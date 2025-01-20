@interface AKPrivateEmailInformation
- (AKPrivateEmailInformation)initWithResponseBody:(id)a3;
- (BOOL)invalidListVersionSupplied;
- (BOOL)shouldSyncWithServer;
- (NSArray)addedPrivateEmails;
- (NSArray)removedPrivateEmails;
- (NSString)privateEmailListVersion;
- (id)description;
- (int)protocolVersion;
- (void)_processDictionary:(id)a3 addedPrivateEmails:(id *)a4 removedPrivateEmails:(id *)a5;
- (void)setShouldSyncWithServer:(BOOL)a3;
@end

@implementation AKPrivateEmailInformation

- (AKPrivateEmailInformation)initWithResponseBody:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AKPrivateEmailInformation;
  v5 = [(AKPrivateEmailInformation *)&v41 init];
  v6 = v5;
  if (v5)
  {
    v5->_shouldSyncWithServer = 0;
    v7 = [v4 objectForKeyedSubscript:AKPrivateEmailListVersionKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    objc_storeStrong((id *)&v6->_privateEmailListVersion, v8);
    v9 = [v4 objectForKeyedSubscript:@"invalidListVersion"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    unsigned __int8 v11 = 0;
    if (isKindOfClass) {
      unsigned __int8 v11 = [v9 BOOLValue];
    }
    v6->_invalidListVersionSupplied = v11;
    v12 = [v4 objectForKeyedSubscript:@"hmeProtocolVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v13 = [v12 intValue];
    }
    else {
      unsigned int v13 = AKPrivateEmailInitialProtocolVersion;
    }
    v6->_protocolVersion = v13;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    id v15 = objc_alloc_init((Class)NSMutableArray);
    v16 = [v4 objectForKeyedSubscript:@"hmeMappings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = v12;
      v33 = v9;
      v34 = v7;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v31 = v16;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v38;
        do
        {
          v21 = 0;
          v22 = v15;
          v23 = v14;
          do
          {
            if (*(void *)v38 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v21);
            id v35 = v22;
            id v36 = v23;
            -[AKPrivateEmailInformation _processDictionary:addedPrivateEmails:removedPrivateEmails:](v6, "_processDictionary:addedPrivateEmails:removedPrivateEmails:", v24, &v36, &v35, v31, v32, v33, v34);
            id v14 = v36;

            id v15 = v35;
            v21 = (char *)v21 + 1;
            v22 = v15;
            v23 = v14;
          }
          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v19);
      }

      v9 = v33;
      v7 = v34;
      v16 = v31;
      v12 = v32;
    }
    else if (!v6->_privateEmailListVersion || v16)
    {
      v25 = _AKLogHme();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1001884D8((uint64_t)v16, (uint64_t *)&v6->_privateEmailListVersion, v25);
      }
    }
    else
    {
      v6->_shouldSyncWithServer = 1;
    }
    v26 = (NSArray *)objc_msgSend(v14, "copy", v31, v32, v33, v34);
    addedPrivateEmails = v6->_addedPrivateEmails;
    v6->_addedPrivateEmails = v26;

    v28 = (NSArray *)[v15 copy];
    removedPrivateEmails = v6->_removedPrivateEmails;
    v6->_removedPrivateEmails = v28;
  }
  return v6;
}

- (void)_processDictionary:(id)a3 addedPrivateEmails:(id *)a4 removedPrivateEmails:(id *)a5
{
  id v15 = a3;
  v7 = [v15 objectForKeyedSubscript:@"d"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = [v15 objectForKeyedSubscript:@"op"];
  v10 = (__CFString *)v9;
  if ((isKindOfClass & 1) == 0)
  {
    id v14 = [v15 objectForKeyedSubscript:@"hme"];
    goto LABEL_6;
  }
  if (v9)
  {
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();
    uint64_t v12 = [v15 objectForKeyedSubscript:@"hme"];
    unsigned int v13 = (__CFString *)v12;
    if ((v11 & 1) == 0)
    {
      id v14 = (id)v12;
LABEL_6:
      if (([(__CFString *)v10 isEqualToString:@"D"] & 1) == 0) {
        goto LABEL_19;
      }
      unsigned int v13 = &stru_100233250;
      goto LABEL_17;
    }
  }
  else
  {
    unsigned int v13 = [v15 objectForKeyedSubscript:@"hme"];
    v10 = @"A";
  }
  if ([(__CFString *)v10 isEqualToString:@"A"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
  }
  else if ([(__CFString *)v10 isEqualToString:@"D"])
  {

    unsigned int v13 = &stru_100233250;
  }
  id v14 = [objc_alloc((Class)AKPrivateEmail) initWithAddress:v13 forKey:v7];
  if (([(__CFString *)v10 isEqualToString:@"D"] & 1) != 0
    || (a5 = a4, [(__CFString *)v10 isEqualToString:@"A"]))
  {
    [*a5 addObject:v14];
  }
LABEL_17:

LABEL_18:
  id v14 = v13;
LABEL_19:
}

- (id)description
{
  return +[NSString stringWithFormat:@"Hide My Email info {added=%@, removed=%@, invalid=%d, shouldSync=%d}", self->_addedPrivateEmails, self->_removedPrivateEmails, self->_invalidListVersionSupplied, self->_shouldSyncWithServer];
}

- (NSString)privateEmailListVersion
{
  return self->_privateEmailListVersion;
}

- (BOOL)invalidListVersionSupplied
{
  return self->_invalidListVersionSupplied;
}

- (NSArray)addedPrivateEmails
{
  return self->_addedPrivateEmails;
}

- (NSArray)removedPrivateEmails
{
  return self->_removedPrivateEmails;
}

- (BOOL)shouldSyncWithServer
{
  return self->_shouldSyncWithServer;
}

- (void)setShouldSyncWithServer:(BOOL)a3
{
  self->_shouldSyncWithServer = a3;
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPrivateEmails, 0);
  objc_storeStrong((id *)&self->_addedPrivateEmails, 0);

  objc_storeStrong((id *)&self->_privateEmailListVersion, 0);
}

@end