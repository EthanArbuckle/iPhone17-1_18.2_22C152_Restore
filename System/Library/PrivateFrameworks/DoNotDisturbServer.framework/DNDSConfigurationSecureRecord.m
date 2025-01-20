@interface DNDSConfigurationSecureRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSConfigurationSecureRecord)init;
- (DNDSSenderConfigurationRecord)senderConfiguration;
- (NSDictionary)allowedApplications;
- (NSSet)allowedWebApplications;
- (NSSet)deniedApplications;
- (NSSet)deniedWebApplications;
- (NSString)description;
- (id)_initWithRecord:(id)a3;
- (id)_initWithSenderConfiguration:(id)a3 allowedApplications:(id)a4 deniedApplications:(id)a5 allowedWebApplications:(id)a6 deniedWebApplications:(id)a7;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)log:(id)a3 withPrefix:(id)a4;
@end

@implementation DNDSConfigurationSecureRecord

- (DNDSConfigurationSecureRecord)init
{
  return (DNDSConfigurationSecureRecord *)[(DNDSConfigurationSecureRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 senderConfiguration];
  v6 = [v4 allowedApplications];
  v7 = [v4 deniedApplications];
  v8 = [v4 allowedWebApplications];
  v9 = [v4 deniedWebApplications];

  id v10 = [(DNDSConfigurationSecureRecord *)self _initWithSenderConfiguration:v5 allowedApplications:v6 deniedApplications:v7 allowedWebApplications:v8 deniedWebApplications:v9];
  return v10;
}

- (id)_initWithSenderConfiguration:(id)a3 allowedApplications:(id)a4 deniedApplications:(id)a5 allowedWebApplications:(id)a6 deniedWebApplications:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)DNDSConfigurationSecureRecord;
  v17 = [(DNDSConfigurationSecureRecord *)&v39 init];
  if (v17)
  {
    v18 = (void *)[v12 copy];
    v19 = v18;
    if (v18) {
      v20 = v18;
    }
    else {
      v20 = (DNDSSenderConfigurationRecord *)objc_opt_new();
    }
    senderConfiguration = v17->_senderConfiguration;
    v17->_senderConfiguration = v20;

    v22 = (void *)[v13 copy];
    v23 = v22;
    if (v22) {
      v24 = v22;
    }
    else {
      v24 = (NSDictionary *)objc_opt_new();
    }
    allowedApplications = v17->_allowedApplications;
    v17->_allowedApplications = v24;

    v26 = (void *)[v14 copy];
    v27 = v26;
    if (v26) {
      v28 = v26;
    }
    else {
      v28 = (NSSet *)objc_opt_new();
    }
    deniedApplications = v17->_deniedApplications;
    v17->_deniedApplications = v28;

    v30 = (void *)[v15 copy];
    v31 = v30;
    if (v30) {
      v32 = v30;
    }
    else {
      v32 = (NSSet *)objc_opt_new();
    }
    allowedWebApplications = v17->_allowedWebApplications;
    v17->_allowedWebApplications = v32;

    v34 = (void *)[v16 copy];
    v35 = v34;
    if (v34) {
      v36 = v34;
    }
    else {
      v36 = (NSSet *)objc_opt_new();
    }
    deniedWebApplications = v17->_deniedWebApplications;
    v17->_deniedWebApplications = v36;
  }
  return v17;
}

