@interface NEVPN
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isDisconnectOnDemandEnabled;
- (BOOL)isEnabled;
- (BOOL)isOnDemandEnabled;
- (BOOL)isOnDemandUserOverrideDisabled;
- (NEVPN)init;
- (NEVPN)initWithCoder:(id)a3;
- (NEVPNProtocol)protocol;
- (NSArray)exceptionApps;
- (NSArray)onDemandRules;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)tunnelType;
- (void)encodeWithCoder:(id)a3;
- (void)setDisconnectOnDemandEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExceptionApps:(id)a3;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setOnDemandUserOverrideDisabled:(BOOL)a3;
- (void)setProtocol:(id)a3;
- (void)setTunnelType:(int64_t)a3;
@end

@implementation NEVPN

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionApps, 0);
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_onDemandRules, 0);
}

- (void)setExceptionApps:(id)a3
{
}

- (NSArray)exceptionApps
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTunnelType:(int64_t)a3
{
  self->_tunnelType = a3;
}

- (int64_t)tunnelType
{
  return self->_tunnelType;
}

- (void)setProtocol:(id)a3
{
}

- (NEVPNProtocol)protocol
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOnDemandRules:(id)a3
{
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  self->_onDemandUserOverrideDisabled = a3;
}

- (BOOL)isOnDemandUserOverrideDisabled
{
  return self->_onDemandUserOverrideDisabled;
}

- (void)setDisconnectOnDemandEnabled:(BOOL)a3
{
  self->_disconnectOnDemandEnabled = a3;
}

- (BOOL)isDisconnectOnDemandEnabled
{
  return self->_disconnectOnDemandEnabled;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  self->_onDemandEnabled = a3;
}

- (BOOL)isOnDemandEnabled
{
  return self->_onDemandEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NEVPN;
  v5 = [(NEVPN *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolType"];
    switch([v6 intValue])
    {
      case 1u:
        v7 = NEVPNProtocolIPSec;
        goto LABEL_10;
      case 2u:
        v7 = NEVPNProtocolL2TP;
        goto LABEL_10;
      case 3u:
        v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "PPTP is not supported", buf, 2u);
        }
        v8 = 0;
        v10 = v6;
        goto LABEL_28;
      case 4u:
        v7 = NETunnelProviderProtocol;
LABEL_10:
        uint64_t v11 = [[v7 alloc] initFromLegacyDictionary:v4];
        protocol = v5->_protocol;
        v5->_protocol = (NEVPNProtocol *)v11;

        break;
      default:
        break;
    }
    v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FA0]];

    if (v10) {
      v5->_onDemandEnabled = [v10 BOOLValue];
    }
    uint64_t v13 = +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v4);
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v13;

    v9 = [v4 objectForKeyedSubscript:@"ExceptionApps"];
    if (isa_nsarray(v9) && [v9 count])
    {
      v24 = v10;
      v15 = [MEMORY[0x1E4F1CA48] array];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v16 = v9;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (isa_nsstring(v21))
            {
              v22 = [[NEAppRule alloc] initWithSigningIdentifier:v21];
              if (v22) {
                [v15 addObject:v22];
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v18);
      }

      v10 = v24;
    }
    v8 = v5;
LABEL_28:
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyLegacyDictionary
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(NEVPN *)self protocol];

  if (v3)
  {
    id v4 = [(NEVPN *)self protocol];
    id v5 = (id)[v4 copyLegacyDictionary];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F41FA0]];

  v7 = [(NEVPN *)self onDemandRules];

  if (v7)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v8 = [(NEVPN *)self onDemandRules];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (!v9)
    {
      id v11 = v8;
      goto LABEL_17;
    }
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyLegacyDictionary];
        if (!v11) {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v11 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);

    if (v11)
    {
      [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F42020]];
LABEL_17:
    }
  }
  v15 = [(NEVPN *)self exceptionApps];

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = [(NEVPN *)self exceptionApps];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v24 + 1) + 8 * j) matchSigningIdentifier];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v5 setObject:v16 forKeyedSubscript:@"ExceptionApps"];
  }
  return v5;
}

