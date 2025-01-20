@interface NEHotspotConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)hidden;
- (BOOL)isAccessory;
- (BOOL)joinOnce;
- (BOOL)useSSIDPrefix;
- (NEHotspotConfiguration)init;
- (NEHotspotConfiguration)initWithCoder:(id)a3;
- (NEHotspotConfiguration)initWithHS20Settings:(NEHotspotHS20Settings *)hs20Settings eapSettings:(NEHotspotEAPSettings *)eapSettings;
- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID;
- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID eapSettings:(NEHotspotEAPSettings *)eapSettings;
- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP;
- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix;
- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP;
- (NEHotspotEAPSettings)eapSettings;
- (NEHotspotHS20Settings)hs20Settings;
- (NSNumber)lifeTimeInDays;
- (NSString)SSID;
- (NSString)SSIDPrefix;
- (NSString)passphrase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)securityType;
- (int64_t)validate;
- (uint64_t)validateEAPSettings;
- (void)encodeWithCoder:(id)a3;
- (void)setEapSettings:(id)a3;
- (void)setHidden:(BOOL)hidden;
- (void)setHs20Settings:(id)a3;
- (void)setIsAccessory:(BOOL)a3;
- (void)setJoinOnce:(BOOL)joinOnce;
- (void)setLifeTimeInDays:(NSNumber *)lifeTimeInDays;
- (void)setPassphrase:(id)a3;
- (void)setSecurityType:(int64_t)a3;
- (void)setUseSSIDPrefix:(BOOL)a3;
@end

@implementation NEHotspotConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hs20Settings, 0);
  objc_storeStrong((id *)&self->_eapSettings, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_lifeTimeInDays, 0);
  objc_storeStrong((id *)&self->_SSIDPrefix, 0);

  objc_storeStrong((id *)&self->_SSID, 0);
}

- (void)setIsAccessory:(BOOL)a3
{
  self->_isAccessory = a3;
}

- (BOOL)isAccessory
{
  return self->_isAccessory;
}

- (void)setUseSSIDPrefix:(BOOL)a3
{
  self->_useSSIDPrefix = a3;
}

- (BOOL)useSSIDPrefix
{
  return self->_useSSIDPrefix;
}

- (void)setHs20Settings:(id)a3
{
}

