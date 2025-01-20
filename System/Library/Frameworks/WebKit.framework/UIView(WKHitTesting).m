@interface UIView(WKHitTesting)
- (uint64_t)_web_findDescendantViewAtPoint:()WKHitTesting withEvent:;
@end

@implementation UIView(WKHitTesting)

- (uint64_t)_web_findDescendantViewAtPoint:()WKHitTesting withEvent:
{
  v20 = &v22;
  uint64_t v21 = 16;
  WebKit::collectDescendantViewsAtPoint((uint64_t)&v20, a1, a5, a2, a3);
  v11 = v20 - 1;
  uint64_t v12 = HIDWORD(v21);
  while (v12 * 8)
  {
    v13 = (WKChildScrollView *)v11[v12];
    if (v13) {
      CFRetain((CFTypeRef)v11[v12]);
    }
    if ([(WKChildScrollView *)v13 conformsToProtocol:&unk_1EEAA7250])
    {
      -[WKChildScrollView convertPoint:fromView:](v13, "convertPoint:fromView:", a1, a2, a3);
      uint64_t v5 = -[WKChildScrollView hitTest:withEvent:](v13, "hitTest:withEvent:", a5);
      char v14 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      if (!HIDWORD(v21)) {
        goto LABEL_26;
      }
      if (WebKit::isScrolledBy(v13, (WKChildScrollView *)v20[HIDWORD(v21) - 1], v15))
      {
        char v14 = 0;
        uint64_t v5 = (uint64_t)v13;
      }
      else
      {
LABEL_11:
        if (_MergedGlobals_54 != -1) {
          dispatch_once(&_MergedGlobals_54, &__block_literal_global_7);
        }
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([(WKChildScrollView *)v13 superview], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v16 = (WKChildScrollView *)[(WKChildScrollView *)v13 superview];
          if (!HIDWORD(v21))
          {
LABEL_26:
            __break(0xC471u);
            JUMPOUT(0x198A089A4);
          }
          int isScrolledBy = WebKit::isScrolledBy(v16, (WKChildScrollView *)v20[HIDWORD(v21) - 1], v17);
          char v14 = isScrolledBy ^ 1;
          if (isScrolledBy) {
            uint64_t v5 = (uint64_t)v13;
          }
        }
        else
        {
          char v14 = 1;
        }
      }
    }
    if (v13) {
      CFRelease(v13);
    }
    --v12;
    if ((v14 & 1) == 0) {
      goto LABEL_25;
    }
  }
  uint64_t v5 = 0;
LABEL_25:
  WTF::Vector<WTF::RetainPtr<UIView>,16ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v20, v10);
  return v5;
}

@end