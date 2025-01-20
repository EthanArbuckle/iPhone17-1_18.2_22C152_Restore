@interface IAMPresentingModalMessageContext
- (IAMMessage)message;
- (IAMMessageGroup)messageGroup;
- (IAMPresentingModalMessageContext)initWithMessage:(id)a3 messageGroup:(id)a4 presentingViewController:(id)a5 presentationExpirationTimer:(id)a6 presentationHandler:(id)a7;
- (NSTimer)presentationExpirationTimer;
- (UIViewController)presentingViewController;
- (id)presentationHandler;
- (void)setMessage:(id)a3;
- (void)setMessageGroup:(id)a3;
- (void)setPresentationExpirationTimer:(id)a3;
- (void)setPresentationHandler:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation IAMPresentingModalMessageContext

- (IAMPresentingModalMessageContext)initWithMessage:(id)a3 messageGroup:(id)a4 presentingViewController:(id)a5 presentationExpirationTimer:(id)a6 presentationHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IAMPresentingModalMessageContext;
  v18 = [(IAMPresentingModalMessageContext *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_message, a3);
    objc_storeStrong((id *)&v19->_messageGroup, a4);
    objc_storeWeak((id *)&v19->_presentingViewController, v15);
    objc_storeStrong((id *)&v19->_presentationExpirationTimer, a6);
    uint64_t v20 = MEMORY[0x21D475810](v17);
    id presentationHandler = v19->_presentationHandler;
    v19->_id presentationHandler = (id)v20;
  }
  return v19;
}

- (IAMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (IAMMessageGroup)messageGroup
{
  return self->_messageGroup;
}

- (void)setMessageGroup:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSTimer)presentationExpirationTimer
{
  return self->_presentationExpirationTimer;
}

- (void)setPresentationExpirationTimer:(id)a3
{
}

- (id)presentationHandler
{
  return self->_presentationHandler;
}

- (void)setPresentationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationHandler, 0);
  objc_storeStrong((id *)&self->_presentationExpirationTimer, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_messageGroup, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end