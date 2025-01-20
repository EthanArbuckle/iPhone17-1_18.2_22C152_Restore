@interface SAPersonAttribute
- (id)_applicableEmail;
- (id)_applicablePhone;
- (id)sr_inPerson;
@end

@implementation SAPersonAttribute

- (id)sr_inPerson
{
  v3 = [(SAPersonAttribute *)self displayText];
  v4 = INPersonHandleLabelMain;
  v5 = [(SAPersonAttribute *)self dataType];
  v6 = [(SAPersonAttribute *)self typedData];
  v50 = v5;
  if (([v5 isEqualToString:@"PhoneNumber"] & 1) != 0
    || [v5 isEqualToString:@"PhoneLabel"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v6;
      }
      else {
        id v8 = 0;
      }
      uint64_t v10 = 2;
      goto LABEL_29;
    }
    id v7 = v6;
    id v8 = [v7 number];
    uint64_t v9 = [v7 label];

    uint64_t v10 = 2;
LABEL_11:
    v4 = (NSString *)v9;
LABEL_29:
    v22 = v6;
    goto LABEL_30;
  }
  if (([v5 isEqualToString:@"EmailAddress"] & 1) != 0
    || [v5 isEqualToString:@"EmailLabel"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v6;
      }
      else {
        id v8 = 0;
      }
      uint64_t v10 = 1;
      goto LABEL_29;
    }
    id v11 = v6;
    id v8 = [v11 emailAddress];
    uint64_t v9 = [v11 label];

    uint64_t v10 = 1;
    goto LABEL_11;
  }
  v47 = v3;
  v48 = v4;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_1000B9F34();
  }
  v12 = [(SAPersonAttribute *)self data];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v13 = [(SAPersonAttribute *)self object];
  v14 = [v13 phones];

  id v15 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v56;
LABEL_20:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v56 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v55 + 1) + 8 * v18);
      v20 = [v19 number];
      unsigned __int8 v21 = [v20 isEqualToString:v12];

      if (v21) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v16) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
    }
    id v8 = v12;
    v4 = [v19 label];

    uint64_t v10 = 2;
    v3 = v47;
    if (v8) {
      goto LABEL_45;
    }
  }
  else
  {
LABEL_26:

    uint64_t v10 = 0;
    v3 = v47;
    v4 = v48;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v38 = [(SAPersonAttribute *)self object];
  v39 = [v38 emails];

  v40 = v39;
  id v8 = [v39 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v8)
  {
    v49 = v4;
    uint64_t v41 = *(void *)v52;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(v40);
        }
        v43 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v44 = [v43 emailAddress];
        unsigned int v45 = [v44 isEqualToString:v12];

        if (v45)
        {
          id v8 = v12;
          v4 = [v43 label];

          uint64_t v10 = 1;
          v3 = v47;
          goto LABEL_44;
        }
      }
      id v8 = [v40 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    v3 = v47;
    v4 = v49;
  }
LABEL_44:

LABEL_45:
  v22 = v46;
LABEL_30:
  v23 = [(SAPersonAttribute *)self object];
  id v24 = objc_alloc_init((Class)NSPersonNameComponents);
  v25 = [v23 firstName];
  [v24 setGivenName:v25];

  v26 = [v23 nickName];
  [v24 setNickname:v26];

  v27 = [v23 middleName];
  [v24 setMiddleName:v27];

  v28 = [v23 lastName];
  [v24 setFamilyName:v28];

  v29 = [v23 prefix];
  [v24 setNamePrefix:v29];

  v30 = [v23 suffix];
  [v24 setNameSuffix:v30];

  id v31 = [objc_alloc((Class)INPersonHandle) initWithValue:v8 type:v10 label:v4];
  id v32 = objc_alloc((Class)INPerson);
  [v23 internalGUID];
  v34 = v33 = v4;
  v35 = [v23 aceId];
  id v36 = [v32 initWithPersonHandle:v31 nameComponents:v24 displayName:v3 image:0 contactIdentifier:v34 customIdentifier:v35];

  return v36;
}

- (id)_applicablePhone
{
  v3 = [(SAPersonAttribute *)self typedData];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B9FA8();
    }
    v5 = [(SAPersonAttribute *)self data];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(SAPersonAttribute *)self object];
    id v7 = [v6 phones];

    id v4 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 number];
          unsigned int v12 = [v11 isEqualToString:v5];

          if (v12)
          {
            id v4 = v10;
            goto LABEL_15;
          }
        }
        id v4 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }

  return v4;
}

- (id)_applicableEmail
{
  v3 = [(SAPersonAttribute *)self typedData];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000BA01C();
    }
    v5 = [(SAPersonAttribute *)self data];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(SAPersonAttribute *)self object];
    id v7 = [v6 emails];

    id v4 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 emailAddress];
          unsigned int v12 = [v11 isEqualToString:v5];

          if (v12)
          {
            id v4 = v10;
            goto LABEL_15;
          }
        }
        id v4 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }

  return v4;
}

@end