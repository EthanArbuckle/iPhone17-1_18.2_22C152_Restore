@interface BKSHIDKeyboardDevice
+ (BKSHIDKeyboardDevice)new;
- (BKSHIDKeyboardDevice)init;
- (BOOL)capsLockKeyHasLanguageSwitchLabel;
- (BOOL)globeKeyLabelHasGlobeSymbol;
- (NSString)description;
- (NSString)exclusivityIdentifier;
- (NSString)language;
- (NSString)layout;
- (NSString)transport;
- (id)_initWithProperties:(id)a3;
- (id)_properties;
- (int64_t)subinterfaceID;
- (unint64_t)senderID;
- (unsigned)countryCode;
- (unsigned)standardType;
- (void)_replaceProperties:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)appendDescriptionToStream:(id)a3 fromProxy:(id)a4;
@end

@implementation BKSHIDKeyboardDevice

- (void).cxx_destruct
{
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BKSHIDKeyboardDeviceProperties *)v2->_lock_properties globeKeyLabelHasGlobeSymbol];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BKSHIDKeyboardDeviceProperties *)v2->_lock_properties capsLockKeyHasLanguageSwitchLabel];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int64_t)subinterfaceID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(BKSHIDKeyboardDeviceProperties *)self->_lock_properties subinterfaceID];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unsigned)standardType
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = [(BKSHIDKeyboardDeviceProperties *)v2->_lock_properties standardType];
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)countryCode
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BKSHIDKeyboardDeviceProperties *)v2->_lock_properties countryCode];
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (NSString)exclusivityIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(BKSHIDKeyboardDeviceProperties *)self->_lock_properties exclusivityIdentifier];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)layout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(BKSHIDKeyboardDeviceProperties *)self->_lock_properties layout];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)language
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(BKSHIDKeyboardDeviceProperties *)self->_lock_properties language];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)transport
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(BKSHIDKeyboardDeviceProperties *)self->_lock_properties transport];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (unint64_t)senderID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(BKSHIDKeyboardDeviceProperties *)self->_lock_properties senderID];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_properties
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = (void *)[(BKSHIDKeyboardDeviceProperties *)self->_lock_properties copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_replaceProperties:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (BKSHIDKeyboardDeviceProperties *)[v5 copy];

  lock_properties = self->_lock_properties;
  self->_lock_properties = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)_initWithProperties:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKSHIDKeyboardDevice;
  v7 = [(BKSHIDKeyboardDevice *)&v14 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    if (v8 != objc_opt_class())
    {
      v10 = [NSString stringWithFormat:@"BKSHIDKeyboardDevice cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v11 = NSStringFromSelector(a2);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138544642;
        v16 = v11;
        __int16 v17 = 2114;
        v18 = v13;
        __int16 v19 = 2048;
        v20 = v7;
        __int16 v21 = 2114;
        v22 = @"BKSHIDKeyboardDevice.m";
        __int16 v23 = 1024;
        int v24 = 75;
        __int16 v25 = 2114;
        v26 = v10;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA4E5FCLL);
    }
    objc_storeStrong((id *)&v7->_lock_properties, a3);
  }

  return v7;
}

- (void)appendDescriptionToStream:(id)a3 fromProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke;
  v15[3] = &unk_1E5441BB0;
  id v16 = v7;
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  [v9 appendProem:self block:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke_2;
  v12[3] = &unk_1E5441BB0;
  id v13 = v9;
  objc_super v14 = self;
  id v11 = v9;
  [v11 appendBodySectionWithName:0 block:v12];
  os_unfair_lock_unlock(p_lock);
}

id __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (v1) {
    return (id)[*((id *)result + 5) appendPointer:v1 withName:@"proxy"];
  }
  return result;
}

id __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [v4 appendProem:self block:&__block_literal_global_6175];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__BKSHIDKeyboardDevice_appendDescriptionToStream___block_invoke_2;
  v7[3] = &unk_1E5441BB0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v6 appendBodySectionWithName:0 block:v7];
  os_unfair_lock_unlock(p_lock);
}

id __50__BKSHIDKeyboardDevice_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BKSHIDKeyboardDevice)init
{
  id v4 = [NSString stringWithFormat:@"cannot -init"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    objc_super v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BKSHIDKeyboardDevice.m";
    __int16 v17 = 1024;
    int v18 = 31;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDKeyboardDevice *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BKSHIDKeyboardDevice)new
{
  id v4 = [NSString stringWithFormat:@"cannot +new"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    id v16 = @"BKSHIDKeyboardDevice.m";
    __int16 v17 = 1024;
    int v18 = 36;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDKeyboardDevice *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end