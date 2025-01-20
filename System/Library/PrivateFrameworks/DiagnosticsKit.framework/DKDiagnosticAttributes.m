@interface DKDiagnosticAttributes
- (BOOL)isEqualTo:(id)a3;
- (BOOL)isEqualToAttributes:(id)a3;
- (BOOL)isHeadless;
- (BOOL)isRestricted;
- (BOOL)requiresUnlock;
- (DKDiagnosticAttributes)initWithExtension:(id)a3;
- (DKDiagnosticAttributes)initWithIdentifier:(id)a3 version:(id)a4 freeSpaceRequired:(id)a5 name:(id)a6 serviceName:(id)a7 headless:(BOOL)a8;
- (DKDiagnosticAttributes)initWithIdentifier:(id)a3 version:(id)a4 name:(id)a5 serviceName:(id)a6;
- (NSArray)supportedDevices;
- (NSExtension)extension;
- (NSNumber)freeSpaceRequired;
- (NSNumber)identifier;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)serviceName;
- (NSString)version;
@end

@implementation DKDiagnosticAttributes

- (DKDiagnosticAttributes)initWithExtension:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)DKDiagnosticAttributes;
  v6 = [(DKDiagnosticAttributes *)&v41 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_40;
  }
  objc_storeStrong((id *)&v6->_extension, a3);
  v8 = [v5 attributes];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"DKBundleIdentifier"];
  bundleIdentifier = v7->_bundleIdentifier;
  v7->_bundleIdentifier = (NSString *)v9;

  if (!v7->_bundleIdentifier) {
    objc_storeStrong((id *)&v7->_bundleIdentifier, @"Default");
  }
  v11 = [v5 attributes];
  v12 = [v11 objectForKeyedSubscript:@"DKDiagnosticIdentifier"];

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      identifier = v7->_identifier;
      v7->_identifier = (NSNumber *)v13;

      v15 = [v5 infoDictionary];
      v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263EFFAA0]];

      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v7->_version, v16);
          v17 = [v5 attributes];
          v18 = [v17 objectForKeyedSubscript:@"DKDiagnosticName"];

          if (v18)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_storeStrong((id *)&v7->_name, v18);
              v19 = [v5 attributes];
              v20 = [v19 objectForKeyedSubscript:@"DKDiagnosticFreeSpaceRequired"];

              if (!v20) {
                goto LABEL_20;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = v20;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_20;
                }
                objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v20, "longLongValue"));
                v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              }
              freeSpaceRequired = v7->_freeSpaceRequired;
              v7->_freeSpaceRequired = v21;

LABEL_20:
              if (!v7->_freeSpaceRequired)
              {
                v7->_freeSpaceRequired = (NSNumber *)&unk_26F0DBA80;
              }
              v7->_requiresUnlock = 0;
              v24 = [v5 attributes];
              v25 = [v24 objectForKeyedSubscript:@"DKDiagnosticRequiresUnlock"];

              if (v25)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
                  v7->_requiresUnlock = [v25 BOOLValue];
                }
              }
              v26 = [v5 attributes];
              v27 = [v26 objectForKeyedSubscript:@"DKDiagnosticSupportedDevices"];

              if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v28 = v27;
                supportedDevices = v7->_supportedDevices;
                v7->_supportedDevices = v28;
              }
              else
              {
                supportedDevices = v7->_supportedDevices;
                v7->_supportedDevices = (NSArray *)MEMORY[0x263EFFA68];
              }

              v30 = [v5 extensionPointIdentifier];
              int v31 = [v30 isEqualToString:@"com.apple.diagnostics-service"];

              if (v31)
              {
                __int16 v32 = 1;
              }
              else
              {
                v33 = [v5 extensionPointIdentifier];
                int v34 = [v33 isEqualToString:@"com.apple.diagnostics-ui-service"];

                if (v34)
                {
                  *(_WORD *)&v7->_headless = 0;
LABEL_39:

LABEL_40:
                  v7 = v7;
                  v22 = v7;
                  goto LABEL_41;
                }
                v35 = [v5 extensionPointIdentifier];
                int v36 = [v35 isEqualToString:@"com.apple.diagnostics-restricted-service"];

                if (v36)
                {
                  __int16 v32 = 257;
                }
                else
                {
                  v37 = [v5 extensionPointIdentifier];
                  int v38 = [v37 isEqualToString:@"com.apple.diagnostics-restricted-ui-service"];

                  if (!v38)
                  {
                    v40 = DiagnosticsKitLogHandleForCategory(1);
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                      -[DKDiagnosticAttributes initWithExtension:](v5, v40);
                    }

                    v7 = 0;
                    goto LABEL_39;
                  }
                  __int16 v32 = 256;
                }
              }
              *(_WORD *)&v7->_headless = v32;
              goto LABEL_39;
            }
          }
        }
      }
    }
  }

  v22 = 0;
