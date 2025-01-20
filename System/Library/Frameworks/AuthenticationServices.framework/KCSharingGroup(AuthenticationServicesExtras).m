@interface KCSharingGroup(AuthenticationServicesExtras)
- (id)_subtitleForNumberOfGroupMembersNotSavedAsContacts:()AuthenticationServicesExtras;
- (id)as_groupMemberTableViewCellDescription;
@end

@implementation KCSharingGroup(AuthenticationServicesExtras)

- (id)as_groupMemberTableViewCellDescription
{
  v2 = [a1 participants];
  uint64_t v3 = [v2 count];

  if (v3 == 1)
  {
    v4 = _WBSLocalizedString();
    goto LABEL_23;
  }
  v5 = +[_ASAccountSharingGroupMemberDataManager sharedManager];
  v6 = [v5 groupMemberDataForGroup:a1];

  v7 = objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_9);
  uint64_t v8 = [v6 count];
  uint64_t v9 = v8 + ~[v7 count];
  uint64_t v10 = [v7 count];
  if (v10 == 2)
  {
    v11 = NSString;
    if (!v9)
    {
      v12 = _WBSLocalizedString();
      v13 = [v7 objectAtIndexedSubscript:0];
      v14 = [v7 objectAtIndexedSubscript:1];
      uint64_t v19 = objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);
      goto LABEL_19;
    }
    v12 = _WBSLocalizedString();
    v13 = [v7 objectAtIndexedSubscript:0];
    v14 = [v7 objectAtIndexedSubscript:1];
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v13, v14, v9);
    uint64_t v19 = LABEL_15:;
LABEL_19:
    v4 = (void *)v19;
    goto LABEL_20;
  }
  if (v10 == 1)
  {
    v15 = NSString;
    v12 = _WBSLocalizedString();
    v13 = [v7 objectAtIndexedSubscript:0];
    if (v9) {
      objc_msgSend(v15, "localizedStringWithFormat:", v12, v13, v9);
    }
    else {
    v4 = objc_msgSend(v15, "stringWithFormat:", v12, v13);
    }
    goto LABEL_21;
  }
  if (v10)
  {
    uint64_t v16 = [v7 count];
    v17 = NSString;
    if (v16 == 3 && !v9)
    {
      v12 = _WBSLocalizedString();
      v13 = [v7 objectAtIndexedSubscript:0];
      v14 = [v7 objectAtIndexedSubscript:1];
      v18 = [v7 objectAtIndexedSubscript:2];
      v4 = objc_msgSend(v17, "stringWithFormat:", v12, v13, v14, v18);

LABEL_20:
LABEL_21:

      goto LABEL_22;
    }
    v12 = _WBSLocalizedString();
    v13 = [v7 objectAtIndexedSubscript:0];
    v14 = [v7 objectAtIndexedSubscript:1];
    objc_msgSend(v17, "localizedStringWithFormat:", v12, v13, v14, objc_msgSend(v6, "count") - 3);
    goto LABEL_15;
  }
  v4 = objc_msgSend(a1, "_subtitleForNumberOfGroupMembersNotSavedAsContacts:", objc_msgSend(v6, "count"));
LABEL_22:

LABEL_23:

  return v4;
}

- (id)_subtitleForNumberOfGroupMembersNotSavedAsContacts:()AuthenticationServicesExtras
{
  if (a3 == 2 || (uint64_t v3 = a3 - 1, a3 == 1))
  {
    v4 = _WBSLocalizedString();
  }
  else
  {
    v5 = NSString;
    v6 = _WBSLocalizedString();
    v4 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
  }

  return v4;
}

@end