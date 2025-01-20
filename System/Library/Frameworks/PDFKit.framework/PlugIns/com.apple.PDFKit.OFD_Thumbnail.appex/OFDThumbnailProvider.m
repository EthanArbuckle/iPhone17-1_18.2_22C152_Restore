@interface OFDThumbnailProvider
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation OFDThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  if (qword_100008110 != -1) {
    dispatch_once(&qword_100008110, &stru_100004118);
  }
  v7 = (uint64_t (*)(void *, void))gFunc_OFDCreatePDFDataFromURL;
  v8 = [v5 fileURL];
  CFDataRef v9 = (const __CFData *)v7(v8, 0);

  if (v9 && (v10 = CGDataProviderCreateWithCFData(v9)) != 0)
  {
    v11 = v10;
    v12 = CGPDFDocumentCreateWithProvider(v10);
    if (v12)
    {
      v13 = v12;
      CGPDFPageRef Page = CGPDFDocumentGetPage(v12, 1uLL);
      CFRetain(Page);
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      double width = BoxRect.size.width;
      double height = BoxRect.size.height;
      objc_msgSend(v5, "maximumSize", BoxRect.origin.x, BoxRect.origin.y);
      double v18 = v17 / width;
      [v5 maximumSize];
      double v20 = v19 / height;
      if (v18 < v19 / height) {
        double v20 = v18;
      }
      double v21 = v20 + -0.01;
      double v22 = width * v21;
      double v23 = height * v21;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100003B70;
      v25[3] = &unk_100004140;
      double v27 = v21;
      id v26 = v5;
      CGPDFPageRef v28 = Page;
      v24 = +[QLThumbnailReply replyWithContextSize:drawingBlock:](QLThumbnailReply, "replyWithContextSize:drawingBlock:", v25, v22, v23);
      v6[2](v6, v24, 0);

      CGPDFDocumentRelease(v13);
    }
    CFRelease(v11);
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

@end