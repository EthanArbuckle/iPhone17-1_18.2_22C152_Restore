@interface NEAOVPN
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isAllowAllCaptiveNetworkPlugins;
- (BOOL)isAllowCaptiveWebSheet;
- (BOOL)isEnabled;
- (BOOL)isToggleEnabled;
- (NEAOVPN)initWithCoder:(id)a3;
- (NSDictionary)allowedCaptiveNetworkPlugins;
- (NSDictionary)applicationExceptions;
- (NSDictionary)interfaceProtocolMapping;
- (NSDictionary)serviceExceptions;
- (NSString)activeInterfaceProtocolKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveInterfaceProtocolKey:(id)a3;
- (void)setAllowAllCaptiveNetworkPlugins:(BOOL)a3;
- (void)setAllowCaptiveWebSheet:(BOOL)a3;
- (void)setAllowedCaptiveNetworkPlugins:(id)a3;
- (void)setApplicationExceptions:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInterfaceProtocolMapping:(id)a3;
- (void)setServiceExceptions:(id)a3;
- (void)setToggleEnabled:(BOOL)a3;
@end

@implementation NEAOVPN

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_applicationExceptions, 0);
  objc_storeStrong((id *)&self->_serviceExceptions, 0);
  objc_storeStrong((id *)&self->_activeInterfaceProtocolKey, 0);

  objc_storeStrong((id *)&self->_interfaceProtocolMapping, 0);
}

- (void)setAllowedCaptiveNetworkPlugins:(id)a3
{
}

- (NSDictionary)allowedCaptiveNetworkPlugins
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplicationExceptions:(id)a3
{
}

- (NSDictionary)applicationExceptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServiceExceptions:(id)a3
{
}

- (NSDictionary)serviceExceptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveInterfaceProtocolKey:(id)a3
{
}

- (NSString)activeInterfaceProtocolKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInterfaceProtocolMapping:(id)a3
{
}

- (NSDictionary)interfaceProtocolMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllowAllCaptiveNetworkPlugins:(BOOL)a3
{
  self->_allowAllCaptiveNetworkPlugins = a3;
}

- (BOOL)isAllowAllCaptiveNetworkPlugins
{
  return self->_allowAllCaptiveNetworkPlugins;
}

- (void)setAllowCaptiveWebSheet:(BOOL)a3
{
  self->_allowCaptiveWebSheet = a3;
}

- (BOOL)isAllowCaptiveWebSheet
{
  return self->_allowCaptiveWebSheet;
}

- (void)setToggleEnabled:(BOOL)a3
{
  self->_toggleEnabled = a3;
}

- (BOOL)isToggleEnabled
{
  return self->_toggleEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"), @"toggle-enabled", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"), @"allow-captive-websheet", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"), @"allow-all-captive-network-plugins", v5, a4);
  v8 = [(NEAOVPN *)self interfaceProtocolMapping];
  [v7 appendPrettyObject:v8 withName:@"interface-to-protocol-mapping" andIndent:v5 options:a4];

  v9 = [(NEAOVPN *)self activeInterfaceProtocolKey];
  [v7 appendPrettyObject:v9 withName:@"active-interface-protocol-key" andIndent:v5 options:a4];

  v10 = [(NEAOVPN *)self serviceExceptions];
  [v7 appendPrettyObject:v10 withName:@"service-exceptions" andIndent:v5 options:a4];

  v11 = [(NEAOVPN *)self applicationExceptions];
  [v7 appendPrettyObject:v11 withName:@"application-exceptions" andIndent:v5 options:a4];

  v12 = [(NEAOVPN *)self allowedCaptiveNetworkPlugins];
  [v7 appendPrettyObject:v12 withName:@"allowed-captive-network-plugins" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEAOVPN *)self interfaceProtocolMapping];

  if (!v5)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing interface to protocol mapping", v4);
    goto LABEL_25;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = [(NEAOVPN *)self interfaceProtocolMapping];
  uint64_t v6 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (!v6)
  {
    LODWORD(v5) = 1;
    goto LABEL_24;
  }
  uint64_t v7 = v6;
  LODWORD(v5) = 1;
  v8 = &off_1E598D000;
  v55 = v4;
  id v56 = *(id *)v73;
  do
  {
    uint64_t v9 = 0;
    uint64_t v53 = v7;
    do
    {
      if (*(id *)v73 != v56) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v72 + 1) + 8 * v9);
      if ((isa_nsstring(v10) & 1) == 0)
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid interface name in interface to protocol mapping", v4);
        LODWORD(v5) = 0;
      }
      v11 = [(NEAOVPN *)self interfaceProtocolMapping];
      v12 = [v11 objectForKeyedSubscript:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        LODWORD(v5) = [v12 checkValidityAndCollectErrors:v4] & v5;
      }
      else
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid protocol", v4);
        LODWORD(v5) = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        v14 = [v13 IKESecurityAssociationParameters];
        if ([v14 diffieHellmanGroup] <= 13)
        {
        }
        else
        {
          v15 = [v13 childSecurityAssociationParameters];
          uint64_t v16 = [v15 diffieHellmanGroup];

          if (v16 > 13) {
            goto LABEL_18;
          }
        }
        v17 = NSString;
        v18 = [v13 IKESecurityAssociationParameters];
        uint64_t v19 = [v18 diffieHellmanGroup];
        [v13 childSecurityAssociationParameters];
        v20 = self;
        v22 = v21 = v8;
        v23 = [v17 stringWithFormat:@"Invalid DH group (parent %ld child %ld), minimum allowed is %ld", v19, objc_msgSend(v22, "diffieHellmanGroup"), 14];
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v23, v55);

        v8 = v21;
        self = v20;

        LODWORD(v5) = 0;
