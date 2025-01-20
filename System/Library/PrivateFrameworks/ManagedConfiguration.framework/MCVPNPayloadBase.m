@interface MCVPNPayloadBase
+ (id)NEAlwaysOnVPNPayloadBaseDelegateWithConfigurationDict:(id)a3;
+ (id)NEVPNPayloadBaseDelegateWithConfigurationDict:(id)a3;
- (MCVPNPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NEProfilePayloadBaseDelegate)nePayloadBase;
- (NSMutableDictionary)configurationDictionary;
- (NSString)CellularSliceUUID;
- (NSString)passwordKey;
- (NSString)pinKey;
- (NSString)proxyPasswordKey;
- (NSString)proxyUserNameKey;
- (NSString)serviceName;
- (NSString)sharedSecretKey;
- (NSString)userNameKey;
- (NSString)vpnType;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)setCellularSliceUUID:(id)a3;
- (void)setConfigurationDictionary:(id)a3;
- (void)setNePayloadBase:(id)a3;
- (void)setPasswordKey:(id)a3;
- (void)setPinKey:(id)a3;
- (void)setProxyPasswordKey:(id)a3;
- (void)setProxyUserNameKey:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSharedSecretKey:(id)a3;
- (void)setUserNameKey:(id)a3;
- (void)setVpnType:(id)a3;
@end

@implementation MCVPNPayloadBase

+ (id)NEVPNPayloadBaseDelegateWithConfigurationDict:(id)a3
{
  id v3 = a3;
  MCNEProfileIngestionClass();
  v4 = (void *)[objc_alloc(NSClassFromString(&cfstr_Neprofilepaylo_0.isa)) initWithPayload:v3];

  return v4;
}

+ (id)NEAlwaysOnVPNPayloadBaseDelegateWithConfigurationDict:(id)a3
{
  id v3 = a3;
  MCNEProfileIngestionClass();
  v4 = (void *)[objc_alloc(NSClassFromString(&cfstr_Neprofilepaylo.isa)) initWithPayload:v3];

  return v4;
}