- (void)log:(id)a3 withPrefix:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v56 = v6;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin secure configuration", buf, 0xCu);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v7 = self->_allowedApplications;
  uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v49;
    *(void *)&long long v9 = 138543875;
    long long v34 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(DNDSSenderConfigurationRecord **)(*((void *)&v48 + 1) + 8 * i);
        id v14 = -[NSDictionary objectForKeyedSubscript:](self->_allowedApplications, "objectForKeyedSubscript:", v13, v34);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          id v56 = v6;
          __int16 v57 = 2113;
          v58 = v13;
          __int16 v59 = 2113;
          v60 = v14;
          _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed app: %{private}@; %{private}@",
            buf,
            0x20u);
        }
      }
      uint64_t v10 = [(NSDictionary *)v7 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v10);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v15 = self->_deniedApplications;
  uint64_t v16 = [(NSSet *)v15 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(DNDSSenderConfigurationRecord **)(*((void *)&v44 + 1) + 8 * j);
          *(_DWORD *)buf = 138543619;
          id v56 = v6;
          __int16 v57 = 2113;
          v58 = v20;
          _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied app: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v17 = [(NSSet *)v15 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v17);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v21 = self->_allowedWebApplications;
  uint64_t v22 = [(NSSet *)v21 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(DNDSSenderConfigurationRecord **)(*((void *)&v40 + 1) + 8 * k);
          *(_DWORD *)buf = 138543619;
          id v56 = v6;
          __int16 v57 = 2113;
          v58 = v26;
          _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed web app: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v23 = [(NSSet *)v21 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v23);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v27 = self->_deniedWebApplications;
  uint64_t v28 = [(NSSet *)v27 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v27);
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(DNDSSenderConfigurationRecord **)(*((void *)&v36 + 1) + 8 * m);
          *(_DWORD *)buf = 138543619;
          id v56 = v6;
          __int16 v57 = 2113;
          v58 = v32;
          _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied web app: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v29 = [(NSSet *)v27 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v29);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    senderConfiguration = self->_senderConfiguration;
    *(_DWORD *)buf = 138543619;
    id v56 = v6;
    __int16 v57 = 2113;
    v58 = senderConfiguration;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] senderConfiguration: %{private}@", buf, 0x16u);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v56 = v6;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] End secure configuration", buf, 0xCu);
  }
}

- (unint64_t)hash
{
  v3 = [(DNDSConfigurationSecureRecord *)self senderConfiguration];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSConfigurationSecureRecord *)self allowedApplications];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSConfigurationSecureRecord *)self deniedApplications];
  uint64_t v8 = [v7 hash];
  long long v9 = [(DNDSConfigurationSecureRecord *)self allowedWebApplications];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(DNDSConfigurationSecureRecord *)self deniedWebApplications];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSConfigurationSecureRecord *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDSConfigurationSecureRecord *)self senderConfiguration];
      v7 = [(DNDSConfigurationSecureRecord *)v5 senderConfiguration];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSConfigurationSecureRecord *)self senderConfiguration];
        if (!v8)
        {
          char v13 = 0;
          goto LABEL_54;
        }
        long long v9 = (void *)v8;
        uint64_t v10 = [(DNDSConfigurationSecureRecord *)v5 senderConfiguration];
        if (!v10)
        {
          char v13 = 0;
LABEL_53:

          goto LABEL_54;
        }
        uint64_t v11 = [(DNDSConfigurationSecureRecord *)self senderConfiguration];
        unint64_t v12 = [(DNDSConfigurationSecureRecord *)v5 senderConfiguration];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v58 = v9;
        __int16 v59 = v12;
        v60 = v11;
        v61 = v10;
      }
      id v14 = [(DNDSConfigurationSecureRecord *)self allowedApplications];
      id v15 = [(DNDSConfigurationSecureRecord *)v5 allowedApplications];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSConfigurationSecureRecord *)self allowedApplications];
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          uint64_t v62 = v14;
          uint64_t v18 = [(DNDSConfigurationSecureRecord *)v5 allowedApplications];
          if (v18)
          {
            v19 = (void *)v18;
            v20 = [(DNDSConfigurationSecureRecord *)self allowedApplications];
            v21 = [(DNDSConfigurationSecureRecord *)v5 allowedApplications];
            if ([v20 isEqual:v21])
            {
              v53 = v21;
              v54 = v20;
              long long v51 = v19;
              v52 = v17;
              goto LABEL_17;
            }
          }
        }
        else
        {
        }
LABEL_50:
        char v13 = 0;
        goto LABEL_51;
      }
      uint64_t v62 = v14;
LABEL_17:
      uint64_t v22 = [(DNDSConfigurationSecureRecord *)self deniedApplications];
      uint64_t v23 = [(DNDSConfigurationSecureRecord *)v5 deniedApplications];
      if (v22 != v23)
      {
        uint64_t v24 = [(DNDSConfigurationSecureRecord *)self deniedApplications];
        if (v24)
        {
          v55 = (void *)v24;
          uint64_t v25 = [(DNDSConfigurationSecureRecord *)v5 deniedApplications];
          if (v25)
          {
            long long v50 = (void *)v25;
            v26 = [(DNDSConfigurationSecureRecord *)self deniedApplications];
            v27 = [(DNDSConfigurationSecureRecord *)v5 deniedApplications];
            if ([v26 isEqual:v27])
            {
              __int16 v57 = v22;
              long long v47 = v27;
              long long v48 = v26;
              goto LABEL_26;
            }
          }
        }

        long long v38 = v62;
        if (v62 == v15)
        {

LABEL_49:
          goto LABEL_50;
        }
LABEL_47:

LABEL_48:
        goto LABEL_49;
      }
      __int16 v57 = v22;
