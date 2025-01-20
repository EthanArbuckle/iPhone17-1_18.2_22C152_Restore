@interface MCSChangeUtilities
+ (id)allMessagesInChanges:(id)a3;
+ (id)flagChangesForKey:(id)a3;
+ (id)mergeMessageChanges:(id)a3 withChanges:(id)a4;
@end

@implementation MCSChangeUtilities

+ (id)flagChangesForKey:(id)a3
{
  id v3 = a3;
  if (!qword_10016B8B0)
  {
    id v4 = objc_alloc((Class)NSDictionary);
    v5 = +[NSNumber numberWithBool:1];
    id v6 = objc_msgSend(v4, "initWithObjectsAndKeys:", v5, MessageIsDeleted, 0, 0);
    v7 = (void *)qword_10016B8B0;
    qword_10016B8B0 = (uint64_t)v6;

    id v8 = objc_alloc((Class)NSDictionary);
    v9 = +[NSNumber numberWithBool:1];
    uint64_t v10 = MessageIsRead;
    id v11 = objc_msgSend(v8, "initWithObjectsAndKeys:", v9, MessageIsRead, 0, 0);
    v12 = (void *)qword_10016B8B8;
    qword_10016B8B8 = (uint64_t)v11;

    id v13 = objc_alloc((Class)NSDictionary);
    v14 = +[NSNumber numberWithBool:0];
    id v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, v10, 0, 0);
    v16 = (void *)qword_10016B8C0;
    qword_10016B8C0 = (uint64_t)v15;

    id v17 = objc_alloc((Class)NSDictionary);
    v18 = +[NSNumber numberWithBool:1];
    uint64_t v19 = MFMessageIsFlagged;
    id v20 = objc_msgSend(v17, "initWithObjectsAndKeys:", v18, MFMessageIsFlagged, 0, 0);
    v21 = (void *)qword_10016B8C8;
    qword_10016B8C8 = (uint64_t)v20;

    id v22 = objc_alloc((Class)NSDictionary);
    v23 = +[NSNumber numberWithBool:0];
    id v24 = objc_msgSend(v22, "initWithObjectsAndKeys:", v23, v19, 0, 0);
    v25 = (void *)qword_10016B8D0;
    qword_10016B8D0 = (uint64_t)v24;
  }
  if ([v3 isEqualToString:@"MCSChangeSetDeletedMessages"])
  {
    v26 = &qword_10016B8B0;
LABEL_13:
    id v27 = (id)*v26;
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"MCSChangeSetReadMessages"])
  {
    v26 = &qword_10016B8B8;
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"MCSChangeSetUnreadMessages"])
  {
    v26 = &qword_10016B8C0;
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"MCSChangeSetFlaggedMessages"])
  {
    v26 = &qword_10016B8C8;
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"MCSChangeSetUnflaggedMessages"])
  {
    v26 = &qword_10016B8D0;
    goto LABEL_13;
  }
  id v27 = 0;
LABEL_14:

  return v27;
}

+ (id)allMessagesInChanges:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
  v5 = [v3 objectForKey:@"MCSChangeSetDeletedMessages"];
  [v4 unionSet:v5];

  id v6 = [v3 objectForKey:@"MCSChangeSetReadMessages"];
  [v4 unionSet:v6];

  v7 = [v3 objectForKey:@"MCSChangeSetUnreadMessages"];
  [v4 unionSet:v7];

  id v8 = [v3 objectForKey:@"MCSChangeSetFlaggedMessages"];
  [v4 unionSet:v8];

  v9 = [v3 objectForKey:@"MCSChangeSetUnflaggedMessages"];
  [v4 unionSet:v9];

  return v4;
}

+ (id)mergeMessageChanges:(id)a3 withChanges:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  id v8 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
  v9 = [v5 objectForKey:@"MCSChangeSetDeletedMessages"];
  [v8 unionSet:v9];

  uint64_t v10 = [v6 objectForKey:@"MCSChangeSetDeletedMessages"];
  [v8 unionSet:v10];

  if ([v8 count]) {
    [v7 setObject:v8 forKey:@"MCSChangeSetDeletedMessages"];
  }
  id v11 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
  v12 = [v5 objectForKey:@"MCSChangeSetReadMessages"];
  [v11 unionSet:v12];

  id v13 = [v6 objectForKey:@"MCSChangeSetReadMessages"];
  [v11 unionSet:v13];

  if ([v11 count]) {
    [v7 setObject:v11 forKey:@"MCSChangeSetReadMessages"];
  }
  id v14 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
  id v15 = [v5 objectForKey:@"MCSChangeSetUnreadMessages"];
  [v14 unionSet:v15];

  v16 = [v6 objectForKey:@"MCSChangeSetUnreadMessages"];
  [v14 unionSet:v16];

  if ([v14 count]) {
    [v7 setObject:v14 forKey:@"MCSChangeSetUnreadMessages"];
  }
  id v17 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
  v18 = [v5 objectForKey:@"MCSChangeSetFlaggedMessages"];
  [v17 unionSet:v18];

  uint64_t v19 = [v6 objectForKey:@"MCSChangeSetFlaggedMessages"];
  [v17 unionSet:v19];

  if ([v17 count]) {
    [v7 setObject:v17 forKey:@"MCSChangeSetFlaggedMessages"];
  }
  id v20 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
  v21 = [v5 objectForKey:@"MCSChangeSetUnflaggedMessages"];
  [v20 unionSet:v21];

  id v22 = [v6 objectForKey:@"MCSChangeSetUnflaggedMessages"];
  [v20 unionSet:v22];

  if ([v20 count]) {
    [v7 setObject:v20 forKey:@"MCSChangeSetUnflaggedMessages"];
  }

  return v7;
}

@end