- (MCVPNPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  v97[6] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v88.receiver = self;
  v88.super_class = (Class)MCVPNPayloadBase;
  v10 = [(MCPayload *)&v88 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    if ([v9 isStub])
    {
      uint64_t v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ServiceName" isRequired:0 outError:0];
      serviceName = v10->_serviceName;
      v10->_serviceName = (NSString *)v11;

      uint64_t v13 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"VPNType" isRequired:0 outError:0];
      id vpnType = v10->_vpnType;
      v10->_id vpnType = (NSString *)v13;
LABEL_10:

      goto LABEL_11;
    }
    id v87 = 0;
    uint64_t v15 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"VPNType" isRequired:1 outError:&v87];
    id vpnType = v87;
    v16 = v10->_vpnType;
    v10->_id vpnType = (NSString *)v15;

    if (vpnType) {
      goto LABEL_5;
    }
    v97[0] = @"VPN";
    v97[1] = @"L2TP";
    v97[2] = @"PPTP";
    v97[3] = @"IPSec";
    v97[4] = @"IKEv2";
    v97[5] = @"AlwaysOn";
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:6];
    uint64_t v26 = [v25 containsObject:v10->_vpnType];

    if ((v26 & 1) == 0)
    {
      id vpnType = +[MCPayload badFieldTypeErrorWithField:@"VPNType"];
      if (!vpnType) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    configurationDictionary = v10->_configurationDictionary;
    v10->_configurationDictionary = v27;

    displayName = v10->super._displayName;
    if (displayName) {
      [(NSMutableDictionary *)v10->_configurationDictionary setObject:displayName forKeyedSubscript:@"PayloadDisplayName"];
    }
    v30 = v10->_configurationDictionary;
    v95[0] = @"Enabled";
    v96[0] = objc_opt_class();
    v95[1] = @"VPNApplicationBundleID";
    v96[1] = objc_opt_class();
    v95[2] = @"VPNApplicationID";
    v96[2] = objc_opt_class();
    v95[3] = @"AppRules";
    v96[3] = objc_opt_class();
    v95[4] = @"PayloadCertificateHash";
    v96[4] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:5];
    id v86 = 0;
    v32 = [v8 MCMutableDictionaryContainingValidatedKeysAndClasses:v31 removeKeys:1 outError:&v86];
    id vpnType = v86;
    [(NSMutableDictionary *)v30 addEntriesFromDictionary:v32];

    if (vpnType) {
      goto LABEL_5;
    }
    if ([(NSString *)v10->_vpnType isEqualToString:@"AlwaysOn"])
    {
      uint64_t v33 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"UserDefinedName" isRequired:0 outError:0];
      v34 = v10->_serviceName;
      v10->_serviceName = (NSString *)v33;

      [(NSMutableDictionary *)v10->_configurationDictionary setObject:v10->_vpnType forKeyedSubscript:@"VPNType"];
      v35 = v10->_serviceName;
      if (v35) {
        [(NSMutableDictionary *)v10->_configurationDictionary setObject:v35 forKeyedSubscript:@"UserDefinedName"];
      }
      id v85 = 0;
      v36 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AlwaysOn" isRequired:1 outError:&v85];
      id vpnType = v85;
      if (!vpnType)
      {
        [(NSMutableDictionary *)v10->_configurationDictionary setObject:v36 forKeyedSubscript:@"AlwaysOn"];
        uint64_t v37 = +[MCVPNPayloadBase NEAlwaysOnVPNPayloadBaseDelegateWithConfigurationDict:v10->_configurationDictionary];
        nePayloadBase = v10->_nePayloadBase;
        v10->_nePayloadBase = (NEProfilePayloadBaseDelegate *)v37;

        uint64_t v39 = [(NEProfilePayloadBaseDelegate *)v10->_nePayloadBase validatePayload];
        if (v39)
        {
          v47 = (void *)v39;
          v48 = (void *)MEMORY[0x1E4F28C58];
          v49 = MCErrorArray(@"ERROR_VPN_COULD_NOT_PARSE", v40, v41, v42, v43, v44, v45, v46, 0);
          id vpnType = [v48 MCErrorWithDomain:@"MCVPNErrorDomain" code:15005 descriptionArray:v49 underlyingError:v47 errorType:@"MCFatalError"];
        }
        else
        {
          id vpnType = 0;
        }
      }
      goto LABEL_46;
    }
    v50 = v10->_configurationDictionary;
    v93[0] = @"VendorConfig";
    v94[0] = objc_opt_class();
    v93[1] = @"OverridePrimary";
    v94[1] = objc_opt_class();
    v93[2] = @"OnDemandEnabled";
    v94[2] = objc_opt_class();
    v93[3] = @"OnDemandMatchDomainsAlways";
    v94[3] = objc_opt_class();
    v93[4] = @"OnDemandMatchDomainsNever";
    v94[4] = objc_opt_class();
    v93[5] = @"OnDemandMatchDomainsOnRetry";
    v94[5] = objc_opt_class();
    v93[6] = @"OnDemandRules";
    v94[6] = objc_opt_class();
    v93[7] = @"IPv4";
    v94[7] = objc_opt_class();
    v93[8] = @"PPP";
    v94[8] = objc_opt_class();
    v93[9] = @"IPSec";
    v94[9] = objc_opt_class();
    v93[10] = @"IKEv2";
    v94[10] = objc_opt_class();
    v93[11] = @"Proxies";
    v94[11] = objc_opt_class();
    v93[12] = @"DNS";
    v94[12] = objc_opt_class();
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:13];
    id v84 = 0;
    v52 = [v8 MCMutableDictionaryContainingValidatedKeysAndClasses:v51 removeKeys:1 outError:&v84];
    id vpnType = v84;
    [(NSMutableDictionary *)v50 addEntriesFromDictionary:v52];

    if (vpnType) {
      goto LABEL_5;
    }
    [(NSMutableDictionary *)v10->_configurationDictionary setObject:v10->_vpnType forKeyedSubscript:@"VPNType"];
    id v83 = 0;
    uint64_t v53 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"UserDefinedName" isRequired:0 outError:&v83];
    id vpnType = v83;
    v54 = v10->_serviceName;
    v10->_serviceName = (NSString *)v53;

    if (vpnType)
    {
LABEL_5:
      v17 = [(MCPayload *)v10 malformedPayloadErrorWithError:vpnType];
      v18 = v17;
      if (a5) {
        *a5 = v17;
      }
      v19 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = objc_opt_class();
        id v22 = v21;
        v23 = [v18 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v90 = v21;
        __int16 v91 = 2114;
        v92 = v23;
        _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_10;
    }
    v55 = v10->_serviceName;
    if (v55) {
      [(NSMutableDictionary *)v10->_configurationDictionary setObject:v55 forKeyedSubscript:@"UserDefinedName"];
    }
    id v82 = 0;
    v56 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"VPN" isRequired:0 outError:&v82];
    id vpnType = v82;
    v36 = (void *)[v56 mutableCopy];

    if (vpnType)
    {
LABEL_46:

      if (!vpnType) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
    if (v36)
    {
      v57 = (void *)[v36 copy];
      [(NSMutableDictionary *)v10->_configurationDictionary setObject:v57 forKeyedSubscript:@"VPN"];
    }
    if ([(NSString *)v10->_vpnType isEqualToString:@"VPN"]
      || [(NSString *)v10->_vpnType isEqualToString:@"IKEv2"])
    {
      uint64_t v58 = [(NSString *)v10->_vpnType isEqualToString:@"VPN"];
      id v81 = 0;
      v59 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"VPNSubType" isRequired:v58 outError:&v81];
      id v60 = v81;
      if (v60)
      {
        id vpnType = v60;
LABEL_45:

        goto LABEL_46;
      }
      if (v59) {
        [(NSMutableDictionary *)v10->_configurationDictionary setObject:v59 forKeyedSubscript:@"VPNSubType"];
      }
      v61 = [(MCPayload *)v10 type];
      v62 = +[MCAppLayerVPNPayload typeStrings];
      v63 = [v62 firstObject];
      int v64 = [v61 isEqualToString:v63];

      if (v64)
      {
        id v80 = 0;
        uint64_t v65 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CellularSliceUUID" isRequired:0 outError:&v80];
        id vpnType = v80;
        CellularSliceUUID = v10->_CellularSliceUUID;
        v10->_CellularSliceUUID = (NSString *)v65;

        if (vpnType) {
          goto LABEL_45;
        }
        v67 = v10->_CellularSliceUUID;
        if (v67) {
          [(NSMutableDictionary *)v10->_configurationDictionary setObject:v67 forKeyedSubscript:@"CellularSliceUUID"];
        }
      }
    }
    uint64_t v68 = +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:v10->_configurationDictionary];
    v69 = v10->_nePayloadBase;
    v10->_nePayloadBase = (NEProfilePayloadBaseDelegate *)v68;

    id vpnType = [(NEProfilePayloadBaseDelegate *)v10->_nePayloadBase validatePayload];
    if (!vpnType) {
      goto LABEL_46;
    }
    v77 = (void *)MEMORY[0x1E4F28C58];
    v59 = MCErrorArray(@"ERROR_VPN_COULD_NOT_PARSE", v70, v71, v72, v73, v74, v75, v76, 0);
    uint64_t v78 = [v77 MCErrorWithDomain:@"MCVPNErrorDomain" code:15005 descriptionArray:v59 underlyingError:vpnType errorType:@"MCFatalError"];
    v79 = vpnType;
    id vpnType = (id)v78;

    goto LABEL_45;
  }