- (NEHotspotHS20Settings)hs20Settings
{
  return (NEHotspotHS20Settings *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEapSettings:(id)a3
{
}

- (NEHotspotEAPSettings)eapSettings
{
  return (NEHotspotEAPSettings *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPassphrase:(id)a3
{
}

- (NSString)passphrase
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSecurityType:(int64_t)a3
{
  self->_securityType = a3;
}

- (int64_t)securityType
{
  return self->_securityType;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setLifeTimeInDays:(NSNumber *)lifeTimeInDays
{
}

- (NSNumber)lifeTimeInDays
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setJoinOnce:(BOOL)joinOnce
{
  self->_joinOnce = joinOnce;
}

- (BOOL)joinOnce
{
  return self->_joinOnce;
}

- (NSString)SSIDPrefix
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)validate
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(NEHotspotConfiguration *)self useSSIDPrefix];
  if (v5
    || ([(NEHotspotConfiguration *)self SSID],
        v2 = objc_claimAutoreleasedReturnValue(),
        ![v2 length]))
  {
    int v6 = 0;
    BOOL v7 = 0;
    if (![(NEHotspotConfiguration *)self useSSIDPrefix]) {
      goto LABEL_12;
    }
  }
  else
  {
    v3 = [(NEHotspotConfiguration *)self SSID];
    if ((unint64_t)[v3 length] <= 0x20)
    {

      goto LABEL_16;
    }
    if (![(NEHotspotConfiguration *)self useSSIDPrefix])
    {

      goto LABEL_37;
    }
    int v6 = 1;
  }
  v8 = [(NEHotspotConfiguration *)self SSIDPrefix];
  if (![v8 length])
  {

    BOOL v7 = 0;
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v9 = [(NEHotspotConfiguration *)self SSIDPrefix];
  if ((unint64_t)[v9 length] >= 3)
  {
    v10 = [(NEHotspotConfiguration *)self SSIDPrefix];
    BOOL v7 = (unint64_t)[v10 length] < 0x21;

    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:

    goto LABEL_12;
  }

  BOOL v7 = 0;
  if (v6) {
    goto LABEL_11;
  }
LABEL_12:
  if (v5)
  {
    if (!v7)
    {
LABEL_37:
      if ([(NEHotspotConfiguration *)self securityType] != 4)
      {
        int64_t v25 = [(NEHotspotConfiguration *)self securityType];
        if (v25 != 4)
        {
          if (v25 == 3) {
            return 101;
          }
          if ([(NEHotspotConfiguration *)self useSSIDPrefix]) {
            return 110;
          }
          return 101;
        }
        return 106;
      }
      if ([(NEHotspotConfiguration *)self joinOnce])
      {
        v21 = ne_log_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v102 = (id)objc_opt_class();
          id v22 = v102;
          v23 = "%@ JoinOnce is not supported for Hotspot 2.0 Wi-Fi networks.";
          goto LABEL_85;
        }
LABEL_40:

        return 109;
      }
      uint64_t v26 = [(NEHotspotConfiguration *)self hs20Settings];
      if (v26)
      {
        v27 = (void *)v26;
        v28 = [(NEHotspotConfiguration *)self hs20Settings];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = [(NEHotspotConfiguration *)self hs20Settings];
          v30 = [v29 domainName];
          if ([v30 length])
          {
            v31 = [(NEHotspotConfiguration *)self hs20Settings];
            v32 = [v31 domainName];
            unint64_t v33 = [v32 length];

            if (v33 <= 0x80)
            {
              uint64_t v34 = [(NEHotspotConfiguration *)self eapSettings];
              if (v34)
              {
                v35 = (void *)v34;
                v36 = [(NEHotspotConfiguration *)self eapSettings];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  char v37 = -[NEHotspotConfiguration validateEAPSettings]((uint64_t)self);

                  if (v37)
                  {
                    v38 = [(NEHotspotConfiguration *)self hs20Settings];
                    int v39 = [v38 isRoamingEnabled];

                    if (v39)
                    {
                      v40 = [(NEHotspotConfiguration *)self hs20Settings];
                      v41 = [v40 roamingConsortiumOIs];
                      if ([v41 count])
                      {
                      }
                      else
                      {
                        v63 = [(NEHotspotConfiguration *)self hs20Settings];
                        v64 = [v63 naiRealmNames];
                        uint64_t v65 = [v64 count];

                        if (!v65)
                        {
                          v87 = ne_log_obj();
                          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            id v102 = (id)objc_opt_class();
                            id v91 = v102;
                            _os_log_error_impl(&dword_19DDAF000, v87, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 configuration(roaming consortium OIs/NAI realms not provided).", buf, 0xCu);
                          }
                          return 105;
                        }
                      }
                    }
                    v66 = [(NEHotspotConfiguration *)self hs20Settings];
                    v67 = [v66 MCCAndMNCs];
                    uint64_t v68 = [v67 count];

                    if (!v68) {
                      goto LABEL_78;
                    }
                    long long v98 = 0u;
                    long long v99 = 0u;
                    long long v96 = 0u;
                    long long v97 = 0u;
                    v69 = [(NEHotspotConfiguration *)self hs20Settings];
                    v70 = [v69 MCCAndMNCs];

                    uint64_t v71 = [v70 countByEnumeratingWithState:&v96 objects:v100 count:16];
                    if (!v71)
                    {
LABEL_114:

                      goto LABEL_78;
                    }
                    uint64_t v72 = v71;
                    uint64_t v73 = *(void *)v97;
                    unint64_t v74 = 0x1E4F29000uLL;
                    unint64_t v75 = 0x1E4F28000uLL;
                    uint64_t v94 = *(void *)v97;
                    v95 = v70;
                    while (1)
                    {
                      uint64_t v76 = 0;
LABEL_99:
                      if (*(void *)v97 != v73) {
                        objc_enumerationMutation(v70);
                      }
                      v77 = *(void **)(*((void *)&v96 + 1) + 8 * v76);
                      unint64_t v78 = v74;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0 || [v77 length] != 6) {
                        break;
                      }
                      unint64_t v79 = v75;
                      v80 = [*(id *)(v75 + 2952) characterSetWithCharactersInString:@"0123456789"];
                      for (uint64_t i = 0; i != 6; ++i)
                      {
                        uint64_t v82 = objc_msgSend(v77, "characterAtIndex:", i, v94);
                        char v83 = [v80 characterIsMember:v82];
                        if (i == 3)
                        {
                          if (v82 == 70) {
                            char v84 = 1;
                          }
                          else {
                            char v84 = v83;
                          }
                          if ((v84 & 1) == 0)
                          {
                            v85 = ne_log_obj();
                            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                            {
LABEL_126:
                              v89 = objc_opt_class();
                              *(_DWORD *)buf = 138412290;
                              id v102 = v89;
                              id v90 = v89;
                              _os_log_error_impl(&dword_19DDAF000, v85, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 configuration.", buf, 0xCu);
                            }
LABEL_118:

                            return 105;
                          }
                        }
                        else if ((v83 & 1) == 0)
                        {
                          v85 = ne_log_obj();
                          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_126;
                          }
                          goto LABEL_118;
                        }
                      }

                      ++v76;
                      unint64_t v74 = v78;
                      uint64_t v73 = v94;
                      v70 = v95;
                      unint64_t v75 = v79;
                      if (v76 != v72) {
                        goto LABEL_99;
                      }
                      uint64_t v72 = [v95 countByEnumeratingWithState:&v96 objects:v100 count:16];
                      if (!v72) {
                        goto LABEL_114;
                      }
                    }
                    v88 = ne_log_obj();
                    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                    {
                      v92 = objc_opt_class();
                      *(_DWORD *)buf = 138412290;
                      id v102 = v92;
                      id v93 = v92;
                      _os_log_error_impl(&dword_19DDAF000, v88, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 configuration.", buf, 0xCu);
                    }
                    return 105;
                  }
                }
                else
                {
                }
              }
              v58 = ne_log_obj();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v102 = (id)objc_opt_class();
                id v59 = v102;
                v60 = "%@ invalid HS2.0 EAP settings.";
                goto LABEL_93;
              }
LABEL_91:

              return 104;
            }
            goto LABEL_73;
          }
        }
      }
LABEL_73:
      v48 = ne_log_obj();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v102 = (id)objc_opt_class();
        id v61 = v102;
        _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 domain name.", buf, 0xCu);
      }
      return 106;
    }
  }
  else
  {

    if (!v7) {
      goto LABEL_37;
    }
  }
LABEL_16:
  if (![(NEHotspotConfiguration *)self securityType]) {
    goto LABEL_78;
  }
  if ([(NEHotspotConfiguration *)self securityType] == 2)
  {
    v11 = [(NEHotspotConfiguration *)self passphrase];
    if ([v11 length])
    {
      v12 = [(NEHotspotConfiguration *)self passphrase];
      if ((unint64_t)[v12 length] > 7)
      {
        v13 = [(NEHotspotConfiguration *)self passphrase];
        unint64_t v14 = [v13 length];

        if (v14 < 0x40) {
          goto LABEL_78;
        }
        goto LABEL_59;
      }
    }
LABEL_59:
    v42 = ne_log_obj();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v102 = (id)objc_opt_class();
      id v57 = v102;
      _os_log_error_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_ERROR, "%@ invalid WPA/WPA2 passphrase length.", buf, 0xCu);
    }
    return 102;
  }
  if ([(NEHotspotConfiguration *)self securityType] != 1)
  {
    if ([(NEHotspotConfiguration *)self securityType] != 3) {
      goto LABEL_78;
    }
    if ([(NEHotspotConfiguration *)self joinOnce])
    {
      v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v102 = (id)objc_opt_class();
        id v22 = v102;
        v23 = "%@ JoinOnce is not supported for Enterprise Wi-Fi networks.";
LABEL_85:
        _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

        goto LABEL_40;
      }
      goto LABEL_40;
    }
    uint64_t v43 = [(NEHotspotConfiguration *)self eapSettings];
    if (v43)
    {
      v44 = (void *)v43;
      v45 = [(NEHotspotConfiguration *)self eapSettings];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v46 = -[NEHotspotConfiguration validateEAPSettings]((uint64_t)self);

        if (v46) {
          goto LABEL_78;
        }
      }
      else
      {
      }
    }
    v58 = ne_log_obj();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v102 = (id)objc_opt_class();
      id v59 = v102;
      v60 = "%@ invalid EAP settings.";
