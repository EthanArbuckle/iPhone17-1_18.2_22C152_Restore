@interface AUHostExtensionContext
+ (BOOL)conformsToProtocol:(id)a3;
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (AUHostDelegate)delegate;
- (AUHostExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (BOOL)conformsToProtocol:(id)a3;
- (NSExtension)extension;
- (id)_derivedExtensionAuxiliaryHostProtocol;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
@end

@implementation AUHostExtensionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AUHostDelegate)delegate
{
  return self->_delegate;
}

- (void)setExtension:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() conformsToProtocol:v3];

  return v4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    delegate = self->_delegate;
  }
  else {
    delegate = 0;
  }
  return delegate;
}

- (id)_derivedExtensionAuxiliaryHostProtocol
{
  v4.receiver = self;
  v4.super_class = (Class)AUHostExtensionContext;
  v2 = [(AUHostExtensionContext *)&v4 _derivedExtensionAuxiliaryHostProtocol];
  SetAllowedClassesForAUAudioUnitHostXPCInterface(v2);
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUHostExtensionContext;
  [(AUHostExtensionContext *)&v2 dealloc];
}

- (AUHostExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AUHostExtensionContext;
  v11 = [(AUHostExtensionContext *)&v15 initWithInputItems:v8 listenerEndpoint:v9 contextUUID:v10];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    delegate = v11->_delegate;
    v11->_delegate = (AUHostDelegate *)v12;
  }
  return v11;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  return +[AUHostDelegate conformsToProtocol:a3];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::once[0] != -1) {
    dispatch_once(+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::once, &__block_literal_global_150);
  }
  objc_super v2 = (void *)+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol;
  return v2;
}

void __59__AUHostExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  CreateAUAudioUnitXPCInterface();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol, v0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::once[0] != -1) {
    dispatch_once(+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::once, &__block_literal_global_5029);
  }
  objc_super v2 = (void *)+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol;
  return v2;
}

void __57__AUHostExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  id v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB6DE0];
  objc_storeStrong((id *)&+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol, v0);

  v1 = (void *)+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol;
  SetAllowedClassesForAUAudioUnitHostXPCInterface(v1);
}

+ (id)_allowedItemPayloadClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  objc_super v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

@end