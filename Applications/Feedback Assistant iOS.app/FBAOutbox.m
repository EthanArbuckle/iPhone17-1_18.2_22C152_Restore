@interface FBAOutbox
- (BOOL)supportsDeletion;
- (BOOL)supportsSelection;
- (id)displayText;
- (id)fetchRequesForInboxItemsInTeam:(id)a3;
- (id)iconSystemImageName;
- (id)predicateForTeam:(id)a3;
- (int64_t)type;
- (unint64_t)unreadCountForTeam:(id)a3;
@end

@implementation FBAOutbox

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
  return 3;
}

- (id)displayText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"OUTBOX_INBOX" value:&stru_1000F6658 table:0];

  return v3;
}

- (id)iconSystemImageName
{
  return FBKSystemImageNameOutbox;
}

- (id)predicateForTeam:(id)a3
{
  return +[FBKContentItem outboxPredicateWithTeam:a3];
}

- (id)fetchRequesForInboxItemsInTeam:(id)a3
{
  id v4 = a3;
  v5 = +[FBKContentItem fetchRequest];
  v6 = [(FBAOutbox *)self predicateForTeam:v4];

  [v5 setPredicate:v6];

  return v5;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  return 0;
}

@end