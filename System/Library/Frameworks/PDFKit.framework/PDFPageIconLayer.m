@interface PDFPageIconLayer
- (PDFDocument)document;
- (PDFPageIconLayer)initWithSize:(CGSize)a3;
- (int)pageIndex;
- (void)setDocument:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNeedsUpdate;
- (void)updateAsPageIndex:(int)a3 forDocument:(id)a4;
@end

@implementation PDFPageIconLayer

- (PDFPageIconLayer)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PDFPageIconLayer;
  v5 = [(PDFPageIconLayer *)&v10 init];
  v6 = v5;
  if (v5)
  {
    -[PDFPageIconLayer setFrame:](v5, "setFrame:", 0.0, 0.0, width, height);
    id v7 = [MEMORY[0x263F825C8] lightGrayColor];
    -[PDFPageIconLayer setBorderColor:](v6, "setBorderColor:", [v7 CGColor]);

    [(PDFPageIconLayer *)v6 setBorderWidth:1.0];
    id v8 = [MEMORY[0x263F825C8] whiteColor];
    -[PDFPageIconLayer setBackgroundColor:](v6, "setBackgroundColor:", [v8 CGColor]);

    [(PDFPageIconLayer *)v6 setContentsGravity:*MEMORY[0x263F15E18]];
    [(PDFPageIconLayer *)v6 setZPosition:0.0];
    objc_storeWeak((id *)&v6->_document, 0);
    v6->_pageIndex = 0;
    v6->_needsUpdate = 0;
  }
  return v6;
}

- (PDFDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);

  return (PDFDocument *)WeakRetained;
}

- (int)pageIndex
{
  return self->_pageIndex;
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)PDFPageIconLayer;
  -[PDFPageIconLayer setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y);
  self->_frameSize.CGFloat width = width;
  self->_frameSize.CGFloat height = height;
}

- (void)updateAsPageIndex:(int)a3 forDocument:(id)a4
{
  id v6 = a4;
  if (updateAsPageIndex_forDocument__onceToken[0] != -1) {
    dispatch_once(updateAsPageIndex_forDocument__onceToken, &__block_literal_global_18);
  }
  if (self->_needsUpdate) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  if (WeakRetained != v6)
  {

LABEL_7:
    objc_storeWeak((id *)&self->_document, v6);
    self->_int pageIndex = a3;
    self->_needsUpdate = 0;
    objc_initWeak(&location, self);
    v9 = updateAsPageIndex_forDocument__gIconsQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_2;
    v10[3] = &unk_264205648;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    int v13 = a3;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }
  int pageIndex = self->_pageIndex;

  if (pageIndex != a3) {
    goto LABEL_7;
  }
LABEL_8:
}

void __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("PDFIconsView", v2);
  v1 = (void *)updateAsPageIndex_forDocument__gIconsQueue;
  updateAsPageIndex_forDocument__gIconsQueue = (uint64_t)v0;
}

void __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_2(uint64_t a1)
{
  v17[3] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (double *)WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 4);
    v5 = v4;
    if (v4 && *(id *)(a1 + 32) == v4 && *(_DWORD *)(a1 + 48) == *((_DWORD *)v3 + 10))
    {
      double BackingScaleFactor = PDFScreenGetBackingScaleFactor();
      double v7 = BackingScaleFactor * v3[6];
      double v8 = BackingScaleFactor * v3[7];
      v9 = [v5 pageAtIndex:*(int *)(a1 + 48)];
      v16[0] = @"PDFPageImageProperty_DrawBookmark";
      v16[1] = @"PDFPageImageProperty_DrawAnnotations";
      v17[0] = MEMORY[0x263EFFA80];
      v17[1] = MEMORY[0x263EFFA88];
      v16[2] = @"PDFPageImageProperty_WithRotation";
      v17[2] = MEMORY[0x263EFFA88];
      objc_super v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
      id v11 = objc_msgSend(v9, "imageOfSize:forBox:withOptions:", 1, v10, v7, v8);

      id v12 = v11;
      if ([v12 CGImage] && *(void **)(a1 + 32) == v5 && *(_DWORD *)(a1 + 48) == *((_DWORD *)v3 + 10))
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_3;
        block[3] = &unk_264203F98;
        v14 = v3;
        id v15 = v12;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
}

uint64_t __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_3(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(*(id *)(a1 + 40), "CGImage"));
  v2 = (void *)MEMORY[0x263F158F8];

  return [v2 commit];
}

- (void)setDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

@end