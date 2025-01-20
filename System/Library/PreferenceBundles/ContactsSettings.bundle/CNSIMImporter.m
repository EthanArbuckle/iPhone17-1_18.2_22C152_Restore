@interface CNSIMImporter
+ (BOOL)isContact:(id)a3 presentInContainer:(id)a4 store:(id)a5;
+ (id)importPhonebookEntry:(id)a3 intoContactStore:(id)a4 container:(id)a5;
+ (id)log;
+ (id)nameComponentsFromString:(id)a3;
+ (id)prepareName:(id)a3;
+ (void)setNameString:(id)a3 onContact:(id)a4;
@end

@implementation CNSIMImporter

+ (id)importPhonebookEntry:(id)a3 intoContactStore:(id)a4 container:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v49 = a5;
  id v51 = objc_alloc_init((Class)CNSaveRequest);
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 1;
  v9 = +[NSCharacterSet whitespaceCharacterSet];
  v50 = v8;
  uint64_t v10 = [v7 objectForKey:kCTPhoneBookNameKey];
  if (v10) {
    v11 = (__CFString *)v10;
  }
  else {
    v11 = &stru_10D88;
  }
  v48 = v7;
  uint64_t v12 = [v7 objectForKey:kCTPhoneBookNumberKey];
  if (v12) {
    v13 = (__CFString *)v12;
  }
  else {
    v13 = &stru_10D88;
  }
  v14 = [(__CFString *)v11 stringByTrimmingCharactersInSet:v9];

  v52 = [(__CFString *)v13 stringByTrimmingCharactersInSet:v9];

  uint64_t v15 = CNIsStringEmpty;
  int v16 = (*(uint64_t (**)(void, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v14);
  int v17 = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v52);
  if (v16 & v17)
  {
    id v18 = 0;
  }
  else
  {
    v46 = CNLabelPhoneNumberMobile;
    v19 = (char *)[v14 length];
    if ((unint64_t)v19 >= 3 && [v14 characterAtIndex:v19 - 2] == 47)
    {
      __darwin_ct_rune_t v20 = __toupper((__darwin_ct_rune_t)[v14 characterAtIndex:v19 - 1]);
      if (v20 != 72)
      {
        if (v20 == 87) {
          v21 = (id *)&CNLabelWork;
        }
        else {
          v21 = (id *)&CNLabelOther;
        }
        v22 = (NSString *)*v21;

        v46 = v22;
      }
      v23 = [v14 substringToIndex:v19 - 2];
      uint64_t v24 = [v23 stringByTrimmingCharactersInSet:v9];

      v14 = (void *)v24;
    }
    id v18 = objc_alloc_init((Class)CNMutableContact);
    if ((v17 & 1) == 0)
    {
      v25 = +[CNPhoneNumber phoneNumberWithStringValue:v52];
      v26 = +[CNLabeledValue labeledValueWithLabel:v46 value:v25];
      v79 = v26;
      v27 = +[NSArray arrayWithObjects:&v79 count:1];
      [v18 setPhoneNumbers:v27];
    }
    if ((v16 & 1) == 0)
    {
      [a1 setNameString:v14 onContact:v18];
      uint64_t v28 = +[CNContactFormatter stringFromContact:v18 style:0];

      v14 = (void *)v28;
    }
    char v29 = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v14);
    id v45 = objc_alloc_init((Class)CNContactFormatter);
    int v30 = *((unsigned __int8 *)v74 + 24);
    if (*((unsigned char *)v74 + 24)) {
      char v31 = v17;
    }
    else {
      char v31 = 1;
    }
    if ((v31 & 1) == 0)
    {
      v32 = +[CNPhoneNumber phoneNumberWithStringValue:v52];
      v33 = +[CNContact predicateForContactsMatchingPhoneNumber:v32];

      v34 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
      v78 = v34;
      v35 = +[NSArray arrayWithObjects:&v78 count:1];

      v36 = [v50 unifiedContactsMatchingPredicate:v33 keysToFetch:v35 error:0];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_3ED4;
      v65[3] = &unk_109A0;
      id v66 = v49;
      id v71 = a1;
      id v67 = v50;
      id v68 = v45;
      char v72 = v29 ^ 1;
      id v69 = v14;
      v70 = &v73;
      [v36 enumerateObjectsUsingBlock:v65];

      int v30 = *((unsigned __int8 *)v74 + 24);
    }
    if (v30) {
      char v37 = v29;
    }
    else {
      char v37 = 1;
    }
    if ((v37 & 1) == 0)
    {
      v38 = +[CNContact predicateForContactsMatchingName:v14];
      v39 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
      v77[0] = v39;
      v77[1] = CNContactPhoneNumbersKey;
      v40 = +[NSArray arrayWithObjects:v77 count:2];

      v41 = [v50 unifiedContactsMatchingPredicate:v38 keysToFetch:v40 error:0];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_3F90;
      v54[3] = &unk_109C8;
      id v55 = v49;
      id v63 = a1;
      id v56 = v50;
      id v57 = v45;
      id v58 = v14;
      v62 = &v73;
      char v64 = v17 ^ 1;
      id v59 = v52;
      v60 = v46;
      id v61 = v51;
      [v41 enumerateObjectsUsingBlock:v54];

      int v30 = *((unsigned __int8 *)v74 + 24);
    }
    if (v30)
    {
      v42 = [v49 identifier];
      [v51 addContact:v18 toContainerWithIdentifier:v42];
    }
    else
    {
      v42 = v18;
      id v18 = 0;
    }

    id v53 = 0;
    [v50 executeSaveRequest:v51 error:&v53];
    id v43 = v53;
    NSLog(@"error %@", v43);
  }
  _Block_object_dispose(&v73, 8);

  return v18;
}

+ (BOOL)isContact:(id)a3 presentInContainer:(id)a4 store:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [a3 identifier];
  uint64_t v10 = +[CNContainer predicateForContainerOfContactWithIdentifier:v9];

  v11 = [v7 containersMatchingPredicate:v10 error:0];

  uint64_t v12 = [v11 firstObject];
  v13 = [v12 identifier];
  v14 = [v8 identifier];

  LOBYTE(v8) = [v13 isEqualToString:v14];
  return (char)v8;
}

+ (void)setNameString:(id)a3 onContact:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (((*(uint64_t (**)(void, id))(CNIsStringEmpty + 16))(CNIsStringEmpty, v9) & 1) == 0)
  {
    id v7 = [a1 nameComponentsFromString:v9];
    id v8 = v7;
    if (v7) {
      [v7 overrideComponentsInContact:v6];
    }
    else {
      [v6 setGivenName:v9];
    }
  }
}

+ (id)nameComponentsFromString:(id)a3
{
  id v4 = a3;
  v5 = [a1 prepareName:v4];
  if (qword_158F8 != -1) {
    dispatch_once(&qword_158F8, &stru_109E8);
  }
  id v6 = (id)qword_15900;
  id v7 = [v6 personNameComponentsFromString:v5];

  return v7;
}

+ (id)prepareName:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCharacterSet characterSetWithCharactersInString:@">"];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

+ (id)log
{
  if (qword_15908 != -1) {
    dispatch_once(&qword_15908, &stru_10A08);
  }
  v2 = (void *)qword_15910;

  return v2;
}

@end