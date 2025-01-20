@interface DNDSystemAction
+ (BOOL)runtimeIsSupported:(id *)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (DNDSystemAction)initWithAction:(id)a3 enabled:(BOOL)a4;
- (DNDSystemAction)initWithAction:(id)a3 reverseAction:(id)a4 enabled:(BOOL)a5;
- (DNDSystemAction)initWithCoder:(id)a3;
- (NSString)identifier;
- (WFReverseContextualAction)reverseAction;
- (WFToggleSettingContextualAction)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDSystemAction

+ (BOOL)runtimeIsSupported:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (NSClassFromString(&cfstr_Wftogglesettin.isa) && NSClassFromString(&cfstr_Wfreverseconte.isa)) {
    return 1;
  }
  v5 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
  {
    +[DNDSystemAction runtimeIsSupported:](v5);
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
    v9[0] = @"Failed to store system action: VoiceShortcutClient framework is not loaded.";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a3 = [v6 errorWithDomain:@"DNDErrorDomain" code:1006 userInfo:v7];
  }
  return 0;
}

- (DNDSystemAction)initWithAction:(id)a3 enabled:(BOOL)a4
{
  id v7 = a3;
  if ([(id)objc_opt_class() runtimeIsSupported:0])
  {
    v12.receiver = self;
    v12.super_class = (Class)DNDSystemAction;
    uint64_t v8 = [(DNDSystemAction *)&v12 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_action, a3);
      v9->_enabled = a4;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (DNDSystemAction)initWithAction:(id)a3 reverseAction:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  v10 = [(DNDSystemAction *)self initWithAction:a3 enabled:v5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_reverseAction, a4);
  }

  return v11;
}

- (NSString)identifier
{
  v2 = [(DNDSystemAction *)self action];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSystemAction)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() runtimeIsSupported:0])
  {
    BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNDActionEnabled"];
    uint64_t v6 = [v5 BOOLValue];
    id v7 = [v4 decodeObjectOfClass:NSClassFromString(&cfstr_Wftogglesettin.isa) forKey:@"DNDActionAction"];
    uint64_t v8 = [v4 decodeObjectOfClass:NSClassFromString(&cfstr_Wfreverseconte.isa) forKey:@"DNDActionReverseAction"];
    self = [(DNDSystemAction *)self initWithAction:v7 reverseAction:v8 enabled:v6];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL enabled = self->_enabled;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithBool:enabled];
  [v7 encodeObject:v6 forKey:@"DNDActionEnabled"];

  [v7 encodeObject:self->_action forKey:@"DNDActionAction"];
  [v7 encodeObject:self->_reverseAction forKey:@"DNDActionReverseAction"];
}

- (unint64_t)hash
{
  v3 = [(DNDSystemAction *)self action];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(DNDSystemAction *)self reverseAction];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(DNDSystemAction *)self isEnabled];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v7 = (DNDSystemAction *)a3;
  if (self == v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = v7;
      id v9 = [(DNDSystemAction *)self action];
      v10 = [(DNDSystemAction *)v8 action];
      if (v9 != v10)
      {
        uint64_t v11 = [(DNDSystemAction *)self action];
        if (!v11)
        {
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        uint64_t v12 = [(DNDSystemAction *)v8 action];
        if (!v12)
        {
          LOBYTE(v14) = 0;
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v4 = (void *)v12;
        v13 = [(DNDSystemAction *)self action];
        BOOL v5 = [(DNDSystemAction *)v8 action];
        if (![v13 isEqual:v5])
        {
          LOBYTE(v14) = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      v15 = [(DNDSystemAction *)self reverseAction];
      v16 = [(DNDSystemAction *)v8 reverseAction];
      if (v15 == v16) {
        goto LABEL_16;
      }
      uint64_t v17 = [(DNDSystemAction *)self reverseAction];
      if (!v17)
      {

        LOBYTE(v14) = 0;
        goto LABEL_25;
      }
      BOOL v5 = (void *)v17;
      uint64_t v18 = [(DNDSystemAction *)v8 reverseAction];
      if (!v18)
      {
        LOBYTE(v14) = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      uint64_t v19 = [(DNDSystemAction *)self reverseAction];
      uint64_t v20 = [(DNDSystemAction *)v8 reverseAction];
      v25 = (void *)v19;
      v21 = (void *)v19;
      uint64_t v4 = (void *)v20;
      if ([v21 isEqual:v20])
      {
LABEL_16:
        BOOL v22 = [(DNDSystemAction *)self isEnabled];
        BOOL v14 = v22 ^ [(DNDSystemAction *)v8 isEnabled] ^ 1;
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          v13 = v27;
          uint64_t v4 = v28;
          BOOL v5 = v26;
          if (v9 != v10) {
            goto LABEL_26;
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    LOBYTE(v14) = 0;
  }
LABEL_29:

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(DNDSystemAction *)self identifier];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSystemAction isEnabled](self, "isEnabled"));
  unint64_t v7 = [(DNDSystemAction *)self action];
  uint64_t v8 = [(DNDSystemAction *)self reverseAction];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@; enabled: %@; action: %@; reverse: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  action = self->_action;
  reverseAction = self->_reverseAction;
  BOOL enabled = self->_enabled;
  return (id)[v4 initWithAction:action reverseAction:reverseAction enabled:enabled];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[DNDMutableSystemAction allocWithZone:a3];
  action = self->_action;
  reverseAction = self->_reverseAction;
  BOOL enabled = self->_enabled;
  return [(DNDSystemAction *)v4 initWithAction:action reverseAction:reverseAction enabled:enabled];
}

- (WFToggleSettingContextualAction)action
{
  return self->_action;
}

- (WFReverseContextualAction)reverseAction
{
  return self->_reverseAction;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (void)runtimeIsSupported:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "Failed to store system action: VoiceShortcutClient framework is not loaded.", v1, 2u);
}

@end