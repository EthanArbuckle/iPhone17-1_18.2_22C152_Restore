@interface RawCameraCIImageProxy
+ (BOOL)respondsToSelector:(SEL)a3;
- (CIImage)ciImage;
- (RawCameraCIImageProxy)initWithRawImage:(shared_ptr<CRawImage>)a3;
- (id).cxx_construct;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)proxyedObject;
- (shared_ptr<CRawImage>)rawImage;
- (void)forwardInvocation:(id)a3;
- (void)setCiImage:(id)a3;
- (void)setRawImage:(shared_ptr<CRawImage>)a3;
@end

@implementation RawCameraCIImageProxy

- (id)proxyedObject
{
  objc_msgSend_rawImage(self, a2, v2, v3, v4);
  if (v18)
  {
    v10 = objc_msgSend_ciImage(self, v6, v7, v8, v9);
    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  if (v19) {
    sub_1DDA18310(v19);
  }
  if (v11)
  {
    v12 = sub_1DDACAB90(self->rawImage.__ptr_, 0);
    objc_msgSend_setCiImage_(self, v13, (uint64_t)v12, v14, v15);
  }
  v16 = objc_msgSend_ciImage(self, v6, v7, v8, v9);

  return v16;
}

- (RawCameraCIImageProxy)initWithRawImage:(shared_ptr<CRawImage>)a3
{
  if (self)
  {
    v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
    uint64_t v7 = *(void *)a3.__ptr_;
    uint64_t v8 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    objc_msgSend_setRawImage_(self, a2, (uint64_t)&v7, (uint64_t)a3.__cntrl_, v3);
    if (v8) {
      sub_1DDA18310(v8);
    }
  }
  return self;
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_proxyedObject(self, v5, v6, v7, v8);
  objc_msgSend_selector(v4, v10, v11, v12, v13);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend_invokeWithTarget_(v4, v14, (uint64_t)v9, v15, v16);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RawCameraCIImageProxy;
    [(RawCameraCIImageProxy *)&v17 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v6 = objc_msgSend_proxyedObject(self, a2, (uint64_t)a3, v3, v4);
  v10 = objc_msgSend_methodSignatureForSelector_(v6, v7, (uint64_t)a3, v8, v9);

  return v10;
}

- (shared_ptr<CRawImage>)rawImage
{
  objc_copyCppObjectAtomic(v2, &self->rawImage, (void (__cdecl *)(void *, const void *))sub_1DDA76D50);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setRawImage:(shared_ptr<CRawImage>)a3
{
}

- (CIImage)ciImage
{
  return (CIImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCiImage:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->rawImage.__cntrl_;
  if (cntrl) {
    sub_1DDA18310((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->ciImage, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end