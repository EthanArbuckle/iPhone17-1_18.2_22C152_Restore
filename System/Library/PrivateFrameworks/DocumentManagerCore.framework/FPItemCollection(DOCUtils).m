@interface FPItemCollection(DOCUtils)
- (uint64_t)doc_displaysSearchResults;
- (uint64_t)doc_isObserving;
- (uint64_t)doc_restartObservation;
- (uint64_t)doc_startObservationIfNeeded;
- (uint64_t)doc_stopObserving;
- (void)doc_setIsObserving:()DOCUtils;
- (void)doc_startObserving;
@end

@implementation FPItemCollection(DOCUtils)

- (uint64_t)doc_startObservationIfNeeded
{
  uint64_t result = objc_msgSend(a1, "doc_displaysSearchResults");
  if ((result & 1) == 0)
  {
    uint64_t result = objc_msgSend(a1, "doc_isObserving");
    if ((result & 1) == 0)
    {
      return objc_msgSend(a1, "doc_startObserving");
    }
  }
  return result;
}

- (uint64_t)doc_displaysSearchResults
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (uint64_t)doc_isObserving
{
  v1 = objc_getAssociatedObject(a1, &_isObservingIdentifier);
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)doc_startObserving
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = a1;
    _os_log_impl(&dword_213670000, v2, OS_LOG_TYPE_DEFAULT, "Start observing collection %@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(a1, "doc_setIsObserving:", 1);
  [a1 startObserving];
  uint64_t v3 = +[DOCFPItemCollectionManager sharedManager];
  [v3 collectionDidStartObserving:a1];
}

- (void)doc_setIsObserving:()DOCUtils
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_isObservingIdentifier, v2, (void *)1);
}

- (uint64_t)doc_stopObserving
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl(&dword_213670000, v2, OS_LOG_TYPE_DEFAULT, "Stop observing collection %@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = +[DOCFPItemCollectionManager sharedManager];
  [v3 collectionDidStopObserving:a1];

  objc_msgSend(a1, "doc_setIsObserving:", 0);
  return [a1 stopObserving];
}

- (uint64_t)doc_restartObservation
{
  if (objc_msgSend(a1, "doc_isObserving")) {
    objc_msgSend(a1, "doc_stopObserving");
  }
  return objc_msgSend(a1, "doc_startObservationIfNeeded");
}

@end