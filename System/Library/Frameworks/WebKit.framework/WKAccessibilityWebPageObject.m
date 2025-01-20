@interface WKAccessibilityWebPageObject
- (NSData)remoteTokenData;
- (WKAccessibilityWebPageObject)init;
- (double)pageScale;
- (id)accessibilityHitTest:(CGPoint)a3;
- (void)dealloc;
- (void)setRemoteTokenData:(id)a3;
@end

@implementation WKAccessibilityWebPageObject

- (void)setRemoteTokenData:(id)a3
{
}

- (WKAccessibilityWebPageObject)init
{
  v4.receiver = self;
  v4.super_class = (Class)WKAccessibilityWebPageObject;
  v2 = [(WKAccessibilityWebPageObject *)&v4 init];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__accessibilityCategoryInstalled_, @"AccessibilityCategoryInstalled", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)WKAccessibilityWebPageObject;
  [(WKAccessibilityWebPageObject *)&v3 dealloc];
}

- (double)pageScale
{
  m_ptr = self->super.m_page.m_ptr;
  return WebKit::WebPage::totalScaleFactor((WebKit::WebPage *)m_ptr, (WebCore::LocalFrame *)a2)
       / *(float *)(*((void *)m_ptr + 6) + 368);
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  CGPoint v8 = a3;
  m_ptr = self->super.m_page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v7, &v8);
  v7[1] = WebKit::WebPage::accessibilityScreenToRootView((WebKit::WebPage *)m_ptr, (const WebCore::IntPoint *)v7);
  id v5 = [(WKAccessibilityWebPageObjectBase *)self accessibilityRootObjectWrapper];
  WebCore::IntPoint::operator CGPoint();
  return (id)objc_msgSend(v5, "accessibilityHitTest:");
}

- (NSData)remoteTokenData
{
  return self->_remoteTokenData;
}

@end