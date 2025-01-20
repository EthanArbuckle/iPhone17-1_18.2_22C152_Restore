@interface DNDAppAction
+ (BOOL)archivingIsSupported:(id *)a3;
+ (BOOL)runtimeIsSupported:(id *)a3;
+ (BOOL)supportsSecureCoding;
+ (id)appActionFromDictionaryRepresentation:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (DNDAppAction)initWithAction:(id)a3 enabled:(BOOL)a4;
- (DNDAppAction)initWithCoder:(id)a3;
- (DNDAppAction)initWithEncodedAction:(id)a3 actionIdentifier:(id)a4 bundleIdentifier:(id)a5 enabled:(BOOL)a6;
- (LNAction)action;
- (LNAction)rawAction;
- (NSData)encodedAction;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (id)_initWithAction:(id)a3 bundleIdentifier:(id)a4 actionIdentifier:(id)a5 encodedAction:(id)a6 enabled:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)action;
- (void)encodeWithCoder:(id)a3;
- (void)encodedAction;
- (void)setBundleIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEncodedAction:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRawAction:(id)a3;
@end

@implementation DNDAppAction

+ (BOOL)runtimeIsSupported:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  Class v4 = NSClassFromString(&cfstr_Lnaction.isa);
  if (!v4)
  {
    v5 = DNDLogAppConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
    {
      +[DNDAppAction runtimeIsSupported:](v5);
      if (!a3) {
        return v4 != 0;
      }
      goto LABEL_4;
    }
    if (a3)
    {
LABEL_4:
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28568];
      v10[0] = @"Failed to encode/decode app action: LinkServices framework is not loaded.";
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      *a3 = [v6 errorWithDomain:@"DNDErrorDomain" code:1006 userInfo:v7];
    }
  }
  return v4 != 0;
}

+ (BOOL)archivingIsSupported:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (NSClassFromString(&cfstr_Wfappintentarc.isa) && NSClassFromString(&cfstr_Lnfullyqualifi.isa)) {
    return 1;
  }
  v5 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
  {
    +[DNDAppAction archivingIsSupported:](v5);
    if (!a3) {
      return 0;
    }
    goto LABEL_6;
  }
  if (a3)
  {
LABEL_6:
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Failed to (un)archive action: VoiceShortcut or LinkServices framework is not loaded.";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a3 = [v6 errorWithDomain:@"DNDErrorDomain" code:1006 userInfo:v7];
  }
  return 0;
}

