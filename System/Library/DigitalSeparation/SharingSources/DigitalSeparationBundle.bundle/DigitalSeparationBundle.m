void sub_2D58(id a1)
{
  uint64_t vars8;

  qword_11DC0 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

id sub_2F68(uint64_t a1, uint64_t a2)
{
  return +[HMDSUtilities sharedResourceForHome:a2 context:*(void *)(a1 + 32)];
}

NAFuture *__cdecl sub_301C(id a1, NSArray *a2)
{
  v2 = [(NSArray *)a2 na_flatMap:&stru_C480];
  v3 = +[NAFuture futureWithResult:v2];

  return (NAFuture *)v3;
}

NSArray *__cdecl sub_3084(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v2 && (isKindOfClass & 1) != 0)
  {
    id v4 = v2;
  }
  else
  {
    id v7 = v2;
    id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  v5 = v4;

  return (NSArray *)v5;
}

uint64_t sub_344C(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) homeUniqueIdentifier];
  uint64_t v5 = HMFEqualObjects();

  return v5;
}

uint64_t sub_3908(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 UUID];
  uint64_t v5 = [v3 uniqueIdentifier];

  uint64_t v6 = HMFEqualObjects();
  return v6;
}

id sub_3978(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) stopSharingHome:*(void *)(a1 + 32) withParticipant:a2 context:*(void *)(a1 + 40)];
}

id sub_3CDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 56) participantObjectForParticipant:*(void *)(a1 + 32) inHome:*(void *)(a1 + 40) accessCodes:v3];
  if (v4)
  {
    if ([*(id *)(a1 + 56) canRemoveParticipantObject:v4 fromHome:*(void *)(a1 + 40) accessCodes:v3])
    {
      uint64_t v5 = [*(id *)(a1 + 56) removeParticipantObject:v4 fromHome:*(void *)(a1 + 40) accessCodes:v3 context:*(void *)(a1 + 48)];
      goto LABEL_10;
    }
    id v7 = *(id *)(a1 + 56);
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v16 = 138543874;
      v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      v21 = v4;
      v12 = "%{public}@Found participant in home but cannot remove them because we do not have sufficient privileges. Hom"
            "e: %@, participantObject: %@";
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = *(id *)(a1 + 56);
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      v11 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v16 = 138543874;
      v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      v12 = "%{public}@Participant is not in home: %@ participant: %@";
LABEL_8:
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v16, 0x20u);
    }
  }

  uint64_t v5 = +[NAFuture futureWithNoResult];
LABEL_10:
  v14 = (void *)v5;

  return v14;
}

id sub_460C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) users];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_4AEC;
  v42[3] = &unk_C2E0;
  id v43 = *(id *)(a1 + 32);
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v42);

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_4B60;
  v40[3] = &unk_C330;
  long long v33 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v33;
  long long v41 = v33;
  id v7 = objc_msgSend(v5, "na_map:", v40);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_4B70;
  v38[3] = &unk_C358;
  long long v34 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v34;
  long long v39 = v34;
  v35 = v3;
  v9 = objc_msgSend(v3, "na_map:", v38);
  uint64_t v10 = [*(id *)(a1 + 32) outgoingInvitations];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_4B80;
  v36[3] = &unk_C380;
  long long v32 = *(_OWORD *)(a1 + 32);
  id v11 = (id)v32;
  long long v37 = v32;
  v12 = objc_msgSend(v10, "na_map:", v36);

  if (objc_msgSend(v7, "hmf_isEmpty")
    && objc_msgSend(v9, "hmf_isEmpty")
    && objc_msgSend(v12, "hmf_isEmpty"))
  {
    id v14 = *(id *)(a1 + 40);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      v17 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v46 = v16;
      __int16 v47 = 2112;
      v48 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%{public}@There are no users we can remove, so not creating a shared resource for home: %@", buf, 0x16u);
    }
    __int16 v18 = +[NAFuture futureWithResult:&__NSArray0__struct];
  }
  else
  {
    uint64_t v19 = v5;
    __int16 v20 = objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9, v32);
    v21 = [v20 arrayByAddingObjectsFromArray:v12];

    id v23 = *(id *)(a1 + 40);
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v46 = v25;
      __int16 v47 = 2112;
      v48 = v21;
      __int16 v49 = 2112;
      v50 = v35;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "%{public}@Home has participants: %@, accessCodes: %@", buf, 0x20u);
    }
    v26 = [HMDSHomeSharedResource alloc];
    v27 = [*(id *)(a1 + 32) name];
    v28 = [*(id *)(a1 + 32) uniqueIdentifier];
    v29 = [(HMDSHomeSharedResource *)v26 initWithDisplayName:v27 displayDetail:0 participants:v21 UUID:v28];

    v44 = v29;
    v30 = +[NSArray arrayWithObjects:&v44 count:1];
    __int16 v18 = +[NAFuture futureWithResult:v30];

    uint64_t v5 = v19;
  }

  return v18;
}

