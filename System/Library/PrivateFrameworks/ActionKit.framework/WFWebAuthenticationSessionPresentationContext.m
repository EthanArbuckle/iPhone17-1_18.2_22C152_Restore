@interface WFWebAuthenticationSessionPresentationContext
- (UIWindow)presentationAnchor;
- (WFWebAuthenticationSessionPresentationContext)initWithPresentationAnchor:(id)a3;
@end

@implementation WFWebAuthenticationSessionPresentationContext

- (void).cxx_destruct
{
}

- (UIWindow)presentationAnchor
{
  return self->_presentationAnchor;
}

- (WFWebAuthenticationSessionPresentationContext)initWithPresentationAnchor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWebAuthenticationSessionPresentationContext;
  v6 = [(WFWebAuthenticationSessionPresentationContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationAnchor, a3);
    v8 = v7;
  }

  return v7;
}

@end