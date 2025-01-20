@interface MSPhotosExtensionFallbackTranscoder
- (void)fallbackForData:(id)a3 attachments:(id)a4 inFileURL:(id)a5 completionBlockWithText:(id)a6;
@end

@implementation MSPhotosExtensionFallbackTranscoder

- (void)fallbackForData:(id)a3 attachments:(id)a4 inFileURL:(id)a5 completionBlockWithText:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc_init(MSMessageExtensionFallbackTranscoder);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1C8E8;
  v18[3] = &unk_3D338;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = v12;
  [(MSMessageExtensionFallbackTranscoder *)v13 fallbackForData:v16 attachments:v15 inFileURL:v14 completionBlockWithText:v18];
}

@end