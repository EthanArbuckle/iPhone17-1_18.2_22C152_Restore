@interface DSVServiceProviderContacts
- (BOOL)canHandleSyncChunk:(id)a3;
- (DSVServiceProviderContacts)init;
- (id)currentVerificationKey;
- (void)handleSyncChunk:(id)a3;
- (void)verifySyncDataWithCompletion:(id)a3;
@end

@implementation DSVServiceProviderContacts

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_resultEntries, 0);
  objc_storeStrong((id *)&self->_verificationResultType, 0);
  objc_storeStrong((id *)&self->_saPersons, 0);
}

- (void)verifySyncDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100006C44;
    v66[3] = &unk_10000C4B8;
    v66[4] = self;
    id v37 = v4;
    id v67 = v4;
    v38 = objc_retainBlock(v66);
    v75 = CNContactGivenNameKey;
    v76 = CNContactFamilyNameKey;
    uint64_t v77 = (uint64_t)CNContactNicknameKey;
    v78 = CNContactPostalAddressesKey;
    v79 = CNContactRelationsKey;
    v80 = CNContactPhoneticGivenNameKey;
    v81 = CNContactPhoneticFamilyNameKey;
    v82 = CNContactEmailAddressesKey;
    v83 = CNContactPhoneNumbersKey;
    v84 = CNContactMiddleNameKey;
    v85 = CNContactNamePrefixKey;
    v86 = CNContactNameSuffixKey;
    v87 = CNContactOrganizationNameKey;
    v5 = +[NSArray arrayWithObjects:&v75 count:13];
    v74[0] = CNContactTypeKey;
    v74[1] = CNContactIdentifierKey;
    v74[2] = CNContactIOSLegacyIdentifierKey;
    v6 = +[NSArray arrayWithObjects:v74 count:3];
    v40 = [v5 arrayByAddingObjectsFromArray:v6];

    id v7 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v40];
    [v7 setUnifyResults:0];
    id v39 = objc_alloc_init((Class)CNContactStore);
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_saPersons, "count"));
    id v9 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSMutableDictionary count](self->_saPersons, "count"));
    v75 = 0;
    v76 = (NSString *)&v75;
    uint64_t v77 = 0x2020000000;
    LOBYTE(v78) = 1;
    v64 = &v75;
    id v65 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100006DD8;
    v58[3] = &unk_10000C3F0;
    id v59 = 0;
    id v60 = v7;
    v61 = self;
    id v41 = v9;
    id v62 = v41;
    id v46 = v8;
    id v63 = v46;
    id v35 = v60;
    [v39 enumerateContactsWithFetchRequest:v60 error:&v65 usingBlock:v58];
    id v36 = v65;
    if (*((unsigned char *)v76 + 24))
    {
      id v10 = [v46 count];
      if (v10 != [(NSMutableDictionary *)self->_saPersons count])
      {
        objc_storeStrong((id *)&self->_verificationResultType, SASyncDeepVerificationResultTypeCOUNT_MISMATCHValue);
        v11 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", @"Count mismatch: client has %tu, server has %tu", @"%tu%tu", 0, [v46 count], -[NSMutableDictionary count](self->_saPersons, "count"));
        [(NSMutableArray *)self->_resultEntries addObject:v11];
        v12 = AFSiriLogContextSync;
        if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v71 = "-[DSVServiceProviderContacts verifySyncDataWithCompletion:]";
          __int16 v72 = 2112;
          v73 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
        }
      }
      id v13 = objc_alloc((Class)NSMutableSet);
      v14 = [v46 allKeys];
      id v15 = [v13 initWithArray:v14];

      [v15 minusSet:v41];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obj = v15;
      id v16 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v55;
        v43 = (void *)SASyncDeepVerificationResultTypeSET_MISMATCHValue;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v55 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            if (!self->_verificationResultType) {
              objc_storeStrong((id *)&self->_verificationResultType, v43);
            }
            v20 = [v46 objectForKey:v19];
            v21 = +[NSString stringWithValidatedFormat:@"Server is missing: %@", @"%@", 0, v20 validFormatSpecifiers error];
            v22 = AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v71 = "-[DSVServiceProviderContacts verifySyncDataWithCompletion:]";
              __int16 v72 = 2112;
              v73 = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
            }
            [(NSMutableArray *)self->_resultEntries addObject:v21];
          }
          id v16 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
        }
        while (v16);
      }

      id v23 = objc_alloc((Class)NSMutableSet);
      v24 = [(NSMutableDictionary *)self->_saPersons allKeys];
      id v25 = [v23 initWithArray:v24];

      [v25 minusSet:v41];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v44 = v25;
      id v26 = [v44 countByEnumeratingWithState:&v50 objects:v68 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v51;
        id v42 = (id)SASyncDeepVerificationResultTypeSET_MISMATCHValue;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v51 != v27) {
              objc_enumerationMutation(v44);
            }
            uint64_t v29 = *(void *)(*((void *)&v50 + 1) + 8 * (void)j);
            if (!self->_verificationResultType) {
              objc_storeStrong((id *)&self->_verificationResultType, v42);
            }
            v30 = [(NSMutableDictionary *)self->_saPersons objectForKey:v29];
            v31 = [v30 dsvDescription];
            v32 = +[NSString stringWithValidatedFormat:@"Server has extra: %@", @"%@", 0, v31 validFormatSpecifiers error];

            v33 = AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v71 = "-[DSVServiceProviderContacts verifySyncDataWithCompletion:]";
              __int16 v72 = 2112;
              v73 = v32;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
            }
            [(NSMutableArray *)self->_resultEntries addObject:v32];
          }
          id v26 = [v44 countByEnumeratingWithState:&v50 objects:v68 count:16];
        }
        while (v26);
      }

      if (self->_verificationResultType)
      {
        ((void (*)(void))v38[2])();
      }
      else
      {
        saPersons = self->_saPersons;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100006FD8;
        v47[3] = &unk_10000C418;
        id v48 = v46;
        v49 = self;
        [(NSMutableDictionary *)saPersons enumerateKeysAndObjectsUsingBlock:v47];
        if (!self->_verificationResultType) {
          objc_storeStrong((id *)&self->_verificationResultType, SASyncDeepVerificationResultTypeSUCCESSValue);
        }
        ((void (*)(void))v38[2])();
      }
    }
    else
    {
      ((void (*)(void))v38[2])();
    }

    _Block_object_dispose(&v75, 8);
    id v4 = v37;
  }
}

