@interface CHInteraction
- (CHInteraction)init;
- (CSSearchableIndex)searchableIndex;
- (void)deleteInteractionWithCall:(id)a3;
- (void)deleteInteractionWithCalls:(id)a3;
- (void)donateCallHistoryInteractionWithCall:(id)a3;
@end

@implementation CHInteraction

- (CHInteraction)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHInteraction;
  v2 = [(CHInteraction *)&v6 init];
  if (v2)
  {
    v3 = (CSSearchableIndex *)objc_alloc_init((Class)CSSearchableIndex);
    searchableIndex = v2->_searchableIndex;
    v2->_searchableIndex = v3;
  }
  return v2;
}

- (void)donateCallHistoryInteractionWithCall:(id)a3
{
  id v63 = a3;
  v3 = +[CHLogServer sharedInstance];
  v4 = [v3 logHandleForDomain:"intent"];

  v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v63 uniqueId];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding interaction for call %{public}@", (uint8_t *)&buf, 0xCu);
  }
  v7 = [v63 serviceProvider];
  uint64_t v60 = CHServiceProviderToINPreferredCallProvider(v7);

  if (v60)
  {
    id v8 = objc_alloc((Class)CHContactProvider);
    id v9 = objc_alloc_init((Class)CNContactStore);
    v58 = [v8 initWithDataSource:v9];

    v89[0] = CNContactIdentifierKey;
    v89[1] = CNContactPhoneNumbersKey;
    v89[2] = CNContactEmailAddressesKey;
    v10 = +[NSPersonNameComponents descriptorForUsedKeys];
    v89[3] = v10;
    v57 = +[NSArray arrayWithObjects:v89 count:4];

    id v88 = v63;
    v11 = +[NSArray arrayWithObjects:&v88 count:1];
    id v77 = 0;
    v62 = [v58 contactsByHandleForCalls:v11 keyDescriptors:v57 error:&v77];
    id v56 = v77;

    if (v62)
    {
      id v61 = objc_alloc_init((Class)NSMutableArray);
      v12 = [v63 remoteParticipantHandles];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v74 = 0u;
      long long v73 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v73 objects:v87 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v74;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v74 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            if ((char *)[v16 type] - 4 >= (char *)0xFFFFFFFFFFFFFFFELL)
            {
              v17 = [v62 objectForKeyedSubscript:v16];
              v18 = [v17 firstObject];

              v19 = [v63 isoCountryCode];
              v20 = CHHandleToINPersonHandle(v16, v18, v19);

              if (v18)
              {
                v21 = +[NSPersonNameComponents componentsForContact:v18];
              }
              else
              {
                v21 = 0;
              }
              id v22 = objc_alloc((Class)INPerson);
              v23 = [v18 identifier];
              LOBYTE(v55) = 0;
              id v24 = [v22 initWithPersonHandle:v20 nameComponents:v21 displayName:0 image:0 contactIdentifier:v23 customIdentifier:0 isMe:v55];

              [v61 addObject:v24];
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v73 objects:v87 count:16];
        }
        while (v13);
      }
    }
    else
    {
      if (!v56)
      {
        id v61 = 0;
        goto LABEL_25;
      }
      v28 = +[CHLogServer sharedInstance];
      v12 = [v28 logHandleForDomain:"intent"];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002F684((uint64_t)v56, v12);
      }
      id v61 = 0;
    }

