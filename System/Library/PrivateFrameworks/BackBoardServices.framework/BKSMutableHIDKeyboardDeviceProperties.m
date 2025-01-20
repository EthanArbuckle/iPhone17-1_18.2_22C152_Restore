@interface BKSMutableHIDKeyboardDeviceProperties
- (void)setCapsLockKeyHasLanguageSwitchLabel:(BOOL)a3;
- (void)setCountryCode:(unsigned __int8)a3;
- (void)setExclusivityIdentifier:(id)a3;
- (void)setGlobeKeyLabelHasGlobeSymbol:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLayout:(id)a3;
- (void)setSenderID:(unint64_t)a3;
- (void)setStandardType:(unsigned int)a3;
- (void)setSubinterfaceID:(int64_t)a3;
- (void)setTransport:(id)a3;
@end

@implementation BKSMutableHIDKeyboardDeviceProperties

- (void)setGlobeKeyLabelHasGlobeSymbol:(BOOL)a3
{
  self->super._globeKeyLabelHasGlobeSymbol = a3;
}

- (void)setCapsLockKeyHasLanguageSwitchLabel:(BOOL)a3
{
  self->super._capsLockKeyHasLanguageSwitchLabel = a3;
}

- (void)setSubinterfaceID:(int64_t)a3
{
  self->super._subinterfaceID = a3;
}

- (void)setStandardType:(unsigned int)a3
{
  self->super._standardType = a3;
}

- (void)setCountryCode:(unsigned __int8)a3
{
  self->super._countryCode = a3;
}

- (void)setExclusivityIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[v16 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"exclusivityIdentifier", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = @"BKSHIDKeyboardDeviceProperties.m";
        __int16 v25 = 1024;
        int v26 = 316;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA5B128);
    }
  }

  v5 = (NSString *)[v16 copy];
  exclusivityIdentifier = self->super._exclusivityIdentifier;
  self->super._exclusivityIdentifier = v5;
}

- (void)setLayout:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[v16 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"layout", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = @"BKSHIDKeyboardDeviceProperties.m";
        __int16 v25 = 1024;
        int v26 = 310;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA5B324);
    }
  }

  v5 = (NSString *)[v16 copy];
  layout = self->super._layout;
  self->super._layout = v5;
}

- (void)setLanguage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[v16 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"language", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = @"BKSHIDKeyboardDeviceProperties.m";
        __int16 v25 = 1024;
        int v26 = 304;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA5B520);
    }
  }

  v5 = (NSString *)[v16 copy];
  language = self->super._language;
  self->super._language = v5;
}

- (void)setTransport:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[v16 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"transport", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = @"BKSHIDKeyboardDeviceProperties.m";
        __int16 v25 = 1024;
        int v26 = 298;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA5B71CLL);
    }
  }

  v5 = (NSString *)[v16 copy];
  transport = self->super._transport;
  self->super._transport = v5;
}

- (void)setSenderID:(unint64_t)a3
{
  self->super._senderID = a3;
}

@end