- (DNDAppAction)initWithAction:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(id)objc_opt_class() runtimeIsSupported:0])
  {
    self = (DNDAppAction *)[(DNDAppAction *)self _initWithAction:v6 bundleIdentifier:0 actionIdentifier:0 encodedAction:0 enabled:v4];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (DNDAppAction)initWithEncodedAction:(id)a3 actionIdentifier:(id)a4 bundleIdentifier:(id)a5 enabled:(BOOL)a6
{
  return (DNDAppAction *)[(DNDAppAction *)self _initWithAction:0 bundleIdentifier:a5 actionIdentifier:a4 encodedAction:a3 enabled:a6];
}

- (id)_initWithAction:(id)a3 bundleIdentifier:(id)a4 actionIdentifier:(id)a5 encodedAction:(id)a6 enabled:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (([(id)objc_opt_class() runtimeIsSupported:0] & 1) != 0
    || [(id)objc_opt_class() archivingIsSupported:0])
  {
    v29.receiver = self;
    v29.super_class = (Class)DNDAppAction;
    v16 = [(DNDAppAction *)&v29 init];
    if (v16)
    {
      uint64_t v17 = [v12 copy];
      rawAction = v16->_rawAction;
      v16->_rawAction = (LNAction *)v17;

      uint64_t v19 = [v12 identifier];
      identifier = v16->_identifier;
      v16->_identifier = (NSString *)v19;

      uint64_t v21 = [v14 copy];
      v22 = v16->_identifier;
      v16->_identifier = (NSString *)v21;

      uint64_t v23 = [v15 copy];
      encodedAction = v16->_encodedAction;
      v16->_encodedAction = (NSData *)v23;

      uint64_t v25 = [v13 copy];
      bundleIdentifier = v16->_bundleIdentifier;
      v16->_bundleIdentifier = (NSString *)v25;

      v16->_enabled = a7;
    }
    self = v16;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    v3 = [(LNAction *)self->_rawAction identifier];
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (LNAction)action
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  rawAction = self->_rawAction;
  if (!rawAction)
  {
    if ([(id)objc_opt_class() archivingIsSupported:0])
    {
      uint64_t v4 = [(DNDAppAction *)self effectiveBundleIdentifier];
      if (v4)
      {
        v5 = (void *)v4;
        id v6 = (void *)[objc_alloc(NSClassFromString(&cfstr_Lnfullyqualifi.isa)) initWithActionIdentifier:self->_identifier bundleIdentifier:v4];
        v7 = (void *)[objc_alloc(NSClassFromString(&cfstr_Wfappintentarc.isa)) initWithIdentifier:v6 actionMetadata:0];
        encodedAction = self->_encodedAction;
        id v22 = 0;
        uint64_t v9 = [v7 unarchiveActionFromData:encodedAction error:&v22];
        id v10 = v22;
        v11 = v10;
        id v12 = DNDLogAppConfiguration;
        if (!v9 || v10)
        {
          if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR)) {
            -[DNDAppAction action]();
          }

          id v15 = (void *)MEMORY[0x1E4F28DC0];
          Class v16 = NSClassFromString(&cfstr_Lnaction.isa);
          uint64_t v17 = self->_encodedAction;
          id v21 = 0;
          id v14 = [v15 unarchivedObjectOfClass:v16 fromData:v17 error:&v21];
          id v13 = v21;

          v18 = DNDLogAppConfiguration;
          if (!v14 || v13)
          {
            if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR)) {
              -[DNDAppAction action]();
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v14;
              _os_log_impl(&dword_19CC2C000, v18, OS_LOG_TYPE_DEFAULT, "Unarchived settings using fallback. %@", buf, 0xCu);
            }
            id v13 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = (LNAction *)v9;
            _os_log_impl(&dword_19CC2C000, v12, OS_LOG_TYPE_DEFAULT, "Unarchived settings. %@", buf, 0xCu);
          }
          id v13 = 0;
          id v14 = (LNAction *)v9;
        }
        uint64_t v19 = self->_rawAction;
        self->_rawAction = v14;
      }
    }
    rawAction = self->_rawAction;
  }
  return rawAction;
}

- (NSData)encodedAction
{
  encodedAction = self->_encodedAction;
  if (encodedAction)
  {
LABEL_2:
    v3 = encodedAction;
    goto LABEL_10;
  }
  int v5 = [(id)objc_opt_class() archivingIsSupported:0];
  v3 = 0;
  if (v5)
  {
    v3 = [(DNDAppAction *)self effectiveBundleIdentifier];
    if (v3)
    {
      id v6 = v3;
      id v7 = objc_alloc(NSClassFromString(&cfstr_Lnfullyqualifi.isa));
      uint64_t v8 = [(DNDAppAction *)self identifier];
      uint64_t v9 = (void *)[v7 initWithActionIdentifier:v8 bundleIdentifier:v6];

      id v10 = (void *)[objc_alloc(NSClassFromString(&cfstr_Wfappintentarc.isa)) initWithIdentifier:v9 actionMetadata:0];
      v11 = [(DNDAppAction *)self rawAction];
      id v16 = 0;
      id v12 = [v10 archiveAction:v11 error:&v16];
      id v13 = v16;

      if ((!v12 || v13) && os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR)) {
        -[DNDAppAction encodedAction]();
      }
      id v14 = self->_encodedAction;
      self->_encodedAction = v12;

      encodedAction = self->_encodedAction;
      goto LABEL_2;
    }
  }
