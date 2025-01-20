@interface PDHandoutAssignedNotificationTrigger
+ (id)dateFormatter:(id)a3;
+ (void)_logHandoutTypeUpdate:(id)a3 forID:(id)a4 isInNotifiedHandoutIDs:(BOOL)a5;
- (BOOL)baseCriteriaPassesWithHandout:(id)a3 database:(id)a4;
- (NSMutableDictionary)pendingRecipientHandoutData;
- (PDHandoutAssignedNotificationTrigger)initWithDatabase:(id)a3;
- (PDRing)notifiedHandoutIDs;
- (id)classWithClassID:(id)a3 database:(id)a4;
- (id)notificationDataWithDatabase:(id)a3 recipient:(id)a4 handoutID:(id)a5 handoutTitle:(id)a6;
- (int64_t)getUpdateFromNewHandout:(id)a3 andExistingHandout:(id)a4;
- (void)dealloc;
- (void)handoutDidInsert:(id)a3;
- (void)handoutRecipientDidInsert:(id)a3;
- (void)handoutWillChange:(id)a3;
- (void)setNotifiedHandoutIDs:(id)a3;
- (void)setPendingRecipientHandoutData:(id)a3;
@end

@implementation PDHandoutAssignedNotificationTrigger

- (PDHandoutAssignedNotificationTrigger)initWithDatabase:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDHandoutAssignedNotificationTrigger;
  v3 = [(PDUserNotificationTrigger *)&v12 initWithDatabase:a3];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingRecipientHandoutData = v3->_pendingRecipientHandoutData;
    v3->_pendingRecipientHandoutData = v4;

    v6 = (PDRing *)sub_100002DB4([PDRing alloc], 20);
    notifiedHandoutIDs = v3->_notifiedHandoutIDs;
    v3->_notifiedHandoutIDs = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"handoutDidInsert:" name:@"PDDatabaseEntityHandoutDidInsertNotification" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v3 selector:"handoutRecipientDidInsert:" name:@"PDDatabaseEntityHandoutRecipientDidInsertNotification" object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"handoutWillChange:" name:@"PDDatabaseEntityHandoutWillChangeNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDHandoutAssignedNotificationTrigger;
  [(PDHandoutAssignedNotificationTrigger *)&v4 dealloc];
}

- (void)handoutDidInsert:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"currentEntity"];

  CLSInitLog();
  v7 = (void *)CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = [v6 objectID];
    v10 = [v6 title];
    v11 = [v6 dateOfPublication];
    int v29 = 138412802;
    v30 = v9;
    __int16 v31 = 2112;
    v32 = v10;
    __int16 v33 = 2112;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutDidInsert. Handout ID: %@ title: %@ pubTime: %@", (uint8_t *)&v29, 0x20u);
  }
  objc_super v12 = [v4 object];
  if ([v6 publishingState] == (id)2
    && [(PDHandoutAssignedNotificationTrigger *)self baseCriteriaPassesWithHandout:v6 database:v12])
  {
    v13 = self;
    objc_sync_enter(v13);
    v14 = [v6 objectID];
    CLSInitLog();
    v15 = CLSLogNotifications;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [(PDHandoutAssignedNotificationTrigger *)v13 notifiedHandoutIDs];
      v17 = (void *)v16;
      if (v16) {
        id v18 = [*(id *)(v16 + 8) containsObject:v14];
      }
      else {
        id v18 = 0;
      }
      v19 = +[NSNumber numberWithBool:v18];
      int v29 = 138412546;
      v30 = v14;
      __int16 v31 = 2112;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutDidInsert > shouldTriggerNotification. Handout ID: %@ In notifiedHandoutIDs: %@", (uint8_t *)&v29, 0x16u);
    }
    uint64_t v20 = [(PDHandoutAssignedNotificationTrigger *)v13 notifiedHandoutIDs];
    v21 = (void *)v20;
    if (!v20
      || (unsigned __int8 v22 = [*(id *)(v20 + 8) containsObject:v14],
          v21,
          (v22 & 1) == 0))
    {
      v23 = [v6 title];
      v24 = [(PDHandoutAssignedNotificationTrigger *)v13 pendingRecipientHandoutData];
      v25 = v24;
      if (v23) {
        CFStringRef v26 = v23;
      }
      else {
        CFStringRef v26 = &stru_1001F6580;
      }
      [v24 setObject:v26 forKeyedSubscript:v14];

      CLSInitLog();
      v27 = CLSLogNotifications;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = [(PDHandoutAssignedNotificationTrigger *)v13 pendingRecipientHandoutData];
        int v29 = 138412546;
        v30 = v14;
        __int16 v31 = 2112;
        v32 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutDidInsert. Added to pendingRecipientHandoutData. Handout ID: %@ pendingRecipientHandoutData: %@", (uint8_t *)&v29, 0x16u);
      }
    }

    objc_sync_exit(v13);
  }
}

