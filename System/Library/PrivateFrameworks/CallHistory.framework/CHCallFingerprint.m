@interface CHCallFingerprint
+ (BOOL)doCallTypesMatch:(id)a3 :(id)a4;
+ (BOOL)doHandlesMatch:(id)a3 with:(id)a4;
+ (BOOL)doesCall:(id)a3 matchWith:(id)a4;
+ (BOOL)shouldCall:(id)a3 updateMatchingCall:(id)a4;
+ (id)matchCallWithFingerprint:(id)a3 usingDatabase:(id)a4;
+ (id)predicateForCall:(id)a3;
+ (id)predicateForHandoffCall:(id)a3;
+ (id)updateCall:(id)a3 withFingerprintedCall:(id)a4;
@end

@implementation CHCallFingerprint

+ (BOOL)doCallTypesMatch:(id)a3 :(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 mediaType];
  if (v7 == [v6 mediaType] && (uint64_t v8 = objc_msgSend(v5, "ttyType"), v8 == objc_msgSend(v6, "ttyType")))
  {
    v9 = [v5 serviceProvider];
    v10 = [v6 serviceProvider];
    char v11 = [v9 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)doHandlesMatch:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 remoteParticipantHandles];
  uint64_t v8 = [v7 count];
  v9 = [v6 remoteParticipantHandles];
  uint64_t v10 = [v9 count];

  if (v8 == v10
    && ([v5 remoteParticipantHandles],
        char v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        v11,
        v12))
  {
    v13 = [v5 notificationThreadIdentifier];
    v14 = [v6 notificationThreadIdentifier];
    char v15 = [v13 isEqualToString:v14];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

+ (BOOL)doesCall:(id)a3 matchWith:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 uniqueId];
  uint64_t v8 = [v6 uniqueId];
  char v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    char v11 = [v5 date];
    uint64_t v12 = [v6 date];
    [v11 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (+[CHCallFingerprint doCallTypesMatch:v5 :v6])
    {
      BOOL v15 = +[CHCallFingerprint doHandlesMatch:v5 with:v6];
      BOOL v10 = fabs(v14) <= 5.0 && v15;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)shouldCall:(id)a3 updateMatchingCall:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 callStatus] & 3) != 0 && (objc_msgSend(v6, "callStatus") & 4) != 0
    || ([v5 callStatus] & 3) != 0 && (objc_msgSend(v6, "callStatus") & 8) != 0
    || ([v5 callStatus] & 4) != 0 && (objc_msgSend(v6, "callStatus") & 3) != 0)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [v5 conversationID];
    uint64_t v9 = [v6 conversationID];
    char v7 = (v8 | v9) == 0;
    if (v9) {
      char v7 = [(id)v8 isEqual:v9];
    }
  }
  return v7;
}