LABEL_93:
      _os_log_error_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_ERROR, v60, buf, 0xCu);

      goto LABEL_91;
    }
    goto LABEL_91;
  }
  v15 = [(NEHotspotConfiguration *)self passphrase];
  if ([v15 length] && self)
  {
    v16 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
    v17 = [v16 invertedSet];

    v18 = [(NEHotspotConfiguration *)self passphrase];
    uint64_t v19 = [v18 rangeOfCharacterFromSet:v17];

    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = [(NEHotspotConfiguration *)self passphrase];
      if ([v20 length] == 10)
      {

        goto LABEL_78;
      }
      v49 = [(NEHotspotConfiguration *)self passphrase];
      uint64_t v50 = [v49 length];

      if (v50 == 26)
      {
LABEL_78:
        uint64_t v51 = [(NEHotspotConfiguration *)self lifeTimeInDays];
        if (v51)
        {
          v52 = (void *)v51;
          v53 = [(NEHotspotConfiguration *)self lifeTimeInDays];
          if ((int)[v53 intValue] >= 366)
          {

LABEL_82:
            lifeTimeInDays = self->_lifeTimeInDays;
            self->_lifeTimeInDays = 0;

            return 100;
          }
          v54 = [(NEHotspotConfiguration *)self lifeTimeInDays];
          int v55 = [v54 intValue];

          if (v55 <= 0) {
            goto LABEL_82;
          }
        }
        return 100;
      }
      goto LABEL_68;
    }
  }
LABEL_68:
  v47 = ne_log_obj();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v102 = (id)objc_opt_class();
    id v62 = v102;
    _os_log_error_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_ERROR, "%@ invalid WEP passphrase length.", buf, 0xCu);
  }
  return 103;
}

- (uint64_t)validateEAPSettings
{
  uint64_t v1 = a1;
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v1;
  }
  unint64_t v2 = 0x1E4F1C000uLL;
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF08D018, &unk_1EF08D030, &unk_1EF08D048, &unk_1EF08D060, 0);
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  v4 = [(id)v1 eapSettings];
  BOOL v5 = [v4 supportedEAPTypes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v156 objects:v167 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v157;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v157 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v156 + 1) + 8 * i);
        if (([v3 containsObject:v10] & 1) == 0)
        {
          v13 = ne_log_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v64 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v170 = v64;
            __int16 v171 = 2112;
            uint64_t v172 = v10;
            id v65 = v64;
            _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "%@ invalid EAP type %@", buf, 0x16u);
          }
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v156 objects:v167 count:16];
    }
    while (v7);
  }

  v11 = [(id)v1 eapSettings];
  v12 = [v11 supportedEAPTypes];
  if ([v12 containsObject:&unk_1EF08D018])
  {
  }
  else
  {
    unint64_t v14 = [(id)v1 eapSettings];
    int v15 = [v14 isTLSClientCertificateRequired];

    if (!v15) {
      goto LABEL_42;
    }
  }
  v16 = [(id)v1 eapSettings];
  v17 = [v16 identityReference];

  if (!v17)
  {
    BOOL v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    v58 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v58;
    id v56 = v58;
    id v57 = "%@ identity not provided";
    goto LABEL_89;
  }
  v18 = [(id)v1 eapSettings];
  uint64_t v19 = [v18 clientTrustChainReference];

  CFTypeRef result = 0;
  v20 = [(id)v1 eapSettings];
  v21 = [v20 identityReference];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_49;
  }
  id v22 = [(id)v1 eapSettings];
  v23 = [v22 identityReference];
  uint64_t v24 = [v23 length];

  if (!v24)
  {
LABEL_49:
    id v59 = ne_log_obj();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v107 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v107;
      id v108 = v107;
      _os_log_error_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_ERROR, "%@ configuration with EAP-TLS type must have identity reference.", buf, 0xCu);
    }
    v30 = 0;
    goto LABEL_52;
  }
  int64_t v25 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v26 = [(id)v1 eapSettings];
  v27 = [v26 identityReference];
  uint64_t v28 = *MEMORY[0x1E4F1CFD0];
  uint64_t v29 = *MEMORY[0x1E4F3B978];
  uint64_t v154 = *MEMORY[0x1E4F3BC80];
  obuint64_t j = (id)*MEMORY[0x1E4F3BD40];
  v30 = objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x1E4F3BD40], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F3BC80], *MEMORY[0x1E4F3B990], *MEMORY[0x1E4F3B978], 0);

  if (SecItemCopyMatching((CFDictionaryRef)v30, &result) || !result)
  {
    id v59 = ne_log_obj();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v85 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v85;
      id v86 = v85;
      v87 = "%@ failed to find the identity item in the keychain.";
LABEL_87:
      _os_log_error_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_ERROR, v87, buf, 0xCu);
    }