- (int64_t)getUpdateFromNewHandout:(id)a3 andExistingHandout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 dueDate];
  if (!v8)
  {
    id v4 = [v6 dueDate];
    if (!v4) {
      goto LABEL_16;
    }
  }
  uint64_t v9 = [v7 dueDate];
  if (!v9)
  {
LABEL_9:
    if (!v8) {

    }
    goto LABEL_12;
  }
  v10 = (void *)v9;
  uint64_t v11 = [v6 dueDate];
  if (!v11)
  {

    goto LABEL_9;
  }
  objc_super v12 = (void *)v11;
  v13 = [v7 dueDate];
  v14 = [v6 dueDate];
  unsigned __int8 v15 = [v13 isEqualToDate:v14];

  if (!v8)
  {

    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    id v18 = [v7 title];
    if (!v18)
    {
      id v4 = [v6 title];
      if (!v4) {
        goto LABEL_30;
      }
    }
    uint64_t v19 = [v7 title];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      uint64_t v21 = [v6 title];
      if (v21)
      {
        unsigned __int8 v22 = (void *)v21;
        v23 = [v7 title];
        v24 = [v6 title];
        unsigned int v25 = [v23 isEqualToString:v24];

        if (v18)
        {

          if (v25) {
            goto LABEL_30;
          }
          goto LABEL_26;
        }

        if (v25)
        {
LABEL_30:
          CFStringRef v26 = [v7 instructions];
          if (!v26)
          {
            id v4 = [v6 instructions];
            if (!v4) {
              goto LABEL_43;
            }
          }
          uint64_t v27 = [v7 instructions];
          if (v27)
          {
            v28 = (void *)v27;
            uint64_t v29 = [v6 instructions];
            if (v29)
            {
              v30 = (void *)v29;
              __int16 v31 = [v7 instructions];
              v32 = [v6 instructions];
              unsigned __int8 v33 = [v31 isEqualToString:v32];

              if (v26)
              {

                if (v33) {
                  goto LABEL_43;
                }
              }
              else
              {

                if (v33)
                {
LABEL_43:
                  int64_t v17 = 6;
                  goto LABEL_44;
                }
              }
              goto LABEL_41;
            }
          }
          if (!v26) {

          }
LABEL_41:
          int64_t v17 = 5;
          goto LABEL_44;
        }
LABEL_26:
        int64_t v17 = 4;
        goto LABEL_44;
      }

      if (!v18) {
        goto LABEL_24;
      }
    }
    else if (!v18)
    {
LABEL_24:
    }
    goto LABEL_26;
  }

  if (v15) {
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v16 = [v6 dueDate];

  if (v16) {
    int64_t v17 = 2;
  }
  else {
    int64_t v17 = 3;
  }
LABEL_44:

  return v17;
}

