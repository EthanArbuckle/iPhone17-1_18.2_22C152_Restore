@interface BSMutableKeyedSettings
- (BOOL)_isMutable;
- (void)applySettings:(id)a3;
- (void)setFlag:(int64_t)a3 forKey:(id)a4;
- (void)setFlag:(int64_t)a3 forSetting:(unint64_t)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forSetting:(unint64_t)a4;
@end

@implementation BSMutableKeyedSettings

- (BOOL)_isMutable
{
  return 1;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v6, v8 != 0);
  -[BSSettings _setObject:forSetting:]((uint64_t)self, v8, v7);
  if (!v8 && [(BSKeyedSettings *)self flagForKey:v6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BSMutableIntegerMap *)self->super._keyMap removeObjectForKey:v7];
    [(NSMutableSet *)self->super._keys removeObject:v6];
  }
}

- (void)setFlag:(int64_t)a3 forKey:(id)a4
{
  id v8 = a4;
  uint64_t v6 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v8, a3 != 0x7FFFFFFFFFFFFFFFLL);
  -[BSSettings _setFlag:forSetting:]((uint64_t)self, a3, v6);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(BSKeyedSettings *)self objectForKey:v8];

    if (!v7)
    {
      [(BSMutableIntegerMap *)self->super._keyMap removeObjectForKey:v6];
      [(NSMutableSet *)self->super._keys removeObject:v8];
    }
  }
}

- (void)applySettings:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  id v12 = v5;
  if (v5)
  {
    char v7 = [v5 isKeyedSettings];
    uint64_t v6 = v12;
    if ((v7 & 1) == 0)
    {
      id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!settings || [settings isKeyedSettings]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v14 = v9;
        __int16 v15 = 2114;
        v16 = v11;
        __int16 v17 = 2048;
        v18 = self;
        __int16 v19 = 2114;
        v20 = @"BSKeyedSettings.m";
        __int16 v21 = 1024;
        int v22 = 283;
        __int16 v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v8 UTF8String];
      __break(0);
      JUMPOUT(0x18AAD4748);
    }
  }
  [v6 _applyToSettings:self];
}

- (void)setFlag:(int64_t)a3 forSetting:(unint64_t)a4
{
}

- (void)setObject:(id)a3 forSetting:(unint64_t)a4
{
}

@end