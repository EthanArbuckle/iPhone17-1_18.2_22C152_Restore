@interface _LSSharedWebCredentialsAppLink
+ (BOOL)_areAppLinksEnabledForServiceDetails:(id)a3 cachedSettings:(id *)a4;
+ (BOOL)_setSWCSetting:(id)a3 forKey:(id)a4 withApplicationIdentifier:(id)a5 error:(id *)a6;
+ (BOOL)removeAllSettingsReturningError:(id *)a3;
+ (BOOL)setSettingsSwitchState:(int64_t)a3 forApplicationIdentifier:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_SWCSettingsWithApplicationIdentifier:(id)a3 error:(id *)a4;
+ (id)_SWCSpecifierForSettingsWithApplicationIdentifier:(id)a3;
+ (int64_t)settingsSwitchStateForApplicationIdentifier:(id)a3;
+ (void)afterAppLinksBecomeAvailableForURL:(id)a3 limit:(unint64_t)a4 performBlock:(id)a5;
+ (void)initialize;
- (BOOL)_setSWCSetting:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)isAlwaysEnabled;
- (BOOL)isEnabled;
- (BOOL)removeSettingsReturningError:(id *)a3;
- (BOOL)setBrowserSettings:(id)a3 error:(id *)a4;
- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4;
- (LSBinding)binding;
- (_LSSharedWebCredentialsAppLink)initWithCoder:(id)a3;
- (_SWCServiceDetails)serviceDetails;
- (id).cxx_construct;
- (id)_SWCSettingsReturningError:(id *)a3;
- (id)_SWCSpecifierForSettings;
- (id)browserSettings;
- (void)encodeWithCoder:(id)a3;
- (void)setServiceDetails:(id)a3;
@end

@implementation _LSSharedWebCredentialsAppLink

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____LSSharedWebCredentialsAppLink;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1) {
    _LSIsSWCAvailable();
  }
}

+ (id)_SWCSpecifierForSettingsWithApplicationIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
  v5 = _LSSWCServiceTypeAppLinks();
  v6 = (void *)[v4 initWithServiceType:v5 applicationIdentifier:v3 domain:0];

  return v6;
}

- (id)_SWCSpecifierForSettings
{
  v2 = [(_SWCServiceDetails *)self->_serviceDetails serviceSpecifier];
  id v3 = [v2 applicationIdentifier];

  id v4 = [(id)objc_opt_class() _SWCSpecifierForSettingsWithApplicationIdentifier:v3];

  return v4;
}

+ (id)_SWCSettingsWithApplicationIdentifier:(id)a3 error:(id *)a4
{
  v5 = [a1 _SWCSpecifierForSettingsWithApplicationIdentifier:a3];
  v6 = [(id)_LSSWCServiceSettingsClass() serviceSettingsWithServiceSpecifier:v5 error:a4];

  return v6;
}

- (id)_SWCSettingsReturningError:(id *)a3
{
  id v4 = [(_SWCServiceDetails *)self->_serviceDetails serviceSpecifier];
  v5 = [v4 applicationIdentifier];

  v6 = [(id)objc_opt_class() _SWCSettingsWithApplicationIdentifier:v5 error:a3];

  return v6;
}

+ (BOOL)_setSWCSetting:(id)a3 forKey:(id)a4 withApplicationIdentifier:(id)a5 error:(id *)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  while (1)
  {
    v12 = objc_msgSend(a1, "_SWCSettingsWithApplicationIdentifier:error:", v11, a6, v21);
    v13 = v12;
    if (!v12) {
      break;
    }
    [v12 setObject:v21 forKey:v10];
    id v22 = 0;
    char v14 = [v13 commitReturningError:&v22];
    id v15 = v22;
    v16 = v15;
    if (v14) {
      goto LABEL_9;
    }
    if ([v15 code] != 1000
      || ([v16 domain],
          v17 = objc_claimAutoreleasedReturnValue(),
          _LSSWCErrorDomain(),
          v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = [v17 isEqual:v18],
          v18,
          v17,
          (v19 & 1) == 0))
    {
      if (a6) {
        *a6 = v16;
      }
LABEL_9:

      goto LABEL_11;
    }
  }
  char v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_setSWCSetting:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_SWCServiceDetails *)self->_serviceDetails serviceSpecifier];
  id v11 = [v10 applicationIdentifier];

  LOBYTE(a5) = [(id)objc_opt_class() _setSWCSetting:v8 forKey:v9 withApplicationIdentifier:v11 error:a5];
  return (char)a5;
}

+ (BOOL)_areAppLinksEnabledForServiceDetails:(id)a3 cachedSettings:(id *)a4
{
  id v6 = a3;
  if ([v6 isAlwaysEnabled])
  {
    int v7 = 1;
    int v8 = 1;
    goto LABEL_11;
  }
  id v9 = *a4;
  if (!v9)
  {
    id v10 = [v6 serviceSpecifier];
    id v11 = [v10 applicationIdentifier];
    id v9 = [a1 _SWCSettingsWithApplicationIdentifier:v11 error:0];

    objc_storeStrong(a4, v9);
  }
  v12 = [v9 objectForKey:@"com.apple.LaunchServices.enabled" ofClass:objc_opt_class()];
  v13 = v12;
  if (v12)
  {
    int v7 = [v12 BOOLValue];
  }
  else
  {

    char v14 = [v6 isEnabledByDefault];
    id v9 = v14;
    if (!v14)
    {
      int v7 = 0;
      int v8 = 0;
      goto LABEL_10;
    }
    int v7 = [v14 BOOLValue];
  }
  int v8 = 1;
LABEL_10:

LABEL_11:
  char v15 = [(id)objc_opt_class() areEnabledByDefault];
  if (v8) {
    BOOL v16 = v7 != 0;
  }
  else {
    BOOL v16 = v15;
  }

  return v16;
}

