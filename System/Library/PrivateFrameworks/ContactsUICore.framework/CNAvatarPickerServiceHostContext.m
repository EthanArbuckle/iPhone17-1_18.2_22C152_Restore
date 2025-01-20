@interface CNAvatarPickerServiceHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (CNAvatarPickerServiceHostProtocol)exportedObject;
- (id)remoteProxy;
- (void)avatarPickerExtensionDidCancel;
- (void)avatarPickerExtensionDidCreateAvatarWithRecordData:(id)a3 identifier:(id)a4;
- (void)avatarPickerExtensionDidDeleteAvatarWithIdentifier:(id)a3;
- (void)avatarPickerExtensionDidFinishWithImageData:(id)a3 memojiMetadata:(id)a4;
- (void)avatarPickerExtensionDidRequestMemojiEditorPresentationForRecordIdentifier:(id)a3;
- (void)avatarPickerExtensionDidSelectItemWithImageData:(id)a3 memojiMetadata:(id)a4;
- (void)setExportedObject:(id)a3;
@end

@implementation CNAvatarPickerServiceHostContext

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
  v2 = [(CNAvatarPickerServiceHostContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)avatarPickerExtensionDidSelectItemWithImageData:(id)a3 memojiMetadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAvatarPickerServiceHostContext *)self exportedObject];
  [v8 avatarPickerExtensionDidSelectItemWithImageData:v7 memojiMetadata:v6];
}

- (void)avatarPickerExtensionDidFinishWithImageData:(id)a3 memojiMetadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAvatarPickerServiceHostContext *)self exportedObject];
  [v8 avatarPickerExtensionDidFinishWithImageData:v7 memojiMetadata:v6];
}

- (void)avatarPickerExtensionDidCancel
{
  id v2 = [(CNAvatarPickerServiceHostContext *)self exportedObject];
  [v2 avatarPickerExtensionDidCancel];
}

- (void)avatarPickerExtensionDidRequestMemojiEditorPresentationForRecordIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarPickerServiceHostContext *)self exportedObject];
  [v5 avatarPickerExtensionDidRequestMemojiEditorPresentationForRecordIdentifier:v4];
}

- (void)avatarPickerExtensionDidCreateAvatarWithRecordData:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAvatarPickerServiceHostContext *)self exportedObject];
  [v8 avatarPickerExtensionDidCreateAvatarWithRecordData:v7 identifier:v6];
}

- (void)avatarPickerExtensionDidDeleteAvatarWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarPickerServiceHostContext *)self exportedObject];
  [v5 avatarPickerExtensionDidDeleteAvatarWithIdentifier:v4];
}

- (CNAvatarPickerServiceHostProtocol)exportedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  return (CNAvatarPickerServiceHostProtocol *)WeakRetained;
}

- (void)setExportedObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end