uint64_t sub_4AEC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 homeAccessControlForUser:v3];
  unsigned __int8 v5 = [v3 isCurrentUser];

  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [v4 isOwner] ^ 1;
  }

  return v6;
}

id sub_4B60(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) participantForUser:a2 inHome:*(void *)(a1 + 32)];
}

id sub_4B70(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) participantForAccessCode:a2 inHome:*(void *)(a1 + 32)];
}

id sub_4B80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) participantForOutgoingInvitation:a2 inHome:*(void *)(a1 + 32)];
}

id sub_50C4(uint64_t a1, void *a2)
{
  id v3 = [a2 userID];
  id v4 = [*(id *)(a1 + 32) userID];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

id sub_5128(uint64_t a1, void *a2)
{
  id v3 = [a2 userInformation];
  id v4 = [v3 simpleLabel];
  id v5 = [*(id *)(a1 + 32) pinCodeLabel];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

id sub_526C(uint64_t a1, void *a2)
{
  id v3 = [a2 invitee];
  id v4 = [v3 userID];
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

NAFuture *__cdecl sub_5838(id a1, NSArray *a2)
{
  return +[NAFuture futureWithNoResult];
}

void sub_5B24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id sub_5B38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  id v3 = [v2 _beginActiveAssertionWithReason:@"DigitalSeparation API Call"];

  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5C34;
  v8[3] = &unk_C698;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 addCompletionBlock:v8];

  return v6;
}

void sub_5C34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  [v2 _endActiveAssertion:*(void *)(a1 + 40)];
}

id sub_5E2C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextFactory];
  id v3 = [*(id *)(a1 + 32) homeManager];
  id v4 = ((void (**)(void, void *))v2)[2](v2, v3);

  id v5 = +[HMDSUtilities stopSharingWithParticipant:*(void *)(a1 + 40) context:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5F5C;
  v9[3] = &unk_C648;
  id v6 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = [v5 addCompletionBlock:v9];

  return v7;
}

void sub_5F5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%{public}@Calling completion after stopping sharing with participant: %@ with error: %@", (uint8_t *)&v12, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_6238(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextFactory];
  id v3 = [*(id *)(a1 + 32) homeManager];
  id v4 = ((void (**)(void, void *))v2)[2](v2, v3);

  id v5 = +[HMDSUtilities stopSharingResource:*(void *)(a1 + 40) context:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6368;
  v9[3] = &unk_C648;
  id v6 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = [v5 addCompletionBlock:v9];

  return v7;
}

