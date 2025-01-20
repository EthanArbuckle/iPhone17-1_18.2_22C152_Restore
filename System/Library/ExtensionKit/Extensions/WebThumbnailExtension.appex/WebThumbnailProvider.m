@interface WebThumbnailProvider
- (void)_sendReplyFor:(id)a3 fromCGImage:(CGImage *)a4 extension:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation WebThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  [v6 maximumSize];
  v7 = [v6 contentType];
  v8 = +[UTType typeWithIdentifier:v7];

  v9 = self;
  if ([v8 conformsToType:UTTypeHTML])
  {
    CFStringRef v10 = @"HTML";
  }
  else if ([v8 conformsToType:UTTypeWebArchive])
  {
    CFStringRef v10 = @"WEB";
  }
  else
  {
    CFStringRef v10 = 0;
  }
  v11 = [v6 generationData];
  CFDictionaryRef v12 = [v11 objectForKeyedSubscript:QLWebExtensionThumbnailPropertyPageSize];

  CGSize size = CGSizeZero;
  CGSizeMakeWithDictionaryRepresentation(v12, &size);
  v13 = [v6 generationData];
  v14 = [v13 objectForKeyedSubscript:QLWebExtensionThumbnailPropertyPageXPath];

  BOOL v15 = size.width == CGSizeZero.width;
  if (size.height != CGSizeZero.height) {
    BOOL v15 = 0;
  }
  if (v14) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v15;
  }
  if (v16) {
    CGSize size = (CGSize)xmmword_100006720;
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100005130;
  v29 = sub_100005140;
  v17 = [QLWebviewSnapshotter alloc];
  v18 = [v6 item];
  v30 = -[QLWebviewSnapshotter initWithItem:previewSize:](v17, "initWithItem:previewSize:", v18, size.width, size.height);

  v19 = (void *)v26[5];
  if (v16)
  {
    v20 = (id *)v23;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000519C;
    v23[3] = &unk_100008480;
    v23[4] = v9;
    v23[5] = v6;
    v23[6] = v10;
    v21 = v22;
    v23[7] = v22;
    v23[8] = &v25;
    [v19 requestSnapshotThumbnail:v23];
  }
  else
  {
    v20 = (id *)v24;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100005148;
    v24[3] = &unk_100008480;
    v24[4] = v9;
    v24[5] = v6;
    v24[6] = v10;
    v21 = v22;
    v24[7] = v22;
    v24[8] = &v25;
    [v19 requestSnapshotThumbnailForPage:0 withXPathQuery:v14 completion:v24];
  }

  _Block_object_dispose(&v25, 8);
}

- (void)_sendReplyFor:(id)a3 fromCGImage:(CGImage *)a4 extension:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  v11 = (void (**)(id, void *, id))a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  [v14 maximumSize];
  double v16 = v15;
  double v18 = v17;
  [v14 scale];
  uint64_t v20 = v19;

  double Width = (double)CGImageGetWidth(a4);
  double Height = (double)CGImageGetHeight(a4);
  if (v16 < Width || v18 < Height)
  {
    double v24 = v18 * (Width / Height);
    double v25 = v16 / (Width / Height);
    if (v24 <= v16) {
      double Width = v18 * (Width / Height);
    }
    else {
      double Width = v16;
    }
    if (v24 <= v16) {
      double Height = v18;
    }
    else {
      double Height = v25;
    }
  }
  CGImageRetain(a4);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100005384;
  v27[3] = &unk_1000084A0;
  v27[4] = v20;
  *(double *)&v27[5] = Width;
  *(double *)&v27[6] = Height;
  v27[7] = a4;
  v26 = +[QLThumbnailReply replyWithContextSize:drawingBlock:](QLThumbnailReply, "replyWithContextSize:drawingBlock:", v27, Width, Height);
  [v26 setColorSpace:CGImageGetColorSpace(a4)];
  [v26 setExtensionBadge:v13];

  v11[2](v11, v26, v12);
}

@end