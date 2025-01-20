@interface MFMessageCriterion
- (id)mailServerSideCriterion;
- (id)myEmailAddressesCriterionWithType:(int64_t)a3;
- (id)referencedConversations;
- (id)referencedMailboxes;
- (id)userProfileProvider;
@end

@implementation MFMessageCriterion

- (id)myEmailAddressesCriterionWithType:(int64_t)a3
{
  v4 = [(MFMessageCriterion *)self userProfileProvider];
  v5 = [v4 accountsEmailAddresses];

  v6 = [v5 allObjects];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007A214;
  v10[3] = &unk_10013C8B0;
  v10[4] = a3;
  v7 = objc_msgSend(v6, "ef_map:", v10);

  v8 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v7];

  return v8;
}

- (id)userProfileProvider
{
  return +[MFUserProfileProvider_iOS defaultProvider];
}

- (id)mailServerSideCriterion
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (qword_10016BBD0 != -1) {
    dispatch_once(&qword_10016BBD0, &stru_10013C8D0);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007A46C;
  v7[3] = &unk_10013C8F8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  v3 = [(MFMessageCriterion *)self criterionByApplyingTransform:v7];
  v4 = v3;
  if (*((unsigned char *)v13 + 24) && !*((unsigned char *)v9 + 24)) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

- (id)referencedMailboxes
{
  +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007AAA4;
  v7[3] = &unk_10013C920;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v3;
  id v4 = [(MFMessageCriterion *)self criterionByApplyingTransform:v7];
  id v5 = objc_msgSend(v3, "ef_compactMap:", &stru_10013C940);

  return v5;
}

- (id)referencedConversations
{
  +[EFMutableInt64Set indexSet];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007AC40;
  v6[3] = &unk_10013C920;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  id v4 = [(MFMessageCriterion *)self criterionByApplyingTransform:v6];

  return v3;
}

@end