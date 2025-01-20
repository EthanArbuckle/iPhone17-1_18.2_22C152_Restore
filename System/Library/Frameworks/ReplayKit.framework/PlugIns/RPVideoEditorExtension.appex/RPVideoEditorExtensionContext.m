@interface RPVideoEditorExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)extensionObjectProxy;
- (id)videoEditorExtensionViewController;
- (void)doAction:(id)a3;
@end

@implementation RPVideoEditorExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPVideoEditorExtensionProtocol];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPVideoEditorExtensionHostProtocol];
}

- (void)doAction:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPVideoEditorExtensionContext:doAction", v6, 2u);
  }
  v5 = [(RPVideoEditorExtensionContext *)self videoEditorExtensionViewController];
  [v5 doAction:v4];
}

- (id)videoEditorExtensionViewController
{
  return [(RPVideoEditorExtensionContext *)self _principalObject];
}

- (id)extensionObjectProxy
{
  v2 = [(RPVideoEditorExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&stru_100018840];

  return v3;
}

@end