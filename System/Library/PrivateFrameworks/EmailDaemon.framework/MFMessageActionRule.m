@interface MFMessageActionRule
+ (id)log;
- (BOOL)canExecuteRuleOnMessage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldIncludeInNewMessagesSet;
- (MFMessageActionRule)initWithMessageActions:(id)a3;
- (NSArray)actions;
- (id)_firstActionsDestination;
- (unint64_t)_flagColorForActionFlagColor:(int64_t)a3;
- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4;
@end

@implementation MFMessageActionRule

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077FC0;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BBA8 != -1) {
    dispatch_once(&qword_10016BBA8, block);
  }
  v2 = (void *)qword_10016BBA0;

  return v2;
}

- (MFMessageActionRule)initWithMessageActions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageActionRule;
  v6 = [(MFMessageActionRule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_actions, a3);
  }

  return v7;
}

- (BOOL)canExecuteRuleOnMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMessageActionRule *)self _firstActionsDestination];
  v6 = v5;
  if (v5)
  {
    [v5 mailboxType];
    uint64_t v7 = mailboxUIDTypeFromECMailboxType();
    v8 = [v4 mailbox];
    id v9 = [v8 type];

    if (v7) {
      BOOL v10 = v7 == (void)v9;
    }
    else {
      BOOL v10 = 0;
    }
    BOOL v11 = !v10;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)shouldIncludeInNewMessagesSet
{
  v2 = [(MFMessageActionRule *)self _firstActionsDestination];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  v32 = v6;
  v30 = objc_msgSend(v6, "ef_groupBy:", &stru_10013C788);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = [(MFMessageActionRule *)self actions];
  id v7 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (!v7)
  {

    id v24 = v6;
    char v12 = 0;
    char v36 = 0;
    char v11 = 0;
    char v10 = 0;
    LOBYTE(v9) = 0;
    id v8 = 0;
    uint64_t v34 = 1;
    goto LABEL_43;
  }
  v33 = self;
  id v8 = 0;
  int v9 = 0;
  char v10 = 0;
  char v11 = 0;
  char v36 = 0;
  char v12 = 0;
  uint64_t v13 = *(void *)v55;
  uint64_t v34 = 1;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v55 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      v16 = [v15 destination];

      if (v16)
      {
        if (v8)
        {
          v17 = +[MFMessageActionRule log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = [v15 destination];
            sub_1000C1D58(v18, buf, &v59, v17);
          }
        }
        else
        {
          id v8 = [v15 destination];
        }
      }
      if ([v15 readStatus] == (id)1)
      {
        if (v10)
        {
          v19 = +[MFMessageActionRule log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1000C1D00(&v52, v53);
          }
          char v10 = 1;
LABEL_21:

          goto LABEL_24;
        }
        char v10 = 0;
        int v9 = 1;
        char v12 = 1;
      }
      else
      {
        BOOL v20 = [v15 readStatus] == (id)2;
        if ((v20 & v9) == 1)
        {
          v19 = +[MFMessageActionRule log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1000C1D2C(&v50, v51);
          }
          int v9 = 1;
          goto LABEL_21;
        }
        v10 |= v20;
        v12 |= v20;
      }
LABEL_24:
      v21 = [v15 flagChange];
      v22 = v21;
      if (!v21) {
        goto LABEL_38;
      }
      if ([v21 flag])
      {
        if (v11)
        {
          v23 = +[MFMessageActionRule log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1000C1CD4(&v46, v47);
          }
          char v11 = 1;
LABEL_34:

          goto LABEL_38;
        }
        uint64_t v34 = -[MFMessageActionRule _flagColorForActionFlagColor:](v33, "_flagColorForActionFlagColor:", [v22 flag]);
        char v11 = 0;
        char v36 = 1;
      }
      else
      {
        if (v36)
        {
          v23 = +[MFMessageActionRule log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1000C1CA8(&v48, v49);
          }
          char v36 = 1;
          goto LABEL_34;
        }
        char v36 = 0;
        char v11 = 1;
      }
      char v12 = 1;
LABEL_38:
    }
    id v7 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  }
  while (v7);

  id v24 = v32;
  if (v8)
  {
    id v25 = objc_alloc_init((Class)NSMutableArray);

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100078820;
    v42[3] = &unk_10013C7B0;
    id v8 = v8;
    id v43 = v8;
    id v26 = v25;
    id v44 = v26;
    id v45 = v31;
    [v30 enumerateKeysAndObjectsUsingBlock:v42];
    v27 = v45;
    id v24 = v26;
  }
LABEL_43:
  if ((([v24 count] != 0) & v12) == 1)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100078A00;
    v37[3] = &unk_10013C7D0;
    char v38 = v9 & 1;
    char v39 = v10 & 1;
    char v40 = v36 & 1;
    v37[4] = v34;
    char v41 = v11 & 1;
    id v28 = [objc_alloc((Class)ECMessageFlagChange) initWithBuilder:v37];
    id v29 = [v31 applyFlagChange:v28 toMessages:v24];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    id v7 = [(MFMessageActionRule *)self actions];
    id v8 = [v6 actions];
    unsigned __int8 v9 = [v7 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)_firstActionsDestination
{
  v2 = [(MFMessageActionRule *)self actions];
  BOOL v3 = objc_msgSend(v2, "ef_firstObjectPassingTest:", &stru_10013C810);

  id v4 = [v3 destination];

  return v4;
}

- (unint64_t)_flagColorForActionFlagColor:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 7) {
    return 1;
  }
  else {
    return a3 - 2;
  }
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
}

@end