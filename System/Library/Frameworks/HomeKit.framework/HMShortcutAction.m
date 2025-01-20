@interface HMShortcutAction
+ (BOOL)isSupportedForHome:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (HMShortcutAction)init;
- (HMShortcutAction)initWithCoder:(id)a3;
- (HMShortcutAction)initWithDictionary:(id)a3 home:(id)a4;
- (HMShortcutAction)initWithShortcut:(id)a3;
- (HMShortcutAction)initWithUUID:(id)a3;
- (WFHomeWorkflow)shortcut;
- (char)initWithShortcut:(char *)a1 shortcutData:(void *)a2 uuid:(void *)a3;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shortcutData;
- (unint64_t)type;
@end

@implementation HMShortcutAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutData, 0);

  objc_storeStrong((id *)&self->_shortcut, 0);
}

- (HMShortcutAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMShortcutAction;
  v5 = [(HMAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.workflowDataKey"];
    shortcutData = v5->_shortcutData;
    v5->_shortcutData = (NSData *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMShortcutAction *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMShortcutAction *)self shortcutData];
      uint64_t v8 = [(HMShortcutAction *)v6 shortcutData];
      objc_super v9 = (void *)v8;
      if (v7 && v8)
      {
        char v10 = [v7 isEqualToData:v8];
      }
      else
      {
        v11 = [(HMAction *)self uniqueIdentifier];
        v12 = [(HMAction *)v6 uniqueIdentifier];
        char v10 = [v11 isEqual:v12];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMShortcutAction initWithShortcut:shortcutData:uuid:]((char *)[HMShortcutAction alloc], self->_shortcut, self->_shortcutData);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (char)initWithShortcut:(char *)a1 shortcutData:(void *)a2 uuid:(void *)a3
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)HMShortcutAction;
    a1 = (char *)objc_msgSendSuper2(&v13, sel_initWithUUID_, 0);
    if (a1)
    {
      v7 = &OBJC_IVAR___HMShortcutAction__shortcut;
      if (v5)
      {
        uint64_t v8 = v5;
      }
      else
      {
        v7 = &OBJC_IVAR___HMShortcutAction__shortcutData;
        uint64_t v8 = v6;
      }
      uint64_t v9 = *v7;
      id v10 = v8;
      v11 = *(void **)&a1[v9];
      *(void *)&a1[v9] = v10;
    }
  }

  return a1;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    char v14 = 0;
    goto LABEL_12;
  }
  v7 = [v6 shortcutData];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shortcutData = self->_shortcutData;
  id v10 = shortcutData;
  if (!shortcutData)
  {
    id v10 = [(WFHomeWorkflow *)self->_shortcut data];
  }
  char v11 = HMFEqualObjects();
  char v12 = v11;
  if (!shortcutData)
  {

    if (v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ((v11 & 1) == 0)
  {
LABEL_9:
    objc_storeStrong((id *)&self->_shortcutData, v7);
    shortcut = self->_shortcut;
    self->_shortcut = 0;
  }
LABEL_10:
  char v14 = v12 ^ 1;
  os_unfair_lock_unlock(p_lock);

LABEL_12:
  return v14;
}

- (id)_serializeForAdd
{
  v3 = [(HMShortcutAction *)self shortcutData];
  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMShortcutAction;
    id v4 = [(HMAction *)&v8 _serializeForAdd];
    id v5 = (void *)[v4 mutableCopy];

    [v5 setObject:v3 forKeyedSubscript:@"HM.workflowDataKey"];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)requiresDeviceUnlock
{
  v2 = [(HMShortcutAction *)self shortcut];
  char v3 = [v2 requiresDeviceUnlock];

  return v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  char v3 = [(HMShortcutAction *)self shortcutData];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)shortcutData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shortcutData = self->_shortcutData;
  if (shortcutData)
  {
    id v5 = shortcutData;
  }
  else
  {
    id v5 = [(WFHomeWorkflow *)self->_shortcut data];
  }
  id v6 = v5;
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (WFHomeWorkflow)shortcut
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shortcut = self->_shortcut;
  if (shortcut)
  {
LABEL_2:
    id v5 = shortcut;
    goto LABEL_10;
  }
  if (self->_shortcutData && WorkflowKitLibraryCore())
  {
    uint64_t v13 = 0;
    char v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v6 = (void *)getWFHomeWorkflowClass_softClass;
    uint64_t v16 = getWFHomeWorkflowClass_softClass;
    if (!getWFHomeWorkflowClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getWFHomeWorkflowClass_block_invoke;
      v12[3] = &unk_1E5943DD8;
      v12[4] = &v13;
      __getWFHomeWorkflowClass_block_invoke((uint64_t)v12);
      id v6 = (void *)v14[3];
    }
    v7 = v6;
    _Block_object_dispose(&v13, 8);
    objc_super v8 = (WFHomeWorkflow *)[[v7 alloc] initWithData:self->_shortcutData];
    uint64_t v9 = self->_shortcut;
    self->_shortcut = v8;

    shortcut = self->_shortcut;
    if (shortcut)
    {
      shortcutData = self->_shortcutData;
      self->_shortcutData = 0;

      shortcut = self->_shortcut;
    }
    goto LABEL_2;
  }
  id v5 = 0;
LABEL_10:
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (unint64_t)type
{
  return 2;
}

- (HMShortcutAction)initWithDictionary:(id)a3 home:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMShortcutAction;
  v7 = [(HMAction *)&v11 initWithDictionary:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "hmf_dataForKey:", @"HM.workflowDataKey");
    shortcutData = v7->_shortcutData;
    v7->_shortcutData = (NSData *)v8;
  }
  return v7;
}

- (HMShortcutAction)initWithShortcut:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = (HMShortcutAction *)_HMFPreconditionFailure();
    [(HMShortcutAction *)v8 initWithUUID:v10];
  }
  id v5 = v4;
  id v6 = -[HMShortcutAction initWithShortcut:shortcutData:uuid:]((char *)self, v4, 0);

  return (HMShortcutAction *)v6;
}

- (HMShortcutAction)initWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  SEL v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMShortcutAction)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupportedForHome:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(a3, "residentDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (([*(id *)(*((void *)&v8 + 1) + 8 * i) capabilities] & 0x100) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

@end