+ (void)_logHandoutTypeUpdate:(id)a3 forID:(id)a4 isInNotifiedHandoutIDs:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  CLSInitLog();
  uint64_t v9 = (void *)CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    uint64_t v11 = +[NSNumber numberWithBool:v5];
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    int64_t v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutWillChange > shouldTriggerNotification_Type%@. Handout ID: %@ In notifiedHandoutIDs: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)handoutWillChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"newEntity"];

  id v7 = [v6 objectID];
  id v8 = [v6 title];
  uint64_t v9 = [v4 object];

  v10 = [v9 select:objc_opt_class() identity:v7];
  uint64_t v11 = [[PDUserNotificationTrigger alloc] initWithDatabase:v9];
  if ([(PDUserNotificationTrigger *)v11 isIncompleteHandout:v10]
    && [(PDUserNotificationTrigger *)v11 isIncompleteHandout:v6])
  {
    unint64_t v12 = (unint64_t)[v10 publishingState];
    id v13 = [v6 publishingState];
    CLSInitLog();
    __int16 v14 = CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)v84 = v7;
      *(_WORD *)&v84[8] = 2112;
      *(void *)&v84[10] = v8;
      __int16 v85 = 2048;
      unint64_t v86 = v12;
      __int16 v87 = 2048;
      id v88 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutWillChange. Handout ID: %@ title: %@ Old pubState: %ld New pubState: %ld", buf, 0x2Au);
    }
    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && v13 == (id)2
      && [(PDHandoutAssignedNotificationTrigger *)self baseCriteriaPassesWithHandout:v6 database:v9])
    {
      uint64_t v15 = [(PDHandoutAssignedNotificationTrigger *)self notifiedHandoutIDs];
      __int16 v16 = (void *)v15;
      if (v15) {
        id v17 = [*(id *)(v15 + 8) containsObject:v7];
      }
      else {
        id v17 = 0;
      }

LABEL_15:
      +[PDHandoutAssignedNotificationTrigger _logHandoutTypeUpdate:@"New" forID:v7 isInNotifiedHandoutIDs:v17];
      int64_t v18 = 1;
LABEL_18:
      uint64_t v21 = [(PDHandoutAssignedNotificationTrigger *)self notifiedHandoutIDs];
      if (v21
        && (unsigned __int8 v22 = (void *)v21,
            unsigned __int8 v23 = [*(id *)(v21 + 8) containsObject:v7],
            v22,
            (v23 & 1) != 0))
      {
        int v24 = 1;
      }
      else
      {
        unsigned int v25 = [(PDHandoutAssignedNotificationTrigger *)self notifiedHandoutIDs];
        sub_10000C028((uint64_t)v25, v7);

        int v24 = 0;
      }
      CLSInitLog();
      CFStringRef v26 = CLSLogNotifications;
      if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v84 = v24 ^ 1;
        *(_WORD *)&v84[4] = 2112;
        *(void *)&v84[6] = v7;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutWillChange. Should trigger %d HandoutID: %@", buf, 0x12u);
      }
      if ((v24 & 1) == 0)
      {
        v78 = v8;
        uint64_t v27 = [v6 objectID];
        BOOL v75 = sub_10016B700((BOOL)v9, v27);

        uint64_t v28 = objc_opt_class();
        v82 = v7;
        uint64_t v29 = +[NSArray arrayWithObjects:&v82 count:1];
        v30 = [v9 select:v28 where:@"parentObjectID = ?" bindings:v29];

        __int16 v31 = [v6 title];
        selfa = [(PDHandoutAssignedNotificationTrigger *)self notificationDataWithDatabase:v9 recipient:v30 handoutID:v7 handoutTitle:v31];

        v32 = [v30 classID];
        unsigned __int8 v33 = [(PDHandoutAssignedNotificationTrigger *)self classWithClassID:v32 database:v9];

        v79 = v33;
        v80 = [v33 displayName];
        v34 = selfa;
        switch(v18)
        {
          case 1:
            v77 = v30;
            v42 = +[NSBundle bundleForClass:objc_opt_class()];
            v43 = v42;
            if (v75)
            {
              v44 = [v42 localizedStringForKey:@"NOTIFICATION_STUDENT_NEW_ASSESSMENT_TITLE" value:&stru_1001F6580 table:@"ClassKit"];
              v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v44, v80);
              v34 = selfa;
              if (selfa) {
                objc_setProperty_nonatomic_copy(selfa, v45, v46, 8);
              }

              v47 = +[NSBundle bundleForClass:objc_opt_class()];
              CFStringRef v48 = @"NOTIFICATION_STUDENT_NEW_ASSESSMENT_MESSAGE_FORMAT";
            }
            else
            {
              v67 = [v42 localizedStringForKey:@"NOTIFICATION_STUDENT_NEW_HANDOUT_TITLE" value:&stru_1001F6580 table:@"ClassKit"];
              v69 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v67, v80);
              v34 = selfa;
              if (selfa) {
                objc_setProperty_nonatomic_copy(selfa, v68, v69, 8);
              }

              v47 = +[NSBundle bundleForClass:objc_opt_class()];
              CFStringRef v48 = @"NOTIFICATION_STUDENT_NEW_HANDOUT_MESSAGE_FORMAT";
            }
            v76 = v47;
            uint64_t v39 = [v47 localizedStringForKey:v48 value:&stru_1001F6580 table:@"ClassKit"];
            uint64_t v40 = [v10 title];
            v41 = (void *)v40;
            v71 = v80;
            goto LABEL_46;
          case 2:
            v77 = v30;
            v49 = +[NSBundle bundleForClass:objc_opt_class()];
            v50 = [v49 localizedStringForKey:@"NOTIFICATION_STUDENT_HANDOUT_INFO_UPDATED_TITLE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v80);
            if (selfa) {
              objc_setProperty_nonatomic_copy(selfa, v51, v52, 8);
            }

            v53 = objc_opt_class();
            v54 = +[NSLocale currentLocale];
            v55 = [v53 dateFormatter:v54];

            v74 = +[NSBundle bundleForClass:objc_opt_class()];
            v41 = [v74 localizedStringForKey:@"NOTIFICATION_STUDENT_HANDOUT_DUE_DATE_UPDATED_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            v56 = [v10 title];
            [v6 dueDate];
            v73 = v76 = v55;
            v72 = objc_msgSend(v55, "stringFromDate:");
            v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v56, v72);
            if (selfa) {
              objc_setProperty_nonatomic_copy(selfa, v57, v58, 16);
            }

            v59 = v74;
            goto LABEL_49;
          case 3:
            v77 = v30;
            v60 = +[NSBundle bundleForClass:objc_opt_class()];
            v61 = [v60 localizedStringForKey:@"NOTIFICATION_STUDENT_HANDOUT_INFO_UPDATED_TITLE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v61, v80);
            if (selfa) {
              objc_setProperty_nonatomic_copy(selfa, v62, v63, 8);
            }

            v76 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v64 = [v76 localizedStringForKey:@"NOTIFICATION_STUDENT_HANDOUT_DUE_DATE_DELETED_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            v41 = [v10 title];
            v59 = (void *)v64;
            v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v64, v41);
            v66 = selfa;
            if (!selfa) {
              goto LABEL_49;
            }
            goto LABEL_48;
          case 4:
          case 5:
            v77 = v30;
            v35 = +[NSBundle bundleForClass:objc_opt_class()];
            v36 = [v35 localizedStringForKey:@"NOTIFICATION_STUDENT_HANDOUT_INFO_UPDATED_TITLE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v80);
            if (selfa) {
              objc_setProperty_nonatomic_copy(selfa, v37, v38, 8);
            }

            v76 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v39 = [v76 localizedStringForKey:@"NOTIFICATION_STUDENT_HANDOUT_INFO_UPDATED_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            uint64_t v40 = [v10 title];
            v41 = (void *)v40;
LABEL_46:
            v59 = (void *)v39;
            v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v39, v40, v71);
            if (!v34) {
              goto LABEL_49;
            }
            v66 = v34;
LABEL_48:
            objc_setProperty_nonatomic_copy(v66, v65, v56, 16);
LABEL_49:

            v30 = v77;
LABEL_50:
            v34 = selfa;
            [(PDUserNotificationTrigger *)self fireTriggerWithNotificationData:selfa];
            v70 = [(PDHandoutAssignedNotificationTrigger *)self notifiedHandoutIDs];
            sub_1000A3E34((uint64_t)v70, v7);

LABEL_51:
            id v8 = v78;
            break;
          case 6:
            goto LABEL_51;
          default:
            goto LABEL_50;
        }
      }
    }
    else
    {
      int64_t v18 = [(PDHandoutAssignedNotificationTrigger *)self getUpdateFromNewHandout:v6 andExistingHandout:v10];
      uint64_t v19 = [(PDHandoutAssignedNotificationTrigger *)self notifiedHandoutIDs];
      uint64_t v20 = (void *)v19;
      if (v19) {
        id v17 = [*(id *)(v19 + 8) containsObject:v7];
      }
      else {
        id v17 = 0;
      }

      switch(v18)
      {
        case 0:
        case 6:
          break;
        case 1:
          goto LABEL_15;
        case 2:
        case 3:
          +[PDHandoutAssignedNotificationTrigger _logHandoutTypeUpdate:@"DueDate" forID:v7 isInNotifiedHandoutIDs:v17];
          goto LABEL_18;
        case 4:
          +[PDHandoutAssignedNotificationTrigger _logHandoutTypeUpdate:@"Title" forID:v7 isInNotifiedHandoutIDs:v17];
          int64_t v18 = 4;
          goto LABEL_18;
        case 5:
          +[PDHandoutAssignedNotificationTrigger _logHandoutTypeUpdate:@"Instructions" forID:v7 isInNotifiedHandoutIDs:v17];
          int64_t v18 = 5;
          goto LABEL_18;
        default:
          goto LABEL_18;
      }
    }
  }
}

