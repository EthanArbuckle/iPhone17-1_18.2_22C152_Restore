@interface MFAssistantEmailCreate
- (void)performWithCompletion:(id)a3;
@end

@implementation MFAssistantEmailCreate

- (void)performWithCompletion:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  if (MSCanSendMail())
  {
    id v3 = 0;
  }
  else
  {
    id v4 = objc_alloc((Class)SACommandFailed);
    id v3 = [v4 initWithErrorCode:SAEmailNoAccountErrorCode];
  }
  v5 = [v3 dictionary];
  v6[2](v6, v5);
}

@end