LABEL_26:
      uint64_t v28 = [(DNDSConfigurationSecureRecord *)self allowedWebApplications];
      id v56 = [(DNDSConfigurationSecureRecord *)v5 allowedWebApplications];
      if (v28 == v56)
      {
LABEL_33:
        v33 = [(DNDSConfigurationSecureRecord *)self deniedWebApplications];
        uint64_t v34 = [(DNDSConfigurationSecureRecord *)v5 deniedWebApplications];
        if (v33 == (void *)v34)
        {

          char v13 = 1;
        }
        else
        {
          long long v45 = (void *)v34;
          uint64_t v35 = [(DNDSConfigurationSecureRecord *)self deniedWebApplications];
          if (v35)
          {
            long long v42 = (void *)v35;
            long long v36 = [(DNDSConfigurationSecureRecord *)v5 deniedWebApplications];
            if (v36)
            {
              long long v41 = v36;
              long long v40 = [(DNDSConfigurationSecureRecord *)self deniedWebApplications];
              long long v37 = [(DNDSConfigurationSecureRecord *)v5 deniedWebApplications];
              char v13 = [v40 isEqual:v37];

              long long v36 = v41;
            }
            else
            {
              char v13 = 0;
            }
          }
          else
          {

            char v13 = 0;
          }
        }
        if (v28 != v56)
        {
        }
        if (v57 != v23)
        {
        }
        if (v62 != v15)
        {
        }
LABEL_51:
        uint64_t v11 = v60;
        uint64_t v10 = v61;
        long long v9 = v58;
        unint64_t v12 = v59;
        if (v6 != v7) {
          goto LABEL_52;
        }
LABEL_54:

        goto LABEL_55;
      }
      uint64_t v29 = [(DNDSConfigurationSecureRecord *)self allowedWebApplications];
      if (v29)
      {
        long long v49 = (void *)v29;
        uint64_t v30 = [(DNDSConfigurationSecureRecord *)v5 allowedWebApplications];
        if (v30)
        {
          id v46 = v30;
          v31 = [(DNDSConfigurationSecureRecord *)self allowedWebApplications];
          v32 = [(DNDSConfigurationSecureRecord *)v5 allowedWebApplications];
          if ([v31 isEqual:v32])
          {
            long long v43 = v31;
            long long v44 = v32;
            goto LABEL_33;
          }

          uint64_t v30 = v46;
        }
      }
      if (v57 != v23)
      {
      }
      long long v38 = v62;
      if (v62 == v15) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
    char v13 = 0;
  }
LABEL_55:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSConfigurationSecureRecord *)self senderConfiguration];
  uint64_t v6 = [(DNDSConfigurationSecureRecord *)self allowedApplications];
  v7 = [(DNDSConfigurationSecureRecord *)self deniedApplications];
  uint64_t v8 = [(DNDSConfigurationSecureRecord *)self allowedWebApplications];
  long long v9 = [(DNDSConfigurationSecureRecord *)self deniedWebApplications];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; senderConfiguration: %@; ; allowedApplications: %@; ; deniedApplications: %@; ; allowedWebApplications: %@; ; deniedWebApplications: %@; >",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  uint64_t v10 = v9);

  return (NSString *)v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableConfigurationSecureRecord alloc];
  return [(DNDSConfigurationSecureRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  long long v51 = (objc_class *)a1;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "bs_safeDictionaryForKey:", @"senderConfiguration");
  id v52 = +[DNDSSenderConfigurationRecord newWithDictionaryRepresentation:v7 context:v6];

  v58 = objc_msgSend(v5, "bs_safeDictionaryForKey:", @"platforms");
  v53 = v5;
  uint64_t v8 = objc_msgSend(v5, "bs_safeDictionaryForKey:", @"allowedApplications");
  __int16 v57 = objc_opt_new();
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v79 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        id v14 = objc_msgSend(v58, "objectForKeyedSubscript:", v13, v51);
        uint64_t v15 = [v14 unsignedIntegerValue];

        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v13 platform:v15];
        uint64_t v17 = [v6 applicationIdentifierMapper];
        uint64_t v18 = [v17 applicationIdentifierForFileWithSourceApplicationIdentifier:v16];

        v19 = [v18 bundleID];
        v20 = [obj objectForKey:v19];
        id v21 = +[DNDSApplicationConfigurationRecord newWithDictionaryRepresentation:v20 context:v6];

        [v57 setObject:v21 forKey:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
    }
    while (v10);
  }

  uint64_t v22 = objc_msgSend(v53, "bs_safeArrayForKey:", @"silencedApplications");
  uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v56 = v22;
  uint64_t v24 = [v56 countByEnumeratingWithState:&v74 objects:v84 count:16];
  v54 = v23;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v75 != v26) {
          objc_enumerationMutation(v56);
        }
        uint64_t v28 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v28 platform:0];
