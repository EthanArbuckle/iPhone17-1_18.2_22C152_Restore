@interface CallRecord
+ (id)fetchRequest;
- (BOOL)addEmergencyMediaItem:(id)a3;
- (BOOL)supportsAutoAnsweredReason;
- (BOOL)supportsBlockedBy;
- (BOOL)supportsBlockedByName;
- (BOOL)supportsCallCategory;
- (BOOL)supportsCallDirectoryIdentityType;
- (BOOL)supportsEmergencyMedia;
- (BOOL)supportsHandleType;
- (BOOL)supportsHasMessage;
- (BOOL)supportsIdentityExtension;
- (BOOL)supportsImageURL;
- (BOOL)supportsInitiator;
- (BOOL)supportsJunkConfidence;
- (BOOL)supportsJunkIdentificationCategory;
- (BOOL)supportsLocalParticipantUUID;
- (BOOL)supportsOutgoingLocalParticipantUUID;
- (BOOL)supportsParticipantGroupUUID;
- (BOOL)supportsRemoteParticipantHandles;
- (BOOL)supportsScreenSharingType;
- (BOOL)supportsServiceProvider;
- (BOOL)supportsVerificationStatus;
- (CHHandle)chInitiator;
- (CHRecentCall)chRecentCall;
- (NSSet)chEmergencyMediaItems;
- (NSSet)chRemoteParticipantHandles;
- (id)compositeCallCategoryForContext:(id)a3;
- (id)compositeCallDirectoryIdentityType:(id)a3;
- (id)compositeEmergencyMediaItemsForContext:(id)a3;
- (id)compositeHandleTypeForContext:(id)a3;
- (id)compositeInitiatorHandleForContext:(id)a3;
- (id)compositeJunkConfidenceForContext:(id)a3;
- (id)compositeLocalParticipantUUIDForContext:(id)a3;
- (id)compositeOutgoingLocalParticipantUUIDForContext:(id)a3;
- (id)compositeParticipantGroupUUIDForContext:(id)a3;
- (id)compositeRemoteParticipantHandlesForContext:(id)a3;
- (id)compositeServiceProviderForContext:(id)a3;
- (id)compositeVerificationStatusForContext:(id)a3;
- (int64_t)chHandleType;
- (unsigned)chCallStatus;
- (void)setChCallStatus:(unsigned int)a3;
@end

@implementation CallRecord

