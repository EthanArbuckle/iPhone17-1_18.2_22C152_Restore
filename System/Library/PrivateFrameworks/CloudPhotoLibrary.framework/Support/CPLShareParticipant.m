@interface CPLShareParticipant
+ (id)shareParticipantsFromCKShareParticipants:(id)a3 currentUserID:(id)a4;
- (id)initWithCKShareParticipant:(id)a3 currentUserID:(id)a4;
- (void)updateCKShareParticipant:(id)a3;
@end

@implementation CPLShareParticipant

+ (id)shareParticipantsFromCKShareParticipants:(id)a3 currentUserID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_alloc((Class)CPLShareParticipant);
        id v15 = objc_msgSend(v14, "initWithCKShareParticipant:currentUserID:", v13, v6, (void)v17);
        [v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)initWithCKShareParticipant:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 userIdentity];
  id v9 = [v8 userRecordID];
  uint64_t v10 = [v9 recordName];

  if (!v10 || !CKCurrentUserDefaultName)
  {
    if (v10 | (unint64_t)CKCurrentUserDefaultName) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ([(id)v10 isEqual:CKCurrentUserDefaultName])
  {
LABEL_6:
    uint64_t v11 = [v7 recordName];

    uint64_t v10 = v11;
  }
LABEL_7:
  v12 = [(CPLShareParticipant *)self initWithUserIdentifier:v10];
  if (v12)
  {
    -[CPLShareParticipant setIsCurrentUser:](v12, "setIsCurrentUser:", [v6 isCurrentUser]);
    unint64_t v13 = (unint64_t)[v6 role] - 1;
    if (v13 > 3) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = qword_10024A080[v13];
    }
    [(CPLShareParticipant *)v12 setRole:v14];
    id v15 = (char *)[v6 acceptanceStatus];
    if ((unint64_t)(v15 - 1) >= 3) {
      v16 = 0;
    }
    else {
      v16 = v15;
    }
    [(CPLShareParticipant *)v12 setAcceptanceStatus:v16];
    long long v17 = (char *)[v6 permission];
    if ((unint64_t)(v17 - 1) >= 3) {
      long long v18 = 0;
    }
    else {
      long long v18 = v17;
    }
    [(CPLShareParticipant *)v12 setPermission:v18];
    long long v19 = [v6 participantID];
    [(CPLShareParticipant *)v12 setParticipantID:v19];

    long long v20 = [v8 lookupInfo];
    v21 = [v8 nameComponents];
    v22 = [v20 emailAddress];
    if (v22) {
      [(CPLShareParticipant *)v12 setEmail:v22];
    }
    v23 = [v20 phoneNumber];
    if (v23) {
      [(CPLShareParticipant *)v12 setPhoneNumber:v23];
    }
    [(CPLShareParticipant *)v12 setNameComponents:v21];
    -[CPLShareParticipant setHasiCloudAccount:](v12, "setHasiCloudAccount:", [v8 hasiCloudAccount]);
  }
  return v12;
}

- (void)updateCKShareParticipant:(id)a3
{
  id v6 = a3;
  v4 = (char *)[(CPLShareParticipant *)self permission];
  if ((unint64_t)(v4 - 1) >= 3) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }
  [v6 setPermission:v5];
}

@end