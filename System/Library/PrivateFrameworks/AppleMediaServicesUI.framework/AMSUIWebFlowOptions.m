@interface AMSUIWebFlowOptions
- (AMSUIWebLoadingPageModel)loadingPage;
- (AMSUIWebNavigationBarModel)navigationBar;
- (BOOL)animated;
- (BOOL)deferredPresentation;
- (BOOL)disableTimeout;
- (BOOL)reuseExistingPage;
- (BOOL)suppressErrorPage;
- (CGSize)modalWindowSize;
- (NSDictionary)pageData;
- (NSString)backgroundColor;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (void)setAnimated:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDeferredPresentation:(BOOL)a3;
- (void)setDisableTimeout:(BOOL)a3;
- (void)setLoadingPage:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setModalTransitionStyle:(int64_t)a3;
- (void)setModalWindowSize:(CGSize)a3;
- (void)setNavigationBar:(id)a3;
- (void)setPageData:(id)a3;
- (void)setReuseExistingPage:(BOOL)a3;
- (void)setSuppressErrorPage:(BOOL)a3;
@end

@implementation AMSUIWebFlowOptions

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)deferredPresentation
{
  return self->_deferredPresentation;
}

- (void)setDeferredPresentation:(BOOL)a3
{
  self->_deferredPresentation = a3;
}

- (BOOL)disableTimeout
{
  return self->_disableTimeout;
}

- (void)setDisableTimeout:(BOOL)a3
{
  self->_disableTimeout = a3;
}

- (BOOL)reuseExistingPage
{
  return self->_reuseExistingPage;
}

- (void)setReuseExistingPage:(BOOL)a3
{
  self->_reuseExistingPage = a3;
}

- (AMSUIWebLoadingPageModel)loadingPage
{
  return self->_loadingPage;
}

- (void)setLoadingPage:(id)a3
{
}

- (int64_t)modalPresentationStyle
{
  return self->_modalPresentationStyle;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (int64_t)modalTransitionStyle
{
  return self->_modalTransitionStyle;
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  self->_modalTransitionStyle = a3;
}

- (CGSize)modalWindowSize
{
  double width = self->_modalWindowSize.width;
  double height = self->_modalWindowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setModalWindowSize:(CGSize)a3
{
  self->_modalWindowSize = a3;
}

- (AMSUIWebNavigationBarModel)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (NSDictionary)pageData
{
  return self->_pageData;
}

- (void)setPageData:(id)a3
{
}

- (BOOL)suppressErrorPage
{
  return self->_suppressErrorPage;
}

- (void)setSuppressErrorPage:(BOOL)a3
{
  self->_suppressErrorPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageData, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_loadingPage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end