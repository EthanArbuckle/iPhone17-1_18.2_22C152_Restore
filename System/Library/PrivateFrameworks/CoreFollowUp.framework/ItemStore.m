@interface ItemStore
+ (id)sharedInstance;
- (BOOL)_unsafe_deleteActionWithID:(int64_t)a3;
- (BOOL)deleteFollowUpItem:(id)a3;
- (BOOL)deleteNotificationForFollowUpItem:(id)a3;
- (BOOL)insertFollowUpItem:(id)a3;
- (BOOL)updateNotificationForFollowUpItem:(id)a3;
- (FLSQLiteExecutor)queryExecutor;
- (double)intervalFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)_unsafeSelectNotificationForFollowUpItem:(id)a3;
- (id)allFollowUpItems;
- (id)dataFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)dateFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)safeSelectFollowUpActions;
- (id)safeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3;
- (id)safeSelectFollowUpNotifications;
- (id)stringFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)urlFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (int64_t)_unsafe_insertAction:(id)a3 item:(id)a4;
- (int64_t)_unsafe_insertFollowUpItem:(id)a3;
- (int64_t)_unsafe_insertNotificationForItem:(id)a3;
- (void)_closeDatabase;
- (void)_openDatabase;
- (void)_unsafeSelectFollowUpActionsForItem:(id)a3 orActionID:(int64_t)a4 rowHandler:(id)a5;
- (void)_unsafeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3 rowHandler:(id)a4;
- (void)_unsafeSelectFollowUpNotificationsWithRowHandler:(id)a3;
- (void)_wipeDatabase;
- (void)setQueryExecutor:(id)a3;
@end

@implementation ItemStore

+ (id)sharedInstance
{
  if (qword_100022E88 != -1) {
    dispatch_once(&qword_100022E88, &stru_10001C938);
  }
  v2 = (void *)qword_100022E80;

  return v2;
}

- (id)allFollowUpItems
{
  return [(ItemStore *)self safeSelectFollowUpItemsWithUniqueIdentifiers:0];
}

- (void)_unsafeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3 rowHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableString stringWithString:@"SELECT id, uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, extension_identifier, group_identifier, target_bundle_identifier, representing_bundle_path, bundle_icon_name, informative_footer_text, category_identifier, expiration_date, account_id, type_id, collection_id FROM items"];
  if ([v6 count])
  {
    [v8 appendString:@" WHERE"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([v9 indexOfObject:*(void *)(*((void *)&v26 + 1) + 8 * (void)v13)]) {
            [v8 appendFormat:@" OR"];
          }
          [v8 appendFormat:@" uuid = ?"];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }
  }
  [v8 appendFormat:@" ORDER BY id"];
  v14 = +[FLSQLiteQuery queryWithString:v8];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100002E68;
  v24[3] = &unk_10001C988;
  id v15 = v6;
  id v25 = v15;
  [v14 setBindHandler:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000859C;
  v22[3] = &unk_10001CB10;
  v22[4] = self;
  id v16 = v7;
  id v23 = v16;
  [v14 setRowHandler:v22];
  queryExecutor = self->_queryExecutor;
  id v21 = 0;
  unsigned __int8 v18 = [(FLSQLiteExecutor *)queryExecutor performQuery:v14 error:&v21];
  id v19 = v21;
  if ((v18 & 1) == 0)
  {
    v20 = _FLLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100010BB4();
    }
  }
}

- (id)safeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _FLSignpostCreate();
  id v6 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100010B40();
  }

  uint64_t v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = sub_1000037E0;
  v17[3] = sub_1000037C0;
  id v18 = +[NSMutableArray array];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100002A18;
  v13[3] = &unk_10001C960;
  v13[4] = self;
  id v7 = v4;
  id v14 = v7;
  id v15 = &v16;
  +[FLSQLiteExecutor performBlockAndWait:v13];
  uint64_t Nanoseconds = _FLSignpostGetNanoseconds();
  id v9 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100010ABC(v5, v9, (double)(unint64_t)Nanoseconds / 1000000000.0);
  }

  id v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100010A3C((uint64_t)v17, v10);
  }

  id v11 = [*(id *)(v17[0] + 40) copy];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (BOOL)insertFollowUpItem:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006530;
  v6[3] = &unk_10001C960;
  id v4 = a3;
  id v7 = v4;
  v8 = self;
  id v9 = &v10;
  +[FLSQLiteExecutor performBlockAndWait:v6];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (int64_t)_unsafe_insertFollowUpItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FLSQLiteQuery queryWithString:@"INSERT OR REPLACE INTO items (uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, extension_identifier, group_identifier, target_bundle_identifier, representing_bundle_path, bundle_icon_name, informative_footer_text, category_identifier, expiration_date, account_id, type_id, collection_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000068A0;
  v13[3] = &unk_10001C988;
  id v6 = v4;
  id v14 = v6;
  [v5 setBindHandler:v13];
  queryExecutor = self->_queryExecutor;
  id v12 = 0;
  id v8 = [(FLSQLiteExecutor *)queryExecutor performInsertQuery:v5 error:&v12];
  id v9 = v12;
  if (v8 == (id)-1)
  {
    uint64_t v10 = _FLLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100010834();
    }
  }
  return (int64_t)v8;
}