LABEL_11:

  return v10;
}

- (id)stubDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)MCVPNPayloadBase;
  id v3 = [(MCPayload *)&v9 stubDictionary];
  v4 = [(MCVPNPayloadBase *)self serviceName];

  if (v4)
  {
    v5 = [(MCVPNPayloadBase *)self serviceName];
    [v3 setObject:v5 forKeyedSubscript:@"ServiceName"];
  }
  v6 = [(MCVPNPayloadBase *)self vpnType];

  if (v6)
  {
    v7 = [(MCVPNPayloadBase *)self vpnType];
    [v3 setObject:v7 forKeyedSubscript:@"VPNType"];
  }
  return v3;
}

- (id)verboseDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v13.receiver = self;
  v13.super_class = (Class)MCVPNPayloadBase;
  v4 = [(MCPayload *)&v13 verboseDescription];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  v6 = [(MCVPNPayloadBase *)self serviceName];

  if (v6)
  {
    v7 = [(MCVPNPayloadBase *)self serviceName];
    [v5 appendFormat:@"Service name: %@\n", v7];
  }
  id v8 = [(MCVPNPayloadBase *)self vpnType];

  if (v8)
  {
    objc_super v9 = [(MCVPNPayloadBase *)self vpnType];
    [v5 appendFormat:@"VPN Type: %@\n", v9];
  }
  v10 = [(MCPayload *)self persistentResourceID];

  if (v10)
  {
    uint64_t v11 = [(MCPayload *)self persistentResourceID];
    [v5 appendFormat:@"  ConfigID : %@\n", v11];
  }
  return v5;
}

