@interface PushDiagnostic
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PushDiagnostic

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(id, void))a5;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v6;
    id v9 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%@]: ** RECEIVED CONNECTION TEST: %@ **", (uint8_t *)&v10, 0x16u);
  }
  v7[2](v7, 0);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

@end