+ (id)dateFormatter:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091788;
  block[3] = &unk_1001F2A68;
  id v8 = a3;
  uint64_t v3 = qword_10023E568;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10023E568, block);
  }
  id v5 = (id)qword_10023E560;

  return v5;
}

- (void)handoutRecipientDidInsert:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (sub_1000510B8(v5))
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"currentEntity"];

    id v8 = [v7 parentObjectID];
    CLSInitLog();
    uint64_t v9 = (void *)CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      uint64_t v11 = [v7 classID];
      int v32 = 138412546;
      unsigned __int8 v33 = v8;
      __int16 v34 = 2112;
      v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutRecipientDidInsert. Look for parent handout: %@ ClassID: %@", (uint8_t *)&v32, 0x16u);
    }
    unint64_t v12 = self;
    objc_sync_enter(v12);
    if (!v8
      || ([(PDHandoutAssignedNotificationTrigger *)v12 notifiedHandoutIDs],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          (__int16 v14 = (void *)v13) != 0)
      && (unsigned __int8 v15 = [*(id *)(v13 + 8) containsObject:v8], v14,
                                                                                        (v15 & 1) != 0))
    {
      CLSInitLog();
      __int16 v16 = CLSLogNotifications;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [(PDHandoutAssignedNotificationTrigger *)v12 pendingRecipientHandoutData];
        int64_t v18 = [(PDHandoutAssignedNotificationTrigger *)v12 notifiedHandoutIDs];
        int v32 = 138412802;
        unsigned __int8 v33 = v8;
        __int16 v34 = 2112;
        v35 = v17;
        __int16 v36 = 2112;
        v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutRecipientDidInsert. Will Not set shouldTriggerNotification. HandoutID: %@ pendingRecipientHandoutData: %@ notifiedHandoutIDs: %@", (uint8_t *)&v32, 0x20u);
      }
      uint64_t v19 = 0;
      uint64_t v20 = 0;
    }
    else
    {
      unsigned __int8 v22 = [(PDHandoutAssignedNotificationTrigger *)v12 pendingRecipientHandoutData];
      uint64_t v19 = [v22 objectForKeyedSubscript:v8];

      if (!v19)
      {
        uint64_t v20 = 0;
        goto LABEL_17;
      }
      CLSInitLog();
      unsigned __int8 v23 = CLSLogNotifications;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = [(PDHandoutAssignedNotificationTrigger *)v12 pendingRecipientHandoutData];
        unsigned int v25 = [(PDHandoutAssignedNotificationTrigger *)v12 notifiedHandoutIDs];
        int v32 = 138412802;
        unsigned __int8 v33 = v8;
        __int16 v34 = 2112;
        v35 = v24;
        __int16 v36 = 2112;
        v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutRecipientDidInsert. Will set shouldTriggerNotification. HandoutID: %@ pendingRecipientHandoutData: %@ notifiedHandoutIDs: %@", (uint8_t *)&v32, 0x20u);
      }
      CFStringRef v26 = [(PDHandoutAssignedNotificationTrigger *)v12 pendingRecipientHandoutData];
      [v26 removeObjectForKey:v8];

      __int16 v16 = [(PDHandoutAssignedNotificationTrigger *)v12 notifiedHandoutIDs];
      sub_10000C028((uint64_t)v16, v8);
      uint64_t v20 = 1;
    }

