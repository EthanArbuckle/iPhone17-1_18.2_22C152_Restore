@interface IDSDGroupContextDataSource
+ (id)sharedInstance;
- (IDSDGroupContextDataSource)init;
- (IDSGroupServer)groupServer;
- (id)_groupWithDeviceIdentity:(id)a3 parent:(id)a4 groupInfo:(id)a5 error:(id *)a6;
- (id)_sponsorAccount;
- (id)_sponsorAlias;
- (void)_groupFromServerResponse:(id)a3 context:(id)a4 groupID:(id)a5 error:(id)a6 resultCode:(int64_t)a7 resultDictionary:(id)a8 allEntries:(id)a9 completion:(id)a10;
- (void)groupContext:(id)a3 fetchGroupWithID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 upsertGroupWithInfo:(id)a4 previousGroup:(id)a5 completion:(id)a6;
- (void)groupFromPublicDataRepresentation:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)participantsForCypher:(id)a3 completion:(id)a4;
- (void)publicDataRepresentationForGroup:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)setGroupServer:(id)a3;
- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5;
@end

@implementation IDSDGroupContextDataSource

+ (id)sharedInstance
{
  if (qword_100A4A6D8 != -1) {
    dispatch_once(&qword_100A4A6D8, &stru_100982970);
  }
  v2 = (void *)qword_100A4A6E0;

  return v2;
}

- (IDSDGroupContextDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSDGroupContextDataSource;
  v2 = [(IDSDGroupContextDataSource *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IDSGroupServer);
    groupServer = v2->_groupServer;
    v2->_groupServer = v3;
  }
  return v2;
}

- (void)groupContext:(id)a3 upsertGroupWithInfo:(id)a4 previousGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 accountIdentity];
  v15 = [v14 deviceKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = v15;
    v16 = [v10 accountIdentity];
    v17 = [v16 deviceKey];

    v50 = [v12 cypher];
    [v50 conversationGroup];
    v49 = id v66 = 0;
    v51 = v11;
    v18 = -[IDSDGroupContextDataSource _groupWithDeviceIdentity:parent:groupInfo:error:](self, "_groupWithDeviceIdentity:parent:groupInfo:error:", v17);
    id v19 = v66;
    v52 = v17;
    v20 = [v17 accountIdentity];
    v21 = [v20 signingIdentity];
    id v65 = v19;
    uint64_t v22 = [v18 publicDataRepresentationWithSponsor:v21 error:&v65];
    id v23 = v65;

    v24 = (void *)v22;
    if (v22)
    {
      +[NSMutableData dataWithData:v22];
      v46 = id v64 = v23;
      v25 = objc_msgSend(v18, "signData:error:");
      id v47 = v23;

      v26 = v18;
      if (v25)
      {
        v27 = [v18 publicKeyData];
        if (v12)
        {
          v43 = [v18 forwardingTicket];
          v28 = [v12 groupID];
          [v28 stableGroupID];
          v30 = v29 = v25;
          v45 = [v30 dataRepresentation];

          v31 = [v12 groupID];
          v44 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (int)[v31 generation]);

          v25 = v29;
        }
        else
        {
          v43 = 0;
          v44 = 0;
          v45 = 0;
        }
        v41 = v25;
        v42 = [(IDSDGroupContextDataSource *)self groupServer];
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100118A7C;
        v53[3] = &unk_1009829C0;
        v53[4] = self;
        id v54 = v10;
        id v55 = v47;
        id v63 = v13;
        id v56 = v26;
        id v57 = v52;
        id v58 = v51;
        id v59 = v27;
        id v60 = v24;
        id v61 = v25;
        id v62 = v43;
        id v37 = v43;
        v38 = v27;
        id v39 = v37;
        id v40 = v38;
        id v11 = v51;
        [v42 publishGroupForKey:v40 data:v60 signature:v61 forwardingSig:v39 ENID:v45 version:v44 completion:v53];

        v36 = v41;
        id v35 = v47;
        v15 = v48;
      }
      else
      {
        v34 = +[ENLog groupContext];
        id v11 = v51;
        id v35 = v47;
        v15 = v48;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138478595;
          v68 = v51;
          __int16 v69 = 2113;
          id v70 = v10;
          __int16 v71 = 2114;
          id v72 = v12;
          __int16 v73 = 2114;
          id v74 = v47;
          _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Unable to create group signature {groupInfo: %{private}@, groupContext: %{private}@, previousGroup: %{public}@, error: %{public}@}", buf, 0x2Au);
        }

        (*((void (**)(id, void, id))v13 + 2))(v13, 0, v47);
        v36 = 0;
      }

      id v23 = v35;
    }
    else
    {
      v33 = +[ENLog groupContext];
      id v11 = v51;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138478595;
        v68 = v51;
        __int16 v69 = 2113;
        id v70 = v10;
        __int16 v71 = 2114;
        id v72 = v12;
        __int16 v73 = 2114;
        id v74 = v23;
        _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Unable to get group.publicRepresentation {groupInfo: %{private}@, groupContext: %{private}@, previousGroup: %{public}@, error: %{public}@}", buf, 0x2Au);
      }

      (*((void (**)(id, void, id))v13 + 2))(v13, 0, v23);
      v26 = v18;
      v15 = v48;
    }
  }
  else
  {
    v32 = +[ENLog groupContext];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      sub_100710FEC();
    }

    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

