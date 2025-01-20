@interface CKSendMenuPresentationRequest
+ (id)requestWithPresentationContext:(id)a3 appCardContentViewController:(id)a4 resolvedAppCardPresentationStyle:(unint64_t)a5 completion:(id)a6;
+ (id)requestWithPresentationContext:(id)a3 sendMenuViewController:(id)a4 completion:(id)a5;
- (CKSceneOverlayPresentationContext)presentationContext;
- (CKSendMenuPresentationRequest)initWithPresentationContext:(id)a3 sendMenuViewController:(id)a4 appCardContentViewController:(id)a5 resolvedAppCardPresentationStyle:(unint64_t)a6 completion:(id)a7;
- (CKSendMenuViewController)sendMenuViewController;
- (UIViewController)appCardContentViewController;
- (id)completionHandler;
- (id)newSendMenuPresentationWithPresentingViewController:(id)a3 delegate:(id)a4;
- (unint64_t)resolvedAppCardPresentationStyle;
- (void)didFinishPresentTransition;
- (void)setAppCardContentViewController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)setResolvedAppCardPresentationStyle:(unint64_t)a3;
- (void)setSendMenuViewController:(id)a3;
@end

@implementation CKSendMenuPresentationRequest

- (CKSendMenuPresentationRequest)initWithPresentationContext:(id)a3 sendMenuViewController:(id)a4 appCardContentViewController:(id)a5 resolvedAppCardPresentationStyle:(unint64_t)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKSendMenuPresentationRequest;
  v17 = [(CKSendMenuPresentationRequest *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_presentationContext, a3);
    objc_storeStrong((id *)&v18->_sendMenuViewController, a4);
    objc_storeStrong((id *)&v18->_appCardContentViewController, a5);
    v18->_resolvedAppCardPresentationStyle = a6;
    [(CKSendMenuPresentationRequest *)v18 setCompletionHandler:v16];
  }

  return v18;
}

+ (id)requestWithPresentationContext:(id)a3 sendMenuViewController:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithPresentationContext:v10 sendMenuViewController:v9 appCardContentViewController:0 resolvedAppCardPresentationStyle:0 completion:v8];

  return v11;
}

+ (id)requestWithPresentationContext:(id)a3 appCardContentViewController:(id)a4 resolvedAppCardPresentationStyle:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithPresentationContext:v12 sendMenuViewController:0 appCardContentViewController:v11 resolvedAppCardPresentationStyle:a5 completion:v10];

  return v13;
}

- (id)newSendMenuPresentationWithPresentingViewController:(id)a3 delegate:(id)a4
{
  sendMenuViewController = self->_sendMenuViewController;
  id v7 = a4;
  id v8 = a3;
  id v9 = [CKSendMenuPresentation alloc];
  presentationContext = self->_presentationContext;
  if (sendMenuViewController) {
    uint64_t v11 = [(CKSendMenuPresentation *)v9 initWithOverlayPresentationContext:presentationContext presentingViewController:v8 sendMenuViewController:self->_sendMenuViewController delegate:v7];
  }
  else {
    uint64_t v11 = [(CKSendMenuPresentation *)v9 initWithOverlayPresentationContext:presentationContext presentingViewController:v8 appCardContentViewController:self->_appCardContentViewController appCardPresentationStyle:self->_resolvedAppCardPresentationStyle delegate:v7];
  }
  id v12 = (void *)v11;

  return v12;
}

- (void)didFinishPresentTransition
{
  v2 = [(CKSendMenuPresentationRequest *)self completionHandler];
  v2[2]();
}

- (CKSceneOverlayPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (CKSendMenuViewController)sendMenuViewController
{
  return self->_sendMenuViewController;
}

- (void)setSendMenuViewController:(id)a3
{
}

- (UIViewController)appCardContentViewController
{
  return self->_appCardContentViewController;
}

- (void)setAppCardContentViewController:(id)a3
{
}

- (unint64_t)resolvedAppCardPresentationStyle
{
  return self->_resolvedAppCardPresentationStyle;
}

- (void)setResolvedAppCardPresentationStyle:(unint64_t)a3
{
  self->_resolvedAppCardPresentationStyle = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_appCardContentViewController, 0);
  objc_storeStrong((id *)&self->_sendMenuViewController, 0);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

@end