LABEL_52:

    BOOL v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    v106 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v106;
    id v56 = v106;
    id v57 = "%@ invalid identity reference";
    goto LABEL_89;
  }
  CFTypeID v31 = CFGetTypeID(result);
  if (v31 != SecIdentityGetTypeID())
  {
    id v59 = ne_log_obj();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v105 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v105;
      id v86 = v105;
      v87 = "%@ failed to find valid identity item in the keychain.";
      goto LABEL_87;
    }
    goto LABEL_52;
  }
  if (v19) {
    goto LABEL_23;
  }
  v110 = (__SecIdentity *)result;
  certificateRef[0] = 0;
  *(void *)trust = 0;
  int v161 = 0;
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  if (BasicX509)
  {
    SecPolicyRef v112 = BasicX509;
    if (SecIdentityCopyCertificate(v110, certificateRef) || !certificateRef[0])
    {
      v115 = ne_log_obj();
      if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
        goto LABEL_149;
      }
      v129 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v129;
      id v117 = v129;
      v118 = "%@ SecIdentityCopyCertificate() failed";
    }
    else
    {
      CFArrayRef v113 = CFArrayCreate(0, (const void **)certificateRef, 1, MEMORY[0x1E4F1D510]);
      CFRelease(certificateRef[0]);
      if (v113)
      {
        OSStatus v114 = SecTrustCreateWithCertificates(v113, v112, (SecTrustRef *)trust);
        CFRelease(v113);
        if (v114)
        {
          v115 = ne_log_obj();
          unint64_t v2 = 0x1E4F1C000;
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
            goto LABEL_149;
          }
          v116 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v170 = v116;
          id v117 = v116;
          v118 = "%@ SecTrustCreateWithCertificates() failed";
        }
        else if (MEMORY[0x19F3B7080](*(void *)trust, &v161))
        {
          v115 = ne_log_obj();
          unint64_t v2 = 0x1E4F1C000;
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
            goto LABEL_149;
          }
          v135 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v170 = v135;
          id v117 = v135;
          v118 = "%@ SecTrustEvaluate() failed";
        }
        else
        {
          CFIndex CertificateCount = SecTrustGetCertificateCount(*(SecTrustRef *)trust);
          if (CertificateCount > 1)
          {
            v115 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v28, *MEMORY[0x1E4F3BC78], *MEMORY[0x1E4F3B980], v29, 0);
            id v153 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v151 = *MEMORY[0x1E4F3BD48];
            CFIndex v146 = 1;
            while (1)
            {
              CFTypeRef cf = 0;
              [v115 setObject:SecTrustGetCertificateAtIndex(*(SecTrustRef *)trust, v146) forKeyedSubscript:v151];
              if (SecItemCopyMatching((CFDictionaryRef)v115, &cf)) {
                break;
              }
              [v153 addObject:cf];
              CFRelease(cf);
              if (CertificateCount == ++v146)
              {
                v147 = [(id)v1 eapSettings];
                [v147 setClientTrustChainReference:v153];
                goto LABEL_147;
              }
            }
            v147 = ne_log_obj();
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            {
              v149 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v170 = v149;
              id v150 = v149;
              _os_log_error_impl(&dword_19DDAF000, v147, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching() failed", buf, 0xCu);
            }
LABEL_147:

            goto LABEL_148;
          }
          v115 = ne_log_obj();
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          {
LABEL_148:
            unint64_t v2 = 0x1E4F1C000;
LABEL_149:

            CFRelease(v112);
            if (*(void *)trust) {
              CFRelease(*(CFTypeRef *)trust);
            }
            goto LABEL_23;
          }
          v143 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v170 = v143;
          id v117 = v143;
          v118 = "%@ failed to find the trust chain for the client certificate";
        }
      }
      else
      {
        v115 = ne_log_obj();
        if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
          goto LABEL_149;
        }
        v130 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v170 = v130;
        id v117 = v130;
        v118 = "%@ failed to allocate certificate array";
      }
    }
    _os_log_error_impl(&dword_19DDAF000, v115, OS_LOG_TYPE_ERROR, v118, buf, 0xCu);

    goto LABEL_148;
  }
  v128 = ne_log_obj();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
  {
    v144 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v144;
    id v145 = v144;
    _os_log_error_impl(&dword_19DDAF000, v128, OS_LOG_TYPE_ERROR, "%@ SecPolicyCreateBasicX509 failed", buf, 0xCu);
  }
LABEL_23:
  if (result) {
    CFRelease(result);
  }

  if (!v19) {
    goto LABEL_41;
  }
  v32 = [(id)v1 eapSettings];
  unint64_t v33 = [v32 clientTrustChainReference];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_101;
  }
  uint64_t v34 = [(id)v1 eapSettings];
  v35 = [v34 clientTrustChainReference];
  uint64_t v36 = [v35 count];

  if (!v36)
  {
LABEL_101:
    char v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v119 = objc_opt_class();
      *(_DWORD *)trust = 138412290;
      *(void *)&trust[4] = v119;
      id v120 = v119;
      _os_log_error_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_ERROR, "%@ invalid client trust chain", trust, 0xCu);
    }