LABEL_17:
    objc_sync_exit(v12);

    CLSInitLog();
    uint64_t v27 = (void *)CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = v27;
      uint64_t v29 = +[NSNumber numberWithBool:v20];
      v30 = [v7 classID];
      int v32 = 138412802;
      unsigned __int8 v33 = v29;
      __int16 v34 = 2112;
      v35 = v30;
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutRecipientDidInsert. Should trigger %@ ClassID: %@ HandoutID: %@", (uint8_t *)&v32, 0x20u);
    }
    if (v20)
    {
      __int16 v31 = [(PDHandoutAssignedNotificationTrigger *)v12 notificationDataWithDatabase:v5 recipient:v7 handoutID:v8 handoutTitle:v19];
      [(PDUserNotificationTrigger *)v12 fireTriggerWithNotificationData:v31];
    }
    goto LABEL_22;
  }
  CLSInitLog();
  uint64_t v21 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    LOWORD(v32) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.handoutRecipientDidInsert. Skip due to initial sync incomplete.", (uint8_t *)&v32, 2u);
  }
LABEL_22:
}

- (id)notificationDataWithDatabase:(id)a3 recipient:(id)a4 handoutID:(id)a5 handoutTitle:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = (__CFString *)a6;
  id v13 = a3;
  CLSInitLog();
  __int16 v14 = (void *)CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v15 = v14;
    __int16 v16 = [v10 classID];
    *(_DWORD *)buf = 138412802;
    v42 = v16;
    __int16 v43 = 2112;
    id v44 = v11;
    __int16 v45 = 2112;
    v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.notificationDataWithDatabase. Class: %@ HandoutID: %@ HandoutTitle: %@", buf, 0x20u);
  }
  id v17 = [v10 classID];
  int64_t v18 = [(PDHandoutAssignedNotificationTrigger *)self classWithClassID:v17 database:v13];

  uint64_t v19 = [v18 displayName];
  uint64_t v20 = &stru_1001F6580;
  if (v12) {
    uint64_t v20 = v12;
  }
  uint64_t v21 = v20;

  if ([v19 length])
  {
    unsigned __int8 v22 = [(PDUserNotificationTrigger *)self database];
    BOOL v23 = sub_10016B700((BOOL)v22, v11);

    int v24 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v25 = v24;
    if (v23)
    {
      CFStringRef v26 = [v24 localizedStringForKey:@"NOTIFICATION_STUDENT_NEW_ASSESSMENT_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

      uint64_t v27 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v28 = v27;
      CFStringRef v29 = @"NOTIFICATION_STUDENT_NEW_ASSESSMENT_MESSAGE_FORMAT";
    }
    else
    {
      CFStringRef v26 = [v24 localizedStringForKey:@"NOTIFICATION_STUDENT_NEW_HANDOUT_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

      uint64_t v27 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v28 = v27;
      CFStringRef v29 = @"NOTIFICATION_STUDENT_NEW_HANDOUT_MESSAGE_FORMAT";
    }
    __int16 v34 = [v27 localizedStringForKey:v29 value:&stru_1001F6580 table:@"ClassKit"];
    v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v21, v19);

    unsigned __int8 v33 = sub_10012691C((id *)[PDUserNotificationData alloc], 0, v26, v35);
    __int16 v36 = [v10 classID];
    v38 = v36;
    if (v33)
    {
      objc_setProperty_nonatomic_copy(v33, v37, v36, 32);

      objc_setProperty_nonatomic_copy(v33, v39, v11, 24);
    }
    else
    {
    }
  }
  else
  {
    CLSInitLog();
    v30 = (void *)CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      __int16 v31 = v30;
      int v32 = [v10 classID];
      *(_DWORD *)buf = 138412546;
      v42 = v32;
      __int16 v43 = 2112;
      id v44 = v11;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "PDHandoutAssignedNotificationTrigger.notificationDataWithDatabase. Could not find class or empty class name. ClassID: %@ HandoutID: %@", buf, 0x16u);
    }
    unsigned __int8 v33 = 0;
  }

  return v33;
}

- (id)classWithClassID:(id)a3 database:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    id v4 = [v5 select:objc_opt_class() identity:v6];
  }

  return v4;
}

- (BOOL)baseCriteriaPassesWithHandout:(id)a3 database:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isReviewed] & 1) != 0 || !sub_1000510B8(v6))
  {
    BOOL v9 = 0;
  }
  else
  {
    id v7 = [v5 dateOfPublication];
    [v7 timeIntervalSinceNow];
    BOOL v9 = v8 > -1209600.0;
  }
  return v9;
}

- (NSMutableDictionary)pendingRecipientHandoutData
{
  return self->_pendingRecipientHandoutData;
}

- (void)setPendingRecipientHandoutData:(id)a3
{
}

- (PDRing)notifiedHandoutIDs
{
  return self->_notifiedHandoutIDs;
}

- (void)setNotifiedHandoutIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedHandoutIDs, 0);

  objc_storeStrong((id *)&self->_pendingRecipientHandoutData, 0);
}

@end