- (CHRecentCall)chRecentCall
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CHRecentCall);
  v4 = [(CallRecord *)self face_time_data];
  [(CHRecentCall *)v3 setBytesOfDataUsed:v4];

  v5 = [(CallRecord *)self number_availability];
  -[CHRecentCall setCallerIdAvailability:](v3, "setCallerIdAvailability:", [v5 integerValue]);

  v6 = [(CallRecord *)self location];
  [(CHRecentCall *)v3 setCallerIdLocation:v6];

  [(CHRecentCall *)v3 setCallStatus:[(CallRecord *)self chCallStatus]];
  v7 = [(CallRecord *)self date];
  [(CHRecentCall *)v3 setDate:v7];

  v8 = [(CallRecord *)self disconnected_cause];
  [(CHRecentCall *)v3 setDisconnectedCause:v8];

  v9 = [(CallRecord *)self duration];
  [v9 doubleValue];
  -[CHRecentCall setDuration:](v3, "setDuration:");

  v10 = [(CallRecord *)self filtered_out_reason];
  [(CHRecentCall *)v3 setFilteredOutReason:v10];

  v11 = [(CallRecord *)self handle_type];
  -[CHRecentCall setHandleType:](v3, "setHandleType:", [v11 integerValue]);

  v12 = [(CallRecord *)self imageURL];
  [(CHRecentCall *)v3 setImageURL:v12];

  v13 = [(CallRecord *)self iso_country_code];
  [(CHRecentCall *)v3 setIsoCountryCode:v13];

  v14 = [(CallRecord *)self junkConfidence];
  -[CHRecentCall setJunkConfidence:](v3, "setJunkConfidence:", [v14 integerValue]);

  v15 = [(CallRecord *)self junkIdentificationCategory];
  [(CHRecentCall *)v3 setJunkIdentificationCategory:v15];

  v16 = [(CallRecord *)self localParticipantUUID];
  [(CHRecentCall *)v3 setLocalParticipantUUID:v16];

  v17 = [(CallRecord *)self name];
  [(CHRecentCall *)v3 setName:v17];

  v18 = [(CallRecord *)self outgoingLocalParticipantUUID];
  [(CHRecentCall *)v3 setOutgoingLocalParticipantUUID:v18];

  v19 = [(CallRecord *)self participantGroupUUID];
  [(CHRecentCall *)v3 setParticipantGroupUUID:v19];

  v20 = [(CallRecord *)self read];
  -[CHRecentCall setRead:](v3, "setRead:", [v20 BOOLValue]);

  v21 = [(CallRecord *)self chRemoteParticipantHandles];
  [(CHRecentCall *)v3 setRemoteParticipantHandles:v21];

  v22 = [(CallRecord *)self service_provider];
  [(CHRecentCall *)v3 setServiceProvider:v22];

  v23 = [(CallRecord *)self unique_id];
  [(CHRecentCall *)v3 setUniqueId:v23];

  v24 = [(CallRecord *)self verificationStatus];
  -[CHRecentCall setVerificationStatus:](v3, "setVerificationStatus:", [v24 integerValue]);

  v25 = [(CallRecord *)self hasMessage];
  -[CHRecentCall setHasMessage:](v3, "setHasMessage:", [v25 BOOLValue]);

  v26 = [(CallRecord *)self conversationID];
  [(CHRecentCall *)v3 setConversationID:v26];

  v27 = [(CallRecord *)self autoAnsweredReason];
  -[CHRecentCall setAutoAnsweredReason:](v3, "setAutoAnsweredReason:", [v27 integerValue]);

  v28 = [(CallRecord *)self chEmergencyMediaItems];
  [(CHRecentCall *)v3 setEmergencyMediaItems:v28];

  [(CHRecentCall *)v3 setUsedEmergencyVideoStreaming:[(CallRecord *)self usedEmergencyVideoStreaming]];
  [(CHRecentCall *)v3 setWasEmergencyCall:[(CallRecord *)self wasEmergencyCall]];
  v29 = [(CallRecord *)self blockedByExtension];
  [(CHRecentCall *)v3 setBlockedByExtension:v29];

  v30 = [(CallRecord *)self blockedByExtensionName];
  [(CHRecentCall *)v3 setBlockedByExtensionName:v30];

  v31 = [(CallRecord *)self identityExtension];
  [(CHRecentCall *)v3 setIdentityExtension:v31];

  v32 = [(CallRecord *)self callDirectoryIdentityType];
  -[CHRecentCall setCallDirectoryIdentityType:](v3, "setCallDirectoryIdentityType:", [v32 integerValue]);

  v33 = [(CallRecord *)self screenSharingType];
  -[CHRecentCall setScreenSharingType:](v3, "setScreenSharingType:", [v33 integerValue]);

  v34 = [(CallRecord *)self chInitiator];
  [(CHRecentCall *)v3 setInitiator:v34];

  v35 = [(CallRecord *)self call_category];
  -[CHRecentCall setCallCategory:](v3, "setCallCategory:", [v35 integerValue]);

  v36 = [(CallRecord *)self address];
  [(CHRecentCall *)v3 setCallerId:v36];

  v37 = [(CallRecord *)self calltype];
  -[CHRecentCall setCallType:](v3, "setCallType:", [v37 integerValue]);

  v38 = [(CHRecentCall *)v3 dictionaryRepresentation];
  v41[0] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  [(CHRecentCall *)v3 setCallOccurrences:v39];

  return v3;
}

- (unsigned)chCallStatus
{
  v3 = [(CallRecord *)self originated];
  int v4 = [v3 BOOLValue];

  v5 = [(CallRecord *)self duration];
  [v5 doubleValue];
  double v7 = v6;

  if (v4)
  {
    v8 = &kCHCallStatusCancelled;
    if (v7 > 0.0) {
      v8 = &kCHCallStatusConnectedOutgoing;
    }
  }
  else if (v7 <= 0.0)
  {
    v9 = [(CallRecord *)self answered];
    int v10 = [v9 BOOLValue];

    v8 = &kCHCallStatusMissed;
    if (v10) {
      v8 = &kCHCallStatusAnsweredElsewhere;
    }
  }
  else
  {
    v8 = &kCHCallStatusConnectedIncoming;
  }
  return *v8;
}

- (NSSet)chEmergencyMediaItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(CallRecord *)self supportsEmergencyMedia])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
    int v4 = [(CallRecord *)self emergencyMediaItems];
    v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v6 = [(CallRecord *)self emergencyMediaItems];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) chEmergencyMediaItem];
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }
  v12 = (void *)[v5 copy];

  return (NSSet *)v12;
}

