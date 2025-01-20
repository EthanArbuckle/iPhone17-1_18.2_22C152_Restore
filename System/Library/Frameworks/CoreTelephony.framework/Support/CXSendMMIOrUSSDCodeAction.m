@interface CXSendMMIOrUSSDCodeAction
- (BOOL)satisfiedBy:(dict)a3;
- (void)asDictionary:(dict *)a3;
@end

@implementation CXSendMMIOrUSSDCodeAction

- (void)asDictionary:(dict *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  -[CXSendMMIOrUSSDCodeAction asDictionary:](&v16, "asDictionary:");
  uint64_t v5 = [(CXSendMMIOrUSSDCodeAction *)self code];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(CXSendMMIOrUSSDCodeAction *)self code];
    id v8 = [v7 length];

    if (v8)
    {
      id v9 = [(CXSendMMIOrUSSDCodeAction *)self code];
      xpc_object_t v14 = xpc_string_create((const char *)[v9 cStringUsingEncoding:4]);
      if (!v14) {
        xpc_object_t v14 = xpc_null_create();
      }
      v12 = a3;
      v13 = "kPhoneNumber";
      sub_100035E70((uint64_t)&v12, &v14, &object);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(v14);
      xpc_object_t v14 = 0;
    }
  }
  xpc_object_t v10 = xpc_int64_create(+[TelephonyProviderDelegate getTTYType:[(CXSendMMIOrUSSDCodeAction *)self ttyType]]);
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  v12 = a3;
  v13 = "kIsTTY";
  sub_100035E70((uint64_t)&v12, &v10, &v11);
  xpc_release(v11);
  xpc_object_t v11 = 0;
  xpc_release(v10);
}

- (BOOL)satisfiedBy:(dict)a3
{
  return 0;
}

@end