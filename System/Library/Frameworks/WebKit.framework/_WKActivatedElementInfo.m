@interface _WKActivatedElementInfo
+ (id)activatedElementInfoWithInteractionInformationAtPosition:(const void *)a3 userInfo:(id)a4;
- (BOOL)_isImage;
- (BOOL)_isUsingAlternateURLForImage;
- (BOOL)canShowAnimationControls;
- (BOOL)isAnimatedImage;
- (BOOL)isAnimating;
- (CGRect)boundingRect;
- (IntPoint)_interactionLocation;
- (NSDictionary)userInfo;
- (NSString)ID;
- (NSString)imageMIMEType;
- (NSString)title;
- (NSURL)URL;
- (NSURL)imageURL;
- (UIImage)image;
- (const)_animationsUnderElement;
- (id).cxx_construct;
- (id)_initWithInteractionInformationAtPosition:(const void *)a3 isUsingAlternateURLForImage:(BOOL)a4 userInfo:(id)a5;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 image:(void *)a5 information:(const void *)a6;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 image:(void *)a6 userInfo:(id)a7 information:(const void *)a8;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 information:(const void *)a6;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 location:(const IntPoint *)a6 title:(id)a7 ID:(id)a8 rect:(CGRect)a9 image:(void *)a10 imageMIMEType:(id)a11 isAnimatedImage:(BOOL)a12 isAnimating:(BOOL)a13 canShowAnimationControls:(BOOL)a14 animationsUnderElement:()Vector<WebCore:()0UL :()WTF:()16UL :(WTF:(id)a16 :FastMalloc>)a15 CrashOnOverflow ElementAnimationContext userInfo:;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 userInfo:(id)a6 information:(const void *)a7;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 information:(const void *)a5;
- (id)_initWithType:(int64_t)a3 image:(void *)a4 information:(const void *)a5;
- (int64_t)type;
@end

@implementation _WKActivatedElementInfo

+ (id)activatedElementInfoWithInteractionInformationAtPosition:(const void *)a3 userInfo:(id)a4
{
  v4 = (void *)CFMakeCollectable((CFTypeRef)[objc_alloc((Class)a1) _initWithInteractionInformationAtPosition:a3 isUsingAlternateURLForImage:0 userInfo:a4]);

  return v4;
}

