@interface AAUIServerUIHookHandler
- (AAUIServerUIHookHandler)init;
- (UIViewController)presentingControllerOverride;
- (void)setPresentingControllerOverride:(id)a3;
@end

@implementation AAUIServerUIHookHandler

- (AAUIServerUIHookHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIServerUIHookHandler;
  v2 = [(AAUIServerUIHookHandler *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AAUIServerHookHandlerDelegate);
    delegate = v2->_delegate;
    v2->_delegate = v3;

    [(RUIServerHookHandler *)v2 setDelegate:v2->_delegate];
  }
  return v2;
}

- (UIViewController)presentingControllerOverride
{
  return self->_presentingControllerOverride;
}

- (void)setPresentingControllerOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingControllerOverride, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end