LABEL_133:

    BOOL v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    v141 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v141;
    id v56 = v141;
    id v57 = "%@ invalid client trust chain";
    goto LABEL_89;
  }
  char v37 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v28, v154, *MEMORY[0x1E4F3B980], v29, 0);
  *(_OWORD *)certificateRef = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  v38 = [(id)v1 eapSettings];
  int v39 = [v38 clientTrustChainReference];

  uint64_t v40 = [v39 countByEnumeratingWithState:certificateRef objects:buf count:16];
  if (!v40) {
    goto LABEL_40;
  }
  uint64_t v41 = v40;
  uint64_t v42 = *(void *)v164;
  while (2)
  {
    for (uint64_t j = 0; j != v41; ++j)
    {
      if (*(void *)v164 != v42) {
        objc_enumerationMutation(v39);
      }
      v44 = (void *)*((void *)certificateRef[1] + j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v44 length]) {
        goto LABEL_132;
      }
      CFTypeRef cf = 0;
      [v37 setObject:v44 forKeyedSubscript:obj];
      if (SecItemCopyMatching((CFDictionaryRef)v37, &cf))
      {
        v136 = ne_log_obj();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        {
          v137 = objc_opt_class();
          *(_DWORD *)trust = 138412290;
          *(void *)&trust[4] = v137;
          id v138 = v137;
          v139 = "%@ failed to find the certificate item in the keychain.";
          goto LABEL_152;
        }
LABEL_131:

LABEL_132:
        goto LABEL_133;
      }
      if (!cf)
      {
        v136 = ne_log_obj();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        {
          v140 = objc_opt_class();
          *(_DWORD *)trust = 138412290;
          *(void *)&trust[4] = v140;
          id v138 = v140;
          v139 = "%@ found nil certificate item in the keychain.";
          goto LABEL_152;
        }
        goto LABEL_131;
      }
      CFTypeID v45 = CFGetTypeID(cf);
      CFTypeID TypeID = SecCertificateGetTypeID();
      CFRelease(cf);
      if (v45 != TypeID)
      {
        v136 = ne_log_obj();
        if (!os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
          goto LABEL_131;
        }
        v148 = objc_opt_class();
        *(_DWORD *)trust = 138412290;
        *(void *)&trust[4] = v148;
        id v138 = v148;
        v139 = "%@ failed to find valid certificate item in the keychain.";
LABEL_152:
        _os_log_error_impl(&dword_19DDAF000, v136, OS_LOG_TYPE_ERROR, v139, trust, 0xCu);

        goto LABEL_131;
      }
    }
    uint64_t v41 = [v39 countByEnumeratingWithState:certificateRef objects:buf count:16];
    if (v41) {
      continue;
    }
    break;
  }
LABEL_40:

  unint64_t v2 = 0x1E4F1C000;
LABEL_41:
  v47 = [(id)v1 eapSettings];
  [v47 setTlsClientCertificateRequired:1];

LABEL_42:
  v48 = [(id)v1 eapSettings];
  v49 = [v48 trustedServerCertificateReferences];
  uint64_t v50 = [v49 count];

  uint64_t v51 = [(id)v1 eapSettings];
  v52 = v51;
  if (!v50)
  {
    id v61 = [v51 trustedServerNames];
    uint64_t v62 = [v61 count];

    if (!v62)
    {
      BOOL v5 = ne_log_obj();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      v63 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v63;
      id v56 = v63;
      id v57 = "%@ EAP settings must have either trusted server certificates or trusted server names configured.";
      goto LABEL_89;
    }
    goto LABEL_72;
  }
  v53 = [v51 trustedServerCertificateReferences];
  unint64_t v54 = [v53 count];

  if (v54 < 0xB)
  {
    v66 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F3BC80], *MEMORY[0x1E4F3B980], *MEMORY[0x1E4F3B978], 0);
    *(_OWORD *)certificateRef = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    v67 = [(id)v1 eapSettings];
    uint64_t v68 = [v67 trustedServerCertificateReferences];

    uint64_t v69 = [v68 countByEnumeratingWithState:certificateRef objects:buf count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v164;
      uint64_t v72 = *MEMORY[0x1E4F3BD40];
LABEL_61:
      uint64_t v73 = 0;
      while (1)
      {
        if (*(void *)v164 != v71) {
          objc_enumerationMutation(v68);
        }
        unint64_t v74 = (void *)*((void *)certificateRef[1] + v73);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ![v74 length]) {
          break;
        }
        CFTypeRef cf = 0;
        [v66 setObject:v74 forKeyedSubscript:v72];
        if (SecItemCopyMatching((CFDictionaryRef)v66, &cf))
        {
          v121 = ne_log_obj();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            v122 = objc_opt_class();
            *(_DWORD *)trust = 138412290;
            *(void *)&trust[4] = v122;
            id v123 = v122;
            v124 = "%@ failed to find the certificate item in the keychain.";
            goto LABEL_136;
          }
LABEL_108:

          break;
        }
        if (!cf)
        {
          v121 = ne_log_obj();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            v125 = objc_opt_class();
            *(_DWORD *)trust = 138412290;
            *(void *)&trust[4] = v125;
            id v123 = v125;
            v124 = "%@ found nil certificate item in the keychain.";
            goto LABEL_136;
          }
          goto LABEL_108;
        }
        CFTypeID v75 = CFGetTypeID(cf);
        CFTypeID v76 = SecCertificateGetTypeID();
        CFRelease(cf);
        if (v75 != v76)
        {
          v121 = ne_log_obj();
          if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
            goto LABEL_108;
          }
          v142 = objc_opt_class();
          *(_DWORD *)trust = 138412290;
          *(void *)&trust[4] = v142;
          id v123 = v142;
          v124 = "%@ failed to find valid certificate item in the keychain.";
LABEL_136:
          _os_log_error_impl(&dword_19DDAF000, v121, OS_LOG_TYPE_ERROR, v124, trust, 0xCu);

          goto LABEL_108;
        }
        if (v70 == ++v73)
        {
          uint64_t v70 = [v68 countByEnumeratingWithState:certificateRef objects:buf count:16];
          if (v70) {
            goto LABEL_61;
          }
          goto LABEL_71;
        }
      }

      BOOL v5 = ne_log_obj();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      v126 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v126;
      id v56 = v126;
      id v57 = "%@ invalid trusted server certificate references";
      goto LABEL_89;
    }
LABEL_71:

    unint64_t v2 = 0x1E4F1C000uLL;
