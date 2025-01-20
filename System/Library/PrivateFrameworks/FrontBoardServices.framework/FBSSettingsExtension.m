@interface FBSSettingsExtension
+ (BOOL)isPrivacySensitiveSetting:(id)a3;
+ (BOOL)propagateSetting:(id)a3;
+ (Class)extensionForBSObjCProtocol:(id)a3;
+ (Class)extensionForProtocol:(id)a3;
+ (id)BSObjCProtocol;
+ (id)alloc;
+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4;
+ (id)protocol;
+ (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6;
+ (id)valueForUndefinedSetting:(id)a3;
+ (void)configureSetting:(id)a3;
@end

@implementation FBSSettingsExtension

+ (id)BSObjCProtocol
{
  v2 = [a1 protocol];
  if (v2)
  {
    v3 = [off_1E58F4550 protocolForProtocol:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (Class)extensionForProtocol:(id)a3
{
  v3 = (Protocol *)a3;
  v4 = NSString;
  if (v3)
  {
    v5 = v3;
    v6 = NSStringFromProtocol(v3);
    [v4 stringWithFormat:@"<%@>", v6];
    objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v5;
    BSObjCClassCreate();
  }
  v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"protocol"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[FBSSettingsExtension extensionForProtocol:]();
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
}

id __45__FBSSettingsExtension_extensionForProtocol___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)configureSetting:(id)a3
{
  id v5 = a3;
  [v5 setPrivacySensitive:[a1 isPrivacySensitiveSetting:v5]];
  v4 = [a1 valueForUndefinedSetting:v5];
  [v5 setDefaultValue:v4];

  [v5 setPropagating:[a1 propagateSetting:v5]];
}

+ (id)valueForUndefinedSetting:(id)a3
{
  return 0;
}

+ (BOOL)propagateSetting:(id)a3
{
  return 0;
}

+ (BOOL)isPrivacySensitiveSetting:(id)a3
{
  return 0;
}

void __45__FBSSettingsExtension_extensionForProtocol___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__FBSSettingsExtension_extensionForProtocol___block_invoke_2;
  v6[3] = &unk_1E58F4B50;
  id v7 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x19F3991F0](v6);
  v4 = imp_implementationWithBlock(v3);

  Class = object_getClass(a2);
  class_addMethod(Class, sel_protocol, v4, "@@:");
}

+ (id)alloc
{
  v4 = NSString;
  id v5 = NSStringFromClass((Class)a1);
  v6 = [v4 stringWithFormat:@"%@ is not intended to be instantiated", v5];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v11 = v7;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2048;
    id v15 = a1;
    __int16 v16 = 2114;
    v17 = @"FBSSceneExtension.m";
    __int16 v18 = 1024;
    int v19 = 63;
    __int16 v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

+ (Class)extensionForBSObjCProtocol:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  if (v4)
  {
    v6 = v4;
    id v7 = [v4 name];
    [v5 stringWithFormat:@"<%@>", v7];
    objc_claimAutoreleasedReturnValue();

    if ((id)objc_opt_class() != a1) {
      objc_opt_class();
    }
    v6;
    BSObjCClassCreate();
  }
  v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"protocol"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[FBSSettingsExtension extensionForBSObjCProtocol:]();
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
}

void __51__FBSSettingsExtension_extensionForBSObjCProtocol___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__FBSSettingsExtension_extensionForBSObjCProtocol___block_invoke_2;
  v6[3] = &unk_1E58F4BA0;
  id v7 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x19F3991F0](v6);
  id v4 = imp_implementationWithBlock(v3);

  Class = object_getClass(a2);
  class_addMethod(Class, sel_BSObjCProtocol, v4, "@@:");
}

id __51__FBSSettingsExtension_extensionForBSObjCProtocol___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)protocol
{
  return 0;
}

+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4
{
  return 0;
}

+ (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  id v10 = a5;
  v11 = [a3 keyForSetting:a6];
  __int16 v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  SEL v13 = NSSelectorFromString(v11);
  if (!v13) {
    goto LABEL_8;
  }
  SEL v14 = v13;
  id v15 = objc_opt_class();
  __int16 v16 = FBSSettingForExtensionSelector(v15, v14);
  if (v16
    || (v17 = objc_opt_class(),
        FBSSettingForExtensionSelector(v17, v14),
        (__int16 v16 = objc_claimAutoreleasedReturnValue()) != 0)
    || (__int16 v18 = objc_opt_class(),
        FBSSettingForExtensionSelector(v18, v14),
        (__int16 v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (-[FBSSetting isRedacted](v16))
    {
      int v19 = @"<redacted>";
    }
    else
    {
      if (a4 != 0x7FFFFFFFFFFFFFFFLL && !v10) {
        BSSettingFlagIsYes();
      }
      uint64_t v20 = -[FBSSetting descriptionProvider](v16);
      v21 = (void *)v20;
      if (!v20
        || ((*(void (**)(uint64_t, id))(v20 + 16))(v20, v10),
            (int v19 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        int v19 = [a1 descriptionOfValue:v10 forSetting:v16];
      }
    }
  }
  else
  {
LABEL_8:
    int v19 = 0;
  }

  return v19;
}

+ (void)extensionForProtocol:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)extensionForProtocol:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)extensionForBSObjCProtocol:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)extensionForBSObjCProtocol:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end