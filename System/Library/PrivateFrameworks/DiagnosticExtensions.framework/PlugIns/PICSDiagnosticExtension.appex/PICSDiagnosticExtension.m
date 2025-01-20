id sub_100003AC8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticExtensionFileFinderWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DiagnosticExtensionFileFinderWrapper()
{
  return self;
}

uint64_t sub_100003B20()
{
  return dispatch thunk of DiagnosticExtensionFileFinder.getFileList()();
}

uint64_t sub_100003B30()
{
  return type metadata accessor for DiagnosticExtensionFileFinder();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_attachmentWithPathURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPathURL:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_getFileList(void *a1, const char *a2, ...)
{
  return _[a1 getFileList];
}