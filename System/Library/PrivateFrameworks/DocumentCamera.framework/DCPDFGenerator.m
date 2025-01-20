@interface DCPDFGenerator
- (BOOL)startGenerating;
- (CGRect)pageRect;
- (DCPDFGenerator)init;
- (DCPDFGenerator)initWithMutableData:(id)a3 pageRect:(CGRect)a4 title:(id)a5;
- (DCPDFGenerator)initWithURL:(id)a3 pageRect:(CGRect)a4 title:(id)a5;
- (NSMutableData)data;
- (NSString)title;
- (NSURL)fileURL;
- (void)addPageWithPageRect:(CGRect)a3 renderBlock:(id)a4;
- (void)addPageWithRenderBlock:(id)a3;
- (void)dealloc;
- (void)finishGenerating;
- (void)setData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setPageRect:(CGRect)a3;
- (void)setTitle:(id)a3;
- (void)startGenerating;
@end

@implementation DCPDFGenerator

- (DCPDFGenerator)init
{
  return 0;
}

- (DCPDFGenerator)initWithURL:(id)a3 pageRect:(CGRect)a4 title:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DCPDFGenerator;
  v13 = [(DCPDFGenerator *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(DCPDFGenerator *)v13 setFileURL:v11];
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    if (CGRectEqualToRect(v17, *MEMORY[0x263F001A0]))
    {
      double x = *(double *)&kICPDFGeneratorDefaultPageRect;
      double y = *(double *)algn_267BA40E8;
      double width = *(double *)&qword_267BA40F0;
      double height = unk_267BA40F8;
    }
    -[DCPDFGenerator setPageRect:](v14, "setPageRect:", x, y, width, height);
    [(DCPDFGenerator *)v14 setTitle:v12];
  }

  return v14;
}

- (DCPDFGenerator)initWithMutableData:(id)a3 pageRect:(CGRect)a4 title:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DCPDFGenerator;
  v13 = [(DCPDFGenerator *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(DCPDFGenerator *)v13 setData:v11];
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    if (CGRectEqualToRect(v17, *MEMORY[0x263F001A0]))
    {
      double x = *(double *)&kICPDFGeneratorDefaultPageRect;
      double y = *(double *)algn_267BA40E8;
      double width = *(double *)&qword_267BA40F0;
      double height = unk_267BA40F8;
    }
    -[DCPDFGenerator setPageRect:](v14, "setPageRect:", x, y, width, height);
    [(DCPDFGenerator *)v14 setTitle:v12];
  }

  return v14;
}

- (void)dealloc
{
  if (self->_pdfContext)
  {
    v3 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217885000, v3, OS_LOG_TYPE_DEFAULT, "Forgot to call finishGenerating", buf, 2u);
    }

    [(DCPDFGenerator *)self finishGenerating];
  }
  v4.receiver = self;
  v4.super_class = (Class)DCPDFGenerator;
  [(DCPDFGenerator *)&v4 dealloc];
}

- (BOOL)startGenerating
{
  v29[2] = *MEMORY[0x263EF8340];
  if (self->_pdfContext)
  {
    v2 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(DCPDFGenerator *)v2 startGenerating];
    }
LABEL_13:
    BOOL v24 = 0;
    goto LABEL_14;
  }
  v28[0] = *MEMORY[0x263F00470];
  id v11 = [(DCPDFGenerator *)self title];
  v29[0] = v11;
  v28[1] = *MEMORY[0x263F003B8];
  id v12 = DCAppName();
  v29[1] = v12;
  v2 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

  [(DCPDFGenerator *)self pageRect];
  mediaBox.origin.double x = v13;
  mediaBox.origin.double y = v14;
  mediaBox.size.double width = v15;
  mediaBox.size.double height = v16;
  CGRect v17 = [(DCPDFGenerator *)self fileURL];

  if (v17)
  {
    CFURLRef v18 = [(DCPDFGenerator *)self fileURL];
    self->_pdfContext = CGPDFContextCreateWithURL(v18, &mediaBox, (CFDictionaryRef)v2);
  }
  else
  {
    v19 = [(DCPDFGenerator *)self data];

    if (!v19)
    {
LABEL_10:
      v25 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        [(DCPDFGenerator *)self startGenerating];
      }

      goto LABEL_13;
    }
    v20 = [MEMORY[0x263EFF8F8] data];
    v21 = [(DCPDFGenerator *)self data];
    [v21 setData:v20];

    v22 = [(DCPDFGenerator *)self data];
    v23 = CGDataConsumerCreateWithCFData(v22);

    self->_pdfContext = CGPDFContextCreate(v23, &mediaBox, (CFDictionaryRef)v2);
    CGDataConsumerRelease(v23);
  }
  if (!self->_pdfContext) {
    goto LABEL_10;
  }
  BOOL v24 = 1;
LABEL_14:

  return v24;
}

- (void)addPageWithRenderBlock:(id)a3
{
  id v4 = a3;
  [(DCPDFGenerator *)self pageRect];
  -[DCPDFGenerator addPageWithPageRect:renderBlock:](self, "addPageWithPageRect:renderBlock:", v4);
}

- (void)addPageWithPageRect:(CGRect)a3 renderBlock:(id)a4
{
  CGRect v16 = a3;
  uint64_t v5 = (void (**)(id, CGContext *, double, double, double, double))a4;
  if (self->_pdfContext)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDataRef v7 = CFDataCreate(0, (const UInt8 *)&v16, 32);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F00438], v7);
    CGPDFContextBeginPage(self->_pdfContext, Mutable);
    v5[2](v5, self->_pdfContext, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    CGPDFContextEndPage(self->_pdfContext);
    CFRelease(Mutable);
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DCPDFGenerator addPageWithPageRect:renderBlock:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)finishGenerating
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (CGRect)pageRect
{
  double x = self->_pageRect.origin.x;
  double y = self->_pageRect.origin.y;
  double width = self->_pageRect.size.width;
  double height = self->_pageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPageRect:(CGRect)a3
{
  self->_pageRect = a3;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)startGenerating
{
}

- (void)addPageWithPageRect:(uint64_t)a3 renderBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end