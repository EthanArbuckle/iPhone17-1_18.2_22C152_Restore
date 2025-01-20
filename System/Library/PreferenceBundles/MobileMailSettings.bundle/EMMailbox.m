@interface EMMailbox
+ (id)mailboxesWithTypes:(id)a3;
- (id)iconFromBundle:(id)a3;
- (int)level;
@end

@implementation EMMailbox

- (id)iconFromBundle:(id)a3
{
  id v4 = a3;
  v5 = +[UIApplication sharedApplication];
  v6 = [v5 mailboxProvider];
  v7 = [(EMMailbox *)self objectID];
  v8 = [v6 legacyMailboxForObjectID:v7];

  v9 = +[MFMailboxUid iconFromBundle:forType:](MFMailboxUid, "iconFromBundle:forType:", v4, [v8 mailboxType]);

  return v9;
}

- (int)level
{
  v3 = +[UIApplication sharedApplication];
  id v4 = [v3 mailboxProvider];
  v5 = [(EMMailbox *)self objectID];
  v6 = [v4 legacyMailboxForObjectID:v5];

  LODWORD(v3) = [v6 level];
  return (int)v3;
}

+ (id)mailboxesWithTypes:(id)a3
{
  v3 = objc_msgSend(a3, "ef_map:", &stru_38CA8);
  id v4 = +[NSCompoundPredicate orPredicateWithSubpredicates:v3];
  v5 = +[EFPromise promise];
  id v6 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v4 sortDescriptors:&__NSArray0__struct];
  v7 = +[UIApplication sharedApplication];
  v8 = [v7 daemonInterface];
  v9 = [v8 mailboxRepository];

  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_E054;
    v15[3] = &unk_38CD0;
    id v16 = v5;
    [v9 performQuery:v6 completionHandler:v15];
  }
  else
  {
    [v5 finishWithResult:&__NSArray0__struct error:0];
  }
  v10 = [v5 future];
  v11 = [v10 result:0];
  v12 = v11;
  if (!v11) {
    v11 = &__NSArray0__struct;
  }
  id v13 = v11;

  return v13;
}

@end