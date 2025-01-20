@interface HMDSUtilities
+ (BOOL)canRemoveParticipantObject:(id)a3 fromHome:(id)a4 accessCodes:(id)a5;
+ (id)_combineAllFuturesWithNoResult:(id)a3;
+ (id)combineAllFuturesFlatteningArrayResults:(id)a3;
+ (id)identityForAccessCode:(id)a3;
+ (id)identityForUser:(id)a3;
+ (id)logCategory;
+ (id)outgoingInvitationForUserID:(id)a3 inHome:(id)a4;
+ (id)participantForAccessCode:(id)a3 inHome:(id)a4;
+ (id)participantForOutgoingInvitation:(id)a3 inHome:(id)a4;
+ (id)participantForUser:(id)a3 inHome:(id)a4;
+ (id)participantObjectForParticipant:(id)a3 inHome:(id)a4 accessCodes:(id)a5;
+ (id)removeParticipantObject:(id)a3 fromHome:(id)a4 accessCodes:(id)a5 context:(id)a6;
+ (id)sharedResourceForHome:(id)a3 context:(id)a4;
+ (id)sharedResourcesForContext:(id)a3;
+ (id)stopSharingHome:(id)a3 withParticipant:(id)a4 context:(id)a5;
+ (id)stopSharingResource:(id)a3 context:(id)a4;
+ (id)stopSharingWithParticipant:(id)a3 context:(id)a4;
@end

@implementation HMDSUtilities

+ (id)logCategory
{
  if (qword_11DB8 != -1) {
    dispatch_once(&qword_11DB8, &stru_C4C8);
  }
  v2 = (void *)qword_11DC0;

  return v2;
}

+ (id)sharedResourcesForContext:(id)a3
{
  id v4 = a3;
  id v6 = a1;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 homes];
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@Found homes: %@", buf, 0x16u);
  }
  v10 = [v4 homes];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2F68;
  v15[3] = &unk_C4A8;
  id v16 = v4;
  id v11 = v4;
  v12 = objc_msgSend(v10, "na_map:", v15);
  v13 = +[HMDSUtilities combineAllFuturesFlatteningArrayResults:v12];

  return v13;
}

+ (id)combineAllFuturesFlatteningArrayResults:(id)a3
{
  id v3 = a3;
  id v4 = +[NAScheduler immediateScheduler];
  v5 = +[NAFuture combineAllFutures:v3 scheduler:v4];

  id v6 = [v5 flatMap:&stru_C440];

  return v6;
}

+ (id)stopSharingWithParticipant:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [v7 homes];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_344C;
    v27[3] = &unk_C3F8;
    id v12 = v10;
    id v28 = v12;
    v13 = objc_msgSend(v11, "na_firstObjectPassingTest:", v27);

    if (v13)
    {
      uint64_t v14 = +[HMDSUtilities stopSharingHome:v13 withParticipant:v8 context:v7];
    }
    else
    {
      id v22 = a1;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        v25 = [v12 homeUniqueIdentifier];
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        __int16 v31 = 2112;
        id v32 = v25;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%{public}@Participant home no longer exists with homeUniqueIdentifier: %@", buf, 0x16u);
      }
      uint64_t v14 = +[NAFuture futureWithNoResult];
    }
    v20 = (void *)v14;

    __int16 v19 = v28;
  }
  else
  {
    id v16 = a1;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized participant: %@", buf, 0x16u);
    }
    __int16 v19 = +[NSError errorWithDomain:HMErrorDomain code:48 userInfo:0];
    v20 = +[NAFuture futureWithError:v19];
  }

  return v20;
}

