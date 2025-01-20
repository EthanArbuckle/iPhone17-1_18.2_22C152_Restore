@interface PDSchoolworkCollaborationStateAdaptor
+ (BOOL)activityDomainFlagsAllowChanges:(unint64_t)a3;
+ (BOOL)activityStateIsTryAgain:(int64_t)a3 flags:(unint64_t)a4;
+ (BOOL)attachmentWithStates:(id)a3 canBeSetToActivityState:(int64_t)a4 ignoreIsLocked:(BOOL)a5;
+ (BOOL)devMode_MutateStateChanges:(id)a3 forDomain:(int64_t)a4;
+ (id)setActivityState:(int64_t)a3 forAttachment:(id)a4 forHandout:(id)a5 senderPersonID:(id)a6 withStates:(id)a7;
+ (void)devMode_DistributeState:(id)a3 sentByTeacher:(BOOL)a4 toTeacherStates:(id)a5 toStudentStates:(id)a6;
@end

@implementation PDSchoolworkCollaborationStateAdaptor

+ (BOOL)activityStateIsTryAgain:(int64_t)a3 flags:(unint64_t)a4
{
  return a3 == 1 && (a4 & 2) != 0;
}

+ (BOOL)devMode_MutateStateChanges:(id)a3 forDomain:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 stateForDomain:a4];
  v7 = v6;
  if (v6 && [v6 domain] == (id)1 && objc_msgSend(v7, "state") == (id)3)
  {
    objc_msgSend(v5, "setState:forDomain:", 4, objc_msgSend(v7, "domain"));
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (void)devMode_DistributeState:(id)a3 sentByTeacher:(BOOL)a4 toTeacherStates:(id)a5 toStudentStates:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v9)
  {
    if ([v9 domain] == (id)2)
    {
      if (!v8)
      {
        v12 = v11;
LABEL_9:
        [v12 addObject:v9];
        goto LABEL_10;
      }
    }
    else
    {
      [v11 addObject:v9];
    }
    v12 = v10;
    goto LABEL_9;
  }
  CLSInitLog();
  v13 = CLSLogHandout;
  if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Missing state.", v14, 2u);
  }
LABEL_10:
}

+ (BOOL)activityDomainFlagsAllowChanges:(unint64_t)a3
{
  BOOL v4 = (~(_WORD)a3 & 0x108) == 0 || (a3 & 0x104) != 4 || (~(_WORD)a3 & 0x208) == 0;
  return !a3 || v4;
}

+ (BOOL)attachmentWithStates:(id)a3 canBeSetToActivityState:(int64_t)a4 ignoreIsLocked:(BOOL)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = a3;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      if (objc_msgSend(v13, "domain", (void)v19) == (id)1) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
    if (a5) {
      unsigned __int8 v14 = 1;
    }
    else {
      unsigned __int8 v14 = objc_msgSend(a1, "activityDomainFlagsAllowChanges:", objc_msgSend(v13, "flags"));
    }
    if (a4 == 1)
    {
      unsigned __int8 v15 = [v13 isCompletedActivity];
      goto LABEL_17;
    }
    if (a4 == 2)
    {
      unsigned __int8 v15 = [v13 isIncompleteActivity];
LABEL_17:
      char v16 = v15 & v14;
      goto LABEL_21;
    }
    CLSInitLog();
    v17 = CLSLogHandout;
    if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v24 = a4;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Unsupported desired state %ld", buf, 0xCu);
    }
  }
LABEL_20:
  char v16 = 0;
LABEL_21:

  return v16;
}