- (void)handleSyncChunk:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  key = self->_key;
  self->_key = v5;

  [v4 toAdd];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 dsvIdentifier];
        if (![v13 length])
        {
          id v14 = [objc_alloc((Class)NSString) initWithFormat:@"Malformed SAPerson: %@", v12];
          id v15 = AFSiriLogContextSync;
          if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "-[DSVServiceProviderContacts handleSyncChunk:]";
            __int16 v22 = 2112;
            id v23 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
          }
          objc_storeStrong((id *)&self->_verificationResultType, SASyncDeepVerificationResultTypeFIELD_MISMATCHValue);
          [(NSMutableArray *)self->_resultEntries addObject:v14];

          goto LABEL_13;
        }
        [(NSMutableDictionary *)self->_saPersons setObject:v12 forKey:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (BOOL)canHandleSyncChunk:(id)a3
{
  id v3 = a3;
  id v4 = [v3 toAdd];
  v5 = [v4 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v3 toRemove];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)currentVerificationKey
{
  return self->_key;
}

- (DSVServiceProviderContacts)init
{
  v10.receiver = self;
  v10.super_class = (Class)DSVServiceProviderContacts;
  v2 = [(DSVServiceProviderContacts *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    saPersons = v2->_saPersons;
    v2->_saPersons = v3;

    verificationResultType = v2->_verificationResultType;
    v2->_verificationResultType = 0;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    resultEntries = v2->_resultEntries;
    v2->_resultEntries = v6;

    key = v2->_key;
    v2->_key = (NSString *)@"com.apple.contact.people";
  }
  return v2;
}

@end