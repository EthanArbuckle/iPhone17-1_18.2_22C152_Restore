@interface FBADraftsInbox
- (BOOL)supportsDeletion;
- (BOOL)supportsSelection;
- (id)displayText;
- (id)fetchRequesForInboxItemsInTeam:(id)a3;
- (id)iconSystemImageName;
- (id)predicateForTeam:(id)a3;
- (int64_t)type;
- (unint64_t)unreadCountForTeam:(id)a3;
@end

@implementation FBADraftsInbox

- (BOOL)supportsSelection
{
  return 1;
}

- (BOOL)supportsDeletion
{
  return 1;
}

- (int64_t)type
{
  return 0;
}

- (id)displayText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DRAFTS_INBOX" value:&stru_1000F6658 table:0];

  return v3;
}

- (id)iconSystemImageName
{
  return FBKSystemImageNameDrafts;
}

- (id)predicateForTeam:(id)a3
{
  return +[FBKContentItem draftsPredicateWithTeam:a3];
}

- (id)fetchRequesForInboxItemsInTeam:(id)a3
{
  id v4 = a3;
  v5 = +[FBKContentItem fetchRequest];
  v6 = [(FBADraftsInbox *)self predicateForTeam:v4];

  [v5 setPredicate:v6];

  return v5;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v4 = a3;
  v5 = [v4 managedObjectContext];
  v6 = [(FBADraftsInbox *)self fetchRequesForInboxItemsInTeam:v4];

  uint64_t v10 = 0;
  id v7 = [v5 countForFetchRequest:v6 error:&v10];
  uint64_t v8 = v10;

  if (v8) {
    return 0;
  }
  else {
    return (unint64_t)v7;
  }
}

@end