- (id)installationWarnings
{
  id v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_VPN");
  v4 = [(MCVPNPayloadBase *)self vpnType];
  int v5 = [v4 isEqualToString:@"PPTP"];

  if (v5)
  {
    v6 = MCLocalizedString(@"INSTALL_WARNING_PPTP_VPN");
    id v7 = [NSString stringWithFormat:@"%@\n\n%@", v3, v6];
  }
  else
  {
    id v7 = v3;
  }
  id v8 = MCLocalizedString(@"INSTALL_WARNING_VPN_TITLE");
  objc_super v9 = +[MCProfileWarning warningWithLocalizedTitle:v8 localizedBody:v7 isLongForm:1];

  v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v9];

  return v10;
}

- (id)payloadDescriptionKeyValueSections
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = [(MCVPNPayloadBase *)self serviceName];

  if (v4)
  {
    int v5 = [MCKeyValue alloc];
    v6 = [(MCVPNPayloadBase *)self serviceName];
    id v7 = MCLocalizedString(@"KEY_VPN_NAME");
    id v8 = [(MCKeyValue *)v5 initWithLocalizedString:v6 localizedKey:v7];

    [v3 addObject:v8];
  }
  objc_super v9 = [(MCVPNPayloadBase *)self vpnType];

  if (v9)
  {
    v10 = [MCKeyValue alloc];
    uint64_t v11 = [(MCVPNPayloadBase *)self vpnType];
    v12 = MCLocalizedString(@"KEY_VPN_TYPE");
    objc_super v13 = [(MCKeyValue *)v10 initWithLocalizedString:v11 localizedKey:v12];

    [v3 addObject:v13];
  }
  if ([v3 count]
    && (+[MCKeyValueSection sectionWithKeyValues:v3],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v15 = (void *)v14;
    v18[0] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSMutableDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (void)setConfigurationDictionary:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)vpnType
{
  return self->_vpnType;
}

- (void)setVpnType:(id)a3
{
}

- (NEProfilePayloadBaseDelegate)nePayloadBase
{
  return self->_nePayloadBase;
}

- (void)setNePayloadBase:(id)a3
{
}

- (NSString)userNameKey
{
  return self->_userNameKey;
}

- (void)setUserNameKey:(id)a3
{
}

- (NSString)passwordKey
{
  return self->_passwordKey;
}

- (void)setPasswordKey:(id)a3
{
}

- (NSString)proxyUserNameKey
{
  return self->_proxyUserNameKey;
}

- (void)setProxyUserNameKey:(id)a3
{
}

- (NSString)proxyPasswordKey
{
  return self->_proxyPasswordKey;
}

- (void)setProxyPasswordKey:(id)a3
{
}

- (NSString)sharedSecretKey
{
  return self->_sharedSecretKey;
}

- (void)setSharedSecretKey:(id)a3
{
}

- (NSString)pinKey
{
  return self->_pinKey;
}

- (void)setPinKey:(id)a3
{
}

- (NSString)CellularSliceUUID
{
  return self->_CellularSliceUUID;
}

- (void)setCellularSliceUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_pinKey, 0);
  objc_storeStrong((id *)&self->_sharedSecretKey, 0);
  objc_storeStrong((id *)&self->_proxyPasswordKey, 0);
  objc_storeStrong((id *)&self->_proxyUserNameKey, 0);
  objc_storeStrong((id *)&self->_passwordKey, 0);
  objc_storeStrong((id *)&self->_userNameKey, 0);
  objc_storeStrong((id *)&self->_nePayloadBase, 0);
  objc_storeStrong((id *)&self->_vpnType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
}

@end