+ (id)stopSharingResource:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [v7 homes];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_3908;
    v40[3] = &unk_C3F8;
    id v12 = v10;
    id v41 = v12;
    v13 = objc_msgSend(v11, "na_firstObjectPassingTest:", v40);

    uint64_t v14 = [v13 currentUser];
    v15 = [v13 homeAccessControlForUser:v14];

    if (([v15 isOwner] & 1) != 0
      || ([v15 isAdministrator] & 1) != 0)
    {
      id v17 = a1;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v19;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "%{public}@Removing all participants that we have authority to remove from home: %@", buf, 0x16u);
      }
      v20 = [v12 participants];
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = sub_3978;
      v36 = &unk_C420;
      id v39 = v17;
      id v37 = v13;
      id v38 = v7;
      v21 = objc_msgSend(v20, "na_map:", &v33);
      id v22 = objc_msgSend(v17, "_combineAllFuturesWithNoResult:", v21, v33, v34, v35, v36);
    }
    else
    {
      id v29 = a1;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        __int16 v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v31;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%{public}@We do not have admin privileges, so we cannot remove anyone from the home: %@", buf, 0x16u);
      }
      id v22 = +[NAFuture futureWithNoResult];
    }

    v27 = v41;
  }
  else
  {
    id v24 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v26;
      __int16 v44 = 2112;
      id v45 = v8;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "%{public}@Invalid shared resource: %@", buf, 0x16u);
    }
    v27 = +[NSError errorWithDomain:HMErrorDomain code:3 userInfo:0];
    id v22 = +[NAFuture futureWithError:v27];
  }

  return v22;
}

+ (id)stopSharingHome:(id)a3 withParticipant:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    uint64_t v14 = [v8 currentUser];
    v15 = [v8 homeAccessControlForUser:v14];

    if (([v15 isOwner] & 1) != 0
      || ([v15 isAdministrator] & 1) != 0)
    {
      id v16 = [v10 simpleLabelAccessCodesForHome:v8];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_3CDC;
      v28[3] = &unk_C3D0;
      id v32 = a1;
      id v29 = v13;
      id v30 = v8;
      id v31 = v10;
      id v17 = [v16 flatMap:v28];

      goto LABEL_15;
    }
    id v24 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v26;
      __int16 v35 = 2112;
      id v36 = v8;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%{public}@We do not have admin privileges, so we cannot remove anyone from the home: %@", buf, 0x16u);
    }
    uint64_t v22 = +[NAFuture futureWithNoResult];
  }
  else
  {
    id v19 = a1;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v21;
      __int16 v35 = 2112;
      id v36 = v11;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized participant: %@", buf, 0x16u);
    }
    v15 = +[NSError errorWithDomain:HMErrorDomain code:48 userInfo:0];
    uint64_t v22 = +[NAFuture futureWithError:v15];
  }
  id v17 = (void *)v22;
LABEL_15:

  return v17;
}

+ (id)removeParticipantObject:(id)a3 fromHome:(id)a4 accessCodes:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([a1 canRemoveParticipantObject:v10 fromHome:v11 accessCodes:v12] & 1) == 0)
  {
    id v24 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      int v38 = 138543618;
      id v39 = v26;
      __int16 v40 = 2112;
      id v41 = v10;
      v27 = "%{public}@Cannot remove participant object: %@";
LABEL_8:
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v38, 0x16u);
    }
LABEL_9:

    id v19 = +[NSError errorWithDomain:HMErrorDomain code:48 userInfo:0];
    uint64_t v28 = +[NAFuture futureWithError:v19];
LABEL_10:
    uint64_t v22 = (void *)v28;
    goto LABEL_11;
  }
  uint64_t v14 = [v10 accessCode];

  if (!v14)
  {
    id v30 = [v10 outgoingInvitation];

    if (v30)
    {
      id v32 = a1;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = HMFGetLogIdentifier();
        int v38 = 138543874;
        id v39 = v34;
        __int16 v40 = 2112;
        id v41 = v11;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "%{public}@Removing outgoing invitation participant from home: %@, participantObject: %@", (uint8_t *)&v38, 0x20u);
      }
      id v19 = [v10 outgoingInvitation];
      uint64_t v28 = [v13 cancelInvitation:v19];
      goto LABEL_10;
    }
    __int16 v35 = [v10 user];

    id v24 = a1;
    id v36 = HMFGetOSLogHandle();
    v25 = v36;
    if (v35)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = HMFGetLogIdentifier();
        int v38 = 138543874;
        id v39 = v37;
        __int16 v40 = 2112;
        id v41 = v11;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%{public}@Removing user participant from home: %@, participantObject: %@", (uint8_t *)&v38, 0x20u);
      }
      id v19 = [v10 user];
      uint64_t v28 = [v13 removeUser:v19 fromHome:v11];
      goto LABEL_10;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      int v38 = 138543618;
      id v39 = v26;
      __int16 v40 = 2112;
      id v41 = v10;
      v27 = "%{public}@Participant object has all nil properties: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v16 = a1;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    int v38 = 138543874;
    id v39 = v18;
    __int16 v40 = 2112;
    id v41 = v11;
    __int16 v42 = 2112;
    id v43 = v10;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%{public}@Removing access code participant from home: %@, participantObject: %@", (uint8_t *)&v38, 0x20u);
  }
  id v19 = [v10 accessCode];
  v20 = [v19 accessCodeValue];
  v21 = [v20 stringValue];
  uint64_t v22 = [v13 removeSimpleLabelAccessCode:v21 fromHome:v11];