LABEL_41:

  return v22;
}

- (DKDiagnosticAttributes)initWithIdentifier:(id)a3 version:(id)a4 name:(id)a5 serviceName:(id)a6
{
  return [(DKDiagnosticAttributes *)self initWithIdentifier:a3 version:a4 freeSpaceRequired:&unk_26F0DBA80 name:a5 serviceName:a6 headless:1];
}

- (DKDiagnosticAttributes)initWithIdentifier:(id)a3 version:(id)a4 freeSpaceRequired:(id)a5 name:(id)a6 serviceName:(id)a7 headless:(BOOL)a8
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)DKDiagnosticAttributes;
  v18 = [(DKDiagnosticAttributes *)&v24 init];
  v19 = v18;
  if (v18)
  {
    extension = v18->_extension;
    v18->_extension = 0;

    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_version, a4);
    objc_storeStrong((id *)&v19->_name, a6);
    objc_storeStrong((id *)&v19->_serviceName, a7);
    v19->_headless = a8;
    objc_storeStrong((id *)&v19->_freeSpaceRequired, a5);
    if (!v19->_freeSpaceRequired)
    {
      v19->_freeSpaceRequired = (NSNumber *)&unk_26F0DBA80;
    }
    v19->_restricted = 1;
  }

  return v19;
}

- (BOOL)isEqualTo:(id)a3
{
  v4 = (DKDiagnosticAttributes *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(DKDiagnosticAttributes *)self isEqualToAttributes:v4];
  }

  return v5;
}

- (BOOL)isEqualToAttributes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DKDiagnosticAttributes *)self identifier];
  v6 = [v4 identifier];
  if ([v5 isEqualToNumber:v6])
  {
    v7 = [(DKDiagnosticAttributes *)self name];
    v8 = [v4 name];
    if (![v7 isEqualToString:v8])
    {
      LOBYTE(v14) = 0;
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v9 = [(DKDiagnosticAttributes *)self version];
    v10 = [v4 version];
    if (![v9 isEqualToString:v10])
    {
      LOBYTE(v14) = 0;
LABEL_13:

      goto LABEL_14;
    }
    v11 = [(DKDiagnosticAttributes *)self freeSpaceRequired];
    v12 = [v4 freeSpaceRequired];
    if ([v11 isEqualToNumber:v12])
    {
      v19 = v11;
      int v13 = [(DKDiagnosticAttributes *)self isHeadless];
      if (v13 != [v4 isHeadless])
      {
        LOBYTE(v14) = 0;
        v11 = v19;
LABEL_12:

        goto LABEL_13;
      }
      int v15 = [(DKDiagnosticAttributes *)self isRestricted];
      BOOL v16 = v15 == [v4 isRestricted];
      v11 = v19;
      if (v16)
      {
        BOOL v18 = [(DKDiagnosticAttributes *)self requiresUnlock];
        int v14 = v18 ^ [v4 requiresUnlock] ^ 1;
        goto LABEL_12;
      }
    }
    LOBYTE(v14) = 0;
    goto LABEL_12;
  }
  LOBYTE(v14) = 0;
LABEL_15:

  return v14;
}

- (BOOL)isHeadless
{
  return self->_headless;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSNumber)freeSpaceRequired
{
  return self->_freeSpaceRequired;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)requiresUnlock
{
  return self->_requiresUnlock;
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_freeSpaceRequired, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtension:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 extensionPointIdentifier];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "Unknown extension point: %@", (uint8_t *)&v4, 0xCu);
}

@end