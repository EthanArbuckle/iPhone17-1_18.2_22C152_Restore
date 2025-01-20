@interface CBSParsePDFMetadataOperation
- (BOOL)parseImage;
- (CBSParsePDFMetadataOperation)initWithPDFBook:(id)a3 filePath:(id)a4 parseImage:(BOOL)a5;
- (CRKBook)book;
- (NSString)filePath;
- (id)fileName;
- (id)titleFromDictionaryRef:(CGPDFDictionary *)a3;
- (void)main;
- (void)updateAuthor:(id)a3;
- (void)updateTitleWithDictionaryRef:(CGPDFDictionary *)a3;
@end

@implementation CBSParsePDFMetadataOperation

- (CBSParsePDFMetadataOperation)initWithPDFBook:(id)a3 filePath:(id)a4 parseImage:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CBSParsePDFMetadataOperation;
  v11 = [(CBSParsePDFMetadataOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_book, a3);
    objc_storeStrong((id *)&v12->_filePath, a4);
    v12->_parseImage = a5;
  }

  return v12;
}

- (void)main
{
  v3 = [(CBSParsePDFMetadataOperation *)self filePath];
  CFURLRef v4 = +[NSURL fileURLWithPath:v3];
  v5 = CGPDFDocumentCreateWithURL(v4);

  if (v5)
  {
    Info = CGPDFDocumentGetInfo(v5);
    [(CBSParsePDFMetadataOperation *)self updateTitleWithDictionaryRef:Info];
    CGPDFStringRef value = 0;
    CGPDFDictionaryGetString(Info, "Author", &value);
    v7 = (__CFString *)CGPDFStringCopyTextString(value);
    [(CBSParsePDFMetadataOperation *)self updateAuthor:v7];

    if (![(CBSParsePDFMetadataOperation *)self parseImage]) {
      goto LABEL_8;
    }
    v8 = objc_opt_new();
    id v9 = [v8 makeFeatureFlags];
    unsigned __int8 v10 = [v9 isRenderPDFThumbnailsEnabled];

    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
    Page = CGPDFDocumentGetPage(v5, 1uLL);
    if (!Page) {
      goto LABEL_8;
    }
    v12 = Page;
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    CGFloat x = BoxRect.origin.x;
    CGFloat y = BoxRect.origin.y;
    CGFloat width = BoxRect.size.width;
    CGFloat height = BoxRect.size.height;
    v17 = (CGContext *)+[CRKCoreGraphicsUtilities createImageContextForSize:](CRKCoreGraphicsUtilities, "createImageContextForSize:", 70.0, 100.0);
    if (v17)
    {
      v18 = v17;
      CGContextTranslateCTM(v17, 0.0, 100.0);
      CGContextScaleCTM(v18, 1.0, -1.0);
      memset(&v24, 0, sizeof(v24));
      v28.origin.CGFloat x = 0.0;
      v28.origin.CGFloat y = 0.0;
      v28.size.CGFloat width = 70.0;
      v28.size.CGFloat height = 100.0;
      CGPDFPageGetDrawingTransform(&v24, v12, kCGPDFCropBox, v28, 0, 1);
      CGAffineTransform v23 = v24;
      CGContextConcatCTM(v18, &v23);
      CGContextSetRGBFillColor(v18, 1.0, 1.0, 1.0, 1.0);
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGContextFillRect(v18, v29);
      CGContextDrawPDFPage(v18, v12);
      CGImageRef Image = CGBitmapContextCreateImage(v18);
      if (Image)
      {
        v20 = Image;
        v21 = +[CRKCoreGraphicsUtilities imageDataFromImage:Image];
        CFRelease(v5);
        CGImageRelease(v20);
        CGContextRelease(v18);
        v22 = [(CBSParsePDFMetadataOperation *)self book];
        [v22 setImage:v21];

        return;
      }
      CFRelease(v5);
      CGContextRelease(v18);
    }
    else
    {
LABEL_8:
      CFRelease(v5);
    }
    [(CBSParsePDFMetadataOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    [(CBSParsePDFMetadataOperation *)self updateTitleWithDictionaryRef:0];
    [(CBSParsePDFMetadataOperation *)self endOperationWithResultObject:0];
  }
}

- (void)updateTitleWithDictionaryRef:(CGPDFDictionary *)a3
{
  CFURLRef v4 = [(CBSParsePDFMetadataOperation *)self titleFromDictionaryRef:a3];
  v5 = v4;
  if (v4)
  {
    id v13 = v4;
  }
  else
  {
    v6 = [(CBSParsePDFMetadataOperation *)self book];
    v7 = [v6 title];
    v8 = v7;
    if (v7)
    {
      id v13 = v7;
    }
    else
    {
      id v9 = [(CBSParsePDFMetadataOperation *)self fileName];
      unsigned __int8 v10 = v9;
      if (v9)
      {
        id v13 = v9;
      }
      else
      {
        v11 = +[NSBundle bundleForClass:objc_opt_class()];
        id v13 = [v11 localizedStringForKey:@"Untitled" value:&stru_10000C3F8 table:0];
      }
    }
  }
  v12 = [(CBSParsePDFMetadataOperation *)self book];
  [v12 setTitle:v13];
}

- (id)titleFromDictionaryRef:(CGPDFDictionary *)a3
{
  if (a3)
  {
    CGPDFStringRef value = 0;
    v3 = 0;
    if (CGPDFDictionaryGetString(a3, "Title", &value))
    {
      CFURLRef v4 = (__CFString *)CGPDFStringCopyTextString(value);
      if ([(__CFString *)v4 length]) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
      v3 = v5;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)fileName
{
  v2 = [(CBSParsePDFMetadataOperation *)self filePath];
  v3 = [v2 lastPathComponent];
  CFURLRef v4 = [v3 stringByDeletingPathExtension];

  if ([v4 length]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)updateAuthor:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CBSParsePDFMetadataOperation *)self book];
    [v5 setAuthor:v4];
  }
}

- (CRKBook)book
{
  return self->_book;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (BOOL)parseImage
{
  return self->_parseImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);

  objc_storeStrong((id *)&self->_book, 0);
}

@end