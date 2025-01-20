@interface MFXPCEndpointService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
+ (id)sharedInstance;
- (MFXPCEndpointService)init;
- (NSString)description;
- (id)activeListeners;
- (id)copyDiagnosticInformation;
- (id)listenerForProtocolNamed:(id)a3;
- (void)dealloc;
@end

@implementation MFXPCEndpointService

+ (id)sharedInstance
{
  if (qword_10016BDD8 != -1) {
    dispatch_once(&qword_10016BDD8, &stru_10013DD30);
  }
  v2 = (void *)qword_10016BDD0;

  return v2;
}

+ (id)requiredEntitlement
{
  return 0;
}

+ (id)serviceName
{
  return @"xpc-endpoint";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  id v8 = a3;
  v9 = xpc_dictionary_get_value(v8, (const char *)[_MSMailServiceArguments UTF8String]);
  v10 = v9;
  if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v12 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v10, "protocol")];
    v13 = [a1 sharedInstance];
    v14 = [v13 listenerForProtocolNamed:v12];

    v15 = [v14 endpoint];
    v16 = [v15 _endpoint];

    if (v16)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v8);
      v18 = reply;
      BOOL v11 = reply != 0;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "endpoint", v16);
        *a5 = v18;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (MFXPCEndpointService)init
{
  v27.receiver = self;
  v27.super_class = (Class)MFXPCEndpointService;
  v2 = [(MFXPCEndpointService *)&v27 init];
  if (v2)
  {
    v3 = +[MFDSearch endpointInfo];
    v33[0] = v3;
    v26 = +[MFDAutosave endpointInfo];
    v33[1] = v26;
    v4 = +[MFXPCServer endpointInfo];
    v33[2] = v4;
    v5 = +[MFXPCServer endpointInfo];
    v33[3] = v5;
    v6 = +[MFXPCServer endpointInfo];
    v33[4] = v6;
    v7 = +[MFXPCServer endpointInfo];
    v33[5] = v7;
    id v8 = +[MFXPCServer endpointInfo];
    v33[6] = v8;
    v9 = +[MFDOpenCompose endpointInfo];
    v33[7] = v9;
    v10 = +[MFDOpenComposeDelegateRequest endpointInfo];
    v33[8] = v10;
    BOOL v11 = +[NSArray arrayWithObjects:v33 count:9];

    v12 = +[NSMutableDictionary dictionary];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v29;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v18 = [v17 exportedInterface];
          v19 = [v18 protocol];
          v20 = NSStringFromProtocol(v19);
          [v12 setObject:v17 forKeyedSubscript:v20];
        }
        id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    v21 = (NSDictionary *)[v12 copy];
    endpointInfoByProtocol = v2->_endpointInfoByProtocol;
    v2->_endpointInfoByProtocol = v21;

    v23 = +[MFDiagnostics sharedController];
    [v23 addDiagnosticsGenerator:v2];

    v24 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[MFDiagnostics sharedController];
  [v3 removeDiagnosticsGenerator:self];

  v4.receiver = self;
  v4.super_class = (Class)MFXPCEndpointService;
  [(MFXPCEndpointService *)&v4 dealloc];
}

- (NSString)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p> ", objc_opt_class(), self];
  objc_super v4 = [(MFXPCEndpointService *)self activeListeners];
  id v5 = [v4 count];
  if (v5)
  {
    v6 = [v4 arrayByApplyingSelector:"description"];
    v7 = [v6 componentsJoinedByString:@",\n\t"];
    [v3 appendFormat:@"%ld active listeners: {\n\t%@\n}", v5, v7];
  }
  else
  {
    [v3 appendString:@"no active listeners"];
  }

  return (NSString *)v3;
}

- (id)copyDiagnosticInformation
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"\n==== XPC Endpoint Service ====\n"];
  objc_msgSend(v3, "appendFormat:", @"  self: %p\n", self);
  [v3 appendString:@"  endpoints: "];
  NSUInteger v4 = [(NSDictionary *)self->_endpointInfoByProtocol count];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_endpointInfoByProtocol allValues];
    v6 = objc_msgSend(v5, "ef_compactMap:", &stru_10013DD70);
    v7 = [v6 componentsJoinedByString:@",\n\t"];
    [v3 appendFormat:@"%ld exported {\n\t%@\n  }", v4, v7];
  }
  else
  {
    [v3 appendString:@"none"];
  }
  return v3;
}

- (id)activeListeners
{
  v2 = [(NSDictionary *)self->_endpointInfoByProtocol allValues];
  id v3 = objc_msgSend(v2, "ef_compactMap:", &stru_10013DD90);

  return v3;
}

- (id)listenerForProtocolNamed:(id)a3
{
  id v3 = [(NSDictionary *)self->_endpointInfoByProtocol objectForKey:a3];
  NSUInteger v4 = [v3 listener];
  id v5 = [v4 listener];

  return v5;
}

- (void).cxx_destruct
{
}

@end