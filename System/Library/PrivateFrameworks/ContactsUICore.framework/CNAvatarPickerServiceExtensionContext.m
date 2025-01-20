@interface CNAvatarPickerServiceExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (CNAvatarPickerServiceExtensionProtocol)exportedObject;
- (id)remoteProxy;
- (void)overrideUserInterfaceStyle:(int64_t)a3;
- (void)setCurrentMemojiMetadata:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setSelectedRecordIdentifier:(id)a3;
- (void)setSetupUserAvatarRecords:(id)a3;
@end

@implementation CNAvatarPickerServiceExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BFEC150];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BFEBEE8];
}

- (id)remoteProxy
{
  v2 = [(CNAvatarPickerServiceExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)setSelectedRecordIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarPickerServiceExtensionContext *)self exportedObject];
  [v5 setSelectedRecordIdentifier:v4];
}

- (void)setCurrentMemojiMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarPickerServiceExtensionContext *)self exportedObject];
  [v5 setCurrentMemojiMetadata:v4];
}

- (void)overrideUserInterfaceStyle:(int64_t)a3
{
  id v4 = [(CNAvatarPickerServiceExtensionContext *)self exportedObject];
  [v4 overrideUserInterfaceStyle:a3];
}

- (void)setSetupUserAvatarRecords:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarPickerServiceExtensionContext *)self exportedObject];
  [v5 setSetupUserAvatarRecords:v4];
}

- (CNAvatarPickerServiceExtensionProtocol)exportedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  return (CNAvatarPickerServiceExtensionProtocol *)WeakRetained;
}

- (void)setExportedObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end