+ (void)afterAppLinksBecomeAvailableForURL:(id)a3 limit:(unint64_t)a4 performBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a1 _dispatchQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke;
  v13[3] = &unk_1E522D1C0;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v17 = a1;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (BOOL)isAlwaysEnabled
{
  return [(_SWCServiceDetails *)self->_serviceDetails isAlwaysEnabled];
}

- (BOOL)isEnabled
{
  id v4 = 0;
  char v2 = [(id)objc_opt_class() _areAppLinksEnabledForServiceDetails:self->_serviceDetails cachedSettings:&v4];

  return v2;
}

- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4
{
  id v6 = [NSNumber numberWithBool:a3];
  LOBYTE(a4) = [(_LSSharedWebCredentialsAppLink *)self _setSWCSetting:v6 forKey:@"com.apple.LaunchServices.enabled" error:a4];

  return (char)a4;
}

+ (int64_t)settingsSwitchStateForApplicationIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 _SWCSpecifierForSettingsWithApplicationIdentifier:a3];
  v5 = [(id)_LSSWCServiceDetailsClass() serviceDetailsWithServiceSpecifier:v4 error:0];
  id v20 = 0;
  unint64_t v6 = [v5 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  unint64_t v8 = 0;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isAlwaysEnabled", (void)v16)) {
          --v6;
        }
        else {
          v8 += [a1 _areAppLinksEnabledForServiceDetails:v12 cachedSettings:&v20];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  if (v6)
  {
    if (v8 == v6) {
      int64_t v13 = 2;
    }
    else {
      int64_t v13 = v8 < v6 && v8 != 0;
    }
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

+ (BOOL)setSettingsSwitchState:(int64_t)a3 forApplicationIdentifier:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ((a3 | 2) == 2)
  {
    uint64_t v9 = [NSNumber numberWithBool:a3 == 2];
    LOBYTE(a5) = [a1 _setSWCSetting:v9 forKey:@"com.apple.LaunchServices.enabled" withApplicationIdentifier:v8 error:a5];
  }
  else if (a5)
  {
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"state";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[_LSSharedWebCredentialsAppLink setSettingsSwitchState:forApplicationIdentifier:error:]", 391, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (id)browserSettings
{
  char v2 = [(_LSSharedWebCredentialsAppLink *)self _SWCSettingsReturningError:0];
  if (!v2
    || (id v3 = v2,
        [v2 objectForKey:@"com.apple.LaunchServices.browserSettings" ofClass:objc_opt_class()],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (BOOL)setBrowserSettings:(id)a3 error:(id *)a4
{
  return [(_LSSharedWebCredentialsAppLink *)self _setSWCSetting:a3 forKey:@"com.apple.LaunchServices.browserSettings" error:a4];
}

- (BOOL)removeSettingsReturningError:(id *)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(_LSSharedWebCredentialsAppLink *)self _SWCSpecifierForSettings];
  v5 = (void *)_LSSWCServiceSettingsClass();
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = @"com.apple.LaunchServices.enabled";
    v11[1] = @"com.apple.LaunchServices.browserSettings";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v8 = [v6 setWithArray:v7];

    char v9 = [v5 removeObjectsForKeys:v8 serviceSpecifier:v4 error:a3];
  }
  else if (a3)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSSharedWebCredentialsAppLink removeSettingsReturningError:]", 430, 0);
    char v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)removeAllSettingsReturningError:(id *)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _LSSWCServiceSettingsClass();
  if (v4)
  {
    v5 = (void *)v4;
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v12[0] = @"com.apple.LaunchServices.enabled";
    v12[1] = @"com.apple.LaunchServices.browserSettings";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v8 = [v6 setWithArray:v7];

    char v9 = _LSSWCServiceTypeAppLinks();
    char v10 = [v5 removeObjectsForKeys:v8 serviceType:v9 error:a3];
  }
  else if (a3)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"+[_LSSharedWebCredentialsAppLink removeAllSettingsReturningError:]", 446, 0);
    char v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSSharedWebCredentialsAppLink;
  [(LSAppLink *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_serviceDetails forKey:@"serviceDetails"];
}

- (_LSSharedWebCredentialsAppLink)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSSharedWebCredentialsAppLink;
  objc_super v5 = [(LSAppLink *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", _LSSWCServiceDetailsClass(), @"serviceDetails");
    serviceDetails = v5->_serviceDetails;
    v5->_serviceDetails = (_SWCServiceDetails *)v6;
  }
  return v5;
}

- (LSBinding)binding
{
  objc_copyCppObjectAtomic(retstr, &self->_binding, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (_SWCServiceDetails)serviceDetails
{
  return self->_serviceDetails;
}

- (void)setServiceDetails:(id)a3
{
}

- (void).cxx_destruct
{
  char v2 = self;
  objc_storeStrong((id *)&self->_serviceDetails, 0);
  char v2 = (_LSSharedWebCredentialsAppLink *)((char *)v2 + 32);

  id v3 = *(void **)&v2->_binding.bundle;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 0;
  *((void *)self + 5) = 0;
  *((_DWORD *)self + 12) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end