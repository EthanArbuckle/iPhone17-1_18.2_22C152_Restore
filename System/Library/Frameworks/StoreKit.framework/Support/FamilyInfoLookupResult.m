@interface FamilyInfoLookupResult
+ (id)_familyMembersFromDictionaryRepresentation:(id)a3;
- (BOOL)isCached;
- (FamilyInfoLookupResult)initWithDictionaryRepresentation:(id)a3 cached:(BOOL)a4;
- (NSArray)familyMembers;
- (NSDictionary)dictionaryRepresentation;
- (id)description;
@end

@implementation FamilyInfoLookupResult

- (FamilyInfoLookupResult)initWithDictionaryRepresentation:(id)a3 cached:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FamilyInfoLookupResult;
  v7 = [(FamilyInfoLookupResult *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_cached = a4;
    uint64_t v9 = +[FamilyInfoLookupResult _familyMembersFromDictionaryRepresentation:v6];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v8->_familyMembers, v11);
  }
  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(FamilyInfoLookupResult *)self familyMembers];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }

  v18 = v3;
  CFStringRef v19 = @"family";
  CFStringRef v17 = @"members";
  v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  return (NSDictionary *)v11;
}

- (id)description
{
  unsigned int v3 = [(FamilyInfoLookupResult *)self isCached];
  v4 = [(FamilyInfoLookupResult *)self familyMembers];
  id v5 = +[NSString stringWithFormat:@"{ cached: %d familyMembers: %@ }", v3, v4];

  return v5;
}

+ (id)_familyMembersFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = +[ACAccountStore ams_sharedAccountStore];
  id v5 = objc_msgSend(v4, "ams_activeiCloudAccount");
  id v6 = objc_msgSend(v5, "ams_DSID");

  uint64_t v7 = +[ACAccountStore ams_sharedAccountStore];
  v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  uint64_t v9 = objc_msgSend(v8, "ams_DSID");

  v35 = v3;
  v10 = [v3 valueForKeyPath:@"family.members"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  v38 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
  v39 = v6;
  v37 = v12;
  if (!v13)
  {

    goto LABEL_26;
  }
  id v14 = v13;
  v36 = 0;
  uint64_t v15 = *(void *)v45;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v45 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [[FamilyMember alloc] initWithDictionaryRepresentation:v17];
        if (v18)
        {
          [v38 addObject:v18];
          if (v6)
          {
            CFStringRef v19 = [(FamilyMember *)v18 iCloudDSID];
            if ([v19 isEqualToNumber:v6]) {
              BOOL v20 = v9 == 0;
            }
            else {
              BOOL v20 = 1;
            }
            if (v20)
            {
LABEL_18:
            }
            else
            {
              v21 = [(FamilyMember *)v18 iTunesDSID];
              unsigned int v22 = [v21 isEqualToNumber:v9];

              if (v22)
              {
                CFStringRef v19 = v36;
                id v12 = v37;
                v36 = v18;
                id v6 = v39;
                goto LABEL_18;
              }
              id v6 = v39;
              id v12 = v37;
            }
          }
        }

        continue;
      }
    }
    id v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
  }
  while (v14);

  v23 = v36;
  if (!v36)
  {
LABEL_26:
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v24 = v38;
    id v25 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v25)
    {
      id v26 = v25;
      v23 = 0;
      uint64_t v27 = *(void *)v41;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(v24);
          }
          if (v9)
          {
            v29 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
            v30 = [v29 iTunesDSID];
            unsigned int v31 = [v30 isEqualToNumber:v9];

            if (v31)
            {
              v32 = v29;

              v23 = v32;
            }
            id v6 = v39;
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v26);
    }
    else
    {
      v23 = 0;
    }
  }
  [(FamilyMember *)v23 setCurrentSignedInUser:1];
  v33 = [v38 sortedArrayUsingComparator:&stru_10035A970];

  return v33;
}

- (BOOL)isCached
{
  return self->_cached;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void).cxx_destruct
{
}

@end