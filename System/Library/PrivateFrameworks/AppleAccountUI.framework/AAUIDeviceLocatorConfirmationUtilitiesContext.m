@interface AAUIDeviceLocatorConfirmationUtilitiesContext
- (ACAccount)account;
- (NSDictionary)customRequestHeaders;
- (NSString)buttonTitle;
- (NSString)message;
- (NSString)telemetryFlowID;
- (UIViewController)presentingViewController;
- (void)setAccount:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setCustomRequestHeaders:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
@end

@implementation AAUIDeviceLocatorConfirmationUtilitiesContext

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSDictionary)customRequestHeaders
{
  return self->_customRequestHeaders;
}

- (void)setCustomRequestHeaders:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_customRequestHeaders, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end