- (void)_groupFromServerResponse:(id)a3 context:(id)a4 groupID:(id)a5 error:(id)a6 resultCode:(int64_t)a7 resultDictionary:(id)a8 allEntries:(id)a9 completion:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = [v15 accountIdentity];
  uint64_t v22 = [v21 deviceKey];

  objc_opt_class();
  id v59 = (void *)v22;
  if (objc_opt_isKindOfClass())
  {
    id v56 = v20;
    id v23 = [v15 accountIdentity];
    id v65 = [v23 deviceKey];

    id v58 = objc_alloc_init((Class)NSMutableArray);
    if (v17 || ![v19 count])
    {
      v24 = +[ENLog groupContext];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_1007111B0();
      }

      (*((void (**)(id, void, id))v20 + 2))(v20, 0, v17);
    }
    else
    {
      id v54 = v15;
      v26 = +[ENLog groupContext];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v90 = v14;
        __int16 v91 = 2112;
        uint64_t v92 = 0;
        __int16 v93 = 2112;
        id v94 = v18;
        __int16 v95 = 2112;
        id v96 = v19;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Got groups {%@ %@ %@ %@}", buf, 0x2Au);
      }
      id v52 = v18;
      id v55 = v14;

      id v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v19, "count"));
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v51 = v19;
      id obj = v19;
      id v28 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v84;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v84 != v30) {
              objc_enumerationMutation(obj);
            }
            uint64_t v32 = *(void *)(*((void *)&v83 + 1) + 8 * i);
            v33 = [IDSMPConversationGroupEntry alloc];
            v34 = [v16 stableGroupID];
            id v35 = [(IDSMPConversationGroupEntry *)v33 initWithStableGroupID:v34 groupServerEntry:v32];

            [v27 addObject:v35];
          }
          id v29 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
        }
        while (v29);
      }
      v53 = v16;

      id v62 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(obj, "count"));
      id v63 = objc_alloc_init((Class)NSMutableSet);
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v60 = v27;
      id v66 = [v60 countByEnumeratingWithState:&v79 objects:v87 count:16];
      if (v66)
      {
        uint64_t v64 = *(void *)v80;
        do
        {
          for (j = 0; j != v66; j = (char *)j + 1)
          {
            if (*(void *)v80 != v64) {
              objc_enumerationMutation(v60);
            }
            id v37 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
            v38 = [v37 data];
            id v39 = [v37 publicKeyData];
            id v40 = [v37 signature];
            v41 = [v37 groupID];
            v42 = [v37 forwardingTicket];
            v43 = [v65 modernIdentity];
            id v78 = 0;
            v44 = +[IDSMPConversationGroup conversationSponsorPairFromPublicData:v38 publicKey:v39 signature:v40 groupID:v41 parent:0 parentPublicKey:0 forwardingTicket:v42 fullDeviceIdentity:v43 error:&v78];
            id v45 = v78;

            if (v44)
            {
              v46 = [v37 publicKeyData];
              [v62 setObject:v44 forKeyedSubscript:v46];

              id v47 = [v44 sponsorAlias];
              [v63 addObject:v47];
            }
          }
          id v66 = [v60 countByEnumeratingWithState:&v79 objects:v87 count:16];
        }
        while (v66);
      }

      v48 = [v63 allObjects];
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100119730;
      v67[3] = &unk_100982A10;
      id v68 = v60;
      id v69 = v62;
      id v70 = v58;
      id v71 = v65;
      id v72 = 0;
      id v16 = v53;
      id v73 = v53;
      id v74 = self;
      id v15 = v54;
      id v75 = v54;
      id v77 = v56;
      id v76 = obj;
      id v49 = v62;
      id v50 = v60;
      [(IDSDGroupContextDataSource *)self _participantsForDestinations:v48 completion:v67];

      id v20 = v56;
      id v14 = v55;
      id v18 = v52;
      id v17 = 0;
      id v19 = v51;
    }
  }
  else
  {
    v25 = +[ENLog groupContext];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_100710FEC();
    }

    (*((void (**)(id, void, void))v20 + 2))(v20, 0, 0);
  }
}

