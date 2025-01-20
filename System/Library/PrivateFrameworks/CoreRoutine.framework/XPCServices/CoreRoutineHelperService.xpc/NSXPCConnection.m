@interface NSXPCConnection
- (void)rejectInvocation:(id)a3 withError:(id)a4 replyTypes:(id)a5;
@end

@implementation NSXPCConnection

- (void)rejectInvocation:(id)a3 withError:(id)a4 replyTypes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v16 = v8;
  id v9 = a5;
  if (!v7)
  {
    v10 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v15) = 0;
    v14 = "Invalid parameter not satisfying: invocation";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v10 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v15) = 0;
    v14 = "Invalid parameter not satisfying: error";
    goto LABEL_11;
  }
  uint64_t v15 = 0;
  objc_msgSend(v7, "getArgument:atIndex:", &v15, objc_msgSend(v7, "blockArgumentIndex"));
  v10 = +[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", [v9 UTF8String]);
  v11 = +[NSInvocation invocationWithMethodSignature:v10];
  id v12 = [v10 argumentIndexForClass:objc_opt_class()];
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = v12;
    [v11 retainArguments];
    [v11 setArgument:&v16 atIndex:v13];
  }
  [v11 setTarget:v15];
  [v11 invoke];

LABEL_9:
}

@end