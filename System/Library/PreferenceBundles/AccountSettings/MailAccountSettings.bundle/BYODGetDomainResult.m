@interface BYODGetDomainResult
- (BOOL)hasEmails;
- (BOOL)hasEmailsForDsid:(id)a3;
- (BOOL)hasUnverifiedEmail;
- (BOOL)isDNSVerfied;
- (BOOL)isDomainInProgress;
- (BOOL)isOwner:(id)a3;
- (BYODDomain)domain;
- (BYODGetDomainResult)initWithDictionary:(id)a3;
- (NSArray)members;
- (NSString)ef_publicDescription;
- (id)getDomainOwnerMember;
- (id)getMemberFromDSID:(id)a3;
- (id)getMemberFromIdentifier:(id)a3;
- (int64_t)maxEmailsPerUser;
- (int64_t)maxMembersPerDomain;
- (void)setDomain:(id)a3;
- (void)setMaxEmailsPerUser:(int64_t)a3;
- (void)setMaxMembersPerDomain:(int64_t)a3;
- (void)setMembers:(id)a3;
@end

@implementation BYODGetDomainResult

- (BYODGetDomainResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BYODGetDomainResult;
  v5 = [(BYODGetDomainResult *)&v27 init];
  if (v5)
  {
    v6 = [BYODDomain alloc];
    v7 = [v4 objectForKeyedSubscript:@"domain"];
    v8 = [(BYODDomain *)v6 initWithDictionary:v7];
    domain = v5->_domain;
    v5->_domain = v8;

    v10 = [v4 objectForKeyedSubscript:@"maxEmailsPerUser"];
    v5->_maxEmailsPerUser = (int64_t)[v10 integerValue];

    v11 = [v4 objectForKeyedSubscript:@"maxMembersPerDomain"];
    v5->_maxMembersPerDomain = (int64_t)[v11 integerValue];

    v12 = [v4 objectForKeyedSubscript:@"members"];
    v13 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v17);
          v19 = [BYODUser alloc];
          v20 = -[BYODUser initWithDictionary:](v19, "initWithDictionary:", v18, (void)v23);
          [(NSArray *)v13 addObject:v20];

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }

    members = v5->_members;
    v5->_members = v13;
  }
  return v5;
}

- (BOOL)hasUnverifiedEmail
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v2 = self->_members;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v2);
        }
        v5 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v6 = [v5 emails];
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v16;
          while (2)
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v6);
              }
              v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) status];
              unsigned __int8 v11 = [v10 isEqualToString:@"PENDING"];

              if (v11)
              {

                BOOL v12 = 1;
                goto LABEL_19;
              }
            }
            id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
      BOOL v12 = 0;
    }
    while (v3);
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

- (BOOL)hasEmails
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_members;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "emails", (void)v9);
        BOOL v7 = [v6 count] == 0;

        if (!v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)getMemberFromDSID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_members;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "dsid", (void)v13);
        unsigned __int8 v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getDomainOwnerMember
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_members;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v7 = [(BYODGetDomainResult *)self domain];
        uint64_t v8 = [v7 owner];
        long long v9 = [v8 dsid];
        long long v10 = [v6 dsid];
        unsigned __int8 v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          id v12 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)getMemberFromIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_members;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "memberIdentifier", (void)v13);
        unsigned __int8 v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isOwner:(id)a3
{
  id v4 = a3;
  v5 = [(BYODDomain *)self->_domain owner];
  id v6 = [v5 dsid];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  return v7;
}

- (BOOL)isDNSVerfied
{
  v2 = [(BYODDomain *)self->_domain status];
  unsigned __int8 v3 = [v2 isEqualToString:@"COMPLETE"];

  return v3;
}

- (BOOL)isDomainInProgress
{
  unsigned __int8 v3 = [(BYODDomain *)self->_domain verificationStatus];
  if ([v3 isEqualToString:@"NOT_STARTED"])
  {
    id v4 = [(BYODDomain *)self->_domain status];
    unsigned __int8 v5 = [v4 isEqualToString:@"IN_PROGRESS"];

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)hasEmailsForDsid:(id)a3
{
  unsigned __int8 v3 = [(BYODGetDomainResult *)self getMemberFromDSID:a3];
  id v4 = [v3 emails];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (NSString)ef_publicDescription
{
  unsigned int v3 = [(BYODGetDomainResult *)self isDNSVerfied];
  unsigned int v4 = [(BYODGetDomainResult *)self hasEmails];
  BOOL v5 = [(BYODDomain *)self->_domain ef_publicDescription];
  char v6 = +[NSString stringWithFormat:@"GetDomainResult: isDNSVerified %d, hasEmails %d, domain: %@ ", v3, v4, v5];

  return (NSString *)v6;
}

- (BYODDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSArray)members
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMembers:(id)a3
{
}

- (int64_t)maxEmailsPerUser
{
  return self->_maxEmailsPerUser;
}

- (void)setMaxEmailsPerUser:(int64_t)a3
{
  self->_maxEmailsPerUser = a3;
}

- (int64_t)maxMembersPerDomain
{
  return self->_maxMembersPerDomain;
}

- (void)setMaxMembersPerDomain:(int64_t)a3
{
  self->_maxMembersPerDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_members, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end