- (void)groupContext:(id)a3 fetchGroupWithID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 stableGroupID];
  id v12 = [v11 dataRepresentation];

  id v13 = [(IDSDGroupContextDataSource *)self groupServer];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10011A340;
  v17[3] = &unk_100982A38;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v13 queryGroupServerForENID:v12 withCompletion:v17];
}

- (void)publicDataRepresentationForGroup:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = +[ENLog groupContext];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v52 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "group->groupPublicData -- Start {group: %{private}@}", buf, 0xCu);
  }

  id v11 = [v8 accountIdentity];
  id v12 = [v11 accountKey];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v36 = +[ENLog groupContext];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      sub_1007113DC(v8);
    }

    uint64_t v37 = ENGroupContextErrorDomain;
    NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
    CFStringRef v58 = @"Unepxcted account key class. Expected IDSAccountIdentity";
    v38 = &v58;
    id v39 = &v57;
    goto LABEL_19;
  }
  id v14 = [v7 cypher];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0)
  {
    id v40 = +[ENLog groupContext];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      sub_10071134C(v7);
    }

    uint64_t v37 = ENGroupContextErrorDomain;
    NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
    CFStringRef v56 = @"Unexpected cypher class. Expected IDSConversationGroupCypher";
    v38 = &v56;
    id v39 = &v55;
LABEL_19:
    id v22 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v39 count:1];
    id v17 = +[NSError errorWithDomain:v37 code:-1000 userInfo:v22];
    v9[2](v9, 0, v17);
    goto LABEL_32;
  }
  id v16 = [v8 accountIdentity];
  id v17 = [v16 accountKey];

  id v18 = [v7 cypher];
  id v19 = [v18 conversationGroup];
  id v20 = [v17 signingIdentity];
  id v50 = 0;
  v21 = [v19 publicDataRepresentationWithSponsor:v20 error:&v50];
  id v22 = v50;

  if (v21)
  {
    id v49 = v22;
    [v19 signData:v21 error:&v49];
    id v23 = v19;
    v25 = v24 = v21;
    id v46 = v49;

    id v47 = v24;
    if (v25)
    {
      id v45 = v18;
      v26 = objc_alloc_init(IDSMPConversationGroupEntry);
      [(IDSMPConversationGroupEntry *)v26 setData:v24];
      v44 = v25;
      [(IDSMPConversationGroupEntry *)v26 setSignature:v25];
      id v27 = [v23 publicKeyData];
      [(IDSMPConversationGroupEntry *)v26 setPublicKeyData:v27];

      id v28 = [v23 groupID];
      [(IDSMPConversationGroupEntry *)v26 setGroupID:v28];

      id v29 = [v23 forwardingTicket];
      [(IDSMPConversationGroupEntry *)v26 setForwardingTicket:v29];

      id v48 = v46;
      uint64_t v30 = [(IDSMPConversationGroupEntry *)v26 publicDataRepresentationWithError:&v48];
      id v43 = v48;

      v31 = +[ENLog groupContext];
      uint64_t v32 = v31;
      id v19 = v23;
      if (v30)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 length]);
          *(_DWORD *)buf = 138543362;
          id v52 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "group->groupPublicData -- Success {publicDataRepresentation.length: %{public}@}", buf, 0xCu);
        }
        v34 = +[ENLog groupContext];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          sub_1007112D8();
        }

        ((void (**)(id, void *, void *))v9)[2](v9, v30, 0);
        id v35 = v43;
        v25 = v44;
      }
      else
      {
        id v35 = v43;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543619;
          id v52 = v43;
          __int16 v53 = 2113;
          id v54 = v7;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed group->groupPublicData -- could not create data from entry {error: %{public}@, group: %{private}@}", buf, 0x16u);
        }

        v9[2](v9, 0, v43);
        v25 = v44;
      }

      id v18 = v45;
    }
    else
    {
      v42 = +[ENLog groupContext];
      id v35 = v46;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v52 = v46;
        __int16 v53 = 2113;
        id v54 = v7;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Failed group->groupPublicData -- could not create signature {error: %{public}@, group: %{private}@}", buf, 0x16u);
      }

      v9[2](v9, 0, v46);
      id v19 = v23;
    }

    id v22 = v35;
    v21 = v47;
  }
  else
  {
    v41 = +[ENLog groupContext];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v52 = v22;
      __int16 v53 = 2113;
      id v54 = v7;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Failed group->groupPublicData -- could not create publicGroupData {error: %{public}@, group: %{private}@}", buf, 0x16u);
    }

    v9[2](v9, 0, v22);
  }

