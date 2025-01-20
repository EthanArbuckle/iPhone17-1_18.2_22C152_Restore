@interface FBSSceneSnapshotRequest
- (BOOL)allowsProtectedContent;
- (BOOL)performSnapshotWithContext:(id)a3;
- (FBSSceneSettings)settings;
- (FBSSceneSnapshotRequest)initWithSettings:(id)a3;
- (FBSSceneSnapshotRequest)initWithSettings:(id)a3 allowsProtectedContent:(BOOL)a4;
- (FBSSceneSnapshotRequest)initWithXPCDictionary:(id)a3;
- (FBSSceneSnapshotRequestDelegate)delegate;
- (NSString)description;
- (NSString)sceneID;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSceneID:(id)a3;
@end

@implementation FBSSceneSnapshotRequest

- (FBSSceneSnapshotRequest)initWithSettings:(id)a3 allowsProtectedContent:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBSSceneSnapshotRequest;
  v7 = [(FBSSceneSnapshotRequest *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    settings = v7->_settings;
    v7->_settings = (FBSSceneSettings *)v8;

    v7->_allowsProtectedContent = a4;
  }

  return v7;
}

- (FBSSceneSnapshotRequest)initWithSettings:(id)a3
{
  return [(FBSSceneSnapshotRequest *)self initWithSettings:a3 allowsProtectedContent:0];
}

- (BOOL)performSnapshotWithContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_handled)
  {
    char v6 = 0;
  }
  else
  {
    self->_handled = 1;
    v7 = [v4 clientExtendedData];
    if (self->_allowsProtectedContent != [v7 BOOLForSetting:281330800])
    {
      if (![v7 mutableCopy]) {
        id v8 = objc_alloc_init((Class)off_1E58F4540);
      }
      BSSettingFlagIfYes();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained snapshotRequestAllowSnapshot:self])
    {
      [v5 setSettings:self->_settings];
      char v6 = [WeakRetained snapshotRequest:self performWithContext:v5];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (NSString)description
{
  return (NSString *)[(FBSSceneSnapshotRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSSceneSnapshotRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_sceneID withName:@"sceneID"];
  id v5 = (id)[v3 appendBool:self->_handled withName:@"handled"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSSceneSnapshotRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneSnapshotRequest *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__FBSSceneSnapshotRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __65__FBSSceneSnapshotRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"settings"];
}

- (FBSSceneSnapshotRequest)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if ([(FBSSceneSnapshotRequest *)self init]) {
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  }

  return 0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (FBSSceneSnapshotRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBSSceneSnapshotRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (BOOL)allowsProtectedContent
{
  return self->_allowsProtectedContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end