- (id)description
{
  return [(NEVPN *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"), @"onDemandEnabled", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"), @"disconnectOnDemandEnabled", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"), @"onDemandUserOverrideDisabled", v5, a4);
  v8 = [(NEVPN *)self onDemandRules];
  [v7 appendPrettyObject:v8 withName:@"onDemandRules" andIndent:v5 options:a4];

  uint64_t v9 = [(NEVPN *)self protocol];
  [v7 appendPrettyObject:v9 withName:@"protocol" andIndent:v5 options:a4];

  uint64_t v10 = [(NEVPN *)self exceptionApps];
  [v7 appendPrettyObject:v10 withName:@"exceptionApps" andIndent:v5 options:a4];

  if ([(NEVPN *)self tunnelType] == 2) {
    id v11 = @"app-proxy";
  }
  else {
    id v11 = @"packet";
  }
  [v7 appendPrettyObject:v11 withName:@"tunnelType" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEVPN *)self onDemandRules];

  if (v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = self;
    v6 = [(NEVPN *)self onDemandRules];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (![v12 checkValidityAndCollectErrors:v4]) {
              char v10 = 0;
            }
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid on demand rule object", v4);
            char v10 = 0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }
    else
    {
      char v10 = 1;
    }

    char v13 = v10 & 1;
    self = v24;
  }
  else
  {
    char v13 = 1;
  }
  v14 = [(NEVPN *)self protocol];

  if (v14)
  {
    v14 = [(NEVPN *)self protocol];
    char v15 = [v14 checkValidityAndCollectErrors:v4];

    LOBYTE(v14) = v15 & v13;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing protocol", v4);
  }
  uint64_t v16 = [(NEVPN *)self exceptionApps];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    char v18 = ne_session_disable_restrictions();

    if ((v18 & 1) == 0)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Exception app rules are not allowed", v4);
      LOBYTE(v14) = 0;
    }
  }
  if ([(NEVPN *)self tunnelType] == 2)
  {
    uint64_t v19 = [(NEVPN *)self protocol];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      v21 = [(NEVPN *)self protocol];
      uint64_t v22 = [v21 type];

      if (v22 != 4)
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"App Proxy tunnel type can only be used with plugin-based configurations", v4);
        LOBYTE(v14) = 0;
      }
    }
  }

  return (char)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setEnabled:", -[NEVPN isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setOnDemandEnabled:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  objc_msgSend(v4, "setDisconnectOnDemandEnabled:", -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"));
  objc_msgSend(v4, "setOnDemandUserOverrideDisabled:", -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"));
  uint64_t v5 = [(NEVPN *)self onDemandRules];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v7 = [(NEVPN *)self onDemandRules];
    uint64_t v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setOnDemandRules:v8];
  }
  uint64_t v9 = [(NEVPN *)self protocol];
  [v4 setProtocol:v9];

  char v10 = [(NEVPN *)self exceptionApps];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v12 = [(NEVPN *)self exceptionApps];
    char v13 = (void *)[v11 initWithArray:v12 copyItems:1];
    [v4 setExceptionApps:v13];
  }
  objc_msgSend(v4, "setTunnelType:", -[NEVPN tunnelType](self, "tunnelType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isEnabled](self, "isEnabled"), @"Enabled");
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"), @"OnDemandEnabled");
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"), @"DisconnectOnDemandEnabled");
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"), @"OnDemandUserOverrideDisabled");
  id v4 = [(NEVPN *)self onDemandRules];
  [v7 encodeObject:v4 forKey:@"OnDemandRules"];

  uint64_t v5 = [(NEVPN *)self protocol];
  [v7 encodeObject:v5 forKey:@"Protocol"];

  id v6 = [(NEVPN *)self exceptionApps];
  [v7 encodeObject:v6 forKey:@"ExceptionApps"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[NEVPN tunnelType](self, "tunnelType"), @"TunnelType");
}

- (NEVPN)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEVPN *)self init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v5->_onDemandEnabled = [v4 decodeBoolForKey:@"OnDemandEnabled"];
    v5->_disconnectOnDemandEnabled = [v4 decodeBoolForKey:@"DisconnectOnDemandEnabled"];
    v5->_onDemandUserOverrideDisabled = [v4 decodeBoolForKey:@"OnDemandUserOverrideDisabled"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"OnDemandRules"];
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Protocol"];
    protocol = v5->_protocol;
    v5->_protocol = (NEVPNProtocol *)v11;

    char v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    char v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"ExceptionApps"];
    exceptionApps = v5->_exceptionApps;
    v5->_exceptionApps = (NSArray *)v16;

    uint64_t v18 = [v4 decodeIntegerForKey:@"TunnelType"];
    v5->_tunnelType = v18;
    if (!v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([(NEVPN *)v5 protocol],
            uint64_t v19 = objc_claimAutoreleasedReturnValue(),
            uint64_t v20 = [v19 type],
            v19,
            v20 == 4))
      {
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v21 = 1;
      }
      v5->_tunnelType = v21;
    }
  }

  return v5;
}

- (NEVPN)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEVPN;
  result = [(NEVPN *)&v3 init];
  if (result) {
    result->_tunnelType = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end