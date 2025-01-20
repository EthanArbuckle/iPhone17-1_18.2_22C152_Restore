@interface AXRemoteUIAlertCallbackHolder
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)dismissalHandler;
- (id)presentationHandler;
- (void)setDismissalHandler:(id)a3;
- (void)setPresentationHandler:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
@end

@implementation AXRemoteUIAlertCallbackHolder

- (id)presentationHandler
{
  return self->_presentationHandler;
}

- (void)setPresentationHandler:(id)a3
{
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong(&self->_presentationHandler, 0);
}

@end