- (NSSet)chRemoteParticipantHandles
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CallRecord *)self supportsRemoteParticipantHandles];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v5 = v4;
  if (v3)
  {
    double v6 = [(CallRecord *)self remoteParticipantHandles];
    uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v8 = [(CallRecord *)self remoteParticipantHandles];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) chHandle];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = (void *)[v4 initWithCapacity:1];
    uint64_t v8 = [(CallRecord *)self address];
    int64_t v14 = [(CallRecord *)self chHandleType];
    if (v14 && v8)
    {
      int64_t v15 = v14;
      if (v14 == 2)
      {
        long long v16 = [CHPhoneNumber alloc];
        long long v17 = [(CallRecord *)self iso_country_code];
        v18 = [(CHPhoneNumber *)v16 initWithDigits:v8 isoCountryCode:v17];

        uint64_t v19 = [(CHPhoneNumber *)v18 normalizedRepresentation];
      }
      else
      {
        uint64_t v19 = 0;
      }
      v20 = [[CHHandle alloc] initWithType:v15 value:v8 normalizedValue:v19];
      [v7 addObject:v20];
    }
  }

  v21 = (void *)[v7 copy];
  return (NSSet *)v21;
}

- (CHHandle)chInitiator
{
  if ([(CallRecord *)self supportsInitiator])
  {
    BOOL v3 = [(CallRecord *)self initiator];
    uint64_t v4 = [v3 chHandle];
LABEL_6:
    uint64_t v7 = (void *)v4;

    goto LABEL_8;
  }
  if (([(CallRecord *)self chCallStatus] & 0xD) != 0)
  {
    v5 = [(CallRecord *)self chRemoteParticipantHandles];
    uint64_t v6 = [v5 count];

    if (v6 == 1)
    {
      BOOL v3 = [(CallRecord *)self chRemoteParticipantHandles];
      uint64_t v4 = [v3 anyObject];
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_8:
  return (CHHandle *)v7;
}

- (BOOL)supportsEmergencyMedia
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 28;

  return v4;
}

- (BOOL)supportsInitiator
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 35;

  return v4;
}

- (BOOL)supportsRemoteParticipantHandles
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 14;

  return v4;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CallRecord"];
}

- (void)setChCallStatus:(unsigned int)a3
{
  if (a3 == 1) {
    goto LABEL_4;
  }
  if (a3 == 2)
  {
LABEL_6:
    id v4 = [NSNumber numberWithBool:1];
    -[CallRecord setOriginated:](self, "setOriginated:");
    goto LABEL_7;
  }
  if (a3 != 4)
  {
    if (a3 != 16) {
      return;
    }
    goto LABEL_6;
  }
LABEL_4:
  id v4 = [NSNumber numberWithBool:1];
  -[CallRecord setAnswered:](self, "setAnswered:");
LABEL_7:
}

- (int64_t)chHandleType
{
  if ([(CallRecord *)self supportsHandleType])
  {
    BOOL v3 = [(CallRecord *)self handle_type];
    uint64_t v4 = [v3 integerValue];
  }
  else
  {
    BOOL v3 = [(CallRecord *)self address];
    uint64_t v4 = +[CHHandle handleTypeForValue:v3];
  }
  int64_t v5 = v4;

  return v5;
}

- (id)compositeCallCategoryForContext:(id)a3
{
  if ([(CallRecord *)self supportsCallCategory])
  {
    [(CallRecord *)self call_category];
  }
  else
  {
    int64_t v5 = [(CallRecord *)self calltype];
    uint64_t v6 = [v5 integerValue];

    objc_msgSend(NSNumber, "numberWithInteger:", +[CHRecentCall categoryForCallType:](CHRecentCall, "categoryForCallType:", v6));
  uint64_t v4 = };
  return v4;
}

- (id)compositeHandleTypeForContext:(id)a3
{
  BOOL v3 = NSNumber;
  int64_t v4 = [(CallRecord *)self chHandleType];
  return (id)[v3 numberWithInteger:v4];
}

- (id)compositeJunkConfidenceForContext:(id)a3
{
  if ([(CallRecord *)self supportsJunkConfidence]) {
    [(CallRecord *)self junkConfidence];
  }
  else {
  int64_t v4 = [NSNumber numberWithInteger:0];
  }
  return v4;
}

- (id)compositeCallDirectoryIdentityType:(id)a3
{
  if ([(CallRecord *)self supportsCallDirectoryIdentityType]) {
    [(CallRecord *)self callDirectoryIdentityType];
  }
  else {
  int64_t v4 = [NSNumber numberWithInteger:0];
  }
  return v4;
}

- (id)compositeLocalParticipantUUIDForContext:(id)a3
{
  if ([(CallRecord *)self supportsLocalParticipantUUID])
  {
    int64_t v4 = [(CallRecord *)self localParticipantUUID];
  }
  else
  {
    int64_t v4 = 0;
  }
  return v4;
}

- (id)compositeOutgoingLocalParticipantUUIDForContext:(id)a3
{
  if ([(CallRecord *)self supportsOutgoingLocalParticipantUUID])
  {
    int64_t v4 = [(CallRecord *)self outgoingLocalParticipantUUID];
  }
  else
  {
    int64_t v4 = 0;
  }
  return v4;
}

