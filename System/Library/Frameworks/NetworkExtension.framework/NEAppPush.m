@interface NEAppPush
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (BOOL)overlapsWithConfiguration:(id)a3;
- (NEAppPush)init;
- (NEAppPush)initWithCoder:(id)a3;
- (NSArray)matchPrivateLTENetworks;
- (NSArray)matchSSIDs;
- (NSDictionary)providerConfiguration;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMatchPrivateLTENetworks:(id)a3;
- (void)setMatchSSIDs:(id)a3;
- (void)setPluginType:(id)a3;
- (void)setProviderBundleIdentifier:(id)a3;
- (void)setProviderConfiguration:(id)a3;
@end

@implementation NEAppPush

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_matchPrivateLTENetworks, 0);
  objc_storeStrong((id *)&self->_matchSSIDs, 0);

  objc_storeStrong((id *)&self->_providerConfiguration, 0);
}

- (void)setProviderBundleIdentifier:(id)a3
{
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPluginType:(id)a3
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchPrivateLTENetworks:(id)a3
{
}

- (NSArray)matchPrivateLTENetworks
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMatchSSIDs:(id)a3
{
}

- (NSArray)matchSSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProviderConfiguration:(id)a3
{
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)overlapsWithConfiguration:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(NEAppPush *)self matchSSIDs];
  v7 = [v5 setWithArray:v6];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [v4 matchSSIDs];
  v10 = [v8 setWithArray:v9];

  if (([v10 intersectsSet:v7] & 1) == 0)
  {
    v11 = [(NEAppPush *)self matchPrivateLTENetworks];
    v12 = [v4 matchPrivateLTENetworks];
    id v13 = v11;
    id v14 = v12;
    v15 = v14;
    if (!self || (LOBYTE(self) = 0, !v13) || !v14)
    {
LABEL_45:

      goto LABEL_46;
    }
    if (![v13 count] || !objc_msgSend(v15, "count"))
    {
      LOBYTE(self) = 0;
      goto LABEL_45;
    }
    unint64_t v16 = [v13 count];
    unint64_t v17 = [v15 count];
    if (v16 >= v17) {
      v18 = v15;
    }
    else {
      v18 = v13;
    }
    if (v16 >= v17) {
      v19 = v13;
    }
    else {
      v19 = v15;
    }
    id v20 = v18;
    id v21 = v19;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v22 = v20;
    uint64_t v47 = [v22 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (!v47)
    {
      LOBYTE(self) = 0;
      goto LABEL_44;
    }
    uint64_t v23 = *(void *)v61;
    v54 = v7;
    id v55 = v4;
    id v52 = v13;
    v53 = v10;
    id v50 = v21;
    v51 = v15;
    v49 = v22;
    uint64_t v46 = *(void *)v61;
LABEL_16:
    uint64_t v24 = 0;
LABEL_17:
    if (*(void *)v61 != v23) {
      objc_enumerationMutation(v22);
    }
    uint64_t v48 = v24;
    v25 = *(void **)(*((void *)&v60 + 1) + 8 * v24);
    id v26 = v21;
    id v27 = v25;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (!v29) {
      goto LABEL_38;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v65;
    id v56 = v28;
LABEL_21:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v65 != v31) {
        objc_enumerationMutation(v28);
      }
      v33 = *(void **)(*((void *)&v64 + 1) + 8 * v32);
      v34 = objc_msgSend(v33, "mobileCountryCode", v46);
      v35 = [v27 mobileCountryCode];
      if ([v34 isEqual:v35]) {
        break;
      }

LABEL_36:
      if (v30 == ++v32)
      {
        uint64_t v30 = [v28 countByEnumeratingWithState:&v64 objects:v69 count:16];
        if (v30) {
          goto LABEL_21;
        }
LABEL_38:

        uint64_t v24 = v48 + 1;
        v7 = v54;
        id v4 = v55;
        id v13 = v52;
        v10 = v53;
        id v21 = v50;
        v15 = v51;
        id v22 = v49;
        uint64_t v23 = v46;
        if (v48 + 1 == v47)
        {
          LOBYTE(self) = 0;
          uint64_t v47 = [v49 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (!v47)
          {
LABEL_44:

            goto LABEL_45;
          }
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    v36 = [v33 mobileNetworkCode];
    v37 = [v27 mobileNetworkCode];
    if (![v36 isEqual:v37])
    {
      char v44 = 0;
      goto LABEL_35;
    }
    uint64_t v58 = [v33 trackingAreaCode];
    if (v58 || ([v27 trackingAreaCode], (v57 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v38 = [v33 trackingAreaCode];
      [v27 trackingAreaCode];
      uint64_t v39 = v30;
      uint64_t v40 = v31;
      v42 = id v41 = v27;
      char v59 = [v38 isEqual:v42];

      id v27 = v41;
      uint64_t v31 = v40;
      uint64_t v30 = v39;

      id v28 = v56;
      v43 = (void *)v58;
      if (v58)
      {
LABEL_34:

        char v44 = v59;
LABEL_35:

        if (v44)
        {

          LOBYTE(self) = 1;
          v7 = v54;
          id v4 = v55;
          id v13 = v52;
          v10 = v53;
          id v21 = v50;
          v15 = v51;
          id v22 = v49;
          goto LABEL_44;
        }
        goto LABEL_36;
      }
    }
    else
    {
      v57 = 0;
      char v59 = 1;
      v43 = 0;
    }

    goto LABEL_34;
  }
  LOBYTE(self) = 1;
LABEL_46:

  return (char)self;
}

- (id)description
{
  return [(NEAppPush *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAppPush isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  v8 = [(NEAppPush *)self matchSSIDs];
  [v7 appendPrettyObject:v8 withName:@"matching SSID List" andIndent:v5 options:a4];

  v9 = [(NEAppPush *)self matchPrivateLTENetworks];
  [v7 appendPrettyObject:v9 withName:@"matching Private LTE Network List" andIndent:v5 options:a4];

  v10 = [(NEAppPush *)self providerConfiguration];
  [v7 appendPrettyObject:v10 withName:@"vendor specific provider configuration" andIndent:v5 options:a4];

  v11 = [(NEAppPush *)self providerBundleIdentifier];
  [v7 appendPrettyObject:v11 withName:@"provider bundle identifier" andIndent:v5 options:a4];

  v12 = [(NEAppPush *)self pluginType];
  [v7 appendPrettyObject:v12 withName:@"plugin type" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEAppPush *)self matchSSIDs];
  if ([v5 count])
  {
  }
  else
  {
    v6 = [(NEAppPush *)self matchPrivateLTENetworks];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      v10 = @"Empty SSID list or private LTE network list";
      goto LABEL_46;
    }
  }
  v8 = [(NEAppPush *)self matchSSIDs];
  unint64_t v9 = [v8 count];

  if (v9 < 0xB)
  {
    v11 = [(NEAppPush *)self matchPrivateLTENetworks];
    unint64_t v12 = [v11 count];

    if (v12 < 0xB)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v13 = [(NEAppPush *)self matchSSIDs];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v59 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            if (!isa_nsstring(v18) || ![v18 length])
            {
              +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid/Empty SSID string in the SSID list", v4);

              goto LABEL_47;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v58 objects:v65 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      obuint64_t j = [(NEAppPush *)self matchPrivateLTENetworks];
      uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v52 = *(void *)v55;
        unint64_t v21 = 0x1E4F28000uLL;
        while (2)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v55 != v52) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            objc_msgSend(v23, "mobileCountryCode", v52);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (!self || !isa_nsstring(v24) || [v25 length] != 3)
            {
              id v50 = v25;
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_57;
            }
            id v26 = [*(id *)(v21 + 2952) decimalDigitCharacterSet];
            id v27 = [v26 invertedSet];

            uint64_t v28 = [v25 rangeOfCharacterFromSet:v27];
            if (v28 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_58;
            }
            id v29 = [v23 mobileNetworkCode];
            if (!isa_nsstring(v29)
              || [v29 length] != 3 && objc_msgSend(v29, "length") != 2)
            {
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_56;
            }
            unint64_t v30 = v21;
            uint64_t v31 = [*(id *)(v21 + 2952) decimalDigitCharacterSet];
            uint64_t v32 = [v31 invertedSet];

            uint64_t v33 = [v29 rangeOfCharacterFromSet:v32];
            if (v33 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_59;
            }
            uint64_t v34 = [v23 trackingAreaCode];
            unint64_t v21 = v30;
            if (v34)
            {
              v25 = (void *)v34;
              id v29 = [v23 trackingAreaCode];
              if (!isa_nsstring(v29)) {
                goto LABEL_55;
              }
              v35 = [*(id *)(v30 + 2952) decimalDigitCharacterSet];
              v36 = [v35 invertedSet];

              if ([v29 rangeOfCharacterFromSet:v36] != 0x7FFFFFFFFFFFFFFFLL
                || ![v29 length])
              {

LABEL_55:
                v51 = @"Invalid TAC in Private LTE configuration";
LABEL_56:
                id v50 = v25;

                v25 = v29;
LABEL_57:

                v25 = v50;
LABEL_58:

LABEL_59:
                +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v51, v4);

                goto LABEL_47;
              }
              unint64_t v37 = [v29 length];

              if (v37 > 5)
              {
                v51 = @"Invalid TAC in Private LTE configuration";
                goto LABEL_59;
              }
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v38 = [(NEAppPush *)self providerBundleIdentifier];
      uint64_t v39 = [v38 length];

      if (v39)
      {
        uint64_t v40 = [(NEAppPush *)self providerConfiguration];
        if (!v40) {
          goto LABEL_40;
        }
        id v41 = (void *)v40;
        v42 = [(NEAppPush *)self providerConfiguration];
        v43 = [v42 allKeys];
        uint64_t v44 = [v43 count];

        if (!v44)
        {
LABEL_40:
          v45 = ne_log_obj();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            long long v63 = self;
            _os_log_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_INFO, "%@ no provider configuration found", buf, 0xCu);
          }
        }
        uint64_t v46 = [(NEAppPush *)self pluginType];
        uint64_t v47 = [v46 length];

        if (v47)
        {
          BOOL v48 = 1;
          goto LABEL_48;
        }
        v10 = @"missing plugin type";
      }
      else
      {
        v10 = @"provider bundle identifier not found";
      }
    }
    else
    {
      v10 = @"A configuration can have maximum 10 Private LTE networks";
    }
  }
  else
  {
    v10 = @"A configuration can have maximum 10 SSIDs";
  }
LABEL_46:
  +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v10, v4);
LABEL_47:
  BOOL v48 = 0;
LABEL_48:

  return v48;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEAppPush allocWithZone:a3] init];
  [(NEAppPush *)v4 setEnabled:[(NEAppPush *)self isEnabled]];
  uint64_t v5 = [(NEAppPush *)self matchSSIDs];
  [(NEAppPush *)v4 setMatchSSIDs:v5];

  v6 = [(NEAppPush *)self providerConfiguration];
  [(NEAppPush *)v4 setProviderConfiguration:v6];

  uint64_t v7 = [(NEAppPush *)self providerBundleIdentifier];
  [(NEAppPush *)v4 setProviderBundleIdentifier:v7];

  v8 = [(NEAppPush *)self pluginType];
  [(NEAppPush *)v4 setPluginType:v8];

  unint64_t v9 = [(NEAppPush *)self matchPrivateLTENetworks];
  [(NEAppPush *)v4 setMatchPrivateLTENetworks:v9];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAppPush isEnabled](self, "isEnabled"), @"Enabled");
  uint64_t v5 = [(NEAppPush *)self matchSSIDs];
  [v4 encodeObject:v5 forKey:@"MatchSSIDs"];

  v6 = [(NEAppPush *)self providerConfiguration];
  [v4 encodeObject:v6 forKey:@"ProviderConfig"];

  uint64_t v7 = [(NEAppPush *)self providerBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"ProviderBundleID"];

  v8 = [(NEAppPush *)self pluginType];
  [v4 encodeObject:v8 forKey:@"PluginType"];

  id v9 = [(NEAppPush *)self matchPrivateLTENetworks];
  [v4 encodeObject:v9 forKey:@"MatchPLTEs"];
}

- (NEAppPush)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NEAppPush;
  uint64_t v5 = [(NEAppPush *)&v29 init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MatchSSIDs"];
    matchSSIDs = v5->_matchSSIDs;
    v5->_matchSSIDs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"ProviderConfig"];
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderBundleID"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v21;

    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"MatchPLTEs"];
    matchPrivateLTENetworks = v5->_matchPrivateLTENetworks;
    v5->_matchPrivateLTENetworks = (NSArray *)v26;
  }
  return v5;
}

- (NEAppPush)init
{
  v5.receiver = self;
  v5.super_class = (Class)NEAppPush;
  v2 = [(NEAppPush *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NEAppPush *)v2 setEnabled:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end