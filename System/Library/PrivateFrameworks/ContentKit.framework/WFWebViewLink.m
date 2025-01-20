@interface WFWebViewLink
- (CGRect)rect;
- (NSURL)href;
- (WFWebViewLink)initWithHref:(id)a3 rect:(CGRect)a4;
@end

@implementation WFWebViewLink

- (void).cxx_destruct
{
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSURL)href
{
  return self->_href;
}

- (WFWebViewLink)initWithHref:(id)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFWebViewLink;
  v11 = [(WFWebViewLink *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_href, a3);
    v12->_rect.origin.CGFloat x = x;
    v12->_rect.origin.CGFloat y = y;
    v12->_rect.size.CGFloat width = width;
    v12->_rect.size.CGFloat height = height;
    v13 = v12;
  }

  return v12;
}

@end