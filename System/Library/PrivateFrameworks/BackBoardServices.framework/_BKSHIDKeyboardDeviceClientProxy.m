@interface _BKSHIDKeyboardDeviceClientProxy
- (BOOL)capsLockKeyHasLanguageSwitchLabel;
- (BOOL)globeKeyLabelHasGlobeSymbol;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)exclusivityIdentifier;
- (NSString)language;
- (NSString)layout;
- (NSString)transport;
- (_BKSHIDKeyboardDeviceClientProxy)initWithDevice:(id)a3 lifetimeAssertion:(id)a4;
- (id)_properties;
- (int64_t)subinterfaceID;
- (unint64_t)hash;
- (unint64_t)senderID;
- (unsigned)countryCode;
- (unsigned)standardType;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
@end

@implementation _BKSHIDKeyboardDeviceClientProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeAssertion, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  return [(BKSHIDKeyboardDevice *)self->_device globeKeyLabelHasGlobeSymbol];
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  return [(BKSHIDKeyboardDevice *)self->_device capsLockKeyHasLanguageSwitchLabel];
}

- (int64_t)subinterfaceID
{
  return [(BKSHIDKeyboardDevice *)self->_device subinterfaceID];
}

- (unsigned)standardType
{
  return [(BKSHIDKeyboardDevice *)self->_device standardType];
}

- (unsigned)countryCode
{
  return [(BKSHIDKeyboardDevice *)self->_device countryCode];
}

- (NSString)exclusivityIdentifier
{
  return [(BKSHIDKeyboardDevice *)self->_device exclusivityIdentifier];
}

- (NSString)layout
{
  return [(BKSHIDKeyboardDevice *)self->_device layout];
}

- (NSString)language
{
  return [(BKSHIDKeyboardDevice *)self->_device language];
}

- (NSString)transport
{
  return [(BKSHIDKeyboardDevice *)self->_device transport];
}

- (unint64_t)senderID
{
  return [(BKSHIDKeyboardDevice *)self->_device senderID];
}

- (id)_properties
{
  return [(BKSHIDKeyboardDevice *)self->_device _properties];
}

- (void)appendDescriptionToStream:(id)a3
{
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  v4 = [MEMORY[0x1E4F4F728] debugStyle];
  v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (unint64_t)hash
{
  return [(BKSHIDKeyboardDevice *)self->_device hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8) {
    char v9 = [(BKSHIDKeyboardDevice *)self->_device isEqual:v8[1]];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_lifetimeAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_BKSHIDKeyboardDeviceClientProxy;
  [(_BKSHIDKeyboardDeviceClientProxy *)&v3 dealloc];
}

- (_BKSHIDKeyboardDeviceClientProxy)initWithDevice:(id)a3 lifetimeAssertion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_BKSHIDKeyboardDeviceClientProxy;
  v10 = [(_BKSHIDKeyboardDeviceClientProxy *)&v34 init];
  if (v10)
  {
    id v11 = v8;
    if (!v11)
    {
      v14 = NSString;
      objc_opt_class();
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = [v14 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"device", v16];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138544642;
        v36 = v18;
        __int16 v37 = 2114;
        v38 = v20;
        __int16 v39 = 2048;
        v40 = v10;
        __int16 v41 = 2114;
        v42 = @"BKSHIDKeyboardService.m";
        __int16 v43 = 1024;
        int v44 = 51;
        __int16 v45 = 2114;
        v46 = v17;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA25FE8);
    }
    v12 = v11;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = NSString;
      v22 = (objc_class *)[v12 classForCoder];
      if (!v22) {
        v22 = (objc_class *)objc_opt_class();
      }
      v23 = NSStringFromClass(v22);
      objc_opt_class();
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"device", v23, v25];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v27 = NSStringFromSelector(a2);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        v36 = v27;
        __int16 v37 = 2114;
        v38 = v29;
        __int16 v39 = 2048;
        v40 = v10;
        __int16 v41 = 2114;
        v42 = @"BKSHIDKeyboardService.m";
        __int16 v43 = 1024;
        int v44 = 51;
        __int16 v45 = 2114;
        v46 = v26;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA26128);
    }

    if (!v9)
    {
      v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"assertion != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v31 = NSStringFromSelector(a2);
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        *(_DWORD *)buf = 138544642;
        v36 = v31;
        __int16 v37 = 2114;
        v38 = v33;
        __int16 v39 = 2048;
        v40 = v10;
        __int16 v41 = 2114;
        v42 = @"BKSHIDKeyboardService.m";
        __int16 v43 = 1024;
        int v44 = 52;
        __int16 v45 = 2114;
        v46 = v30;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v30 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA26220);
    }
    objc_storeStrong((id *)&v10->_device, a3);
    objc_storeStrong((id *)&v10->_lifetimeAssertion, a4);
  }

  return v10;
}

@end