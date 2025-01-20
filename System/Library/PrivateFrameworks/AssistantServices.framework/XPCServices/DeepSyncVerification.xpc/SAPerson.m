@interface SAPerson
- (id)dsvDescription;
- (id)dsvDiffAgainstCNContact:(id)a3;
- (id)dsvIdentifier;
@end

@implementation SAPerson

- (id)dsvDescription
{
  v2 = [(SAPerson *)self dictionary];
  v3 = [v2 description];

  return v3;
}

- (id)dsvDiffAgainstCNContact:(id)a3
{
  id v4 = a3;
  v5 = @"field: %@, client value: %@, server value:%@";
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [v4 postalAddresses];
  v8 = sub_100008118(v7);
  v9 = [(SAPerson *)self addresses];
  v10 = sub_100008118(v9);
  unsigned __int8 v11 = [v8 isEqualToSet:v10];

  if ((v11 & 1) == 0)
  {
    v12 = [v4 postalAddresses];
    v13 = [(SAPerson *)self addresses];
    v14 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"addresses", v12, v13 validFormatSpecifiers error];
    [v6 addObject:v14];
  }
  v15 = [v4 emailAddresses];
  v16 = sub_100008118(v15);
  v17 = [(SAPerson *)self emails];
  v18 = sub_100008118(v17);
  unsigned __int8 v19 = [v16 isEqualToSet:v18];

  if ((v19 & 1) == 0)
  {
    v20 = [v4 emailAddresses];
    v21 = [(SAPerson *)self emails];
    v22 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"emails", v20, v21 validFormatSpecifiers error];
    [v6 addObject:v22];
  }
  v23 = [v4 phoneNumbers];
  v24 = sub_100008118(v23);
  v25 = [(SAPerson *)self phones];
  v26 = sub_100008118(v25);
  unsigned __int8 v27 = [v24 isEqualToSet:v26];

  if ((v27 & 1) == 0)
  {
    v28 = [v4 phoneNumbers];
    v29 = [(SAPerson *)self phones];
    v30 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"phones", v28, v29 validFormatSpecifiers error];
    [v6 addObject:v30];
  }
  if (![v4 contactType])
  {
    v38 = [v4 givenName];
    if ([v38 length])
    {
      v39 = [v4 givenName];
      v40 = [(SAPerson *)self firstName];
      unsigned __int8 v41 = [v39 isEqualToString:v40];

      if (v41) {
        goto LABEL_16;
      }
      v38 = [v4 givenName];
      v42 = [(SAPerson *)self firstName];
      v43 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"firstName", v38, v42 validFormatSpecifiers error];
      [v6 addObject:v43];
    }
LABEL_16:
    v44 = [v4 familyName];
    if ([v44 length])
    {
      v45 = [v4 familyName];
      v46 = [(SAPerson *)self lastName];
      unsigned __int8 v47 = [v45 isEqualToString:v46];

      if (v47) {
        goto LABEL_20;
      }
      v44 = [v4 familyName];
      v48 = [(SAPerson *)self lastName];
      v49 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"lastName", v44, v48 validFormatSpecifiers error];
      [v6 addObject:v49];
    }
LABEL_20:
    v50 = [v4 nickname];
    if ([v50 length])
    {
      v51 = [v4 nickname];
      v52 = [(SAPerson *)self nickName];
      unsigned __int8 v53 = [v51 isEqualToString:v52];

      if (v53) {
        goto LABEL_24;
      }
      v50 = [v4 nickname];
      v54 = [(SAPerson *)self nickName];
      v55 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"nickName", v50, v54 validFormatSpecifiers error];
      [v6 addObject:v55];
    }
LABEL_24:
    v56 = [(SAPerson *)self relatedNames];
    v31 = [v56 sortedArrayUsingComparator:&stru_10000C360];

    v57 = [v4 contactRelations];
    v58 = [v57 sortedArrayUsingComparator:&stru_10000C3A0];

    uint64_t v100 = 0;
    v101 = &v100;
    uint64_t v102 = 0x2020000000;
    char v103 = 0;
    id v59 = [v31 count];
    if (v59 == [v58 count])
    {
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_100008590;
      v97[3] = &unk_10000C3C8;
      id v98 = v58;
      v99 = &v100;
      [v31 enumerateObjectsUsingBlock:v97];
    }
    if (*((unsigned char *)v101 + 24))
    {
      v60 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"relatedNames", v31, v58 validFormatSpecifiers error];
      [v6 addObject:v60];
    }
    v61 = [v4 phoneticGivenName];
    if ([v61 length])
    {
      v62 = [v4 phoneticGivenName];
      v63 = [(SAPerson *)self firstNamePhonetic];
      unsigned __int8 v64 = [v62 isEqualToString:v63];

      if (v64) {
        goto LABEL_32;
      }
      v61 = [v4 phoneticGivenName];
      v65 = [(SAPerson *)self firstNamePhonetic];
      v66 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"firstNamePhonetic", v61, v65 validFormatSpecifiers error];
      [v6 addObject:v66];
    }