- (id)_initWithInteractionInformationAtPosition:(const void *)a3 isUsingAlternateURLForImage:(BOOL)a4 userInfo:(id)a5
{
  v34.receiver = self;
  v34.super_class = (Class)_WKActivatedElementInfo;
  v8 = [(_WKActivatedElementInfo *)&v34 init];
  if (!v8) {
    return v8;
  }
  v9 = (const void *)WTF::URL::operator NSURL *();
  v10 = v9;
  if (v9) {
    CFRetain(v9);
  }
  v11 = (const void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v10;
  if (v11) {
    CFRelease(v11);
  }
  v12 = (const void *)WTF::URL::operator NSURL *();
  v13 = v12;
  if (v12) {
    CFRetain(v12);
  }
  v14 = (const void *)*((void *)v8 + 2);
  *((void *)v8 + 2) = v13;
  if (v14) {
    CFRelease(v14);
  }
  if (*((void *)a3 + 19))
  {
    v15 = (__CFString *)WTF::StringImpl::operator NSString *();
    v16 = (const void **)(v8 + 56);
    if (!v15) {
      goto LABEL_13;
    }
  }
  else
  {
    v16 = (const void **)(v8 + 56);
    v15 = &stru_1EEA10550;
  }
  CFRetain(v15);
LABEL_13:
  v17 = *v16;
  *v16 = v15;
  if (v17) {
    CFRelease(v17);
  }
  *((void *)v8 + 4) = *(void *)a3;
  if (*((void *)a3 + 20))
  {
    v18 = (__CFString *)WTF::StringImpl::operator NSString *();
    v19 = (const void **)(v8 + 24);
    if (!v18) {
      goto LABEL_18;
    }
  }
  else
  {
    v19 = (const void **)(v8 + 24);
    v18 = &stru_1EEA10550;
  }
  CFRetain(v18);
LABEL_18:
  v20 = *v19;
  *v19 = v18;
  if (v20) {
    CFRelease(v20);
  }
  WebCore::IntRect::operator CGRect();
  *((void *)v8 + 15) = v22;
  *((void *)v8 + 16) = v23;
  *((void *)v8 + 17) = v24;
  *((void *)v8 + 18) = v25;
  if (*((unsigned char *)a3 + 26))
  {
    uint64_t v26 = 2;
LABEL_22:
    *((void *)v8 + 14) = v26;
    goto LABEL_25;
  }
  if (!*((unsigned char *)a3 + 24))
  {
    if (*((unsigned char *)a3 + 25)) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 3;
    }
    goto LABEL_22;
  }
  *((void *)v8 + 14) = 0;
LABEL_25:
  v27 = (atomic_uint *)*((void *)a3 + 24);
  if (v27) {
    atomic_fetch_add(v27, 1u);
  }
  uint64_t v28 = *((void *)v8 + 6);
  *((void *)v8 + 6) = v27;
  if (v28) {
    WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref(v28, v21);
  }
  if (!*((void *)a3 + 21))
  {
    v30 = (const void **)(v8 + 40);
    v29 = &stru_1EEA10550;
    goto LABEL_31;
  }
  v29 = (__CFString *)WTF::StringImpl::operator NSString *();
  v30 = (const void **)(v8 + 40);
  if (v29) {
LABEL_31:
  }
    CFRetain(v29);
  v31 = *v30;
  *v30 = v29;
  if (v31) {
    CFRelease(v31);
  }
  v8[104] = *((unsigned char *)a3 + 27);
  v8[80] = *((unsigned char *)a3 + 28);
  v8[81] = *((unsigned char *)a3 + 29);
  v8[105] = *((unsigned char *)a3 + 25);
  v8[106] = a4;
  if (a5) {
    CFRetain(a5);
  }
  v32 = (const void *)*((void *)v8 + 9);
  *((void *)v8 + 9) = a5;
  if (v32) {
    CFRelease(v32);
  }
  WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)(v8 + 88), (uint64_t)a3 + 624);
  return v8;
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 information:(const void *)a5
{
  uint64_t v9 = WTF::URL::operator NSURL *();

  return [(_WKActivatedElementInfo *)self _initWithType:a3 URL:a4 imageURL:v9 information:a5];
}