LABEL_18:

        id v4 = v55;
        uint64_t v7 = v53;
      }

      ++v9;
    }
    while (v7 != v9);
    uint64_t v7 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
  }
  while (v7);
LABEL_24:

LABEL_25:
  v24 = [(NEAOVPN *)self serviceExceptions];

  if (v24)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v57 = [(NEAOVPN *)self serviceExceptions];
    uint64_t v25 = [v57 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v69 != v27) {
            objc_enumerationMutation(v57);
          }
          v29 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if ((isa_nsstring(v29) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid service name for service exceptions", v4);
            LODWORD(v5) = 0;
          }
          v30 = [(NEAOVPN *)self serviceExceptions];
          v31 = [v30 objectForKeyedSubscript:v29];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LODWORD(v5) = [v31 checkValidityAndCollectErrors:v4] & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid service exception", v4);
            LODWORD(v5) = 0;
          }
        }
        uint64_t v26 = [v57 countByEnumeratingWithState:&v68 objects:v78 count:16];
      }
      while (v26);
    }
  }
  v32 = [(NEAOVPN *)self applicationExceptions];

  if (v32)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v58 = [(NEAOVPN *)self applicationExceptions];
    uint64_t v33 = [v58 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v58);
          }
          v37 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if ((isa_nsstring(v37) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid bundle identifier for application exception", v4);
            LODWORD(v5) = 0;
          }
          v38 = [(NEAOVPN *)self applicationExceptions];
          v39 = [v38 objectForKeyedSubscript:v37];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LODWORD(v5) = [v39 checkValidityAndCollectErrors:v4] & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid application exception", v4);
            LODWORD(v5) = 0;
          }
          uint64_t v40 = [v39 limitToProtocols];
          if (v40)
          {
            v41 = (void *)v40;
            v42 = [v39 limitToProtocols];
            if ([v42 count])
            {
              char v43 = [v39 isLimitedToUDP];

              if ((v43 & 1) == 0)
              {
                +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid application exception LimitToProtocol specified", v4);
                LODWORD(v5) = 0;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v34 = [v58 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v34);
    }
  }
  v44 = [(NEAOVPN *)self allowedCaptiveNetworkPlugins];

  if (v44)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v59 = [(NEAOVPN *)self allowedCaptiveNetworkPlugins];
    uint64_t v45 = [v59 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v61 != v47) {
            objc_enumerationMutation(v59);
          }
          v49 = *(void **)(*((void *)&v60 + 1) + 8 * k);
          if ((isa_nsstring(v49) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid bundle identifier for allowed Captive network plugin", v4);
            LODWORD(v5) = 0;
          }
          v50 = [(NEAOVPN *)self allowedCaptiveNetworkPlugins];
          v51 = [v50 objectForKeyedSubscript:v49];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LODWORD(v5) = [v51 checkValidityAndCollectErrors:v4] & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid Captive network plugin exception", v4);
            LODWORD(v5) = 0;
          }
        }
        uint64_t v46 = [v59 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v46);
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEAOVPN allocWithZone:a3] init];
  [(NEAOVPN *)v4 setEnabled:[(NEAOVPN *)self isEnabled]];
  [(NEAOVPN *)v4 setToggleEnabled:[(NEAOVPN *)self isToggleEnabled]];
  [(NEAOVPN *)v4 setAllowCaptiveWebSheet:[(NEAOVPN *)self isAllowCaptiveWebSheet]];
  [(NEAOVPN *)v4 setAllowAllCaptiveNetworkPlugins:[(NEAOVPN *)self isAllowAllCaptiveNetworkPlugins]];
  uint64_t v5 = [(NEAOVPN *)self interfaceProtocolMapping];
  [(NEAOVPN *)v4 setInterfaceProtocolMapping:v5];

  uint64_t v6 = [(NEAOVPN *)self activeInterfaceProtocolKey];
  [(NEAOVPN *)v4 setActiveInterfaceProtocolKey:v6];

  uint64_t v7 = [(NEAOVPN *)self serviceExceptions];
  [(NEAOVPN *)v4 setServiceExceptions:v7];

  v8 = [(NEAOVPN *)self applicationExceptions];
  [(NEAOVPN *)v4 setApplicationExceptions:v8];

  uint64_t v9 = [(NEAOVPN *)self allowedCaptiveNetworkPlugins];
  [(NEAOVPN *)v4 setAllowedCaptiveNetworkPlugins:v9];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isEnabled](self, "isEnabled"), @"Enabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"), @"ToggleEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"), @"AllowCaptiveWebSheet");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"), @"AllowAllCaptiveNetworkPlugins");
  uint64_t v5 = [(NEAOVPN *)self interfaceProtocolMapping];
  [v4 encodeObject:v5 forKey:@"InterfaceProtocolMapping"];

  uint64_t v6 = [(NEAOVPN *)self activeInterfaceProtocolKey];
  [v4 encodeObject:v6 forKey:@"ActiveInterfaceProtocolKey"];

  uint64_t v7 = [(NEAOVPN *)self serviceExceptions];
  [v4 encodeObject:v7 forKey:@"ServiceExceptions"];

  v8 = [(NEAOVPN *)self applicationExceptions];
  [v4 encodeObject:v8 forKey:@"ApplicationExceptions"];

  id v9 = [(NEAOVPN *)self allowedCaptiveNetworkPlugins];
  [v4 encodeObject:v9 forKey:@"AllowedCaptiveNetworkPlugins"];
}