LABEL_10:
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDAppAction)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() runtimeIsSupported:0])
  {
    int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNDActionEnabled"];
    uint64_t v6 = [v5 BOOLValue];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNDActionEncodedAction"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNDActionActionIdentifier"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNDActionBundleIdentifierKey"];
    id v10 = [v4 decodeObjectOfClass:NSClassFromString(&cfstr_Lnaction.isa) forKey:@"DNDActionAction"];
    self = (DNDAppAction *)[(DNDAppAction *)self _initWithAction:v10 bundleIdentifier:v9 actionIdentifier:v8 encodedAction:v7 enabled:v6];

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL enabled = self->_enabled;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithBool:enabled];
  [v7 encodeObject:v6 forKey:@"DNDActionEnabled"];

  [v7 encodeObject:self->_rawAction forKey:@"DNDActionAction"];
  [v7 encodeObject:self->_encodedAction forKey:@"DNDActionEncodedAction"];
  [v7 encodeObject:self->_bundleIdentifier forKey:@"DNDActionBundleIdentifierKey"];
  [v7 encodeObject:self->_identifier forKey:@"DNDActionActionIdentifier"];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithBool:self->_enabled];
  [v3 setObject:v4 forKeyedSubscript:@"DNDActionEnabled"];

  int v5 = [(DNDAppAction *)self encodedAction];
  [v3 setObject:v5 forKeyedSubscript:@"DNDActionEncodedAction"];

  uint64_t v6 = [(DNDAppAction *)self bundleIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"DNDActionBundleIdentifierKey"];

  id v7 = [(DNDAppAction *)self identifier];
  [v3 setObject:v7 forKeyedSubscript:@"DNDActionActionIdentifier"];

  uint64_t v8 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v9 = [(DNDAppAction *)self action];
  id v14 = 0;
  id v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v14];
  id v11 = v14;

  if (v11 && os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDAppAction encodedAction]();
  }
  [v3 setObject:v10 forKeyedSubscript:@"AppConfigurationActionPayload"];
  id v12 = (void *)[v3 copy];

  return v12;
}

+ (id)appActionFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"DNDActionEnabled"];
  uint64_t v5 = [v4 BOOLValue];

  uint64_t v6 = [DNDAppAction alloc];
  id v7 = [v3 objectForKeyedSubscript:@"DNDActionEncodedAction"];
  uint64_t v8 = [v3 objectForKeyedSubscript:@"DNDActionActionIdentifier"];
  uint64_t v9 = [v3 objectForKeyedSubscript:@"DNDActionBundleIdentifierKey"];

  id v10 = [(DNDAppAction *)v6 initWithEncodedAction:v7 actionIdentifier:v8 bundleIdentifier:v9 enabled:v5];
  return v10;
}

- (unint64_t)hash
{
  id v3 = [(DNDAppAction *)self rawAction];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(DNDAppAction *)self encodedAction];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(DNDAppAction *)self bundleIdentifier];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(DNDAppAction *)self identifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = v10 ^ [(DNDAppAction *)self isEnabled];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (DNDAppAction *)a3;
  if (self == v5)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      id v7 = [(DNDAppAction *)self rawAction];
      uint64_t v8 = [(DNDAppAction *)v6 rawAction];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDAppAction *)self rawAction];
        if (!v9)
        {
          LOBYTE(v13) = 0;
          goto LABEL_53;
        }
        uint64_t v10 = (void *)v9;
        unint64_t v11 = [(DNDAppAction *)v6 rawAction];
        if (!v11)
        {
          LOBYTE(v13) = 0;
LABEL_52:

          goto LABEL_53;
        }
        id v12 = [(DNDAppAction *)self rawAction];
        id v3 = [(DNDAppAction *)v6 rawAction];
        if (![v12 isEqual:v3])
        {
          LOBYTE(v13) = 0;
LABEL_51:

          goto LABEL_52;
        }
        v49 = v3;
        v50 = v12;
        v51 = v11;
        v52 = v10;
      }
      id v14 = [(DNDAppAction *)self encodedAction];
      id v15 = [(DNDAppAction *)v6 encodedAction];
      if (v14 == v15) {
        goto LABEL_16;
      }
      uint64_t v16 = [(DNDAppAction *)self encodedAction];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        uint64_t v18 = [(DNDAppAction *)v6 encodedAction];
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          v47 = v14;
          id v3 = [(DNDAppAction *)self encodedAction];
          v20 = [(DNDAppAction *)v6 encodedAction];
          if ([v3 isEqual:v20])
          {
            v42 = v19;
            v43 = v17;
            v41 = v20;
            id v14 = v47;
LABEL_16:
            id v21 = [(DNDAppAction *)self bundleIdentifier];
            id v22 = [(DNDAppAction *)v6 bundleIdentifier];
            if (v21 == v22)
            {
              v46 = v3;
              v48 = v14;
              v45 = v21;
            }
            else
            {
              uint64_t v23 = [(DNDAppAction *)self bundleIdentifier];
              if (!v23)
              {

                LOBYTE(v13) = 0;
LABEL_47:
                if (v14 != v15)
                {
                }
LABEL_50:
                unint64_t v11 = v51;
                uint64_t v10 = v52;
                id v12 = v50;
                id v3 = v49;
                if (v7 != v8) {
                  goto LABEL_51;
                }
LABEL_53:

                goto LABEL_54;
              }
              v44 = (void *)v23;
              uint64_t v24 = [(DNDAppAction *)v6 bundleIdentifier];
              if (!v24)
              {
                LOBYTE(v13) = 0;
LABEL_45:

                goto LABEL_46;
              }
              v48 = v14;
              v40 = (void *)v24;
              uint64_t v25 = [(DNDAppAction *)self bundleIdentifier];
              v38 = [(DNDAppAction *)v6 bundleIdentifier];
              v39 = v25;
              if (!objc_msgSend(v25, "isEqual:"))
              {
                LOBYTE(v13) = 0;
                id v14 = v48;
LABEL_44:

                goto LABEL_45;
              }
              v45 = v21;
              v46 = v3;
            }
            v26 = [(DNDAppAction *)self identifier];
            v27 = [(DNDAppAction *)self identifier];
            if (v26 == v27) {
              goto LABEL_34;
            }
            uint64_t v28 = [(DNDAppAction *)self identifier];
            if (!v28)
            {

              LOBYTE(v13) = 0;
              goto LABEL_43;
            }
            id v3 = (void *)v28;
            uint64_t v29 = [(DNDAppAction *)self identifier];
            if (!v29)
            {
              LOBYTE(v13) = 0;
              goto LABEL_41;
            }
            v37 = (void *)v29;
            [(DNDAppAction *)self identifier];
            uint64_t v30 = v34 = v3;
            v35 = [(DNDAppAction *)self identifier];
            v36 = (void *)v30;
            v31 = (void *)v30;
            id v3 = v34;
            if (objc_msgSend(v31, "isEqual:"))
            {
LABEL_34:
              BOOL v32 = [(DNDAppAction *)self isEnabled];
              BOOL v13 = v32 ^ [(DNDAppAction *)v6 isEnabled] ^ 1;
              if (v26 == v27)
              {

LABEL_42:
LABEL_43:
                id v21 = v45;
                id v3 = v46;
                id v14 = v48;
                if (v45 == v22)
                {
LABEL_46:

                  goto LABEL_47;
                }
                goto LABEL_44;
              }
            }
            else
            {
              LOBYTE(v13) = 0;
            }

LABEL_41:
            goto LABEL_42;
          }

