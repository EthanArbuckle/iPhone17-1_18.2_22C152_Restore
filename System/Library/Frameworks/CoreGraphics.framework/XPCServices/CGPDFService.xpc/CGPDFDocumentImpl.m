@interface CGPDFDocumentImpl
- (CGPDFDocumentImpl)initWithData:(id)a3 requestQueue:(id)a4;
- (id).cxx_construct;
- (id)getPageAtIndex:(int64_t)a3;
- (void)getInfo:(id)a3;
- (void)getIsEncrypted:(id)a3;
- (void)getIsUnlocked:(id)a3;
- (void)getPageAtIndex:(int64_t)a3 completion:(id)a4;
- (void)getPageCount:(id)a3;
- (void)getVersion:(id)a3;
@end

@implementation CGPDFDocumentImpl

- (CGPDFDocumentImpl)initWithData:(id)a3 requestQueue:(id)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CGPDFDocumentImpl;
  v8 = [(CGPDFDocumentImpl *)&v20 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v8->_requestQueue, a4);
  uint64_t v10 = os_transaction_create();
  transaction = v9->_transaction;
  v9->_transaction = (OS_os_transaction *)v10;

  CGDataProviderRef v12 = CGDataProviderCreateWithCFData(v6);
  CGDataProviderRef v13 = v12;
  v19[1] = v12;
  if (!v12)
  {
    NSLog(@"Failed to create CGDataProvoder");
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  v14 = CGPDFDocumentCreateWithProvider(v12);
  mCFObject = v9->_cgDocument.mCFObject;
  v9->_cgDocument.mCFObject = v14;
  if (mCFObject)
  {
    CFRelease(mCFObject);
    v14 = v9->_cgDocument.mCFObject;
  }
  if (!v14)
  {
    NSLog(@"Failed to create CGPDFDocument");
    CFRelease(v13);
    goto LABEL_10;
  }
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v14);
  v19[0] = 0;
  std::vector<CGPDFPageImpl * {__strong}>::resize((uint64_t)&v9->_pages, NumberOfPages, v19);

  CFRelease(v13);
LABEL_7:
  v17 = v9;
LABEL_11:

  return v17;
}

- (id)getPageAtIndex:(int64_t)a3
{
  if (a3 < 0 || (begin = self->_pages.__begin_, a3 >= self->_pages.var0 - begin))
  {
    NSLog(@"Out of bounds page index", a2);
    Page = 0;
  }
  else
  {
    Page = begin[a3];
    if (!Page)
    {
      Page = (CGPDFPageImpl *)CGPDFDocumentGetPage(self->_cgDocument.mCFObject, a3 + 1);
      if (Page)
      {
        Page = [[CGPDFPageImpl alloc] initWithCGPDFPage:Page requestQueue:self->_requestQueue];
        objc_storeStrong((id *)&self->_pages.__begin_[a3], Page);
      }
      else
      {
        NSLog(@"Failed to create page at index: (%ld)", a3);
      }
    }
  }

  return Page;
}

- (void)getInfo:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __29__CGPDFDocumentImpl_getInfo___block_invoke;
  v7[3] = &unk_1000042E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

void __29__CGPDFDocumentImpl_getInfo___block_invoke(uint64_t a1)
{
  id v2 = (id)CGPDFDocumentCopyInfoDictionary();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getVersion:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __32__CGPDFDocumentImpl_getVersion___block_invoke;
  v7[3] = &unk_1000042E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

uint64_t __32__CGPDFDocumentImpl_getVersion___block_invoke(uint64_t a1)
{
  *(void *)minorVersion = 0;
  CGPDFDocumentGetVersion(*(CGPDFDocumentRef *)(*(void *)(a1 + 32) + 24), &minorVersion[1], minorVersion);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getIsUnlocked:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __35__CGPDFDocumentImpl_getIsUnlocked___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

uint64_t __35__CGPDFDocumentImpl_getIsUnlocked___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  BOOL IsUnlocked = CGPDFDocumentIsUnlocked(*(CGPDFDocumentRef *)(*(void *)(a1 + 32) + 24));
  v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);

  return v3(v1, IsUnlocked);
}

- (void)getIsEncrypted:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __36__CGPDFDocumentImpl_getIsEncrypted___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

uint64_t __36__CGPDFDocumentImpl_getIsEncrypted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  BOOL IsEncrypted = CGPDFDocumentIsEncrypted(*(CGPDFDocumentRef *)(*(void *)(a1 + 32) + 24));
  v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);

  return v3(v1, IsEncrypted);
}

- (void)getPageCount:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __34__CGPDFDocumentImpl_getPageCount___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v7];
}

uint64_t __34__CGPDFDocumentImpl_getPageCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(*(CGPDFDocumentRef *)(*(void *)(a1 + 32) + 24));
  v3 = *(uint64_t (**)(uint64_t, size_t))(v1 + 16);

  return v3(v1, NumberOfPages);
}

- (void)getPageAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  requestQueue = self->_requestQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __47__CGPDFDocumentImpl_getPageAtIndex_completion___block_invoke;
  v9[3] = &unk_100004308;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [(NSOperationQueue *)requestQueue addOperationWithBlock:v9];
}

void __47__CGPDFDocumentImpl_getPageAtIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) getPageAtIndex:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void).cxx_destruct
{
  p_pages = &self->_pages;
  std::vector<CGPDFPageImpl * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_pages);
  mCFObject = self->_cgDocument.mCFObject;
  if (mCFObject) {
    CFRelease(mCFObject);
  }
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end