void sub_6368(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%{public}@Calling completion after stopping sharing resource: %@ with error: %@", (uint8_t *)&v12, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_6604(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextFactory];
  id v3 = [*(id *)(a1 + 32) homeManager];
  id v4 = ((void (**)(void, void *))v2)[2](v2, v3);

  id v5 = +[HMDSUtilities sharedResourcesForContext:v4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_678C;
  v13[3] = &unk_C5F8;
  id v14 = v4;
  id v6 = v4;
  id v7 = [v5 flatMap:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6854;
  v11[3] = &unk_C620;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v8;
  id v9 = [v7 addCompletionBlock:v11];

  return v9;
}

id sub_678C(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6980;
  v6[3] = &unk_C5D0;
  id v7 = *(id *)(a1 + 32);
  id v3 = objc_msgSend(a2, "na_map:", v6);
  id v4 = +[HMDSUtilities _combineAllFuturesWithNoResult:v3];

  return v4;
}

void sub_6854(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%{public}@Calling completion after stopping all sharing with error: %@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_6980(uint64_t a1, uint64_t a2)
{
  return +[HMDSUtilities stopSharingResource:a2 context:*(void *)(a1 + 32)];
}

void sub_6B38(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v7;
      __int16 v30 = 2112;
      id v31 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%{public}@Calling completion with error because we failed to refresh the home manager with error: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) contextFactory];
    id v9 = [*(id *)(a1 + 32) homeManager];
    id v10 = ((void (**)(void, void *))v8)[2](v8, v9);

    if (![v10 dataSyncState]
      || [v10 dataSyncState] == &dword_4
      || [v10 dataSyncState] == (char *)&dword_4 + 1)
    {
      id v12 = *(id *)(a1 + 32);
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        [v10 status];
        uint64_t v15 = HMHomeManagerStatusToString();
        [v10 dataSyncState];
        __int16 v16 = HMHomeManagerDataSyncStateToString();
        *(_DWORD *)buf = 138543874;
        v29 = v14;
        __int16 v30 = 2112;
        id v31 = v15;
        __int16 v32 = 2112;
        long long v33 = v16;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%{public}@Calling completion with error because home manager is not ready. Status: %@, DataSyncState: %@", buf, 0x20u);
      }
      uint64_t v17 = *(void *)(a1 + 40);
      __int16 v18 = +[NSError errorWithDomain:HMErrorDomain code:77 userInfo:0];
      (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, &__NSArray0__struct, v18);
    }
    else if ([v10 status] || objc_msgSend(v10, "dataSyncState") != (char *)&dword_0 + 1)
    {
      id v21 = *(id *)(a1 + 32);
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        [v10 status];
        v24 = HMHomeManagerStatusToString();
        [v10 dataSyncState];
        v25 = HMHomeManagerDataSyncStateToString();
        *(_DWORD *)buf = 138543874;
        v29 = v23;
        __int16 v30 = 2112;
        id v31 = v24;
        __int16 v32 = 2112;
        long long v33 = v25;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%{public}@Calling completion with empty array because home manager is not ready, but it is not clear that we are in an error state. Status: %@, DataSyncState: %@", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v19 = *(void **)(a1 + 32);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_6F68;
      v26[3] = &unk_C580;
      v26[4] = v19;
      id v27 = *(id *)(a1 + 40);
      [v19 _flatMapWithAssertion:v26];
    }
  }
}

id sub_6F68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextFactory];
  id v3 = [*(id *)(a1 + 32) homeManager];
  id v4 = ((void (**)(void, void *))v2)[2](v2, v3);

  id v5 = +[HMDSUtilities sharedResourcesForContext:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7080;
  v9[3] = &unk_C558;
  id v6 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v7 = [v5 addCompletionBlock:v9];

  return v7;
}

void sub_7080(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%{public}@Calling completion after fetching shared resources: %@, with error: %@", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_73C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

HMDSContext *__cdecl sub_73C8(id a1, HMHomeManager *a2)
{
  id v2 = a2;
  id v3 = [HMDSContext alloc];
  id v4 = [(HMHomeManager *)v2 homes];
  id v5 = [(HMDSContext *)v3 initWithHomeManager:v2 homes:v4];

  return v5;
}

void sub_749C(id a1)
{
  qword_11DD0 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

void sub_754C(id a1)
{
  qword_11DD8 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"SELF MATCHES %@", @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*");

  _objc_release_x1();
}

void sub_7A7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      __int16 v13 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to remove access code", (uint8_t *)&v12, 0xCu);
    }
    int v11 = +[NSError errorWithDomain:@"HMDigitalSeparationErrorDomain" code:1 userInfo:0];
    [*(id *)(a1 + 40) finishWithError:v11];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void sub_7CA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "na_map:", &stru_C740);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) finishWithResult:v6 error:v5];
}

