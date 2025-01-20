@interface CHUISWidgetLaunchRequest
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEntitledToOpenSystemProcesses;
- (BOOL)isEqual:(id)a3;
- (BSAction)launchAction;
- (CHUISWidgetLaunchRequest)initWithBSXPCCoder:(id)a3;
- (CHUISWidgetLaunchRequest)initWithLaunchAction:(id)a3 effectiveContainerBundleIdentifier:(id)a4 isEntitledToOpenSystemProcesses:(BOOL)a5;
- (NSString)effectiveContainerBundleIdentifier;
- (NSURL)url;
- (NSUserActivity)newUserActivity;
- (id)_stateDumpDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userActivityData;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHUISWidgetLaunchRequest

- (CHUISWidgetLaunchRequest)initWithLaunchAction:(id)a3 effectiveContainerBundleIdentifier:(id)a4 isEntitledToOpenSystemProcesses:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHUISWidgetLaunchRequest;
  v11 = [(CHUISWidgetLaunchRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_launchAction, a3);
    objc_storeStrong((id *)&v12->_effectiveContainerBundleIdentifier, a4);
    v12->_isEntitledToOpenSystemProcesses = a5;
  }

  return v12;
}

- (NSURL)url
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(BSAction *)self->_launchAction url];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (id)userActivityData
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(BSAction *)self->_launchAction userActivityData];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSUserActivity)newUserActivity
{
  v2 = [(CHUISWidgetLaunchRequest *)self userActivityData];
  if (v2) {
    v3 = (NSUserActivity *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHUISWidgetLaunchRequest alloc];
  effectiveContainerBundleIdentifier = self->_effectiveContainerBundleIdentifier;
  launchAction = self->_launchAction;
  BOOL isEntitledToOpenSystemProcesses = self->_isEntitledToOpenSystemProcesses;

  return [(CHUISWidgetLaunchRequest *)v4 initWithLaunchAction:launchAction effectiveContainerBundleIdentifier:effectiveContainerBundleIdentifier isEntitledToOpenSystemProcesses:isEntitledToOpenSystemProcesses];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CHUISWidgetLaunchRequest)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeStringForKey:@"effectiveContainerBundleIdentifier"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isEntitledToOpenSystemProcesses"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchAction"];
  v8 = [(CHUISWidgetLaunchRequest *)self initWithLaunchAction:v7 effectiveContainerBundleIdentifier:v5 isEntitledToOpenSystemProcesses:v6];

  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_effectiveContainerBundleIdentifier forKey:@"effectiveContainerBundleIdentifier"];
  [v4 encodeObject:self->_launchAction forKey:@"launchAction"];
  [v4 encodeBool:self->_isEntitledToOpenSystemProcesses forKey:@"isEntitledToOpenSystemProcesses"];
}

- (id)_stateDumpDescription
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke;
  v16[3] = &unk_1E62AF538;
  id v4 = v3;
  id v17 = v4;
  v18 = self;
  id v5 = (id)[v4 modifyProem:v16];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke_2;
  v13 = &unk_1E62AF538;
  id v6 = v4;
  id v14 = v6;
  v15 = self;
  id v7 = (id)[v6 modifyBody:&v10];
  v8 = objc_msgSend(v6, "build", v10, v11, v12, v13);

  return v8;
}

id __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"launchAction"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"effectiveContainerBundleIdentifier"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"isEntitledToOpenSystemProcesses"];
}

void __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) url];
  id v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  id v4 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) effectiveContainerBundleIdentifier];
  id v5 = (id)objc_msgSend(v4, "appendObject:withName:");

  id v6 = *(void **)(a1 + 32);
  id v10 = (id)[*(id *)(a1 + 40) newUserActivity];
  id v7 = (id)objc_msgSend(v6, "appendObject:withName:");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    effectiveContainerBundleIdentifier = self->_effectiveContainerBundleIdentifier;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __36__CHUISWidgetLaunchRequest_isEqual___block_invoke;
    v24[3] = &unk_1E62AF740;
    id v11 = v9;
    id v25 = v11;
    id v12 = (id)[v5 appendString:effectiveContainerBundleIdentifier counterpart:v24];
    BOOL isEntitledToOpenSystemProcesses = self->_isEntitledToOpenSystemProcesses;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_2;
    v22[3] = &unk_1E62AF688;
    id v14 = v11;
    id v23 = v14;
    id v15 = (id)[v5 appendBool:isEntitledToOpenSystemProcesses counterpart:v22];
    launchAction = self->_launchAction;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_3;
    v20[3] = &unk_1E62AF708;
    id v21 = v14;
    id v17 = (id)[v5 appendObject:launchAction counterpart:v20];
    char v18 = [v5 isEqual];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

id __36__CHUISWidgetLaunchRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

uint64_t __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

id __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_launchAction];
  id v5 = (id)[v3 appendString:self->_effectiveContainerBundleIdentifier];
  id v6 = (id)[v3 appendBool:self->_isEntitledToOpenSystemProcesses];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (NSString)effectiveContainerBundleIdentifier
{
  return self->_effectiveContainerBundleIdentifier;
}

- (BOOL)isEntitledToOpenSystemProcesses
{
  return self->_isEntitledToOpenSystemProcesses;
}

- (BSAction)launchAction
{
  return self->_launchAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchAction, 0);

  objc_storeStrong((id *)&self->_effectiveContainerBundleIdentifier, 0);
}

@end