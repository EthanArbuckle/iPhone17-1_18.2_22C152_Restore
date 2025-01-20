@interface CGPDFPageImpl
- (CGPDFPageImpl)initWithCGPDFPage:(CGPDFPage *)a3 requestQueue:(id)a4;
- (CGRect)rectForBox:(int)a3;
- (int64_t)rotation;
- (void)dealloc;
- (void)drawWithBox:(int)a3 size:(CGSize)a4 colorSpace:(id)a5 options:(id)a6 completion:(id)a7;
- (void)getBoxRect:(int)a3 completion:(id)a4;
- (void)getIdentifier:(id)a3;
- (void)getPageText:(id)a3;
- (void)getRotation:(id)a3;
@end

@implementation CGPDFPageImpl

- (CGPDFPageImpl)initWithCGPDFPage:(CGPDFPage *)a3 requestQueue:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CGPDFPageImpl;
  v8 = [(CGPDFPageImpl *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_requestQueue, a4);
    uint64_t v10 = +[NSUUID UUID];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    v9->_cgPage = CGPDFPageRetain(a3);
  }

  return v9;
}

- (void)dealloc
{
  CGPDFPageRelease(self->_cgPage);
  v3.receiver = self;
  v3.super_class = (Class)CGPDFPageImpl;
  [(CGPDFPageImpl *)&v3 dealloc];
}

- (int64_t)rotation
{
  int v2 = CGPDFPageGetRotationAngle(self->_cgPage) % 360;
  if (v2 >= 0) {
    return v2;
  }
  else {
    return (v2 + 360);
  }
}

- (CGRect)rectForBox:(int)a3
{
  return CGPDFPageGetBoxRect(self->_cgPage, (CGPDFBox)a3);
}

- (void)getIdentifier:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __31__CGPDFPageImpl_getIdentifier___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

uint64_t __31__CGPDFPageImpl_getIdentifier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)getRotation:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __29__CGPDFPageImpl_getRotation___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

uint64_t __29__CGPDFPageImpl_getRotation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) rotation];
  objc_super v3 = *(uint64_t (**)(uint64_t, id))(v1 + 16);

  return v3(v1, v2);
}

- (void)getBoxRect:(int)a3 completion:(id)a4
{
  id v6 = a4;
  requestQueue = self->_requestQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __39__CGPDFPageImpl_getBoxRect_completion___block_invoke;
  v9[3] = &unk_100004290;
  v9[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v9];
}

uint64_t __39__CGPDFPageImpl_getBoxRect_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) rectForBox:*(unsigned int *)(a1 + 48)];
  id v2 = *(uint64_t (**)(uint64_t))(v1 + 16);

  return v2(v1);
}

- (void)drawWithBox:(int)a3 size:(CGSize)a4 colorSpace:(id)a5 options:(id)a6 completion:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  requestQueue = self->_requestQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __64__CGPDFPageImpl_drawWithBox_size_colorSpace_options_completion___block_invoke;
  v20[3] = &unk_1000042B8;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v21 = v13;
  v22 = self;
  int v27 = a3;
  id v23 = v14;
  id v24 = v15;
  id v17 = v14;
  id v18 = v15;
  id v19 = v13;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v20];
}

void __64__CGPDFPageImpl_drawWithBox_size_colorSpace_options_completion___block_invoke(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 32);
  if (!v2 || (CGColorSpaceRef v3 = CGColorSpaceCreateWithPropertyList(v2)) == 0) {
    CGColorSpaceRef v3 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  }
  id v4 = (CGContext *)CGBitmapContextCreateWithShareableMappedData();
  if (v4)
  {
    CGContextClear();
    CGContextDrawPDFPageWithOptions();
    Data = CGBitmapContextGetData(v4);
    dispatch_data_t v6 = dispatch_data_create(Data, 0, 0, _dispatch_data_destructor_munmap);
    id v7 = [objc_alloc((Class)CGBitmapFormat) initWithBitmapContext:v4];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    CFRelease(v4);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (void)getPageText:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __29__CGPDFPageImpl_getPageText___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

void __29__CGPDFPageImpl_getPageText___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)CGPDFPageCopyString();
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end