LABEL_72:
    v77 = [(id)v1 eapSettings];
    unint64_t v78 = [v77 supportedEAPTypes];
    char v79 = [v78 containsObject:&unk_1EF08D018];

    if (v79) {
      goto LABEL_73;
    }
    v88 = [(id)v1 eapSettings];
    v89 = [v88 username];
    if ([v89 length])
    {
      id v90 = [(id)v1 eapSettings];
      id v91 = [v90 username];
      unint64_t v92 = [v91 length];

      if (v92 < 0xFE)
      {
        id v93 = [(id)v1 eapSettings];
        uint64_t v94 = [v93 password];
        if ([v94 length])
        {
          v95 = [(id)v1 eapSettings];
          long long v96 = [v95 password];
          unint64_t v97 = [v96 length];

          if (v97 < 0x41)
          {
            long long v98 = [(id)v1 eapSettings];
            long long v99 = [v98 supportedEAPTypes];
            int v100 = [v99 containsObject:&unk_1EF08D030];

            if (v100)
            {
              BOOL v5 = objc_msgSend(*(id *)(v2 + 2768), "setWithObjects:", &unk_1EF08D078, &unk_1EF08D090, &unk_1EF08D0A8, &unk_1EF08D0C0, &unk_1EF08D0D8, 0);
              v101 = NSNumber;
              id v102 = [(id)v1 eapSettings];
              uint64_t v103 = objc_msgSend(v101, "numberWithInteger:", objc_msgSend(v102, "ttlsInnerAuthenticationType"));
              int v104 = [v5 containsObject:v103];

              if (!v104)
              {
                v13 = ne_log_obj();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  v131 = objc_opt_class();
                  id v132 = v131;
                  v133 = [(id)v1 eapSettings];
                  uint64_t v134 = [v133 ttlsInnerAuthenticationType];
                  *(_DWORD *)buf = 138412546;
                  v170 = v131;
                  __int16 v171 = 2048;
                  uint64_t v172 = v134;
                  _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "%@ invalid EAP type %ld", buf, 0x16u);
                }
LABEL_14:

                goto LABEL_53;
              }
            }
LABEL_73:
            BOOL v5 = objc_msgSend(*(id *)(v2 + 2768), "setWithObjects:", &unk_1EF08D078, &unk_1EF08D090, &unk_1EF08D0A8, 0);
            v80 = NSNumber;
            v81 = [(id)v1 eapSettings];
            uint64_t v82 = objc_msgSend(v80, "numberWithInteger:", objc_msgSend(v81, "preferredTLSVersion"));
            char v83 = [v5 containsObject:v82];

            if ((v83 & 1) == 0)
            {
              char v84 = [(id)v1 eapSettings];
              [v84 setPreferredTLSVersion:2];
            }
            uint64_t v1 = 1;
            goto LABEL_54;
          }
        }
        else
        {
        }
        BOOL v5 = ne_log_obj();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_53;
        }
        v127 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v170 = v127;
        id v56 = v127;
        id v57 = "%@ invalid password in EAP settings";
LABEL_89:
        _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, v57, buf, 0xCu);

        goto LABEL_53;
      }
    }
    else
    {
    }
    BOOL v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    v109 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v109;
    id v56 = v109;
    id v57 = "%@ invalid username in EAP settings";
    goto LABEL_89;
  }
  BOOL v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v55 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v55;
    id v56 = v55;
    id v57 = "%@ too many trusted server certificates";
    goto LABEL_89;
  }
LABEL_53:
  uint64_t v1 = 0;
LABEL_54:

  return v1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NEHotspotConfiguration *)self SSID];
  [v4 encodeObject:v5 forKey:@"SSID"];

  uint64_t v6 = [(NEHotspotConfiguration *)self SSIDPrefix];
  [v4 encodeObject:v6 forKey:@"SSIDPrefix"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"), @"UseSSIDPrefix");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEHotspotConfiguration securityType](self, "securityType"), @"SecurityType");
  uint64_t v7 = [(NEHotspotConfiguration *)self lifeTimeInDays];
  [v4 encodeObject:v7 forKey:@"LifeTimeInDays"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration joinOnce](self, "joinOnce"), @"JoinOnce");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration isAccessory](self, "isAccessory"), @"IsAccessory");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration hidden](self, "hidden"), @"hidden");
  uint64_t v8 = [(NEHotspotConfiguration *)self passphrase];
  [v4 encodeObject:v8 forKey:@"passphrase"];

  v9 = [(NEHotspotConfiguration *)self eapSettings];
  [v4 encodeObject:v9 forKey:@"EAPSettings"];

  id v10 = [(NEHotspotConfiguration *)self hs20Settings];
  [v4 encodeObject:v10 forKey:@"HSSettings"];
}

