@interface StorageDataURLsWrapper
- (void)startObservingURLs:(id)a3 withUpdateHandler:(id)a4;
@end

@implementation StorageDataURLsWrapper

- (void)startObservingURLs:(id)a3 withUpdateHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, id))a4;
  v7 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "path", 0, 0);
        STMSizeOfFileTree();

        id v15 = objc_alloc_init((Class)SAURLSize);
        [v15 setSize:v18];
        [v7 setObject:v15 forKey:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v16 = objc_alloc_init((Class)SAURLSizerResults);
  [v16 setUrlInfo:v7];
  id v17 = objc_alloc_init((Class)NSError);
  v6[2](v6, v16, v17);
}

@end