+ (id)updateCall:(id)a3 withFingerprintedCall:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = +[CHLogServer sharedInstance];
  uint64_t v8 = [v7 logHandleForDomain:"Fingerprint"];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 138412290;
    id v47 = v5;
    _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "YMM Call: %@", (uint8_t *)&v46, 0xCu);
  }

  uint64_t v9 = +[CHLogServer sharedInstance];
  BOOL v10 = [v9 logHandleForDomain:"Fingerprint"];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 138412290;
    id v47 = v6;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "YMM existingCall: %@", (uint8_t *)&v46, 0xCu);
  }

  char v11 = (void *)[v5 copy];
  uint64_t v12 = +[CHLogServer sharedInstance];
  double v13 = [v12 logHandleForDomain:"Fingerprint"];

  double v14 = v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", [v5 callStatus]);
    v16 = +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", [v6 callStatus]);
    int v46 = 138412546;
    id v47 = v15;
    __int16 v48 = 2112;
    v49 = v16;
    _os_log_impl(&dword_1B8E4A000, v14, OS_LOG_TYPE_DEFAULT, "YMM: call.callStatus = %@, existingCall.callStatus = %@", (uint8_t *)&v46, 0x16u);
  }
  int v17 = [v5 callStatus];
  if (v17 != [v6 callStatus] && objc_msgSend(v6, "callStatus") != 4)
  {
    v18 = [v6 uniqueId];
    [v11 setUniqueId:v18];

    objc_msgSend(v11, "setCallStatus:", objc_msgSend(v6, "callStatus"));
  }
  uint64_t v19 = [v5 uniqueId];
  uint64_t v20 = [v6 uniqueId];
  char v21 = (v19 | v20) == 0;
  if (v20) {
    char v21 = [(id)v19 isEqual:v20];
  }

  if ((v21 & 1) == 0)
  {
    v22 = [v5 date];
    v23 = [v6 date];
    if ([v22 compare:v23] == 1) {
      v24 = v6;
    }
    else {
      v24 = v5;
    }
    v25 = [v24 date];
    [v11 setDate:v25];

    v26 = NSNumber;
    v27 = [v5 bytesOfDataUsed];
    LODWORD(v25) = [v27 intValue];
    v28 = [v6 bytesOfDataUsed];
    v29 = objc_msgSend(v26, "numberWithInt:", objc_msgSend(v28, "intValue") + v25);
    [v11 setBytesOfDataUsed:v29];

    [v5 duration];
    double v31 = v30;
    [v6 duration];
    [v11 setDuration:v31 + v32];
  }
  v33 = [v5 participantGroupUUID];
  if (v33) {
    v34 = v5;
  }
  else {
    v34 = v6;
  }
  v35 = [v34 participantGroupUUID];
  [v11 setParticipantGroupUUID:v35];

  v36 = [v5 localParticipantUUID];
  if (v36) {
    v37 = v5;
  }
  else {
    v37 = v6;
  }
  v38 = [v37 localParticipantUUID];
  [v11 setLocalParticipantUUID:v38];

  v39 = [v5 outgoingLocalParticipantUUID];
  if (v39) {
    v40 = v5;
  }
  else {
    v40 = v6;
  }
  v41 = [v40 outgoingLocalParticipantUUID];
  [v11 setOutgoingLocalParticipantUUID:v41];

  if ([v5 verificationStatus]) {
    v42 = v5;
  }
  else {
    v42 = v6;
  }
  objc_msgSend(v11, "setVerificationStatus:", objc_msgSend(v42, "verificationStatus"));
  v43 = +[CHLogServer sharedInstance];
  v44 = [v43 logHandleForDomain:"Fingerprint"];

  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 138412290;
    id v47 = v11;
    _os_log_impl(&dword_1B8E4A000, v44, OS_LOG_TYPE_DEFAULT, "YMM updatedCall: %@", (uint8_t *)&v46, 0xCu);
  }

  return v11;
}

+ (id)predicateForHandoffCall:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 conversationID];

  if (v5)
  {
    id v6 = [v3 conversationID];
    char v7 = +[CHRecentCall predicateForCallsWithConversationID:v6];
    [v4 addObject:v7];
  }
  uint64_t v8 = [v3 participantGroupUUID];

  if (v8)
  {
    uint64_t v9 = [v3 participantGroupUUID];
    BOOL v10 = +[CHRecentCall predicateForCallsWithGroupUUID:v9];
    [v4 addObject:v10];
  }
  char v11 = [v3 uniqueId];
  uint64_t v12 = +[CHRecentCall predicateForCallsWithUniqueID:v11];
  [v4 addObject:v12];

  double v13 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v4];

  return v13;
}

+ (id)predicateForCall:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 date];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 dateByAddingTimeInterval:-5.0];
    uint64_t v8 = [v6 dateByAddingTimeInterval:5.0];
    uint64_t v9 = +[CHRecentCall predicateForCallsBetweenStartDate:v7 endDate:v8];
    [v4 addObject:v9];
  }
  uint64_t v10 = [v3 mediaType];
  if (v10)
  {
    char v11 = +[CHRecentCall predicateForCallsWithMediaType:v10];
    [v4 addObject:v11];
  }
  uint64_t v12 = [v3 serviceProvider];
  if ([v12 length])
  {
    double v13 = +[CHRecentCall predicateForCallsWithServiceProvider:v12];
    [v4 addObject:v13];
  }
  uint64_t v14 = [v3 ttyType];
  if (v14)
  {
    BOOL v15 = +[CHRecentCall predicateForCallsWithTTYType:v14];
    [v4 addObject:v15];
  }
  v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v16;
}

+ (id)matchCallWithFingerprint:(id)a3 usingDatabase:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 date];

  if (!v7)
  {
    uint64_t v19 = +[CHLogServer sharedInstance];
    uint64_t v20 = [v19 logHandleForDomain:"Fingerprint"];

    v18 = v20;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = [v5 uniqueId];
      int v49 = 138543362;
      uint64_t v50 = v21;
      v22 = "Ignoring fingerprinted call %{public}@ without a date";
LABEL_13:
      _os_log_impl(&dword_1B8E4A000, v18, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v49, 0xCu);
    }