+ (id)setActivityState:(int64_t)a3 forAttachment:(id)a4 forHandout:(id)a5 senderPersonID:(id)a6 withStates:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (!v15)
  {
    v17 = 0;
LABEL_22:
    CLSInitLog();
    v32 = CLSLogHandout;
    if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v54 = (int64_t)v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Missing ACTIVITY domain state for attachment %@", buf, 0xCu);
    }
    v18 = 0;
    id v29 = 0;
    goto LABEL_44;
  }
  id v16 = v15;
  id v46 = v13;
  v47 = v12;
  id v48 = v11;
  v17 = 0;
  v18 = 0;
  uint64_t v19 = *(void *)v50;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v50 != v19) {
        objc_enumerationMutation(v14);
      }
      long long v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if ([v21 domain] == (id)1)
      {
        long long v22 = v18;
        v23 = v17;
        v18 = v21;
      }
      else
      {
        long long v22 = v17;
        v23 = v21;
        if ([v21 domain] != (id)2) {
          continue;
        }
      }
      id v24 = v21;

      v17 = v23;
    }
    id v16 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
  }
  while (v16);
  if (!v18)
  {
    id v12 = v47;
    id v11 = v48;
    id v13 = v46;
    goto LABEL_22;
  }
  if ((unint64_t)(a3 - 1) >= 2)
  {
    CLSInitLog();
    v33 = CLSLogHandout;
    id v12 = v47;
    id v11 = v48;
    if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v54 = a3;
      __int16 v55 = 2112;
      id v56 = v48;
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Unsupported new state (%ld) for attachment %@", buf, 0x16u);
    }
    id v29 = 0;
    id v13 = v46;
    goto LABEL_44;
  }
  id v25 = objc_alloc((Class)CLSCollaborationStateChange);
  v26 = [v18 ownerPersonID];
  v27 = [v18 classID];
  v28 = [v18 ownerPersonID];
  id v11 = v48;
  id v29 = [v25 initWithObject:v48 ownerPersonID:v26 targetClassID:v27 recipientPersonID:v28];

  id v13 = v46;
  id v12 = v47;
  if (a3 == 1) {
    goto LABEL_28;
  }
  if (a3 != 2) {
    goto LABEL_32;
  }
  if (([v18 isCompletedActivity] & 1) != 0
    || [v18 isReturnedActivity])
  {
    CLSInitLog();
    v30 = CLSLogHandout;
    if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v54 = (int64_t)v48;
      v31 = "Already DONE for attachment %@";
      goto LABEL_31;
    }
    goto LABEL_44;
  }
LABEL_28:
  if (![v18 isReturnedActivity])
  {
LABEL_32:
    unint64_t v34 = (unint64_t)[v18 flags];
    if (v17) {
      unint64_t v35 = (unint64_t)[v17 state];
    }
    else {
      unint64_t v35 = 0;
    }
    self;
    if (a3 == 2)
    {
      unint64_t v45 = v34 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v36 = v34 & 0xFFFFFFFFFFFFFFFCLL | 1;
      uint64_t v37 = [v47 dueDate];
      if (v37)
      {
        v38 = (void *)v37;
        v39 = [v47 dueDate];
        v40 = +[NSDate date];
        id v44 = [v39 compare:v40];

        id v13 = v46;
        if (v44 == (id)-1) {
          unint64_t v36 = v45 | 0x11;
        }
      }
      unint64_t v41 = v35 & 0xFFFFFFFFFFFFFFFCLL;
    }
    else
    {
      self;
      unint64_t v36 = v34 & 0xFFFFFFFFFFFFFFEELL;
      unint64_t v41 = v35 | 1;
    }
    [v29 addStates:v14];
    [v29 setState:a3 forDomain:1];
    [v29 setFlags:v36 forDomain:1];
    [v29 setState:v41 forDomain:2];
    v42 = [v29 senderPersonID];

    if (!v42) {
      [v29 setSenderPersonID:v13];
    }
    id v12 = v47;
    id v11 = v48;
    goto LABEL_44;
  }
  CLSInitLog();
  v30 = CLSLogHandout;
  if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int64_t v54 = (int64_t)v48;
    v31 = "Can't become INCOMPLETE/STARTED for attachment %@";
LABEL_31:
    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, v31, buf, 0xCu);
  }
LABEL_44:

  return v29;
}

@end