HMHomeAccessCode *__cdecl sub_7D20(id a1, HMHomeAccessCode *a2)
{
  id v2 = a2;
  id v3 = [(HMHomeAccessCode *)v2 userInformation];
  id v4 = [v3 simpleLabel];

  if (v4) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void sub_7EC8(id a1)
{
  qword_11DF0 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

uint64_t HMFCreateOSLogHandle()
{
  return _HMFCreateOSLogHandle();
}

uint64_t HMFEqualObjects()
{
  return _HMFEqualObjects();
}

uint64_t HMFGetLogIdentifier()
{
  return _HMFGetLogIdentifier();
}

uint64_t HMFGetOSLogHandle()
{
  return _HMFGetOSLogHandle();
}

uint64_t HMHomeManagerDataSyncStateToString()
{
  return _HMHomeManagerDataSyncStateToString();
}

uint64_t HMHomeManagerStatusToString()
{
  return _HMHomeManagerStatusToString();
}

uint64_t _HMFPreconditionFailure()
{
  return __HMFPreconditionFailure();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_accessCode(void *a1, const char *a2, ...)
{
  return [a1 accessCode];
}

id objc_msgSend_accessCodeValue(void *a1, const char *a2, ...)
{
  return [a1 accessCodeValue];
}

id objc_msgSend_apiCallFuture(void *a1, const char *a2, ...)
{
  return [a1 apiCallFuture];
}

id objc_msgSend_contextFactory(void *a1, const char *a2, ...)
{
  return [a1 contextFactory];
}

id objc_msgSend_controlCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 controlCharacterSet];
}

id objc_msgSend_createAccessCodeManager(void *a1, const char *a2, ...)
{
  return [a1 createAccessCodeManager];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_dataSyncState(void *a1, const char *a2, ...)
{
  return [a1 dataSyncState];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultPrivateConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultPrivateConfiguration];
}

id objc_msgSend_didUpdateHomesFuture(void *a1, const char *a2, ...)
{
  return [a1 didUpdateHomesFuture];
}

id objc_msgSend_errorOnlyCompletionHandlerAdapter(void *a1, const char *a2, ...)
{
  return [a1 errorOnlyCompletionHandlerAdapter];
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return [a1 finishWithNoResult];
}

id objc_msgSend_futureWithNoResult(void *a1, const char *a2, ...)
{
  return [a1 futureWithNoResult];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return [a1 homeManager];
}

id objc_msgSend_homeUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 homeUniqueIdentifier];
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return [a1 homes];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_immediateScheduler(void *a1, const char *a2, ...)
{
  return [a1 immediateScheduler];
}

id objc_msgSend_invitee(void *a1, const char *a2, ...)
{
  return [a1 invitee];
}

id objc_msgSend_isAdministrator(void *a1, const char *a2, ...)
{
  return [a1 isAdministrator];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUser];
}

id objc_msgSend_isOwner(void *a1, const char *a2, ...)
{
  return [a1 isOwner];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_outgoingInvitation(void *a1, const char *a2, ...)
{
  return [a1 outgoingInvitation];
}

id objc_msgSend_outgoingInvitations(void *a1, const char *a2, ...)
{
  return [a1 outgoingInvitations];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_pinCodeLabel(void *a1, const char *a2, ...)
{
  return [a1 pinCodeLabel];
}

id objc_msgSend_simpleLabel(void *a1, const char *a2, ...)
{
  return [a1 simpleLabel];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return [a1 userID];
}

id objc_msgSend_userInformation(void *a1, const char *a2, ...)
{
  return [a1 userInformation];
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return [a1 users];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}