- (int64_t)_unsafe_insertAction:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FLSQLiteQuery queryWithString:@"INSERT INTO actions (label, url, launch_url, launch_arguments, item_id, action_identifier) VALUES (?, ?, ?, ?, ?, ?)"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100007014;
  v17[3] = &unk_10001C9B0;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  [v8 setBindHandler:v17];
  queryExecutor = self->_queryExecutor;
  id v16 = 0;
  id v12 = [(FLSQLiteExecutor *)queryExecutor performInsertQuery:v8 error:&v16];
  id v13 = v16;
  if (v12 == (id)-1)
  {
    id v14 = _FLLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10001089C();
    }
  }
  return (int64_t)v12;
}

- (int64_t)_unsafe_insertNotificationForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 notification];
  id v6 = [v5 activateAction];

  if (v6)
  {
    id v7 = [v5 activateAction];
    int64_t v8 = [(ItemStore *)self _unsafe_insertAction:v7 item:0];
    id v9 = [v5 activateAction];
    [v9 setSqlID:v8];
  }
  id v10 = [v4 notification];
  id v11 = [v10 clearAction];

  if (v11)
  {
    id v12 = [v5 clearAction];
    int64_t v13 = [(ItemStore *)self _unsafe_insertAction:v12 item:0];
    id v14 = [v5 clearAction];
    [v14 setSqlID:v13];
  }
  if ([v5 sqlID])
  {
    id v15 = [(ItemStore *)self _unsafeSelectNotificationForFollowUpItem:v4];
    id v16 = [v15 activateAction];

    if (v16)
    {
      v17 = [v15 activateAction];
      -[ItemStore _unsafe_deleteActionWithID:](self, "_unsafe_deleteActionWithID:", [v17 sqlID]);
    }
    id v18 = [v15 clearAction];

    if (v18)
    {
      id v19 = [v15 clearAction];
      -[ItemStore _unsafe_deleteActionWithID:](self, "_unsafe_deleteActionWithID:", [v19 sqlID]);
    }
    v20 = _FLLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using creation date from %@", buf, 0xCu);
    }

    id v21 = [v15 creationDate];
    [v5 setCreationDate:v21];

    CFStringRef v22 = @"INSERT OR REPLACE INTO notifications (item_id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text, id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  }
  else
  {
    CFStringRef v22 = @"INSERT INTO notifications (item_id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  }
  id v23 = +[FLSQLiteQuery queryWithString:v22];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000751C;
  v32[3] = &unk_10001C9B0;
  id v24 = v4;
  id v33 = v24;
  id v25 = v5;
  id v34 = v25;
  [v23 setBindHandler:v32];
  queryExecutor = self->_queryExecutor;
  id v31 = 0;
  id v27 = [(FLSQLiteExecutor *)queryExecutor performInsertQuery:v23 error:&v31];
  id v28 = v31;
  if (v27 == (id)-1)
  {
    long long v29 = _FLLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100010904();
    }
  }
  return (int64_t)v27;
}

- (BOOL)deleteFollowUpItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting item: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007A74;
  v9[3] = &unk_10001C9D8;
  id v6 = v4;
  id v11 = self;
  p_long long buf = &buf;
  id v10 = v6;
  +[FLSQLiteExecutor performBlockAndWait:v9];
  [(ItemStore *)self deleteNotificationForFollowUpItem:v6];
  BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v7;
}

- (BOOL)updateNotificationForFollowUpItem:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007CCC;
  v6[3] = &unk_10001CA00;
  int64_t v8 = &v9;
  void v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  +[FLSQLiteExecutor performBlockAndWait:v6];
  char v4 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)deleteNotificationForFollowUpItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting notifications for item %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007E8C;
  v9[3] = &unk_10001C9D8;
  id v6 = v4;
  uint64_t v11 = self;
  p_long long buf = &buf;
  id v10 = v6;
  +[FLSQLiteExecutor performBlockAndWait:v9];
  BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v7;
}

- (BOOL)_unsafe_deleteActionWithID:(int64_t)a3
{
  uint64_t v5 = +[FLSQLiteQuery queryWithString:@"DELETE FROM actions WHERE id=?"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000080F8;
  v12[3] = &unk_10001CA20;
  v12[4] = a3;
  [v5 setBindHandler:v12];
  queryExecutor = self->_queryExecutor;
  id v11 = 0;
  unsigned __int8 v7 = [(FLSQLiteExecutor *)queryExecutor performQuery:v5 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = _FLLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000109D4();
    }
  }
  return v7;
}