LABEL_32:
          LOBYTE(v13) = 0;
          goto LABEL_50;
        }
      }
      goto LABEL_32;
    }
    LOBYTE(v13) = 0;
  }
LABEL_54:

  return v13;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(DNDAppAction *)self identifier];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDAppAction isEnabled](self, "isEnabled"));
  id v7 = [(DNDAppAction *)self rawAction];
  uint64_t v8 = [NSNumber numberWithInt:self->_encodedAction != 0];
  uint64_t v9 = [(DNDAppAction *)self bundleIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@; enabled: %@; action: %@; hasEncoded: %@; bundleIdentifier: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  uint64_t v10 = v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  rawAction = self->_rawAction;
  identifier = self->_identifier;
  bundleIdentifier = self->_bundleIdentifier;
  encodedAction = self->_encodedAction;
  BOOL enabled = self->_enabled;
  return (id)[v4 _initWithAction:rawAction bundleIdentifier:bundleIdentifier actionIdentifier:identifier encodedAction:encodedAction enabled:enabled];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[DNDMutableAppAction allocWithZone:a3];
  rawAction = self->_rawAction;
  identifier = self->_identifier;
  bundleIdentifier = self->_bundleIdentifier;
  encodedAction = self->_encodedAction;
  BOOL enabled = self->_enabled;
  return [(DNDAppAction *)v4 _initWithAction:rawAction bundleIdentifier:bundleIdentifier actionIdentifier:identifier encodedAction:encodedAction enabled:enabled];
}

- (LNAction)rawAction
{
  return self->_rawAction;
}

- (void)setRawAction:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setEncodedAction:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedAction, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawAction, 0);
}

+ (void)runtimeIsSupported:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "Failed to encode/decode app action: LinkServices framework is not loaded.", v1, 2u);
}

+ (void)archivingIsSupported:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "Failed to (un)archive action: VoiceShortcut or LinkServices framework is not loaded.", v1, 2u);
}

- (void)action
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_19CC2C000, v0, v1, "Failed to unarchive settings: %{public}@", v2, v3, v4, v5, v6);
}

- (void)encodedAction
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_19CC2C000, v0, v1, "Failed to archive settings: %{public}@", v2, v3, v4, v5, v6);
}

@end