LABEL_32:
}

- (void)groupFromPublicDataRepresentation:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ENLog groupContext];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v54 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "groupPublicData->Group -- Start {data: %{private}@}", buf, 0xCu);
  }

  id v49 = 0;
  id v12 = +[IDSMPConversationGroupEntry entryFromPublicDataRepresentation:v8 error:&v49];
  id v13 = v49;
  if (v12)
  {
    id v14 = [v9 accountIdentity];
    char v15 = [v14 deviceKey];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v35 = self;
      id v39 = v8;
      id v17 = [v9 accountIdentity];
      id v18 = [v17 deviceKey];

      id v19 = [v12 data];
      id v20 = [v12 publicKeyData];
      v21 = [v12 signature];
      id v22 = [v12 groupID];
      [v12 forwardingTicket];
      uint64_t v37 = v9;
      id v23 = v38 = v18;
      v24 = [v18 modernIdentity];
      id v48 = v13;
      v25 = +[IDSMPConversationGroup conversationSponsorPairFromPublicData:v19 publicKey:v20 signature:v21 groupID:v22 parent:0 parentPublicKey:0 forwardingTicket:v23 fullDeviceIdentity:v24 error:&v48];
      id v36 = v48;

      if (v25)
      {
        v26 = [v25 sponsorAlias];
        id v50 = v26;
        id v27 = +[NSArray arrayWithObjects:&v50 count:1];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10011AF1C;
        v40[3] = &unk_100982A60;
        id v41 = v25;
        id v47 = v10;
        id v42 = v12;
        id v43 = v36;
        v44 = v35;
        id v45 = v38;
        id v9 = v37;
        id v46 = v37;
        [(IDSDGroupContextDataSource *)v35 _participantsForDestinations:v27 completion:v40];

        id v8 = v39;
        id v28 = v38;
        id v13 = v36;
      }
      else
      {
        id v9 = v37;
        id v28 = v38;
        v34 = +[ENLog groupContext];
        id v13 = v36;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          sub_10071146C((uint64_t)v36, (uint64_t)v12, v34);
        }

        (*((void (**)(id, void, id))v10 + 2))(v10, 0, v36);
        id v8 = v39;
      }
    }
    else
    {
      uint64_t v30 = +[ENLog groupContext];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_1007114E4(v9);
      }

      uint64_t v31 = ENGroupContextErrorDomain;
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      CFStringRef v52 = @"Unepxcted device key class. Expected IDSDeviceIdentity";
      uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      v33 = +[NSError errorWithDomain:v31 code:-1000 userInfo:v32];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v33);
    }
  }
  else
  {
    id v29 = +[ENLog groupContext];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v54 = v13;
      __int16 v55 = 2113;
      id v56 = v8;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed groupPublicData->Group {error: %{public}@, data: %{private}@}", buf, 0x16u);
    }

    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

- (void)participantsForCypher:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = [v8 conversationGroup];
    id v10 = [v9 groupMembers];

    id v11 = [v10 allKeys];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10011B710;
    v13[3] = &unk_100982A88;
    id v14 = v7;
    [(IDSDGroupContextDataSource *)self _participantsForDestinations:v11 completion:v13];
  }
  else
  {
    id v12 = +[ENLog groupContext];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_1007115E4();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, id, void))a5;
  id v8 = a4;
  id v12 = [a3 cypher];
  id v9 = [v12 conversationGroup];
  id v10 = [v8 cypher];

  id v11 = [v10 conversationGroup];
  v7[2](v7, [v9 isParentOfGroup:v11], 0);
}

- (id)_groupWithDeviceIdentity:(id)a3 parent:(id)a4 groupInfo:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)_sponsorAlias
{
  v2 = [(IDSDGroupContextDataSource *)self _sponsorAccount];
  v3 = [v2 prefixedURIStringsFromRegistration];
  v4 = [v3 firstObject];

  return v4;
}

- (id)_sponsorAccount
{
  v2 = +[IDSDServiceController sharedInstance];
  v3 = [v2 serviceWithPushTopic:@"com.apple.madrid"];

  v4 = +[IDSDAccountController sharedInstance];
  v5 = [v4 accountsOnService:v3];

  id v6 = [v5 firstObject];

  return v6;
}

- (IDSGroupServer)groupServer
{
  return self->_groupServer;
}

- (void)setGroupServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end