LABEL_17:
          objc_msgSend(v23, "addObject:", v29, v51);

          continue;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = (void *)[MEMORY[0x1E4F5F598] newWithDictionaryRepresentation:v28 context:v6];
          v31 = [v6 applicationIdentifierMapper];
          uint64_t v29 = [v31 applicationIdentifierForFileWithSourceApplicationIdentifier:v30];

          uint64_t v23 = v54;
          goto LABEL_17;
        }
        if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
          +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:](&v72, v73);
        }
      }
      uint64_t v25 = [v56 countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v25);
  }

  v32 = objc_msgSend(v53, "bs_safeArrayForKey:", @"allowedWebApplications");
  v55 = [MEMORY[0x1E4F1CA80] set];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v33 = v32;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v69 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v68 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v39 = (void *)[MEMORY[0x1E4F5F778] newWithDictionaryRepresentation:v38 context:v6];
          [v55 addObject:v39];
        }
        else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
        {
          +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:](&v66, v67);
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v35);
  }

  long long v40 = objc_msgSend(v53, "bs_safeArrayForKey:", @"silencedWebApplications");
  long long v41 = [MEMORY[0x1E4F1CA80] set];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v42 = v40;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v63 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v62 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v48 = (void *)[MEMORY[0x1E4F5F778] newWithDictionaryRepresentation:v47 context:v6];
          [v41 addObject:v48];
        }
        else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
        {
          +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:](&v60, v61);
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v62 objects:v82 count:16];
    }
    while (v44);
  }

  long long v49 = (void *)[[v51 alloc] _initWithSenderConfiguration:v52 allowedApplications:v57 deniedApplications:v54 allowedWebApplications:v55 deniedWebApplications:v41];
  return v49;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 healingSource];
  id v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v8 = v7;

  uint64_t v9 = [(DNDSConfigurationSecureRecord *)self senderConfiguration];
  long long v62 = v8;
  [v8 setDictionaryRepresentationOfRecord:v9 forKey:@"senderConfiguration" context:v3];

  long long v65 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v64 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v10 = [(DNDSConfigurationSecureRecord *)self allowedApplications];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v79 objects:v86 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v80 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v16 = [(DNDSConfigurationSecureRecord *)self allowedApplications];
        uint64_t v17 = [v16 objectForKeyedSubscript:v15];

        uint64_t v18 = [v3 destination];
        if (!v18)
        {
          v19 = [v3 applicationIdentifierMapper];
          uint64_t v20 = [v19 applicationIdentifierForSyncWithSourceApplicationIdentifier:v15];
          goto LABEL_13;
        }
        if (v18 == 1)
        {
          v19 = [v3 applicationIdentifierMapper];
          uint64_t v20 = [v19 applicationIdentifierForFileWithSourceApplicationIdentifier:v15];
LABEL_13:
          id v21 = (void *)v20;

          goto LABEL_15;
        }
        id v21 = 0;
