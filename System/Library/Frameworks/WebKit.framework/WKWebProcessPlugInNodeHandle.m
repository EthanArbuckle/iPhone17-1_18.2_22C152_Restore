@interface WKWebProcessPlugInNodeHandle
+ (WKWebProcessPlugInNodeHandle)nodeHandleWithJSValue:(id)a3 inContext:(id)a4;
- (BOOL)HTMLInputElementIsAutoFilled;
- (BOOL)HTMLInputElementIsAutoFilledAndObscured;
- (BOOL)HTMLInputElementIsAutoFilledAndViewable;
- (BOOL)HTMLInputElementIsUserEdited;
- (BOOL)HTMLTextAreaElementIsUserEdited;
- (BOOL)isHTMLInputElementAutoFillButtonEnabled;
- (BOOL)isSelectElement;
- (BOOL)isSelectableTextNode;
- (BOOL)isTextField;
- (CGRect)elementBounds;
- (Object)_apiObject;
- (WKWebProcessPlugInFrame)frame;
- (WKWebProcessPlugInNodeHandle)HTMLTableCellElementCellAbove;
- (id)htmlIFrameElementContentFrame;
- (id)renderedImageWithOptions:(unsigned int)a3;
- (id)renderedImageWithOptions:(unsigned int)a3 width:(id)a4;
- (int64_t)htmlInputElementAutoFillButtonType;
- (int64_t)htmlInputElementLastAutoFillButtonType;
- (void)_nodeHandle;
- (void)dealloc;
- (void)setHTMLInputElementAutoFillButtonEnabledWithButtonType:(int64_t)a3;
- (void)setHTMLInputElementIsAutoFilled:(BOOL)a3;
- (void)setHTMLInputElementIsAutoFilledAndObscured:(BOOL)a3;
- (void)setHTMLInputElementIsAutoFilledAndViewable:(BOOL)a3;
@end

@implementation WKWebProcessPlugInNodeHandle

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_nodeHandle.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInNodeHandle;
    [(WKWebProcessPlugInNodeHandle *)&v4 dealloc];
  }
}