- (id)compositeParticipantGroupUUIDForContext:(id)a3
{
  if ([(CallRecord *)self supportsParticipantGroupUUID])
  {
    int64_t v4 = [(CallRecord *)self participantGroupUUID];
  }
  else
  {
    int64_t v4 = 0;
  }
  return v4;
}

- (id)compositeRemoteParticipantHandlesForContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CallRecord *)self supportsRemoteParticipantHandles])
  {
    int64_t v5 = [(CallRecord *)self remoteParticipantHandles];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithContext:", v4, (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v13 = (void *)[v6 copy];
  }
  else
  {
    int64_t v14 = [(CallRecord *)self chRemoteParticipantHandles];
    if (v14)
    {
      v13 = +[CHManagedHandle managedHandlesForHandles:v14 inManagedObjectContext:v4];
    }
    else
    {
      v13 = 0;
    }
  }
  return v13;
}

- (id)compositeInitiatorHandleForContext:(id)a3
{
  id v4 = a3;
  if ([(CallRecord *)self supportsInitiator])
  {
    int64_t v5 = [(CallRecord *)self initiator];

    if (v5)
    {
      uint64_t v6 = [(CallRecord *)self initiator];
      uint64_t v7 = [v6 copyWithContext:v4];
LABEL_6:
      uint64_t v8 = (void *)v7;
      goto LABEL_8;
    }
  }
  uint64_t v6 = [(CallRecord *)self chInitiator];
  if (v6)
  {
    uint64_t v7 = +[CHManagedHandle managedHandleForHandle:v6 inManagedObjectContext:v4];
    goto LABEL_6;
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (id)compositeServiceProviderForContext:(id)a3
{
  if ([(CallRecord *)self supportsServiceProvider])
  {
    [(CallRecord *)self service_provider];
  }
  else
  {
    int64_t v5 = [(CallRecord *)self calltype];
    uint64_t v6 = [v5 integerValue];

    +[CHRecentCall serviceProviderForCallType:v6];
  id v4 = };
  return v4;
}

- (id)compositeVerificationStatusForContext:(id)a3
{
  if ([(CallRecord *)self supportsVerificationStatus]) {
    [(CallRecord *)self verificationStatus];
  }
  else {
  id v4 = [NSNumber numberWithInteger:0];
  }
  return v4;
}

- (id)compositeEmergencyMediaItemsForContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CallRecord *)self supportsEmergencyMedia])
  {
    int64_t v5 = [(CallRecord *)self emergencyMediaItems];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithContext:", v4, (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    v13 = (void *)[v6 copy];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)addEmergencyMediaItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int64_t v5 = [(CallRecord *)self chEmergencyMediaItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v25 + 1) + 8 * i) isEqualToMediaItem:v4])
        {
          BOOL v19 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v10 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v11 = [(CallRecord *)self chEmergencyMediaItems];
  int64_t v5 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count") + 1);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = [(CallRecord *)self emergencyMediaItems];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        [v5 addObject:*(void *)(*((void *)&v21 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  long long v17 = [(CallRecord *)self managedObjectContext];
  long long v18 = +[EmergencyMediaItem managedEmergencyMediaItemForEmergencyMediaItem:v4 inManagedObjectContext:v17];

  [v5 addObject:v18];
  [(CallRecord *)self setEmergencyMediaItems:v5];

  BOOL v19 = 1;
LABEL_18:

  return v19;
}

- (BOOL)supportsCallCategory
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 5;

  return v4;
}

- (BOOL)supportsHandleType
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 12;

  return v4;
}

- (BOOL)supportsImageURL
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 23;

  return v4;
}

- (BOOL)supportsBlockedBy
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 30;

  return v4;
}

- (BOOL)supportsIdentityExtension
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 34;

  return v4;
}

- (BOOL)supportsCallDirectoryIdentityType
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 31;

  return v4;
}

- (BOOL)supportsJunkConfidence
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 20;

  return v4;
}

- (BOOL)supportsLocalParticipantUUID
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 15;

  return v4;
}

- (BOOL)supportsOutgoingLocalParticipantUUID
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 16;

  return v4;
}

- (BOOL)supportsParticipantGroupUUID
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 22;

  return v4;
}

- (BOOL)supportsServiceProvider
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 5;

  return v4;
}

- (BOOL)supportsVerificationStatus
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 17;

  return v4;
}

- (BOOL)supportsHasMessage
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 24;

  return v4;
}

- (BOOL)supportsJunkIdentificationCategory
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 25;

  return v4;
}

- (BOOL)supportsAutoAnsweredReason
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 27;

  return v4;
}

- (BOOL)supportsScreenSharingType
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 33;

  return v4;
}

- (BOOL)supportsBlockedByName
{
  v2 = [(CallRecord *)self entity];
  BOOL v3 = [v2 managedObjectModel];
  BOOL v4 = +[DBManager versionForManagedObjectModel:v3] > 36;

  return v4;
}

@end