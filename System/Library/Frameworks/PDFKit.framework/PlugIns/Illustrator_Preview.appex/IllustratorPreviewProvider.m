@interface IllustratorPreviewProvider
- (BOOL)_illustratorFileContainsPDFAtURL:(id)a3 type:(id)a4;
- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation IllustratorPreviewProvider

- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  v7 = [a3 fileURL];
  NSLog(@"Getting content type for file at url: %@", v7);
  v19 = 0;
  id v18 = 0;
  unsigned __int8 v8 = [v7 getResourceValue:&v19 forKey:NSURLContentTypeKey error:&v18];
  v9 = v19;
  id v10 = v18;
  id v11 = v9;
  if (v8)
  {
    if ([(IllustratorPreviewProvider *)self _illustratorFileContainsPDFAtURL:v7 type:v11])
    {
      NSLog(@"The Illustrator document contains PDF data.");
      id v12 = objc_alloc((Class)QLPreviewReply);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000357C;
      v16[3] = &unk_100004118;
      id v17 = v7;
      id v13 = objc_msgSend(v12, "initForPDFWithPageSize:documentCreationBlock:", v16, 500.0, 500.0);
      v6[2](v6, v13, 0);
    }
    else
    {
      NSLog(@"%@", @"The Illustrator document doesn't contain PDF data.");
      NSErrorUserInfoKey v20 = NSDebugDescriptionErrorKey;
      CFStringRef v21 = @"The Illustrator document doesn't contain PDF data.";
      v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v15 = +[NSError errorWithDomain:NSCocoaErrorDomain code:2048 userInfo:v14];

      ((void (**)(id, id, void *))v6)[2](v6, 0, v15);
    }
  }
  else
  {
    NSLog(@"The content type of the edited copy could not be determined: %@", v10);
    ((void (**)(id, id, id))v6)[2](v6, 0, v10);
  }
}

- (BOOL)_illustratorFileContainsPDFAtURL:(id)a3 type:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[UTType typeWithIdentifier:@"com.adobe.illustrator.ai-image"];
  unsigned __int8 v8 = (void *)v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    if ([v6 conformsToType:v7]
      && CFURLGetFileSystemRepresentation((CFURLRef)v5, 1u, buffer, 1024)
      && (int v10 = open((const char *)buffer, 0, 0), v10 != -1))
    {
      int v11 = v10;
      BOOL v9 = read(v10, &v13, 4uLL) == 4 && v13 == 1178882085;
      close(v11);
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

@end