- (NEAOVPN)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NEAOVPN;
  uint64_t v5 = [(NEAOVPN *)&v33 init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v5->_toggleEnabled = [v4 decodeBoolForKey:@"ToggleEnabled"];
    v5->_allowCaptiveWebSheet = [v4 decodeBoolForKey:@"AllowCaptiveWebSheet"];
    v5->_allowAllCaptiveNetworkPlugins = [v4 decodeBoolForKey:@"AllowAllCaptiveNetworkPlugins"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"InterfaceProtocolMapping"];
    interfaceProtocolMapping = v5->_interfaceProtocolMapping;
    v5->_interfaceProtocolMapping = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ActiveInterfaceProtocolKey"];
    activeInterfaceProtocolKey = v5->_activeInterfaceProtocolKey;
    v5->_activeInterfaceProtocolKey = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"ServiceExceptions"];
    serviceExceptions = v5->_serviceExceptions;
    v5->_serviceExceptions = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"ApplicationExceptions"];
    applicationExceptions = v5->_applicationExceptions;
    v5->_applicationExceptions = (NSDictionary *)v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"AllowedCaptiveNetworkPlugins"];
    allowedCaptiveNetworkPlugins = v5->_allowedCaptiveNetworkPlugins;
    v5->_allowedCaptiveNetworkPlugins = (NSDictionary *)v30;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end