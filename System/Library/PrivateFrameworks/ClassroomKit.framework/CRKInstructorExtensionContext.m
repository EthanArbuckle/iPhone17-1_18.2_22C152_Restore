@interface CRKInstructorExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)listenerEndpointWithCompletion:(id)a3;
@end

@implementation CRKInstructorExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_39);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_vendorInterface;

  return v2;
}

uint64_t __66__CRKInstructorExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_vendorInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D829A58];

  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_45);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_hostInterface;

  return v2;
}

uint64_t __64__CRKInstructorExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_hostInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D829580];

  return MEMORY[0x270F9A758]();
}

- (void)listenerEndpointWithCompletion:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->mListener)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = [MEMORY[0x263F08D88] anonymousListener];
  mListener = self->mListener;
  self->mListener = v6;

  [(NSXPCListener *)self->mListener setDelegate:self];
  [(NSXPCListener *)self->mListener resume];
  id v4 = v8;
  if (v8)
  {
LABEL_3:
    v5 = [(NSXPCListener *)self->mListener endpoint];
    (*((void (**)(id, void *))v8 + 2))(v8, v5);

    id v4 = v8;
  }
LABEL_4:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F39CE8];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithXPCConnection:v6];

  id v8 = [(CRKInstructorExtensionContext *)self _principalObject];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(CRKInstructorExtensionContext *)self _principalObject];
    [v10 didAcceptAdminTransport:v7];
  }
  else
  {
    [v7 invalidate];
  }

  return v9 & 1;
}

- (void).cxx_destruct
{
}

@end