LABEL_14:
    int v17 = 0;
    uint64_t v10 = v18;
    goto LABEL_36;
  }
  uint64_t v8 = [v5 remoteParticipantHandles];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v23 = +[CHLogServer sharedInstance];
    v24 = [v23 logHandleForDomain:"Fingerprint"];

    v18 = v24;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = [v5 uniqueId];
      int v49 = 138543362;
      uint64_t v50 = v21;
      v22 = "Ignoring fingerprinted call %{public}@ without remote participant handles";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v10 = +[CHCallFingerprint predicateForHandoffCall:v5];
  char v11 = +[CHLogServer sharedInstance];
  uint64_t v12 = [v11 logHandleForDomain:"Fingerprint"];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v49 = 138412290;
    uint64_t v50 = v10;
    _os_log_impl(&dword_1B8E4A000, v12, OS_LOG_TYPE_DEFAULT, "Fetching local call records using predicate %@", (uint8_t *)&v49, 0xCu);
  }

  double v13 = [v6 fetchObjectsWithPredicate:v10];
  if ([v13 count])
  {
    uint64_t v14 = +[CHLogServer sharedInstance];
    BOOL v15 = [v14 logHandleForDomain:"Fingerprint"];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = 138412290;
      uint64_t v50 = v13;
      _os_log_impl(&dword_1B8E4A000, v15, OS_LOG_TYPE_DEFAULT, "Got matching calls: %@", (uint8_t *)&v49, 0xCu);
    }

    v16 = [v13 sortedArrayUsingComparator:&__block_literal_global];
    int v17 = [v16 firstObject];
    v18 = v13;
  }
  else
  {
    v25 = +[CHCallFingerprint predicateForCall:v5];

    v26 = +[CHLogServer sharedInstance];
    v27 = [v26 logHandleForDomain:"Fingerprint"];

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = 138412290;
      uint64_t v50 = v25;
      _os_log_impl(&dword_1B8E4A000, v27, OS_LOG_TYPE_DEFAULT, "Fetching local call records using predicate %@", (uint8_t *)&v49, 0xCu);
    }

    v18 = [v6 fetchObjectsWithPredicate:v25];

    uint64_t v28 = [v18 count];
    v29 = +[CHLogServer sharedInstance];
    double v30 = [v29 logHandleForDomain:"Fingerprint"];

    v16 = v30;
    BOOL v31 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v31)
      {
        uint64_t v32 = [v18 count];
        v33 = [v5 uniqueId];
        int v49 = 134218242;
        uint64_t v50 = v32;
        __int16 v51 = 2114;
        v52 = v33;
        _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu calls matching %{public}@ in local data store", (uint8_t *)&v49, 0x16u);
      }
      if ([v18 count] != 1)
      {
        v38 = [v5 remoteParticipantHandles];
        v39 = [v38 allObjects];
        uint64_t v10 = +[CHRecentCall predicateForCallsWithRemoteParticipantHandles:v39];

        v16 = [v18 filteredArrayUsingPredicate:v10];
        if ([v16 count])
        {
          int v17 = [v16 firstObject];
          v40 = +[CHLogServer sharedInstance];
          v41 = [v40 logHandleForDomain:"Fingerprint"];

          v42 = v41;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = [v17 uniqueId];
            v44 = [v5 uniqueId];
            int v49 = 138543618;
            uint64_t v50 = v43;
            __int16 v51 = 2114;
            v52 = v44;
            _os_log_impl(&dword_1B8E4A000, v42, OS_LOG_TYPE_DEFAULT, "Fingerprint matched local call %{public}@ with remote call %{public}@", (uint8_t *)&v49, 0x16u);
          }
        }
        else
        {
          v45 = +[CHLogServer sharedInstance];
          int v46 = [v45 logHandleForDomain:"Fingerprint"];

          v42 = v46;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v47 = [v5 uniqueId];
            int v49 = 138543362;
            uint64_t v50 = v47;
            _os_log_impl(&dword_1B8E4A000, v42, OS_LOG_TYPE_DEFAULT, "Did not find filtered caller ID result matching call %{public}@", (uint8_t *)&v49, 0xCu);
          }
          int v17 = 0;
        }

        goto LABEL_35;
      }
      int v17 = [v18 firstObject];
      v34 = +[CHLogServer sharedInstance];
      v35 = [v34 logHandleForDomain:"Fingerprint"];

      v16 = v35;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v17 uniqueId];
        int v49 = 138543362;
        uint64_t v50 = v36;
        _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Returning matching call with uniqueID %{public}@", (uint8_t *)&v49, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        v37 = [v5 uniqueId];
        int v49 = 138543362;
        uint64_t v50 = v37;
        _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Could not find fingerprinted call %{public}@ in local data store", (uint8_t *)&v49, 0xCu);
      }
      int v17 = 0;
    }
    uint64_t v10 = v25;
  }
LABEL_35:

LABEL_36:
  return v17;
}

uint64_t __60__CHCallFingerprint_matchCallWithFingerprint_usingDatabase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end