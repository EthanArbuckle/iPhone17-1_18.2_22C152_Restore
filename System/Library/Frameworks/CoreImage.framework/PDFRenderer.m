@interface PDFRenderer
- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4;
- (PDFRenderer)init;
- (__CFData)pdfdata;
- (void)dealloc;
- (void)flushRender;
- (void)setFileTitle:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation PDFRenderer

- (PDFRenderer)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDFRenderer;
  v2 = [(CGRenderer *)&v5 init];
  if (v2)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 2, 0, 0);
    v2->info = Mutable;
    [(__CFDictionary *)Mutable setValue:@"Apple, Inc." forKey:*MEMORY[0x1E4F1DDC8]];
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->info);
  data = self->data;
  if (data) {
    CFRelease(data);
  }
  dataConsumer = self->dataConsumer;
  if (dataConsumer) {
    CGDataConsumerRelease(dataConsumer);
  }
  v5.receiver = self;
  v5.super_class = (Class)PDFRenderer;
  [(CGRenderer *)&v5 dealloc];
}

- (void)setFileURL:(id)a3
{
  dataConsumer = self->dataConsumer;
  if (dataConsumer) {
    CGDataConsumerRelease(dataConsumer);
  }
  context = self->super.context;
  if (context)
  {
    CGContextRelease(context);
    self->super.context = 0;
  }
  if (a3)
  {
    v7 = CGDataConsumerCreateWithURL((CFURLRef)[a3 URLByAppendingPathExtension:@"pdf"]);
  }
  else
  {
    data = self->data;
    if (data) {
      CFRelease(data);
    }
    CFMutableDictionaryRef Mutable = CFDataCreateMutable(0, 0);
    self->data = Mutable;
    v7 = CGDataConsumerCreateWithCFData(Mutable);
  }
  self->dataConsumer = v7;
}

- (void)setFileTitle:(id)a3
{
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  __asm { FMOV            V2.2D, #-20.0 }
  v13.origin = _Q2;
  v13.size.width = (double)a3 + 40.0;
  v13.size.height = (double)a4 + 40.0;
  context = self->super.context;
  if (context)
  {
    CGPDFContextEndPage(context);
    uint64_t v14 = *MEMORY[0x1E4F1DDE0];
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v13 length:32];
    BOOL v11 = 1;
    CGPDFContextBeginPage(self->super.context, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, *(_OWORD *)&v13.origin, *(void *)&v13.size.width, *(void *)&v13.size.height));
  }
  else
  {
    self->super.context = CGPDFContextCreate(self->dataConsumer, &v13, self->info);
    uint64_t v16 = *MEMORY[0x1E4F1DDE0];
    v17[0] = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v13 length:32];
    CGPDFContextBeginPage(self->super.context, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, *(_OWORD *)&v13.origin, *(void *)&v13.size.width, *(void *)&v13.size.height));
    return self->super.context != 0;
  }
  return v11;
}

- (void)flushRender
{
  CGPDFContextEndPage(self->super.context);
  context = self->super.context;

  CGPDFContextClose(context);
}

- (__CFData)pdfdata
{
  return CFDataCreateCopy(0, self->data);
}

@end