LABEL_25:
    uint64_t v29 = CHTTYTypeToINTTYType((uint64_t)[v63 ttyType]);
    BOOL v30 = CHRecentCallMediaTypeToINCallCapability((BOOL)[v63 mediaType]);
    id v31 = objc_alloc_init((Class)INStartCallIntentDonationMetadata);
    v32 = [v63 timeToEstablish];
    [v32 doubleValue];
    objc_msgSend(v31, "setTimeToEstablish:");

    [v63 duration];
    objc_msgSend(v31, "setCallDuration:");
    v33 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v63 callStatus]);
    [v31 setRecentCallStatus:v33];

    v34 = [v63 disconnectedCause];
    [v31 setDisconnectedReason:v34];

    id v35 = [objc_alloc((Class)INStartCallIntent) initWithAudioRoute:0 destinationType:1 preferredCallProvider:v60 contacts:v61 recordTypeForRedialing:0 ttyType:v29 callCapability:v30];
    [v35 _setLaunchId:@"com.apple.InCallService"];
    [v35 _setExtensionBundleId:@"com.apple.TelephonyUtilities.PhoneIntentHandler"];
    v36 = [v63 notificationThreadIdentifier];
    [v35 setNotificationThreadIdentifier:v36];

    [v35 setDonationMetadata:v31];
    id v37 = [objc_alloc((Class)INInteraction) initWithIntent:v35 response:0];
    v38 = [v63 interactionDateInterval];
    [v37 setDateInterval:v38];

    objc_msgSend(v37, "setDirection:", CHCallStatusToINInteractionDirection((int)objc_msgSend(v63, "callStatus")));
    v39 = [v63 uniqueId];
    [v37 setIdentifier:v39];

    [v37 setIntentHandlingStatus:3];
    if ([v63 callStatus] == 8)
    {
      id location = 0;
      p_id location = &location;
      uint64_t v80 = 0x2050000000;
      id v40 = (id)qword_100053E78;
      uint64_t v81 = qword_100053E78;
      if (!qword_100053E78)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        uint64_t v83 = (uint64_t)sub_10002925C;
        v84 = (uint64_t (*)(uint64_t, uint64_t))&unk_100049978;
        v85 = &location;
        sub_10002925C((uint64_t)&buf);
        id v40 = p_location[3];
      }
      id v41 = v40;
      _Block_object_dispose(&location, 8);
      v42 = [v41 appIntentsStream];
      v43 = [v42 name];

      id location = 0;
      p_id location = &location;
      uint64_t v80 = 0x2020000000;
      v44 = (id *)qword_100053E88;
      uint64_t v81 = qword_100053E88;
      if (!qword_100053E88)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        uint64_t v83 = (uint64_t)sub_100029428;
        v84 = (uint64_t (*)(uint64_t, uint64_t))&unk_100049978;
        v85 = &location;
        v45 = (void *)sub_1000292B4();
        v46 = dlsym(v45, "_DKKnowledgeStorageDidInsertEventsNotification");
        *((void *)v85[1] + 3) = v46;
        qword_100053E88 = *((void *)v85[1] + 3);
        v44 = (id *)p_location[3];
      }
      _Block_object_dispose(&location, 8);
      if (!v44)
      {
        sub_10002F660();
        __break(1u);
      }
      id v47 = *v44;
      v48 = v47;
      if (v43 && v47)
      {
        v49 = +[NSDistributedNotificationCenter defaultCenter];
        objc_initWeak(&location, v49);

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v83 = 0x3032000000;
        v84 = sub_100028B6C;
        v85 = (id *)sub_100028B7C;
        id v86 = 0;
        v50 = +[NSDistributedNotificationCenter defaultCenter];
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_100028B84;
        v67[3] = &unk_100049950;
        id v68 = v63;
        objc_copyWeak(&v72, &location);
        p_long long buf = &buf;
        id v69 = v48;
        id v70 = v43;
        uint64_t v51 = [v50 addObserverForName:v69 object:v70 queue:0 usingBlock:v67];
        v52 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v51;

        _Block_object_dispose(&buf, 8);
        objc_destroyWeak(&v72);

        objc_destroyWeak(&location);
      }
    }
    [v63 uniqueId];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100028CF4;
    v64[3] = &unk_100049088;
    id v65 = v37;
    id v66 = (id)objc_claimAutoreleasedReturnValue();
    id v53 = v66;
    id v54 = v37;
    [v54 donateInteractionWithCompletion:v64];

    v27 = v58;
    goto LABEL_36;
  }
  v25 = +[CHLogServer sharedInstance];
  v26 = [v25 logHandleForDomain:"intent"];

  v27 = v26;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    sub_10002F61C(v26);
    v27 = v26;
  }
LABEL_36:
}

- (void)deleteInteractionWithCall:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    v5 = +[NSArray arrayWithObjects:&v6 count:1];

    -[CHInteraction deleteInteractionWithCalls:](self, "deleteInteractionWithCalls:", v5, v6);
  }
}

- (void)deleteInteractionWithCalls:(id)a3
{
  id v4 = a3;
  v5 = @"com.apple.InCallService";
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100029128;
  v15[3] = &unk_100049638;
  id v6 = v4;
  id v16 = v6;
  v7 = objc_retainBlock(v15);
  if ([v6 count])
  {
    id v8 = +[CHLogServer sharedInstance];
    id v9 = [v8 logHandleForDomain:"intent"];

    v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (__CFString *)[v6 count];
      *(_DWORD *)long long buf = 134218242;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing %lu donated interactions for bundle identifier %@", buf, 0x16u);
    }

    v12 = [(CHInteraction *)self searchableIndex];
    [v12 deleteInteractionsWithIdentifiers:v6 bundleID:v5 protectionClass:0 completionHandler:v7];
  }
  else
  {
    if (v6) {
      goto LABEL_7;
    }
    id v13 = +[CHLogServer sharedInstance];
    uint64_t v14 = [v13 logHandleForDomain:"intent"];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing all donated interactions for bundle identifier %@", buf, 0xCu);
    }

    v12 = [(CHInteraction *)self searchableIndex];
    [v12 deleteAllInteractionsWithBundleID:v5 protectionClass:0 completionHandler:v7];
  }

LABEL_7:
}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void).cxx_destruct
{
}

@end