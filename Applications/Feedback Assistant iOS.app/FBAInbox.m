@interface FBAInbox
- (BOOL)isCountingUnreadOnly;
- (BOOL)supportsDeletion;
- (BOOL)supportsSelection;
- (NSString)displayText;
- (NSString)iconSystemImageName;
- (UIImage)icon;
- (UIImageSymbolConfiguration)iconConfiguration;
- (id)diffableIdentifier;
- (id)inboxItemsForTeam:(id)a3 withSortDescriptors:(id)a4;
- (id)predicateForTeam:(id)a3;
- (int64_t)type;
- (unint64_t)unreadCountForTeam:(id)a3;
@end

@implementation FBAInbox

- (BOOL)supportsSelection
{
  return 0;
}

- (BOOL)supportsDeletion
{
  return 0;
}

- (NSString)displayText
{
  return (NSString *)&stru_1000F6658;
}

- (UIImageSymbolConfiguration)iconConfiguration
{
  if (qword_100124048 != -1) {
    dispatch_once(&qword_100124048, &stru_1000F3148);
  }
  v2 = (void *)qword_100124040;

  return (UIImageSymbolConfiguration *)v2;
}

- (NSString)iconSystemImageName
{
  return (NSString *)FBKSystemImageNamePaper;
}

- (UIImage)icon
{
  v3 = [(FBAInbox *)self iconSystemImageName];
  v4 = +[UIImage systemImageNamed:v3];
  v5 = [(FBAInbox *)self iconConfiguration];
  v6 = [v4 imageWithConfiguration:v5];

  return (UIImage *)v6;
}

- (id)inboxItemsForTeam:(id)a3 withSortDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[FBKData sharedInstance];
  v9 = [v8 currentUser];

  if (v9)
  {
    v10 = [(FBAInbox *)self predicateForTeam:v6];
    v11 = [v9 contentItems];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100024B6C;
    v16[3] = &unk_1000F3170;
    id v17 = v10;
    id v12 = v10;
    v13 = [v11 ded_selectItemsPassingTest:v16];

    v14 = [v13 sortedArrayUsingDescriptors:v7];
  }
  else
  {
    v14 = &__NSArray0__struct;
  }

  return v14;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  return 0;
}

- (id)predicateForTeam:(id)a3
{
  return 0;
}

- (BOOL)isCountingUnreadOnly
{
  return 1;
}

- (id)diffableIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (int64_t)type
{
  return 1;
}

@end