LABEL_11:

  return v22;
}

+ (id)sharedResourceForHome:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%{public}@Creating shared resource for home: %@", buf, 0x16u);
  }
  id v12 = [v6 currentUser];
  id v13 = [v6 homeAccessControlForUser:v12];

  if (([v13 isOwner] & 1) != 0
    || ([v13 isAdministrator] & 1) != 0)
  {
    uint64_t v14 = [v7 simpleLabelAccessCodesForHome:v6];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_460C;
    v21[3] = &unk_C3A8;
    id v22 = v6;
    id v23 = v9;
    v15 = [v14 flatMap:v21];
  }
  else
  {
    id v17 = v9;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "%{public}@We do not have admin privileges, so not creating a shared resource for home: %@", buf, 0x16u);
    }
    v15 = +[NAFuture futureWithResult:&__NSArray0__struct];
  }

  return v15;
}

+ (BOOL)canRemoveParticipantObject:(id)a3 fromHome:(id)a4 accessCodes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 currentUser];
  id v12 = [v9 homeAccessControlForUser:v11];

  if ([v12 isOwner]) {
    goto LABEL_5;
  }
  if (![v12 isAdministrator])
  {
LABEL_11:
    LOBYTE(v15) = 0;
    goto LABEL_12;
  }
  id v13 = [v8 accessCode];

  if (!v13)
  {
    uint64_t v14 = [v8 outgoingInvitation];

    if (!v14)
    {
      id v16 = [v8 user];

      if (v16)
      {
        id v17 = [v8 user];
        v18 = [v9 homeAccessControlForUser:v17];

        unsigned int v15 = [v18 isOwner] ^ 1;
        goto LABEL_12;
      }
      id v20 = a1;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        int v24 = 138543618;
        v25 = v22;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@Participant object has all nil properties: %@", (uint8_t *)&v24, 0x16u);
      }
      goto LABEL_11;
    }
  }
LABEL_5:
  LOBYTE(v15) = 1;
LABEL_12:

  return v15;
}

+ (id)participantObjectForParticipant:(id)a3 inHome:(id)a4 accessCodes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identity];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    id v19 = a1;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v35 = v21;
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@Invalid identity on participant: %@", buf, 0x16u);
    }
LABEL_11:
    id v17 = 0;
    goto LABEL_22;
  }
  uint64_t v14 = [v13 userID];

  if (!v14)
  {
    id v22 = [v13 pinCodeLabel];

    if (v22)
    {
      id v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      id v29 = sub_5128;
      id v30 = &unk_C308;
      id v31 = v13;
      id v23 = objc_msgSend(v10, "na_firstObjectPassingTest:", &v27);
      if (v23)
      {
        id v17 = +[HMDSParticipantObject homeParticipantObjectWithAccessCode:](HMDSParticipantObject, "homeParticipantObjectWithAccessCode:", v23, v27, v28, v29, v30);
      }
      else
      {
        id v17 = 0;
      }

      goto LABEL_22;
    }
    goto LABEL_11;
  }
  unsigned int v15 = [v13 userID];
  id v16 = [a1 outgoingInvitationForUserID:v15 inHome:v9];

  if (v16)
  {
    id v17 = +[HMDSParticipantObject homeParticipantObjectWithOutgoingInvitation:v16];
  }
  else
  {
    int v24 = [v9 users];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_50C4;
    v32[3] = &unk_C2E0;
    id v33 = v13;
    v25 = objc_msgSend(v24, "na_firstObjectPassingTest:", v32);

    if (v25)
    {
      id v17 = +[HMDSParticipantObject homeParticipantObjectWithUser:v25];
    }
    else
    {
      id v17 = 0;
    }
  }
