@interface MPAssistantAddOutputDevicesToGroup
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantAddOutputDevicesToGroup

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantAddOutputDevicesToGroup *)self aceId];
    sub_1D4244ECC(@"Add Output Devices To Group", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Output Devices To Group (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v10 = self->_requestAceHash;
  v11 = [(MPAssistantAddOutputDevicesToGroup *)self hashedRouteUIDs];
  sub_1D4245018(@"Add Output Devices To Group", v10, v11);

  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = [(MPAssistantAddOutputDevicesToGroup *)self groupID];
  char v14 = [v13 isEqualToString:@"LOCAL_DEVICE"];

  if (v14)
  {
    char v15 = 0;
  }
  else
  {
    v16 = [(MPAssistantAddOutputDevicesToGroup *)self groupID];
    [v12 addObject:v16];

    v17 = [(MPAssistantAddOutputDevicesToGroup *)self hashedRouteUIDs];
    v18 = [(MPAssistantAddOutputDevicesToGroup *)self groupID];
    char v15 = [v17 containsObject:v18];
  }
  v19 = [(MPAssistantAddOutputDevicesToGroup *)self hashedRouteUIDs];
  [v12 addObjectsFromArray:v19];

  id v20 = objc_alloc_init(MEMORY[0x1E4F76E40]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1D4252F80;
  v23[3] = &unk_1E69E3998;
  id v24 = v20;
  v25 = self;
  char v27 = v15;
  id v26 = v4;
  id v21 = v4;
  id v22 = v20;
  [v22 decodeHashedRouteUIDs:v12 completion:v23];
}

@end