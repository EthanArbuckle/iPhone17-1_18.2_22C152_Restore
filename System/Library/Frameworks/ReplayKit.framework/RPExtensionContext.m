@interface RPExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (RPExtensionContextDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3 completionHandler:(id)a4;
@end

@implementation RPExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D11F580];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Requested vendor protocol", v4, 2u);
  }
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D13F410];

  return v2;
}

- (void)setEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Set endpoint", v9, 2u);
  }
  v8 = [(RPExtensionContext *)self delegate];
  [v8 extensionContext:self setEndpoint:v6];

  v7[2](v7);
}

- (RPExtensionContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RPExtensionContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end