LABEL_32:
    v67 = [v4 phoneticFamilyName];
    if ([v67 length])
    {
      v68 = [v4 phoneticFamilyName];
      v69 = [(SAPerson *)self lastNamePhonetic];
      unsigned __int8 v70 = [v68 isEqualToString:v69];

      if (v70) {
        goto LABEL_36;
      }
      v67 = [v4 phoneticFamilyName];
      v71 = [(SAPerson *)self lastNamePhonetic];
      v72 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"lastNamePhonetic", v67, v71 validFormatSpecifiers error];
      [v6 addObject:v72];
    }
LABEL_36:
    v73 = [v4 middleName];
    if ([v73 length])
    {
      v74 = [v4 middleName];
      v75 = [(SAPerson *)self middleName];
      unsigned __int8 v76 = [v74 isEqualToString:v75];

      if (v76) {
        goto LABEL_40;
      }
      v73 = [v4 middleName];
      v77 = [(SAPerson *)self middleName];
      v78 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"middleName", v73, v77 validFormatSpecifiers error];
      [v6 addObject:v78];
    }
LABEL_40:
    v79 = [v4 namePrefix];
    if ([v79 length])
    {
      v80 = [v4 namePrefix];
      v81 = [(SAPerson *)self prefix];
      unsigned __int8 v82 = [v80 isEqualToString:v81];

      if (v82) {
        goto LABEL_44;
      }
      v79 = [v4 namePrefix];
      v83 = [(SAPerson *)self prefix];
      v84 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"prefix", v79, v83 validFormatSpecifiers error];
      [v6 addObject:v84];
    }
LABEL_44:
    v85 = [v4 nameSuffix];
    if ([v85 length])
    {
      v86 = [v4 nameSuffix];
      v87 = [(SAPerson *)self suffix];
      unsigned __int8 v88 = [v86 isEqualToString:v87];

      if (v88)
      {
LABEL_48:
        _Block_object_dispose(&v100, 8);

LABEL_49:
        goto LABEL_50;
      }
      v85 = [v4 nameSuffix];
      v89 = [(SAPerson *)self suffix];
      v90 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"suffix", v85, v89 validFormatSpecifiers error];
      [v6 addObject:v90];
    }
    goto LABEL_48;
  }
  if ([v4 contactType] != (id)1) {
    goto LABEL_50;
  }
  v31 = [v4 organizationName];
  if (![v31 length]) {
    goto LABEL_49;
  }
  v32 = [v4 organizationName];
  v33 = [(SAPerson *)self company];
  unsigned __int8 v34 = [v32 isEqualToString:v33];

  if ((v34 & 1) == 0)
  {
    v35 = [v4 organizationName];
    v36 = [(SAPerson *)self company];
    v37 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"company", v35, v36 validFormatSpecifiers error];
    [v6 addObject:v37];
  }
LABEL_50:
  if ([v6 count])
  {
    v91 = [v6 componentsJoinedByString:@"\n"];
    id v92 = objc_alloc((Class)NSString);
    v93 = [(SAPerson *)self identifier];
    v94 = [v4 identifier];
    id v95 = [v92 initWithFormat:@"Diff for SAPerson %@ with contactIdentifier=%@:\n %@", v93, v94, v91];
  }
  else
  {
    id v95 = 0;
  }

  return v95;
}

- (id)dsvIdentifier
{
  v3 = [(SAPerson *)self internalGUID];
  if (![v3 length])
  {
    id v4 = [(SAPerson *)self identifier];
    v5 = [v4 absoluteString];

    id v6 = [v5 componentsSeparatedByString:@"recordID="];
    if ([v6 count] == (id)2)
    {
      v7 = [v6 objectAtIndex:1];
      v8 = [v7 componentsSeparatedByString:@"databaseID"];

      if ([v8 count] == (id)2)
      {
        uint64_t v9 = [v8 firstObject];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
      v8 = v3;
    }

    v3 = (void *)v9;
  }
  return v3;
}

@end