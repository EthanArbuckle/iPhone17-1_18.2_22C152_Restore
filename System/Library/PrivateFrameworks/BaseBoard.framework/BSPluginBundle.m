@interface BSPluginBundle
+ (void)bundleWithPath:(void *)a3 availableSpecifications:;
- (BOOL)isLoaded;
- (BOOL)isValid;
- (BOOL)loadPlugin;
- (BOOL)loadPlugin:(id)a3;
- (Class)principalClass;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (NSString)type;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation BSPluginBundle

+ (void)bundleWithPath:(void *)a3 availableSpecifications:
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v71 = a3;
  v69 = v4;
  v5 = (objc_class *)self;
  char v84 = 0;
  v70 = [v4 pathExtension];
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v70 length]
    && ((int v7 = [v6 fileExistsAtPath:v4 isDirectory:&v84], v84) ? (v8 = v7) : (v8 = 0), v8 == 1))
  {
    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithPath:v4];
    v10 = (void *)v9;
    if (v9)
    {
      obuint64_t j = (id)v9;
      id v11 = [v5 alloc];
      id v12 = v10;
      if (v11)
      {
        v88.receiver = v11;
        v88.super_class = (Class)BSPluginBundle;
        id v13 = objc_msgSendSuper2(&v88, sel_init);
        v14 = v13;
        if (v13)
        {
          objc_storeStrong((id *)v13 + 1, obj);
          v15 = [v12 bundlePath];
          v67 = [v12 infoDictionary];
          v16 = objc_msgSend(v67, "bs_safeObjectForKey:ofType:", @"BSPluginSpecification", objc_opt_class());
          v17 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"BSPluginName", objc_opt_class());
          if (!v17)
          {
            v18 = [v15 lastPathComponent];
            v17 = [v18 stringByDeletingPathExtension];
          }
          v19 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"BSPluginType", objc_opt_class());
          if (!v19)
          {
            v19 = [v15 pathExtension];
          }
          v20 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"BSPluginControllerClass", objc_opt_class());
          if (!v20)
          {
            v20 = objc_msgSend(v67, "bs_safeObjectForKey:ofType:", @"NSPrincipalClass", objc_opt_class());
          }
          v21 = objc_msgSend(v12, "bundleIdentifier", obj);
          uint64_t v22 = [v21 copy];
          v23 = (void *)v14[4];
          v14[4] = v22;

          uint64_t v24 = [v17 copy];
          v25 = (void *)v14[5];
          v14[5] = v24;

          uint64_t v26 = [v19 copy];
          v27 = (void *)v14[6];
          v14[6] = v26;

          uint64_t v28 = [v20 copy];
          v29 = (void *)v14[2];
          v14[2] = v28;
        }
      }
      else
      {
        v14 = 0;
      }

      v68 = [v12 infoDictionary];
      objc_msgSend(v68, "bs_safeObjectForKey:ofType:", @"UIRequiredDeviceCapabilities", objc_opt_class());
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v30 countByEnumeratingWithState:&v80 objects:v87 count:16];
      v32 = v30;
      if (v31)
      {
        uint64_t v33 = *(void *)v81;
        v32 = v30;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v81 != v33) {
              objc_enumerationMutation(v30);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v32 = 0;
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v80 objects:v87 count:16];
        }
        while (v31);
      }

      if ([v32 count])
      {
        v35 = (void *)MGCopyMultipleAnswers();
        if (v35)
        {
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v36 = v32;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v76 objects:v86 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v77;
            while (2)
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v77 != v38) {
                  objc_enumerationMutation(v36);
                }
                v40 = objc_msgSend(v35, "bs_safeObjectForKey:ofType:", *(void *)(*((void *)&v76 + 1) + 8 * j), objc_opt_class());
                v41 = v40;
                if (v40)
                {
                  int v42 = [v40 BOOLValue];

                  if (v42) {
                    continue;
                  }
                }

                goto LABEL_41;
              }
              uint64_t v37 = [v36 countByEnumeratingWithState:&v76 objects:v86 count:16];
              if (v37) {
                continue;
              }
              break;
            }
          }
          int v43 = 1;
        }
        else
        {
LABEL_41:
          v36 = BSLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v88.receiver) = 138543362;
            *(id *)((char *)&v88.receiver + 4) = v14;
            _os_log_error_impl(&dword_18AAA8000, v36, OS_LOG_TYPE_ERROR, "Ignoring plugin because this device lacks the required capabilities: %{public}@", (uint8_t *)&v88, 0xCu);
          }
          int v43 = 0;
        }
      }
      else
      {
        int v43 = 1;
      }
      v44 = objc_msgSend(v68, "objectForKey:", @"UIDeviceFamily", obj);
      if (v44)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [MEMORY[0x1E4F1CAD0] setWithArray:v44];
        }
        else {
        v46 = [MEMORY[0x1E4F1CAD0] setWithObject:v44];
        }
        v47 = (void *)MEMORY[0x1E4F1CAD0];
        v48 = (void *)MGCopyAnswer();
        v49 = [v47 setWithArray:v48];

        int v45 = [v46 intersectsSet:v49];
        if ((v45 & 1) == 0)
        {
          v50 = BSLogCommon();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v88.receiver) = 138543362;
            *(id *)((char *)&v88.receiver + 4) = v14;
            _os_log_error_impl(&dword_18AAA8000, v50, OS_LOG_TYPE_ERROR, "Ignoring plugin because it does not support the current device type: %{public}@", (uint8_t *)&v88, 0xCu);
          }
        }
      }
      else
      {
        int v45 = 1;
      }
      if ((v43 & v45) == 1)
      {
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v51 = v71;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v72 objects:v85 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v73;
LABEL_58:
          uint64_t v54 = 0;
          while (1)
          {
            if (*(void *)v73 != v53) {
              objc_enumerationMutation(v51);
            }
            v55 = *(void **)(*((void *)&v72 + 1) + 8 * v54);
            if (-[BSPluginSpecification matchesPluginBundle:]((uint64_t)v55, v14)) {
              break;
            }
            if (v52 == ++v54)
            {
              uint64_t v52 = [v51 countByEnumeratingWithState:&v72 objects:v85 count:16];
              if (v52) {
                goto LABEL_58;
              }
              goto LABEL_64;
            }
          }
          id v56 = v55;
          v57 = v56;
          if (v56) {
            v58 = (void *)*((void *)v56 + 3);
          }
          else {
            v58 = 0;
          }
          id v59 = v58;
          v60 = v59;
          if (v14)
          {
            uint64_t v61 = [v59 copy];
            v62 = (void *)v14[3];
            v14[3] = v61;
          }
          if (v57) {
            goto LABEL_73;
          }
        }
        else
        {
LABEL_64:
        }
        v63 = BSLogCommon();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v88.receiver) = 138543362;
          *(id *)((char *)&v88.receiver + 4) = v14;
          _os_log_error_impl(&dword_18AAA8000, v63, OS_LOG_TYPE_ERROR, "Ignoring plugin that does not match any specification: %{public}@", (uint8_t *)&v88, 0xCu);
        }

        v57 = 0;
        v14 = 0;
