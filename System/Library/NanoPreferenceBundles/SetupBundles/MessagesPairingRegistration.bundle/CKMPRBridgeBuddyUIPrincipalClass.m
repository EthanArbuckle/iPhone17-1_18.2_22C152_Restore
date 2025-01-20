@interface CKMPRBridgeBuddyUIPrincipalClass
- (CKMPRBridgeBuddyUIPrincipalClass)init;
- (CKMPRiMessageConsentViewController)iMessageConsentViewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)setIMessageConsentViewController:(id)a3;
@end

@implementation CKMPRBridgeBuddyUIPrincipalClass

- (CKMPRBridgeBuddyUIPrincipalClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKMPRBridgeBuddyUIPrincipalClass;
  v2 = [(CKMPRBridgeBuddyUIPrincipalClass *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CKMPRiMessageConsentViewController);
    [(CKMPRBridgeBuddyUIPrincipalClass *)v2 setIMessageConsentViewController:v3];

    v4 = [(CKMPRBridgeBuddyUIPrincipalClass *)v2 iMessageConsentViewController];
    [v4 setMiniFlowDelegate:v2];
  }
  return v2;
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(CKMPRBridgeBuddyUIPrincipalClass *)self delegate];
  [v4 buddyControllerDone:self];
}

- (CKMPRiMessageConsentViewController)iMessageConsentViewController
{
  return self->_iMessageConsentViewController;
}

- (void)setIMessageConsentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end