LABEL_22:

  return v17;
}

+ (id)outgoingInvitationForUserID:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = [a4 outgoingInvitations];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_526C;
  v10[3] = &unk_C2B8;
  id v11 = v5;
  id v7 = v5;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

+ (id)participantForOutgoingInvitation:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  id v7 = [a3 invitee];
  id v8 = [a1 identityForUser:v7];

  id v9 = [HMDSParticipant alloc];
  id v10 = [v6 uniqueIdentifier];

  id v11 = [(HMDSParticipant *)v9 initWithRole:2 permission:1 identity:v8 homeUniqueIdentifier:v10];

  return v11;
}

+ (id)participantForAccessCode:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  id v7 = [a1 identityForAccessCode:a3];
  id v8 = [HMDSParticipant alloc];
  id v9 = [v6 uniqueIdentifier];

  id v10 = [(HMDSParticipant *)v8 initWithRole:2 permission:1 identity:v7 homeUniqueIdentifier:v9];

  return v10;
}

+ (id)participantForUser:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 homeAccessControlForUser:v7];
  uint64_t v9 = 1;
  if ([v8 isOwner]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  if ([v8 isAdministrator]) {
    uint64_t v9 = 2;
  }
  id v11 = [a1 identityForUser:v7];

  id v12 = [HMDSParticipant alloc];
  id v13 = [v6 uniqueIdentifier];

  uint64_t v14 = [(HMDSParticipant *)v12 initWithRole:v10 permission:v9 identity:v11 homeUniqueIdentifier:v13];

  return v14;
}

+ (id)identityForAccessCode:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 userInformation];
  id v6 = [v5 simpleLabel];
  [v4 setGivenName:v6];

  id v7 = [HMDSParticipantIdentity alloc];
  id v8 = [v3 userInformation];

  uint64_t v9 = [v8 simpleLabel];
  uint64_t v10 = [(HMDSParticipantIdentity *)v7 initWithUnifiedContactIdentifier:0 nameComponents:v4 emailAddress:0 phoneNumber:0 userID:0 pinCodeLabel:v9];

  return v10;
}

+ (id)identityForUser:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userID];
  if (objc_msgSend(v4, "hmds_isEmail"))
  {
    uint64_t v5 = [v3 userID];
  }
  else
  {
    uint64_t v5 = 0;
  }

  id v6 = [v3 userID];
  if (objc_msgSend(v6, "hmds_isPhoneNumber"))
  {
    uint64_t v7 = [v3 userID];
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v8 = [v3 userID];
  if (v8 && (v8, v5 | v7))
  {
    uint64_t v14 = [HMDSParticipantIdentity alloc];
    uint64_t v9 = [v3 userID];
    id v13 = [(HMDSParticipantIdentity *)v14 initWithUnifiedContactIdentifier:0 nameComponents:0 emailAddress:v5 phoneNumber:v7 userID:v9 pinCodeLabel:0];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [v3 name];
    [v9 setGivenName:v10];

    id v11 = [HMDSParticipantIdentity alloc];
    id v12 = [v3 userID];
    id v13 = [(HMDSParticipantIdentity *)v11 initWithUnifiedContactIdentifier:0 nameComponents:v9 emailAddress:0 phoneNumber:0 userID:v12 pinCodeLabel:0];
  }

  return v13;
}

+ (id)_combineAllFuturesWithNoResult:(id)a3
{
  id v3 = a3;
  id v4 = +[NAScheduler immediateScheduler];
  uint64_t v5 = +[NAFuture combineAllFutures:v3 scheduler:v4];

  id v6 = [v5 flatMap:&stru_C290];

  return v6;
}

@end