@interface FBACombinedInbox
- (id)displayText;
- (id)iconSystemImageName;
- (id)predicateForTeam:(id)a3;
- (int64_t)type;
- (unint64_t)unreadCountForTeam:(id)a3;
@end

@implementation FBACombinedInbox

- (int64_t)type
{
  return 1;
}

- (id)displayText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"COMBINED_INBOX" value:&stru_1000F6658 table:0];

  return v3;
}

- (id)iconSystemImageName
{
  return FBKSystemImageNameInbox;
}

- (id)predicateForTeam:(id)a3
{
  return +[FBKContentItem inboxPredicateWithTeam:a3];
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v3 = a3;
  v4 = [v3 managedObjectContext];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003784C;
  v9[3] = &unk_1000F3858;
  id v5 = v3;
  id v10 = v5;
  v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [v6 performBlockAndWait:v9];
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

@end