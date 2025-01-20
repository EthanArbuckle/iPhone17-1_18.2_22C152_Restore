@interface QLPreviewItemPrinter
- (QLItemPresenterViewController)presenter;
- (QLPreviewItemPrinter)initWithItem:(id)a3;
- (QLPrintingProtocol)itemPrinter;
- (id)printer;
- (int64_t)numberOfPages;
- (void)_didReceivePrinter:(id)a3;
- (void)_waitForPrinterSynchronously;
- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)prepareForDrawingPages:(_NSRange)a3;
- (void)setItemPrinter:(id)a3;
- (void)setPresenter:(id)a3;
@end

@implementation QLPreviewItemPrinter

- (QLPreviewItemPrinter)initWithItem:(id)a3
{
  id v4 = a3;
  if (v4
    && (v16.receiver = self,
        v16.super_class = (Class)QLPreviewItemPrinter,
        (self = [(QLPreviewItemPrinter *)&v16 init]) != 0))
  {
    id v5 = [[QLItemPresenterViewController alloc] initForPrinting:1];
    [(QLPreviewItemPrinter *)self setPresenter:v5];

    v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.quicklook.previewprinter.accessprinter", 0);
    accessPrinterQueue = self->_accessPrinterQueue;
    self->_accessPrinterQueue = v6;

    v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    waitForPrinterSemaphore = self->_waitForPrinterSemaphore;
    self->_waitForPrinterSemaphore = v8;

    v10 = [(QLPreviewItemPrinter *)self presenter];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __37__QLPreviewItemPrinter_initWithItem___block_invoke;
    v14[3] = &unk_2642F6680;
    v11 = self;
    v15 = v11;
    [v10 loadPreviewControllerWithContents:v4 context:0 completionHandler:v14];

    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __37__QLPreviewItemPrinter_initWithItem___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 _didReceivePrinter:0];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) presenter];
    id v4 = [v5 printer];
    [v2 _didReceivePrinter:v4];
  }
}

- (id)printer
{
  return self->_itemPrinter;
}

- (int64_t)numberOfPages
{
  [(QLPreviewItemPrinter *)self _waitForPrinterSynchronously];
  v4.receiver = self;
  v4.super_class = (Class)QLPreviewItemPrinter;
  return [(QLPreviewPrinter *)&v4 numberOfPages];
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(QLPreviewItemPrinter *)self _waitForPrinterSynchronously];
  v6.receiver = self;
  v6.super_class = (Class)QLPreviewItemPrinter;
  -[QLPreviewPrinter prepareForDrawingPages:](&v6, sel_prepareForDrawingPages_, location, length);
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(QLPreviewItemPrinter *)self _waitForPrinterSynchronously];
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewItemPrinter;
  -[QLPreviewPrinter drawPageAtIndex:inRect:](&v10, sel_drawPageAtIndex_inRect_, a3, x, y, width, height);
}

- (void)_didReceivePrinter:(id)a3
{
  objc_storeStrong((id *)&self->_itemPrinter, a3);
  id v5 = a3;
  self->_didReceivePrinter = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForPrinterSemaphore);
}

- (void)_waitForPrinterSynchronously
{
  accessPrinterQueue = self->_accessPrinterQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__QLPreviewItemPrinter__waitForPrinterSynchronously__block_invoke;
  block[3] = &unk_2642F5430;
  block[4] = self;
  dispatch_sync(accessPrinterQueue, block);
}

intptr_t __52__QLPreviewItemPrinter__waitForPrinterSynchronously__block_invoke(intptr_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 160)) {
    return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v1 + 152), 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (QLPrintingProtocol)itemPrinter
{
  return self->_itemPrinter;
}

- (void)setItemPrinter:(id)a3
{
}

- (QLItemPresenterViewController)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_itemPrinter, 0);
  objc_storeStrong((id *)&self->_waitForPrinterSemaphore, 0);

  objc_storeStrong((id *)&self->_accessPrinterQueue, 0);
}

@end