- (id)safeSelectFollowUpActions
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1000037E0;
  char v12 = sub_1000037C0;
  id v13 = +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000082BC;
  v7[3] = &unk_10001CA70;
  v7[4] = self;
  v7[5] = &v8;
  +[FLSQLiteExecutor performBlockAndWait:v7];
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v9[5];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Actions Fetched: %@", buf, 0xCu);
  }

  id v5 = [(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)safeSelectFollowUpNotifications
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1000037E0;
  char v12 = sub_1000037C0;
  id v13 = +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008500;
  v7[3] = &unk_10001CA70;
  v7[4] = self;
  v7[5] = &v8;
  +[FLSQLiteExecutor performBlockAndWait:v7];
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v9[5];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notifications Fetched: %@", buf, 0xCu);
  }

  id v5 = [(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_unsafeSelectFollowUpNotificationsWithRowHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[FLSQLiteQuery queryWithString:@"SELECT id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text FROM notifications"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008B04;
  v12[3] = &unk_10001CB10;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  [v5 setRowHandler:v12];
  queryExecutor = self->_queryExecutor;
  id v11 = 0;
  unsigned __int8 v8 = [(FLSQLiteExecutor *)queryExecutor performQuery:v5 error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = _FLLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100010C1C();
    }
  }
}

- (id)_unsafeSelectNotificationForFollowUpItem:(id)a3
{
  id v4 = a3;
  id v5 = +[FLSQLiteQuery queryWithString:@"SELECT id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text FROM notifications WHERE item_id = ? LIMIT 1"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000090FC;
  v24[3] = &unk_10001C988;
  id v6 = v4;
  id v25 = v6;
  [v5 setBindHandler:v24];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1000037E0;
  CFStringRef v22 = sub_1000037C0;
  id v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009140;
  v17[3] = &unk_10001CB38;
  void v17[4] = self;
  v17[5] = &v18;
  [v5 setRowHandler:v17];
  queryExecutor = self->_queryExecutor;
  id v16 = 0;
  unsigned __int8 v8 = [(FLSQLiteExecutor *)queryExecutor performQuery:v5 error:&v16];
  id v9 = v16;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = _FLLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100010C1C();
    }
  }
  id v11 = (void *)v19[5];
  if (v11)
  {
    char v12 = _FLLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v19[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found notification: %@", buf, 0xCu);
    }

    id v11 = (void *)v19[5];
  }
  id v14 = v11;

  _Block_object_dispose(&v18, 8);

  return v14;
}

- (void)_unsafeSelectFollowUpActionsForItem:(id)a3 orActionID:(int64_t)a4 rowHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[NSMutableString stringWithString:@"SELECT id, label, url, launch_url, launch_arguments, action_identifier FROM actions"];
  id v11 = v10;
  if (v8)
  {
    CFStringRef v12 = @" WHERE item_id = ?";
  }
  else
  {
    if (a4 < 1) {
      goto LABEL_6;
    }
    CFStringRef v12 = @" WHERE id = ?";
  }
  [v10 appendString:v12];
LABEL_6:
  uint64_t v13 = +[FLSQLiteQuery queryWithString:v11];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000095FC;
  v23[3] = &unk_10001CB60;
  id v14 = v8;
  id v24 = v14;
  int64_t v25 = a4;
  [v13 setBindHandler:v23];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100009650;
  v21[3] = &unk_10001CB10;
  v21[4] = self;
  id v15 = v9;
  id v22 = v15;
  [v13 setRowHandler:v21];
  queryExecutor = self->_queryExecutor;
  id v20 = 0;
  unsigned __int8 v17 = [(FLSQLiteExecutor *)queryExecutor performQuery:v13 error:&v20];
  id v18 = v20;
  if ((v17 & 1) == 0)
  {
    id v19 = _FLLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100010C84();
    }
  }
}

- (id)stringFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  id v4 = (void *)sqlite3_column_text(a4, a3);
  if (v4)
  {
    id v4 = +[NSString stringWithUTF8String:v4];
  }

  return v4;
}

- (id)urlFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  id v4 = [(ItemStore *)self stringFromColumn:a3 inStatement:a4];
  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  int v5 = a3;
  int v6 = sqlite3_column_bytes(a4, a3);
  unsigned __int8 v7 = sqlite3_column_blob(a4, v5);
  id v8 = 0;
  if (v7 && v6)
  {
    id v8 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
  }

  return v8;
}

- (id)dateFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  [(ItemStore *)self intervalFromColumn:a3 inStatement:a4];
  if (v4 == 0.0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }

  return v5;
}

- (double)intervalFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  return sqlite3_column_double(a4, a3);
}

- (void)_openDatabase
{
}

- (void)_closeDatabase
{
}

- (void)_wipeDatabase
{
}

- (FLSQLiteExecutor)queryExecutor
{
  return self->_queryExecutor;
}

- (void)setQueryExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end