LABEL_15:
        uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "platform"));
        uint64_t v23 = [v21 bundleID];
        [v64 setObject:v22 forKeyedSubscript:v23];

        uint64_t v24 = [v21 bundleID];
        [v65 setDictionaryRepresentationOfRecord:v17 forKey:v24 context:v3];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v79 objects:v86 count:16];
    }
    while (v12);
  }

  uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v26 = (void *)[v3 mutableCopy];
  v27 = [v3 healingSource];
  uint64_t v28 = [v27 objectForKeyedSubscript:@"silencedApplications"];
  long long v63 = v26;
  [v26 setArrayHealingSource:v28];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v29 = [(DNDSConfigurationSecureRecord *)self deniedApplications];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (!v30) {
    goto LABEL_30;
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v76;
  do
  {
    for (uint64_t j = 0; j != v31; ++j)
    {
      if (*(void *)v76 != v32) {
        objc_enumerationMutation(v29);
      }
      uint64_t v34 = *(void *)(*((void *)&v75 + 1) + 8 * j);
      uint64_t v35 = [v3 destination];
      if (!v35)
      {
        uint64_t v36 = [v3 applicationIdentifierMapper];
        uint64_t v37 = [v36 applicationIdentifierForSyncWithSourceApplicationIdentifier:v34];
        goto LABEL_26;
      }
      if (v35 == 1)
      {
        uint64_t v36 = [v3 applicationIdentifierMapper];
        uint64_t v37 = [v36 applicationIdentifierForFileWithSourceApplicationIdentifier:v34];
LABEL_26:
        uint64_t v38 = (void *)v37;

        goto LABEL_28;
      }
      uint64_t v38 = 0;
LABEL_28:
      long long v39 = [v38 dictionaryRepresentationWithContext:v63];
      [v25 addObject:v39];
    }
    uint64_t v31 = [v29 countByEnumeratingWithState:&v75 objects:v85 count:16];
  }
  while (v31);
LABEL_30:

  objc_msgSend(v62, "bs_setSafeObject:forKey:", v65, @"allowedApplications");
  objc_msgSend(v62, "bs_setSafeObject:forKey:", v64, @"platforms");
  v61 = v25;
  objc_msgSend(v62, "bs_setSafeObject:forKey:", v25, @"silencedApplications");
  long long v40 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = (void *)[v3 mutableCopy];
  id v42 = [v3 healingSource];
  uint64_t v43 = [v42 objectForKeyedSubscript:@"allowedWebApplications"];
  [v41 setArrayHealingSource:v43];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v44 = [(DNDSConfigurationSecureRecord *)self allowedWebApplications];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v72 != v47) {
          objc_enumerationMutation(v44);
        }
        long long v49 = [*(id *)(*((void *)&v71 + 1) + 8 * k) dictionaryRepresentationWithContext:v41];
        [v40 addObject:v49];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v46);
  }

  objc_msgSend(v62, "bs_setSafeObject:forKey:", v40, @"allowedWebApplications");
  long long v50 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = (void *)[v3 mutableCopy];
  id v52 = [v3 healingSource];
  v53 = [v52 objectForKeyedSubscript:@"silencedWebApplications"];
  [v51 setArrayHealingSource:v53];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v54 = [(DNDSConfigurationSecureRecord *)self deniedWebApplications];
  uint64_t v55 = [v54 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v68;
    do
    {
      for (uint64_t m = 0; m != v56; ++m)
      {
        if (*(void *)v68 != v57) {
          objc_enumerationMutation(v54);
        }
        __int16 v59 = [*(id *)(*((void *)&v67 + 1) + 8 * m) dictionaryRepresentationWithContext:v51];
        [v50 addObject:v59];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v56);
  }

  objc_msgSend(v62, "bs_setSafeObject:forKey:", v50, @"silencedWebApplications");
  return v62;
}

- (DNDSSenderConfigurationRecord)senderConfiguration
{
  return self->_senderConfiguration;
}

- (NSDictionary)allowedApplications
{
  return self->_allowedApplications;
}

- (NSSet)deniedApplications
{
  return self->_deniedApplications;
}

- (NSSet)allowedWebApplications
{
  return self->_allowedWebApplications;
}

- (NSSet)deniedWebApplications
{
  return self->_deniedWebApplications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedWebApplications, 0);
  objc_storeStrong((id *)&self->_allowedWebApplications, 0);
  objc_storeStrong((id *)&self->_deniedApplications, 0);
  objc_storeStrong((id *)&self->_allowedApplications, 0);
  objc_storeStrong((id *)&self->_senderConfiguration, 0);
}

+ (void)newWithDictionaryRepresentation:(unsigned char *)a1 context:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1D3052000, v2, v3, "Unexpected class in allowed web application list", v4);
}

+ (void)newWithDictionaryRepresentation:(unsigned char *)a1 context:(unsigned char *)a2 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1D3052000, v2, v3, "Unexpected class in denied application list", v4);
}

@end