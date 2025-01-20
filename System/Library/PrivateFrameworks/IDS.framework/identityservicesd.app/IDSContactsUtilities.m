@interface IDSContactsUtilities
- (CNContactStore)contactStore;
- (IDSContactsUtilities)init;
- (id)nameForContactMatchingURI:(id)a3;
- (id)predicateForURI:(id)a3;
- (int64_t)countOfHandles;
- (void)setContactStore:(id)a3;
@end

@implementation IDSContactsUtilities

- (IDSContactsUtilities)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSContactsUtilities;
  v2 = [(IDSContactsUtilities *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)qword_100A4AA58;
    uint64_t v13 = qword_100A4AA58;
    if (!qword_100A4AA58)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001EEEBC;
      v9[3] = &unk_10097ED88;
      v9[4] = &v10;
      sub_1001EEEBC((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (CNContactStore *)objc_alloc_init(v4);
    contactStore = v2->_contactStore;
    v2->_contactStore = v5;
  }
  return v2;
}

- (id)predicateForURI:(id)a3
{
  id v3 = a3;
  id v4 = [v3 FZIDType];
  if (v4)
  {
    if (v4 == (id)1)
    {
      v5 = [v3 unprefixedURI];
      v6 = [sub_1001EDEB0() predicateForContactsMatchingEmailAddress:v5];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v7 = (void *)qword_100A4AA70;
    uint64_t v16 = qword_100A4AA70;
    if (!qword_100A4AA70)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1001EF0D8;
      v12[3] = &unk_10097ED88;
      v12[4] = &v13;
      sub_1001EF0D8((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    v9 = [v3 unprefixedURI];
    uint64_t v10 = [v8 phoneNumberWithStringValue:v9];

    v6 = [sub_1001EDEB0() predicateForContactsMatchingPhoneNumber:v10];
  }

  return v6;
}

- (id)nameForContactMatchingURI:(id)a3
{
  id v4 = a3;
  v5 = [(IDSContactsUtilities *)self predicateForURI:v4];
  if (v5)
  {
    *(void *)&long long v39 = 0;
    *((void *)&v39 + 1) = &v39;
    uint64_t v40 = 0x3032000000;
    v41 = sub_1001EE5B0;
    v42 = sub_1001EE5C0;
    id v43 = 0;
    v6 = [sub_1001EE5C8() descriptorForRequiredKeysForStyle:0];
    v38[0] = v6;
    v7 = sub_1001EE6B0();
    v38[1] = v7;
    id v8 = sub_1001EE7BC();
    v38[2] = v8;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    v9 = (id *)qword_100A4AA90;
    uint64_t v37 = qword_100A4AA90;
    if (!qword_100A4AA90)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1001EF228;
      v45 = &unk_10097ED88;
      v46 = &v34;
      uint64_t v10 = (void *)sub_1001EEF14();
      v11 = dlsym(v10, "CNContactGivenNameKey");
      *(void *)(v46[1] + 24) = v11;
      qword_100A4AA90 = *(void *)(v46[1] + 24);
      v9 = (id *)v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (v9)
    {
      id v12 = *v9;
      v38[3] = v12;
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v13 = (id *)qword_100A4AA98;
      uint64_t v37 = qword_100A4AA98;
      if (!qword_100A4AA98)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1001EF278;
        v45 = &unk_10097ED88;
        v46 = &v34;
        v14 = (void *)sub_1001EEF14();
        uint64_t v15 = dlsym(v14, "CNContactFamilyNameKey");
        *(void *)(v46[1] + 24) = v15;
        qword_100A4AA98 = *(void *)(v46[1] + 24);
        uint64_t v13 = (id *)v35[3];
      }
      _Block_object_dispose(&v34, 8);
      if (v13)
      {
        id v16 = *v13;
        v38[4] = v16;
        v17 = sub_1001EE8C8();
        v38[5] = v17;
        v18 = +[NSArray arrayWithObjects:v38 count:6];

        id v19 = [objc_alloc((Class)sub_1001EE9D4()) initWithKeysToFetch:v18];
        [v19 setPredicate:v5];
        v20 = +[IDSFoundationLog ContactsUtilities];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v5;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching contacts for predicate %@", buf, 0xCu);
        }

        contactStore = self->_contactStore;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1001EEABC;
        v32[3] = &unk_100985D60;
        v32[4] = &v39;
        id v33 = 0;
        [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v19 error:&v33 usingBlock:v32];
        id v22 = v33;
        v23 = +[IDSFoundationLog ContactsUtilities];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 40);
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v4;
          *(_WORD *)&buf[22] = 2112;
          v45 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found contact %@, for URI %@ with error %@", buf, 0x20u);
        }

        if (*(void *)(*((void *)&v39 + 1) + 40))
        {
          v25 = [sub_1001EE5C8() stringFromContact:*(void *)(*((void *)&v39 + 1) + 40) style:0];
        }
        else
        {
          v25 = 0;
        }

        _Block_object_dispose(&v39, 8);
        goto LABEL_19;
      }
      v30 = +[NSAssertionHandler currentHandler];
      v31 = +[NSString stringWithUTF8String:"NSString *getCNContactFamilyNameKey(void)"];
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"IDSContactsUtilities.m", 25, @"%s", dlerror());
    }
    else
    {
      v28 = +[NSAssertionHandler currentHandler];
      v29 = +[NSString stringWithUTF8String:"NSString *getCNContactGivenNameKey(void)"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"IDSContactsUtilities.m", 24, @"%s", dlerror());
    }
    __break(1u);
  }
  v26 = +[IDSFoundationLog ContactsUtilities];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v39) = 138412290;
    *(void *)((char *)&v39 + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No predicate found for URI %@", (uint8_t *)&v39, 0xCu);
  }

  v25 = 0;
LABEL_19:

  return v25;
}

- (int64_t)countOfHandles
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v3 = sub_1001EE6B0();
  v21[0] = v3;
  id v4 = sub_1001EE7BC();
  v21[1] = v4;
  v5 = sub_1001EE8C8();
  v21[2] = v5;
  v6 = +[NSArray arrayWithObjects:v21 count:3];

  id v7 = [objc_alloc((Class)sub_1001EE9D4()) initWithKeysToFetch:v6];
  contactStore = self->_contactStore;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001EEDF8;
  v13[3] = &unk_100985D60;
  v13[4] = &v15;
  id v14 = 0;
  [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v7 error:&v14 usingBlock:v13];
  id v9 = v14;
  uint64_t v10 = +[IDSFoundationLog ContactsUtilities];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enumerated contact handles with error %@", buf, 0xCu);
  }

  int64_t v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v11;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end