+ (WKWebProcessPlugInNodeHandle)nodeHandleWithJSValue:(id)a3 inContext:(id)a4
{
  objc_super v4 = JSValueToObject((JSContextRef)[a4 JSGlobalContextRef], (JSValueRef)objc_msgSend(a3, "JSValueRef"), 0);
  WebKit::InjectedBundleNodeHandle::getOrCreate(v4, v5, (WebKit::InjectedBundleNodeHandle **)&v11);
  v6 = (WebKit::InjectedBundleNodeHandle *)v11;
  if (v11)
  {
    CFTypeRef v7 = v11[1];
    if (v7)
    {
      CFRetain(v11[1]);
      v8 = (const void *)*((void *)v6 + 1);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  v9 = (void *)CFMakeCollectable(v7);

  return (WKWebProcessPlugInNodeHandle *)v9;
}

- (id)htmlIFrameElementContentFrame
{
  WebKit::InjectedBundleNodeHandle::htmlIFrameElementContentFrame((uint64_t)&self->_nodeHandle, &v8);
  uint64_t v2 = v8;
  if (v8)
  {
    uint64_t v8 = 0;
    v3 = *(const void **)(v2 + 8);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(v2 + 8));
      objc_super v4 = *(const void **)(v2 + 8);
    }
    else
    {
      objc_super v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  CFTypeRef v5 = (id)CFMakeCollectable(v3);
  uint64_t v6 = v8;
  uint64_t v8 = 0;
  if (v6) {
    CFRelease(*(CFTypeRef *)(v6 + 8));
  }
  return (id)v5;
}

- (id)renderedImageWithOptions:(unsigned int)a3
{
  return [(WKWebProcessPlugInNodeHandle *)self renderedImageWithOptions:*(void *)&a3 width:0];
}

- (id)renderedImageWithOptions:(unsigned int)a3 width:(id)a4
{
  LOBYTE(v25) = 0;
  char v26 = 0;
  if (a4)
  {
    [a4 floatValue];
    int v25 = v6;
    char v26 = 1;
  }
  WebKit::InjectedBundleNodeHandle::renderedImage((WebCore::RenderObject *)&self->_nodeHandle, a3 & 0xF | (((a3 >> 4) & 7) << 6), (a3 >> 7) & 1, (uint64_t)&v25, &v24);
  if (!v24) {
    return 0;
  }
  uint64_t v7 = *(void *)(v24 + 16);
  if (v7 && ((*(void (**)(WebCore::NativeImage **__return_ptr))(*(void *)v7 + 56))(&v23), v23))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F42A80]);
    v9 = (const void *)[v8 initWithCGImage:*(void *)WebCore::NativeImage::platformImage(v23)];
    CFTypeRef v11 = (id)CFMakeCollectable(v9);
    v12 = v23;
    v23 = 0;
    if (v12)
    {
      char v13 = 0;
      uint64_t v14 = *((void *)v12 + 1);
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v14, (unsigned __int8 *)&v13, 1u, memory_order_acquire, memory_order_acquire);
      if (v13) {
        MEMORY[0x19972E8D0](v14);
      }
      uint64_t v15 = *(void *)(v14 + 8);
      int v16 = 1;
      uint64_t v17 = v15 - 1;
      *(void *)(v14 + 8) = v15 - 1;
      if (v15 == 1)
      {
        uint64_t v22 = *(void *)(v14 + 16);
        uint64_t v18 = *(void *)(v14 + 24);
        *(void *)(v14 + 24) = 0;
        BOOL v19 = v22 != 0;
      }
      else
      {
        uint64_t v18 = 0;
        BOOL v19 = 1;
      }
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v14, (unsigned __int8 *)&v16, 0, memory_order_release, memory_order_relaxed);
      if (v16 == 1)
      {
        if (!v17)
        {
LABEL_13:
          if (v18) {
            (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
          }
          if (!v19) {
            WTF::fastFree((WTF *)v14, v10);
          }
        }
      }
      else
      {
        WTF::Lock::unlockSlow((WTF::Lock *)v14);
        if (!v17) {
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    CFTypeRef v11 = 0;
  }
  uint64_t v20 = v24;
  uint64_t v24 = 0;
  if (v20) {
    CFRelease(*(CFTypeRef *)(v20 + 8));
  }
  return (id)v11;
}

- (CGRect)elementBounds
{
  WebKit::InjectedBundleNodeHandle::elementBounds((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
  WebCore::IntRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)HTMLInputElementIsAutoFilled
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFilled((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)HTMLInputElementIsAutoFilledAndViewable
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFilledAndViewable((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)HTMLInputElementIsAutoFilledAndObscured
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFilledAndObscured((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (void)setHTMLInputElementIsAutoFilled:(BOOL)a3
{
}

- (void)setHTMLInputElementIsAutoFilledAndViewable:(BOOL)a3
{
}

- (void)setHTMLInputElementIsAutoFilledAndObscured:(BOOL)a3
{
}

- (BOOL)isHTMLInputElementAutoFillButtonEnabled
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFillButtonEnabled((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (void)setHTMLInputElementAutoFillButtonEnabledWithButtonType:(int64_t)a3
{
}

- (int64_t)htmlInputElementAutoFillButtonType
{
  int v2 = WebKit::InjectedBundleNodeHandle::htmlInputElementAutoFillButtonType((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
  if ((v2 - 1) < 5) {
    return (v2 - 1) + 1;
  }
  else {
    return 0;
  }
}

- (int64_t)htmlInputElementLastAutoFillButtonType
{
  int AutoFillButtonType = WebKit::InjectedBundleNodeHandle::htmlInputElementLastAutoFillButtonType((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
  if ((AutoFillButtonType - 1) < 5) {
    return (AutoFillButtonType - 1) + 1;
  }
  else {
    return 0;
  }
}

- (BOOL)HTMLInputElementIsUserEdited
{
  return WebKit::InjectedBundleNodeHandle::htmlInputElementLastChangeWasUserEdit((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)HTMLTextAreaElementIsUserEdited
{
  return WebKit::InjectedBundleNodeHandle::htmlTextAreaElementLastChangeWasUserEdit((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)isSelectElement
{
  Class isa = self[1].super.isa;
  return isa
      && (*((_WORD *)isa + 16) & 0x10) != 0
      && *(void *)(*((void *)isa + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6B08] + 24);
}

- (BOOL)isSelectableTextNode
{
  return WebKit::InjectedBundleNodeHandle::isSelectableTextNode((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)isTextField
{
  return WebKit::InjectedBundleNodeHandle::isTextField((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (WKWebProcessPlugInNodeHandle)HTMLTableCellElementCellAbove
{
  WebKit::InjectedBundleNodeHandle::htmlTableCellElementCellAbove((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle, (WebKit::InjectedBundleNodeHandle **)&v7);
  int v2 = (WebKit::InjectedBundleNodeHandle *)v7;
  if (v7)
  {
    CFTypeRef v3 = v7[1];
    if (v3)
    {
      CFRetain(v7[1]);
      double v4 = (const void *)*((void *)v2 + 1);
    }
    else
    {
      double v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    CFTypeRef v3 = 0;
  }
  double v5 = (void *)CFMakeCollectable(v3);

  return (WKWebProcessPlugInNodeHandle *)v5;
}

- (WKWebProcessPlugInFrame)frame
{
  Class isa = self[1].super.isa;
  if (isa)
  {
    WebKit::InjectedBundleNodeHandle::getOrCreate(*(WebKit::InjectedBundleNodeHandle **)(*((void *)isa + 6) + 8), &v11);
    CFTypeRef v3 = v11;
  }
  else
  {
    CFTypeRef v3 = 0;
  }
  WebKit::InjectedBundleNodeHandle::documentFrame((uint64_t)v3, &v10);
  uint64_t v4 = v10;
  if (v10)
  {
    uint64_t v10 = 0;
    double v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      int v6 = *(const void **)(v4 + 8);
    }
    else
    {
      int v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    double v5 = 0;
  }
  uint64_t v7 = (id)CFMakeCollectable(v5);
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8) {
    CFRelease(*(CFTypeRef *)(v8 + 8));
  }
  if (v3) {
    CFRelease(*((CFTypeRef *)v3 + 1));
  }
  return v7;
}

- (void)_nodeHandle
{
  return &self->_nodeHandle;
}

- (Object)_apiObject
{
  return (Object *)&self->_nodeHandle;
}

@end