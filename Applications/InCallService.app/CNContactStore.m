@interface CNContactStore
+ (BOOL)phoneKit_isAuthorized;
+ (id)contactStore;
+ (id)suggestedContactStore;
+ (int64_t)authorizationStatus;
- (id)contactsForHandles:(id)a3 keyDescriptors:(id)a4;
- (id)contactsForHandles:(id)a3 keyDescriptors:(id)a4 alwaysUnifyLabeledValues:(BOOL)a5;
@end

@implementation CNContactStore

+ (int64_t)authorizationStatus
{
  return +[CNContactStore authorizationStatusForEntityType:0];
}

+ (BOOL)phoneKit_isAuthorized
{
  return [a1 authorizationStatus] == (id)3;
}

+ (id)contactStore
{
  if (objc_msgSend(a1, "phoneKit_isAuthorized"))
  {
    id v2 = objc_alloc_init((Class)objc_opt_class());
  }
  else
  {
    v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1001EC448(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v2 = 0;
  }

  return v2;
}

+ (id)suggestedContactStore
{
  if (objc_msgSend(a1, "phoneKit_isAuthorized"))
  {
    if (+[CNContact suggestionsEnabled]) {
      uint64_t v3 = 7;
    }
    else {
      uint64_t v3 = 1;
    }
    uint64_t v4 = [a1 storeWithOptions:v3];
  }
  else
  {
    uint64_t v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EC448(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)contactsForHandles:(id)a3 keyDescriptors:(id)a4
{
  return [(CNContactStore *)self contactsForHandles:a3 keyDescriptors:a4 alwaysUnifyLabeledValues:1];
}

- (id)contactsForHandles:(id)a3 keyDescriptors:(id)a4 alwaysUnifyLabeledValues:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
    v16 = 0;
    goto LABEL_21;
  }
  id v10 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v9];
  uint64_t v11 = +[CNContact predicateForContactsMatchingHandleStrings:v8];
  [v10 setPredicate:v11];

  SEL v12 = NSSelectorFromString(@"setAlwaysUnifyLabeledValues:");
  char v13 = objc_opt_respondsToSelector();
  v14 = sub_1000D5130();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      v33 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ without always unifying labels using contact store %@", buf, 0x16u);
    }

    ((void (*)(id, SEL, BOOL))[v10 methodForSelector:v12])(v10, v12, v5);
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      v33 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ using contact store %@", buf, 0x16u);
    }
  }
  id v29 = 0;
  v17 = [(CNContactStore *)self executeFetchRequest:v10 error:&v29];
  id v18 = v29;
  v19 = v18;
  if (v17)
  {
    v16 = [v17 value];
    v20 = sub_1000D5130();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v16 count];
      *(_DWORD *)buf = 134217984;
      id v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Contact fetch request returned %lu results", buf, 0xCu);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v18 && [v18 code] != (id)200)
  {
    v20 = sub_1000D5130();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1001EC4C0((uint64_t)v19, v20, v22, v23, v24, v25, v26, v27);
    }
    v16 = 0;
    goto LABEL_19;
  }
  v16 = 0;
LABEL_20:

LABEL_21:

  return v16;
}

@end