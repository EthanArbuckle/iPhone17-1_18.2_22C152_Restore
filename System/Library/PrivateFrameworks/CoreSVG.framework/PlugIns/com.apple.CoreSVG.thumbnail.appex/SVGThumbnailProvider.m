@interface SVGThumbnailProvider
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation SVGThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  v7 = [v5 fileURL];
  uint64_t v8 = CGSVGDocumentCreateFromURL();

  if (v8)
  {
    CGSVGDocumentGetCanvasSize();
    double v10 = v9;
    double v12 = v11;
    [v5 maximumSize];
    double v14 = v13 / v10;
    [v5 maximumSize];
    if (v14 >= v15 / v12) {
      double v16 = v15 / v12;
    }
    else {
      double v16 = v14;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100003C70;
    v18[3] = &unk_1000040A0;
    *(double *)&v18[4] = v10;
    *(double *)&v18[5] = v12;
    v18[6] = v8;
    v17 = +[QLThumbnailReply replyWithContextSize:drawingBlock:](QLThumbnailReply, "replyWithContextSize:drawingBlock:", v18, v10 * v16, v12 * v16);
    v6[2](v6, v17, 0);
  }
  else
  {
    v17 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v17);
  }
}

@end