LABEL_73:
      }
      v10 = obja;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isValid
{
  return self->_name && self->_type && self->_specifiedClassName != 0;
}

- (BOOL)isLoaded
{
  return self->_principalClass != 0;
}

- (BOOL)loadPlugin
{
  return [(BSPluginBundle *)self loadPlugin:0];
}

- (BOOL)loadPlugin:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, Class))a3;
  bundle = self->_bundle;
  if (bundle)
  {
    id v27 = 0;
    BOOL v6 = [(NSBundle *)bundle loadAndReturnError:&v27];
    int v7 = (NSString *)v27;
    if (!v6)
    {
      principalClass = BSLogCommon();
      if (os_log_type_enabled(principalClass, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = self->_bundle;
        *(_DWORD *)buf = 136315650;
        v29 = "-[BSPluginBundle loadPlugin:]";
        __int16 v30 = 2114;
        uint64_t v31 = v22;
        __int16 v32 = 2114;
        uint64_t v33 = v7;
        _os_log_error_impl(&dword_18AAA8000, principalClass, OS_LOG_TYPE_ERROR, "%s Error loading %{public}@: %{public}@", buf, 0x20u);
      }
LABEL_11:

      goto LABEL_12;
    }
    if (self->_principalClass)
    {
LABEL_12:

      goto LABEL_13;
    }
    int v8 = (void *)MEMORY[0x18C125360]();
    Class v9 = NSClassFromString(self->_specifiedClassName);
    requiredClassOrProtocolName = self->_requiredClassOrProtocolName;
    if (!requiredClassOrProtocolName) {
      goto LABEL_28;
    }
    id v11 = NSProtocolFromString(requiredClassOrProtocolName);
    if (v11)
    {
      if (([(objc_class *)v9 conformsToProtocol:v11] & 1) == 0)
      {
        id v12 = BSLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          specifiedClassName = self->_specifiedClassName;
          v14 = self->_requiredClassOrProtocolName;
          *(_DWORD *)buf = 136315650;
          v29 = "-[BSPluginBundle loadPlugin:]";
          __int16 v30 = 2114;
          uint64_t v31 = (NSBundle *)specifiedClassName;
          __int16 v32 = 2114;
          uint64_t v33 = v14;
          v15 = "%s Specified principal class \"%{public}@\" does not conform to expected protocol <%{public}@>. Ignoring.";
LABEL_32:
          _os_log_error_impl(&dword_18AAA8000, v12, OS_LOG_TYPE_ERROR, v15, buf, 0x20u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else
    {
      Class v20 = NSClassFromString(self->_requiredClassOrProtocolName);
      if (!v20)
      {
LABEL_27:

LABEL_28:
        int v21 = 0;
LABEL_29:
        if (!v21) {
          goto LABEL_12;
        }
        v23 = v9;
        principalClass = self->_principalClass;
        self->_principalClass = v23;
        goto LABEL_11;
      }
      if (([(objc_class *)v9 isSubclassOfClass:v20] & 1) == 0)
      {
        id v12 = BSLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v25 = self->_specifiedClassName;
          uint64_t v26 = self->_requiredClassOrProtocolName;
          *(_DWORD *)buf = 136315650;
          v29 = "-[BSPluginBundle loadPlugin:]";
          __int16 v30 = 2114;
          uint64_t v31 = (NSBundle *)v25;
          __int16 v32 = 2114;
          uint64_t v33 = v26;
          v15 = "%s Specified principal class \"%{public}@\" is not a subclass of %{public}@. Ignoring.";
          goto LABEL_32;
        }
LABEL_26:

        goto LABEL_27;
      }
    }

    if ([(objc_class *)v9 conformsToProtocol:&unk_1ED794828])
    {
      if (objc_opt_respondsToSelector()) {
        [(objc_class *)v9 awakeFromBundle];
      }
      int v21 = 1;
      goto LABEL_29;
    }
    id v11 = BSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = self->_specifiedClassName;
      *(_DWORD *)buf = 136315394;
      v29 = "-[BSPluginBundle loadPlugin:]";
      __int16 v30 = 2114;
      uint64_t v31 = (NSBundle *)v24;
      _os_log_error_impl(&dword_18AAA8000, v11, OS_LOG_TYPE_ERROR, "%s Specified principal class \"%{public}@\" does not conform to <BSPluginBundleController>. Ignoring.", buf, 0x16u);
    }
    goto LABEL_27;
  }
LABEL_13:
  if (v4)
  {
    v17 = (void *)MEMORY[0x18C125360]();
    v4[2](v4, self->_principalClass);
  }
  BOOL v18 = [(BSPluginBundle *)self isLoaded];

  return v18;
}

- (NSString)description
{
  return (NSString *)[(BSPluginBundle *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSPluginBundle *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"ID" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_name withName:@"name"];
  id v6 = (id)[v3 appendObject:self->_type withName:@"type"];
  id v7 = (id)[v3 appendObject:self->_specifiedClassName withName:@"principalClass" skipIfNil:1];
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSPluginBundle isValid](self, "isValid"), @"valid");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BSPluginBundle isLoaded](self, "isLoaded"), @"loaded", 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSPluginBundle *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v3 = [(BSPluginBundle *)self succinctDescriptionBuilder];
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (Class)principalClass
{
  return self->_principalClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalClass, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_requiredClassOrProtocolName, 0);
  objc_storeStrong((id *)&self->_specifiedClassName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end