- (id)_initWithType:(int64_t)a3 image:(void *)a4 information:(const void *)a5
{
  uint64_t v9 = WTF::URL::operator NSURL *();
  uint64_t v10 = WTF::URL::operator NSURL *();

  return [(_WKActivatedElementInfo *)self _initWithType:a3 URL:v9 imageURL:v10 image:a4 userInfo:0 information:a5];
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 information:(const void *)a6
{
  return [(_WKActivatedElementInfo *)self _initWithType:a3 URL:a4 imageURL:a5 image:*((void *)a6 + 24) userInfo:0 information:a6];
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 image:(void *)a5 information:(const void *)a6
{
  uint64_t v11 = WTF::URL::operator NSURL *();

  return [(_WKActivatedElementInfo *)self _initWithType:a3 URL:a4 imageURL:v11 image:a5 userInfo:0 information:a6];
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 userInfo:(id)a6 information:(const void *)a7
{
  return -[_WKActivatedElementInfo _initWithType:URL:imageURL:image:userInfo:information:](self, "_initWithType:URL:imageURL:image:userInfo:information:", a3, a4, a5, *((void *)a7 + 24), a6);
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 image:(void *)a6 userInfo:(id)a7 information:(const void *)a8
{
  WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v37, (uint64_t)a8 + 624);
  if (*((void *)a8 + 20)) {
    uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v11 = &stru_1EEA10550;
  }
  if (*((void *)a8 + 21)) {
    v12 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v12 = &stru_1EEA10550;
  }
  WebCore::IntRect::operator CGRect();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if (*((void *)a8 + 19)) {
    v21 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v21 = &stru_1EEA10550;
  }
  int v22 = *((unsigned __int8 *)a8 + 27);
  int v23 = *((unsigned __int8 *)a8 + 28);
  int v24 = *((unsigned __int8 *)a8 + 29);
  WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v35, (uint64_t)&v37);
  BYTE2(v30) = v24 != 0;
  BYTE1(v30) = v23 != 0;
  LOBYTE(v30) = v22 != 0;
  id v26 = -[_WKActivatedElementInfo _initWithType:URL:imageURL:location:title:ID:rect:image:imageMIMEType:isAnimatedImage:isAnimating:canShowAnimationControls:animationsUnderElement:userInfo:](self, "_initWithType:URL:imageURL:location:title:ID:rect:image:imageMIMEType:isAnimatedImage:isAnimating:canShowAnimationControls:animationsUnderElement:userInfo:", a3, a4, a5, a8, v11, v12, v14, v16, v18, v20, a6, v21, v30, &v35, a7);
  v27 = v35;
  if (v35)
  {
    v35 = 0;
    int v36 = 0;
    WTF::fastFree(v27, v25);
  }
  uint64_t v28 = v37;
  if (v37)
  {
    v37 = 0;
    int v38 = 0;
    WTF::fastFree(v28, v25);
  }
  return v26;
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 location:(const IntPoint *)a6 title:(id)a7 ID:(id)a8 rect:(CGRect)a9 image:(void *)a10 imageMIMEType:(id)a11 isAnimatedImage:(BOOL)a12 isAnimating:(BOOL)a13 canShowAnimationControls:(BOOL)a14 animationsUnderElement:()Vector<WebCore:()0UL :()WTF:()16UL :(WTF:(id)a16 :FastMalloc>)a15 CrashOnOverflow ElementAnimationContext userInfo:
{
  CGFloat height = a9.size.height;
  CGFloat width = a9.size.width;
  CGFloat y = a9.origin.y;
  CGFloat x = a9.origin.x;
  v41.receiver = self;
  v41.super_class = (Class)_WKActivatedElementInfo;
  id v26 = [(_WKActivatedElementInfo *)&v41 init];
  if (v26)
  {
    uint64_t v27 = [a4 copy];
    uint64_t v28 = (const void *)*((void *)v26 + 1);
    *((void *)v26 + 1) = v27;
    if (v28) {
      CFRelease(v28);
    }
    uint64_t v29 = [a5 copy];
    uint64_t v30 = (const void *)*((void *)v26 + 2);
    *((void *)v26 + 2) = v29;
    if (v30) {
      CFRelease(v30);
    }
    uint64_t v31 = [a11 copy];
    v32 = (const void *)*((void *)v26 + 7);
    *((void *)v26 + 7) = v31;
    if (v32) {
      CFRelease(v32);
    }
    *((IntPoint *)v26 + 4) = *a6;
    uint64_t v34 = [a7 copy];
    v35 = (const void *)*((void *)v26 + 3);
    *((void *)v26 + 3) = v34;
    if (v35) {
      CFRelease(v35);
    }
    *((CGFloat *)v26 + 15) = x;
    *((CGFloat *)v26 + 16) = y;
    *((CGFloat *)v26 + 17) = width;
    *((CGFloat *)v26 + 18) = height;
    *((void *)v26 + 14) = a3;
    if (a10) {
      atomic_fetch_add((atomic_uint *volatile)a10, 1u);
    }
    uint64_t v36 = *((void *)v26 + 6);
    *((void *)v26 + 6) = a10;
    if (v36) {
      WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref(v36, v33);
    }
    if (a8) {
      CFRetain(a8);
    }
    v37 = (const void *)*((void *)v26 + 5);
    *((void *)v26 + 5) = a8;
    if (v37) {
      CFRelease(v37);
    }
    uint64_t v38 = [*(id *)&a15.m_capacity copy];
    v39 = (const void *)*((void *)v26 + 9);
    *((void *)v26 + 9) = v38;
    if (v39) {
      CFRelease(v39);
    }
    *((unsigned char *)v26 + 80) = a13;
    *((unsigned char *)v26 + 81) = a14;
    WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v26 + 88, (uint64_t)a15.m_buffer);
    *((unsigned char *)v26 + 104) = a12;
  }
  return v26;
}

- (NSURL)URL
{
  return (NSURL *)self->_URL.m_ptr;
}

- (NSURL)imageURL
{
  return (NSURL *)self->_imageURL.m_ptr;
}

- (NSString)title
{
  return (NSString *)self->_title.m_ptr;
}

- (NSString)imageMIMEType
{
  return (NSString *)self->_imageMIMEType.m_ptr;
}

- (NSString)ID
{
  return (NSString *)self->_ID.m_ptr;
}

- (IntPoint)_interactionLocation
{
  return self->_interactionLocation;
}

- (BOOL)isAnimatedImage
{
  return self->_animatedImage;
}

- (BOOL)_isUsingAlternateURLForImage
{
  return self->_isUsingAlternateURLForImage;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)canShowAnimationControls
{
  return self->_canShowAnimationControls;
}

- (const)_animationsUnderElement
{
  return &self->_animationsUnderElement;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)self->_userInfo.m_ptr;
}

- (BOOL)_isImage
{
  return self->_isImage;
}

- (UIImage)image
{
  m_ptr = self->_cocoaImage.m_ptr;
  if (m_ptr)
  {
    v4 = (void *)CFMakeCollectable((CFTypeRef)[m_ptr copy]);
    return (UIImage *)v4;
  }
  else if (self->_image.m_ptr)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F42A80]);
    WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)&cf, (WebCore::ShareableBitmap *)self->_image.m_ptr);
    v8 = (void *)[v6 initWithCGImage:cf];
    uint64_t v9 = self->_cocoaImage.m_ptr;
    self->_cocoaImage.m_ptr = v8;
    if (v9) {
      CFRelease(v9);
    }
    CFTypeRef v10 = cf;
    CFTypeRef cf = 0;
    if (v10) {
      CFRelease(v10);
    }
    uint64_t v11 = self->_image.m_ptr;
    self->_image.m_ptr = 0;
    if (v11) {
      WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v11, v7);
    }
    return (UIImage *)(id)CFMakeCollectable((CFTypeRef)[self->_cocoaImage.m_ptr copy]);
  }
  else
  {
    return 0;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (CGRect)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  m_buffer = self->_animationsUnderElement.m_buffer;
  if (m_buffer)
  {
    self->_animationsUnderElement.m_buffer = 0;
    self->_animationsUnderElement.m_capacitdouble y = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  m_ptr = self->_userInfo.m_ptr;
  self->_userInfo.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v5 = self->_cocoaImage.m_ptr;
  self->_cocoaImage.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  id v6 = self->_imageMIMEType.m_ptr;
  self->_imageMIMEType.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = self->_image.m_ptr;
  self->_image.m_ptr = 0;
  if (v7) {
    WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v7, (void *)a2);
  }
  v8 = self->_ID.m_ptr;
  self->_ID.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = self->_title.m_ptr;
  self->_title.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  CFTypeRef v10 = self->_imageURL.m_ptr;
  self->_imageURL.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = self->_URL.m_ptr;
  self->_URL.m_ptr = 0;
  if (v11)
  {
    CFRelease(v11);
  }
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  return self;
}

@end