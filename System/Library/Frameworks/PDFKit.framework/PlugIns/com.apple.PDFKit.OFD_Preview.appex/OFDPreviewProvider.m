@interface OFDPreviewProvider
- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation OFDPreviewProvider

- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = qword_100008108;
  v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_100008108, &stru_1000040D0);
  }
  v8 = [v7 fileURL];

  v9 = (void *)gFunc_OFDCreatePDFDataFromURL(v8, 0);
  v10 = +[UTType typeWithIdentifier:@"com.adobe.pdf"];
  id v11 = objc_alloc((Class)QLPreviewReply);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003C68;
  v14[3] = &unk_1000040F8;
  id v15 = v9;
  id v12 = v9;
  id v13 = objc_msgSend(v11, "initWithDataOfContentType:contentSize:dataCreationBlock:", v10, v14, 500.0, 500.0);
  v6[2](v6, v13, 0);
}

@end