- (NEHotspotConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NEHotspotConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSID"];
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSIDPrefix"];
    SSIDPrefix = v5->_SSIDPrefix;
    v5->_SSIDPrefix = (NSString *)v8;

    v5->_useSSIDPrefix = [v4 decodeBoolForKey:@"UseSSIDPrefix"];
    v5->_securityType = [v4 decodeInt64ForKey:@"SecurityType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LifeTimeInDays"];
    lifeTimeInDays = v5->_lifeTimeInDays;
    v5->_lifeTimeInDays = (NSNumber *)v10;

    v5->_joinOnce = [v4 decodeBoolForKey:@"JoinOnce"];
    v5->_isAccessory = [v4 decodeBoolForKey:@"IsAccessory"];
    v5->_hidden = [v4 decodeBoolForKey:@"hidden"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passphrase"];
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EAPSettings"];
    eapSettings = v5->_eapSettings;
    v5->_eapSettings = (NEHotspotEAPSettings *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSSettings"];
    hs20Settings = v5->_hs20Settings;
    v5->_hs20Settings = (NEHotspotHS20Settings *)v16;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (![(NEHotspotConfiguration *)self securityType])
  {
    BOOL v13 = [(NEHotspotConfiguration *)self useSSIDPrefix];
    uint64_t v14 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    if (v13)
    {
      uint64_t v7 = [(NEHotspotConfiguration *)self SSIDPrefix];
      uint64_t v15 = [v14 initWithSSIDPrefix:v7];
    }
    else
    {
      uint64_t v7 = [(NEHotspotConfiguration *)self SSID];
      uint64_t v15 = [v14 initWithSSID:v7];
    }
    uint64_t v19 = (void *)v15;
    goto LABEL_20;
  }
  if ([(NEHotspotConfiguration *)self securityType] == 1)
  {
    BOOL v5 = [(NEHotspotConfiguration *)self useSSIDPrefix];
    uint64_t v6 = [(id)objc_opt_class() allocWithZone:a3];
    if (v5)
    {
      uint64_t v7 = [(NEHotspotConfiguration *)self SSIDPrefix];
      uint64_t v8 = [(NEHotspotConfiguration *)self passphrase];
      v9 = (void *)v6;
      uint64_t v10 = v7;
      v11 = v8;
      uint64_t v12 = 1;
LABEL_10:
      uint64_t v18 = [v9 initWithSSIDPrefix:v10 passphrase:v11 isWEP:v12];
LABEL_19:
      uint64_t v19 = (void *)v18;

LABEL_20:
      goto LABEL_21;
    }
    uint64_t v7 = [(NEHotspotConfiguration *)self SSID];
    uint64_t v8 = [(NEHotspotConfiguration *)self passphrase];
    v20 = (void *)v6;
    v21 = v7;
    id v22 = v8;
    uint64_t v23 = 1;
    goto LABEL_18;
  }
  if ([(NEHotspotConfiguration *)self securityType] == 2)
  {
    BOOL v16 = [(NEHotspotConfiguration *)self useSSIDPrefix];
    uint64_t v17 = [(id)objc_opt_class() allocWithZone:a3];
    if (v16)
    {
      uint64_t v7 = [(NEHotspotConfiguration *)self SSIDPrefix];
      uint64_t v8 = [(NEHotspotConfiguration *)self passphrase];
      v9 = (void *)v17;
      uint64_t v10 = v7;
      v11 = v8;
      uint64_t v12 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = [(NEHotspotConfiguration *)self SSID];
    uint64_t v8 = [(NEHotspotConfiguration *)self passphrase];
    v20 = (void *)v17;
    v21 = v7;
    id v22 = v8;
    uint64_t v23 = 0;
LABEL_18:
    uint64_t v18 = [v20 initWithSSID:v21 passphrase:v22 isWEP:v23];
    goto LABEL_19;
  }
  if ([(NEHotspotConfiguration *)self securityType] != 3)
  {
    if ([(NEHotspotConfiguration *)self securityType] != 4)
    {
      uint64_t v19 = 0;
      goto LABEL_21;
    }
    v27 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    uint64_t v7 = [(NEHotspotConfiguration *)self hs20Settings];
    uint64_t v8 = [(NEHotspotConfiguration *)self eapSettings];
    uint64_t v18 = [v27 initWithHS20Settings:v7 eapSettings:v8];
    goto LABEL_19;
  }
  uint64_t v19 = [(NEHotspotConfiguration *)self eapSettings];

  if (v19)
  {
    uint64_t v24 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    uint64_t v7 = [(NEHotspotConfiguration *)self SSID];
    uint64_t v8 = [(NEHotspotConfiguration *)self eapSettings];
    uint64_t v18 = [v24 initWithSSID:v7 eapSettings:v8];
    goto LABEL_19;
  }
LABEL_21:
  objc_msgSend(v19, "setUseSSIDPrefix:", -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"));
  objc_msgSend(v19, "setSecurityType:", -[NEHotspotConfiguration securityType](self, "securityType"));
  int64_t v25 = [(NEHotspotConfiguration *)self lifeTimeInDays];
  [v19 setLifeTimeInDays:v25];

  objc_msgSend(v19, "setJoinOnce:", -[NEHotspotConfiguration joinOnce](self, "joinOnce"));
  objc_msgSend(v19, "setHidden:", -[NEHotspotConfiguration hidden](self, "hidden"));
  return v19;
}

- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP
{
  BOOL v5 = isWEP;
  uint64_t v8 = SSIDPrefix;
  v9 = passphrase;
  v19.receiver = self;
  v19.super_class = (Class)NEHotspotConfiguration;
  uint64_t v10 = [(NEHotspotConfiguration *)&v19 init];
  v11 = v10;
  if (v10)
  {
    SSID = v10->_SSID;
    v10->_SSID = (NSString *)&stru_1EF054CB8;

    uint64_t v13 = [(NSString *)v8 copy];
    uint64_t v14 = v11->_SSIDPrefix;
    v11->_SSIDPrefix = (NSString *)v13;

    if (v5) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
    v11->_securityType = v15;
    uint64_t v16 = [(NSString *)v9 copy];
    uint64_t v17 = v11->_passphrase;
    v11->_passphrase = (NSString *)v16;

    v11->_useSSIDPrefix = 1;
  }

  return v11;
}

- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix
{
  id v4 = SSIDPrefix;
  v11.receiver = self;
  v11.super_class = (Class)NEHotspotConfiguration;
  BOOL v5 = [(NEHotspotConfiguration *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)&stru_1EF054CB8;

    uint64_t v8 = [(NSString *)v4 copy];
    v9 = v6->_SSIDPrefix;
    v6->_SSIDPrefix = (NSString *)v8;

    v6->_securityType = 0;
    v6->_useSSIDPrefix = 1;
  }

  return v6;
}

- (NEHotspotConfiguration)initWithHS20Settings:(NEHotspotHS20Settings *)hs20Settings eapSettings:(NEHotspotEAPSettings *)eapSettings
{
  uint64_t v6 = hs20Settings;
  uint64_t v7 = eapSettings;
  v17.receiver = self;
  v17.super_class = (Class)NEHotspotConfiguration;
  uint64_t v8 = [(NEHotspotConfiguration *)&v17 init];
  v9 = v8;
  if (v8)
  {
    SSID = v8->_SSID;
    v8->_SSID = (NSString *)&stru_1EF054CB8;

    v9->_securityType = 4;
    uint64_t v11 = [(NEHotspotEAPSettings *)v7 copy];
    uint64_t v12 = v9->_eapSettings;
    v9->_eapSettings = (NEHotspotEAPSettings *)v11;

    uint64_t v13 = v9->_eapSettings;
    if (v13)
    {
      [(NEHotspotEAPSettings *)v13 setPreferredTLSVersion:2];
      [(NEHotspotEAPSettings *)v9->_eapSettings setTlsClientCertificateRequired:0];
    }
    uint64_t v14 = [(NEHotspotHS20Settings *)v6 copy];
    uint64_t v15 = v9->_hs20Settings;
    v9->_hs20Settings = (NEHotspotHS20Settings *)v14;
  }
  return v9;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID eapSettings:(NEHotspotEAPSettings *)eapSettings
{
  uint64_t v6 = SSID;
  uint64_t v7 = eapSettings;
  v15.receiver = self;
  v15.super_class = (Class)NEHotspotConfiguration;
  uint64_t v8 = [(NEHotspotConfiguration *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    uint64_t v10 = v8->_SSID;
    v8->_SSID = (NSString *)v9;

    v8->_securityType = 3;
    uint64_t v11 = [(NEHotspotEAPSettings *)v7 copy];
    uint64_t v12 = v8->_eapSettings;
    v8->_eapSettings = (NEHotspotEAPSettings *)v11;

    uint64_t v13 = v8->_eapSettings;
    if (v13)
    {
      [(NEHotspotEAPSettings *)v13 setPreferredTLSVersion:2];
      [(NEHotspotEAPSettings *)v8->_eapSettings setTlsClientCertificateRequired:0];
    }
  }

  return v8;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP
{
  BOOL v5 = isWEP;
  uint64_t v8 = SSID;
  uint64_t v9 = passphrase;
  v18.receiver = self;
  v18.super_class = (Class)NEHotspotConfiguration;
  uint64_t v10 = [(NEHotspotConfiguration *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [(NSString *)v8 copy];
    uint64_t v12 = v10->_SSID;
    v10->_SSID = (NSString *)v11;

    SSIDPrefix = v10->_SSIDPrefix;
    v10->_SSIDPrefix = (NSString *)&stru_1EF054CB8;

    uint64_t v14 = 1;
    if (!v5) {
      uint64_t v14 = 2;
    }
    v10->_securityType = v14;
    uint64_t v15 = [(NSString *)v9 copy];
    uint64_t v16 = v10->_passphrase;
    v10->_passphrase = (NSString *)v15;

    v10->_useSSIDPrefix = 0;
  }

  return v10;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID
{
  id v4 = SSID;
  v10.receiver = self;
  v10.super_class = (Class)NEHotspotConfiguration;
  BOOL v5 = [(NEHotspotConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    uint64_t v7 = v5->_SSID;
    v5->_SSID = (NSString *)v6;

    SSIDPrefix = v5->_SSIDPrefix;
    v5->_SSIDPrefix = (NSString *)&stru_1EF054CB8;

    v5->_securityType = 0;
    v5->_useSSIDPrefix = 0;
  }

  return v5;
}

- (NEHotspotConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEHotspotConfiguration;
  CFTypeRef result = [(NEHotspotConfiguration *)&v3 init];
  if (result)
  {
    result->_securityType = 0;
    *(_WORD *)&result->_joinOnce = 0;
    result->_useSSIDPrefix = 0;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(NEHotspotConfiguration *)self SSID];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(NEHotspotConfiguration *)self SSID];
    [v3 appendPrettyObject:v6 withName:@"SSID" andIndent:0 options:0];
  }
  uint64_t v7 = [(NEHotspotConfiguration *)self SSIDPrefix];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = [(NEHotspotConfiguration *)self SSIDPrefix];
    [v3 appendPrettyObject:v9 withName:@"SSID Prefix" andIndent:0 options:0];
  }
  objc_super v10 = [(NEHotspotConfiguration *)self lifeTimeInDays];
  [v3 appendFormat:@"\tLife Time : %@ Days\n", v10];

  switch([(NEHotspotConfiguration *)self securityType])
  {
    case 1:
      [v3 appendPrettyObject:@"WEP" withName:@"Security Type" andIndent:0 options:0];
      uint64_t v11 = [(NEHotspotConfiguration *)self passphrase];
      uint64_t v12 = @"WEP Passphrase";
      goto LABEL_9;
    case 2:
      [v3 appendPrettyObject:@"WPA/WPA2 Personal" withName:@"Security Type" andIndent:0 options:0];
      uint64_t v11 = [(NEHotspotConfiguration *)self passphrase];
      uint64_t v12 = @"WPA/WPA2 Personal Passphrase";
LABEL_9:
      uint64_t v13 = v3;
      uint64_t v14 = v11;
      uint64_t v15 = 3;
      goto LABEL_13;
    case 3:
      [v3 appendPrettyObject:@"WPA/WPA2 Enterprise" withName:@"Security Type" andIndent:0 options:0];
      uint64_t v11 = [(NEHotspotConfiguration *)self eapSettings];
      uint64_t v12 = @"EAP Configuration";
      goto LABEL_12;
    case 4:
      [v3 appendPrettyObject:@"Hotspot 2.0" withName:@"Security Type" andIndent:0 options:0];
      uint64_t v16 = [(NEHotspotConfiguration *)self eapSettings];
      [v3 appendPrettyObject:v16 withName:@"EAP Configuration" andIndent:0 options:0];

      uint64_t v11 = [(NEHotspotConfiguration *)self hs20Settings];
      uint64_t v12 = @"Hotspot 2.0 Configuration";
LABEL_12:
      uint64_t v13 = v3;
      uint64_t v14 = v11;
      uint64_t v15 = 0;
LABEL_13:
      [v13 appendPrettyObject:v14 withName:v12 andIndent:0 options:v15];

      break;
    default:
      [v3 appendPrettyObject:@"Open" withName:@"Security Type" andIndent:0 options:0];
      break;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end