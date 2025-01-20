@interface DRKeyboardArbiter
- (id)errorHandler;
- (id)proxy;
- (void)connect;
- (void)disconnect;
- (void)queue_activeProcessResignWithCompletion:(id)a3;
- (void)queue_endInputSessionWithCompletion:(id)a3;
- (void)queue_getDebugInfoWithCompletion:(id)a3;
- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4;
- (void)queue_keyboardChangedWithCompletion:(id)a3;
- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4;
- (void)queue_keyboardSuppressed:(BOOL)a3 withCompletion:(id)a4;
- (void)queue_keyboardTransition:(id)a3 event:(unint64_t)a4 withInfo:(id)a5 onComplete:(id)a6;
- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4;
- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4;
- (void)queue_setKeyboardDisabled:(BOOL)a3 withCompletion:(id)a4;
- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4;
- (void)setErrorHandler:(id)a3;
- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 completionHandler:(id)a5;
@end

@implementation DRKeyboardArbiter

- (void)connect
{
  objc_initWeak(&location, self);
  v3 = +[_UIRemoteKeyboards createArbiterConnection];
  connection = self->_connection;
  self->_connection = v3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C180;
  v8[3] = &unk_100054CA8;
  objc_copyWeak(&v9, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C1DC;
  v6[3] = &unk_100054CA8;
  objc_copyWeak(&v7, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v6];
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  [(NSXPCConnection *)self->_connection resume];
  v5 = [(DRKeyboardArbiter *)self proxy];
  [v5 setWantsFencing:0];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)disconnect
{
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  connection = self->_connection;
  [(NSXPCConnection *)connection invalidate];
}

- (id)proxy
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C30C;
  v5[3] = &unk_100054D20;
  v5[4] = self;
  v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];
  return v3;
}

- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(DRKeyboardArbiter *)self proxy];
  [v10 setKeyboardTotalDisable:v6 withFence:v9 completionHandler:v8];
}

- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4
{
  id v7 = a4;
  v5 = [a3 animationFence];
  [v5 invalidate];

  BOOL v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    BOOL v6 = v7;
  }
}

- (void)queue_keyboardChangedWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4
{
  if (a4) {
    (*((void (**)(id, double))a4 + 2))(a4, a3);
  }
}

- (void)queue_keyboardTransition:(id)a3 event:(unint64_t)a4 withInfo:(id)a5 onComplete:(id)a6
{
  if (a6) {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (void)queue_keyboardSuppressed:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)queue_getDebugInfoWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, _UNKNOWN **))a3 + 2))(a3, &off_100057948);
  }
}

- (void)queue_setKeyboardDisabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)queue_activeProcessResignWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)queue_endInputSessionWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end