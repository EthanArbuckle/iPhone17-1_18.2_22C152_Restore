@interface PHSearchRequest
- (BOOL)didSpecifyContacts;
- (CHManager)recentsManager;
- (NSArray)recentCalls;
- (NSArray)voicemails;
- (NSMutableDictionary)contactsByVoicemailIdentifier;
- (NSSet)specifiedContactIdentifiers;
- (PHSearchRequest)initWithDictionary:(id)a3;
- (VMVoicemailManager)voicemailManager;
- (id)labelForEmailAddress:(id)a3;
- (id)labelForPhoneNumber:(id)a3;
- (id)personFromRawAddress:(id)a3;
- (id)phoneCallHistoryFromRecentCall:(id)a3;
- (id)phoneVoiceMailFromVMVoicemail:(id)a3;
- (id)recentCallsFilterPredicate;
- (id)typedDataForRawAddress:(id)a3;
- (id)voicemailFilterPredicate;
- (void)cacheContactsForVoicemails:(id)a3;
- (void)performWithCompletion:(id)a3;
- (void)setRecentsManager:(id)a3;
- (void)setVoicemailManager:(id)a3;
@end

@implementation PHSearchRequest

- (PHSearchRequest)initWithDictionary:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHSearchRequest;
  v3 = [(PHSearchRequest *)&v11 initWithDictionary:a3];
  if (v3)
  {
    v4 = (VMVoicemailManager *)objc_alloc_init(MEMORY[0x263F84CE8]);
    voicemailManager = v3->_voicemailManager;
    v3->_voicemailManager = v4;

    v6 = (CHManager *)objc_alloc_init(MEMORY[0x263F30588]);
    recentsManager = v3->_recentsManager;
    v3->_recentsManager = v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    contactsByVoicemailIdentifier = v3->_contactsByVoicemailIdentifier;
    v3->_contactsByVoicemailIdentifier = (NSMutableDictionary *)v8;
  }
  return v3;
}

- (NSArray)voicemails
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(PHSearchRequest *)self voicemailManager];
  int v4 = [v3 isOnline];

  v5 = [(PHSearchRequest *)self voicemailManager];
  v6 = v5;
  if (v4) {
    v7 = &unk_26E87C040;
  }
  else {
    v7 = &unk_26E87C060;
  }
  uint64_t v8 = [v5 voicemailsPassingTest:v7];

  v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    uint64_t v12 = [v8 count];
    _os_log_impl(&dword_2352C7000, v9, OS_LOG_TYPE_DEFAULT, "Initial search to voicemail database returned %lu voicemails.", (uint8_t *)&v11, 0xCu);
  }

  return (NSArray *)v8;
}

- (NSArray)recentCalls
{
  v55[2] = *MEMORY[0x263EF8340];
  int v4 = [MEMORY[0x263EFF980] array];
  v5 = [(SAPhoneSearch *)self faceTime];
  if (v5)
  {
    v6 = [(SAPhoneSearch *)self faceTime];
    int v7 = [v6 BOOLValue];
  }
  else
  {
    int v7 = 1;
  }

  uint64_t v8 = [(SAPhoneSearch *)self faceTimeAudio];
  if (v8)
  {
    v2 = [(SAPhoneSearch *)self faceTimeAudio];
    int v9 = [v2 BOOLValue];
  }
  else
  {
    int v9 = 1;
  }

  v10 = [(SAPhoneSearch *)self faceTime];
  if (!v10)
  {
    v2 = [(SAPhoneSearch *)self faceTimeAudio];
    if (!v2)
    {
      int v12 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  int v11 = [(SAPhoneSearch *)self faceTime];
  if ([v11 BOOLValue])
  {
    int v12 = 0;
  }
  else
  {
    uint64_t v13 = [(SAPhoneSearch *)self faceTimeAudio];
    int v12 = [v13 BOOLValue] ^ 1;
  }
  if (!v10) {
    goto LABEL_15;
  }
LABEL_16:

  if (v7)
  {
    v32 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F305F8]];
    [v4 addObject:v32];

    if (!v9)
    {
LABEL_18:
      if (!v12) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if (!v9)
  {
    goto LABEL_18;
  }
  v33 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F305F0]];
  [v4 addObject:v33];

  if (v12)
  {
LABEL_19:
    v14 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F30600]];
    v55[0] = v14;
    v15 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F30608]];
    v55[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    [v4 addObjectsFromArray:v16];
  }
LABEL_20:
  uint64_t v17 = [v4 count];
  v18 = PHDefaultLog();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      v20 = [(SAPhoneSearch *)self outgoing];
      int v21 = [v20 BOOLValue];
      v22 = [(SAPhoneSearch *)self missed];
      int v23 = [v22 BOOLValue];
      v24 = [(SAPhoneSearch *)self start];
      *(_DWORD *)buf = 138413058;
      uint64_t v48 = (uint64_t)v4;
      __int16 v49 = 1024;
      int v50 = v21;
      __int16 v51 = 1024;
      int v52 = v23;
      __int16 v53 = 2112;
      v54 = v24;
      _os_log_impl(&dword_2352C7000, v18, OS_LOG_TYPE_DEFAULT, "Requested call types: %@ with search parameters: {outgoing: %d, missed: %d, startDate: %@}", buf, 0x22u);
    }
    v25 = [(SAPhoneSearch *)self outgoing];
    int v26 = [v25 BOOLValue];

    v27 = [(SAPhoneSearch *)self missed];
    int v28 = [v27 BOOLValue];

    v29 = [(SAPhoneSearch *)self start];
    v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = [MEMORY[0x263EFF910] distantPast];
    }
    v35 = v31;

    if (v26)
    {
      if (v28)
      {
        v34 = [MEMORY[0x263EFF8C0] array];
LABEL_41:

        goto LABEL_42;
      }
      v36 = [(PHSearchRequest *)self recentsManager];
      v40 = (void *)MEMORY[0x263F08A98];
      v38 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F305B8]];
      v46[0] = v38;
      v39 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F305C8]];
      v46[1] = v39;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
      v42 = [v40 predicateWithFormat:@"date > %@ AND callType IN %@ AND callStatus IN %@", v35, v4, v41];
      v34 = [v36 recentCallsWithPredicate:v42];
    }
    else
    {
      v36 = [(PHSearchRequest *)self recentsManager];
      v37 = (void *)MEMORY[0x263F08A98];
      if (!v28)
      {
        v38 = [MEMORY[0x263F08A98] predicateWithFormat:@"date > %@ AND callType IN %@", v35, v4];
        v34 = [v36 recentCallsWithPredicate:v38];
        goto LABEL_40;
      }
      v38 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F305D8]];
      v39 = [v37 predicateWithFormat:@"date > %@ AND callType IN %@ AND callStatus == %@", v35, v4, v38];
      v34 = [v36 recentCallsWithPredicate:v39];
    }

LABEL_40:
    goto LABEL_41;
  }
  if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2352C7000, v18, OS_LOG_TYPE_DEFAULT, "No call types requested.", buf, 2u);
  }

  v34 = [MEMORY[0x263EFF8C0] array];
LABEL_42:
  v43 = PHDefaultLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = [v34 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v44;
    _os_log_impl(&dword_2352C7000, v43, OS_LOG_TYPE_DEFAULT, "Initial search to recents database returned %lu calls.", buf, 0xCu);
  }

  return (NSArray *)v34;
}

- (id)typedDataForRawAddress:(id)a3
{
  id v4 = a3;
  if ([v4 _appearsToBePhoneNumber])
  {
    id v5 = [MEMORY[0x263F64B38] phone];
    v6 = [(PHSearchRequest *)self labelForPhoneNumber:v4];
    [v5 setLabel:v6];

    [v5 setNumber:v4];
  }
  else if ([v4 _appearsToBeEmail])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F648C0]);
    int v7 = [(PHSearchRequest *)self labelForEmailAddress:v4];
    [v5 setLabel:v7];

    [v5 setEmailAddress:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)labelForPhoneNumber:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[PHAssistantServices sharedContactStore];
  v21[0] = *MEMORY[0x263EFE070];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v6 = [v4 contactForDestinationId:v3 keysToFetch:v5];

  if (v6)
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = objc_msgSend(v6, "phoneNumbers", 0);
    int v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = [v12 value];
          int v14 = [v13 isEqual:v7];

          if (v14)
          {
            int v9 = [v12 label];
            goto LABEL_12;
          }
        }
        int v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)labelForEmailAddress:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[PHAssistantServices sharedContactStore];
  v20[0] = *MEMORY[0x263EFDF80];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v6 = [v4 contactForDestinationId:v3 keysToFetch:v5];

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v7 = objc_msgSend(v6, "emailAddresses", 0);
    uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v12 = [v11 value];
          int v13 = [v12 isEqualToString:v3];

          if (v13)
          {
            uint64_t v8 = [v11 label];
            goto LABEL_12;
          }
        }
        uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)personFromRawAddress:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F64B28] person];
  if ([v3 length])
  {
    if ([v3 _appearsToBeEmail])
    {
      id v5 = objc_alloc_init(MEMORY[0x263F648C0]);
      [v5 setEmailAddress:v3];
      v9[0] = v5;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      [v4 setEmails:v6];
    }
    else
    {
      id v5 = [MEMORY[0x263F64B38] phone];
      [v5 setNumber:v3];
      id v8 = v5;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
      [v4 setPhones:v6];
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
    v6 = [v5 localizedStringForKey:@"UNKNOWN_CALLER" value:&stru_26E87C300 table:@"General"];
    [v4 setFullName:v6];
  }

  return v4;
}

- (id)phoneVoiceMailFromVMVoicemail:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F64B68]);
  v6 = [v4 date];
  [v5 setCallTime:v6];

  int v7 = NSNumber;
  [v4 duration];
  uint64_t v9 = [v7 numberWithUnsignedInteger:(unint64_t)v8];
  [v5 setLength:v9];

  uint64_t v10 = [MEMORY[0x263F64B30] personAttribute];
  int v11 = [(PHSearchRequest *)self contactsByVoicemailIdentifier];
  int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  int v13 = [v11 objectForKeyedSubscript:v12];

  if (v13)
  {
    int v14 = [MEMORY[0x263F333F0] createSAPersonFromCNContact:v13];
    [v10 setObject:v14];
  }
  else
  {
    int v14 = [v4 senderDestinationID];
    long long v15 = [(PHSearchRequest *)self personFromRawAddress:v14];
    [v10 setObject:v15];
  }
  long long v16 = [v4 senderDestinationID];
  [v10 setData:v16];

  long long v17 = [v10 object];
  long long v18 = [v17 fullName];
  [v10 setDisplayText:v18];

  long long v19 = [v4 senderDestinationID];
  v20 = [(PHSearchRequest *)self typedDataForRawAddress:v19];
  [v10 setTypedData:v20];

  [v5 setContact:v10];
  int v21 = [v4 dataURL];
  [v5 setIdentifier:v21];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isUnread"));
  [v5 setIsNew:v22];

  return v5;
}

- (id)phoneCallHistoryFromRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F64B40] callHistory];
  v6 = [v4 date];
  [v5 setCallTime:v6];

  int v7 = [v4 callStatus];
  int v8 = *MEMORY[0x263F305E0] & v7;
  [v4 duration];
  double v10 = v9;
  int v11 = [MEMORY[0x263F64B30] personAttribute];
  int v12 = [v4 callerId];
  int v13 = [v4 contactIdentifier];

  if (!v13) {
    goto LABEL_3;
  }
  int v14 = +[PHAssistantServices sharedContactStore];
  [v4 contactIdentifier];
  long long v16 = v15 = v8;
  long long v17 = [MEMORY[0x263F333F0] descriptorsForRequiredKeys];
  long long v18 = [v14 contactForIdentifier:v16 keysToFetch:v17];

  int v8 = v15;
  long long v19 = [MEMORY[0x263F333F0] createSAPersonFromCNContact:v18];

  if (!v19)
  {
LABEL_3:
    long long v19 = [(PHSearchRequest *)self personFromRawAddress:v12];
  }
  [v11 setObject:v19];
  v20 = [v19 fullName];
  [v11 setDisplayText:v20];

  [v11 setData:v12];
  int v21 = [(PHSearchRequest *)self typedDataForRawAddress:v12];
  [v11 setTypedData:v21];

  [v5 setContact:v11];
  v22 = [NSNumber numberWithBool:v8 != 0];
  [v5 setOutgoing:v22];

  BOOL v23 = v10 == 0.0 && v8 == 0;
  v24 = [NSNumber numberWithInt:v23];
  [v5 setMissed:v24];

  v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "callerIdIsBlocked"));
  [v5 setBlocked:v25];

  int v26 = [v4 callType];
  if (v26)
  {
    int v27 = v26;
    int v28 = [NSNumber numberWithInt:v26 == *MEMORY[0x263F305F8]];
    [v5 setFaceTime:v28];

    v29 = [NSNumber numberWithInt:v27 == *MEMORY[0x263F305F0]];
    [v5 setFaceTimeAudio:v29];
  }

  return v5;
}

- (BOOL)didSpecifyContacts
{
  v2 = [(SAPhoneSearch *)self contacts];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSSet)specifiedContactIdentifiers
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  specifiedContactIdentifiers = self->_specifiedContactIdentifiers;
  if (!specifiedContactIdentifiers)
  {
    id v4 = (void *)MEMORY[0x263EFF9C0];
    id v5 = [(SAPhoneSearch *)self contacts];
    v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v7 = [(SAPhoneSearch *)self contacts];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v13 = [v12 identifier];

          if (v13)
          {
            int v14 = (void *)MEMORY[0x263F333F8];
            int v15 = [v12 identifier];
            long long v16 = [v14 contactIDFromAssistantID:v15];
            [v6 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    long long v17 = (NSSet *)[v6 copy];
    long long v18 = self->_specifiedContactIdentifiers;
    self->_specifiedContactIdentifiers = v17;

    specifiedContactIdentifiers = self->_specifiedContactIdentifiers;
  }

  return specifiedContactIdentifiers;
}

- (void)cacheContactsForVoicemails:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F333F0], "descriptorsForRequiredKeys", a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(PHSearchRequest *)self voicemails];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = +[PHAssistantServices sharedContactStore];
        int v11 = [v9 contactUsingContactStore:v10 withKeysToFetch:v4];
        int v12 = [(PHSearchRequest *)self contactsByVoicemailIdentifier];
        int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
        [v12 setObject:v11 forKeyedSubscript:v13];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (id)voicemailFilterPredicate
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2352CCB50;
  v4[3] = &unk_264C4CFB0;
  v4[4] = self;
  v2 = [MEMORY[0x263F08A98] predicateWithBlock:v4];

  return v2;
}

- (id)recentCallsFilterPredicate
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2352CCDB0;
  v4[3] = &unk_264C4CFD8;
  v4[4] = self;
  v2 = [MEMORY[0x263F08A98] predicateWithBlock:v4];

  return v2;
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [(SAPhoneSearch *)self voiceMail];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    uint64_t v8 = [(PHSearchRequest *)self voicemailFilterPredicate];
    uint64_t v9 = [(PHSearchRequest *)self voicemails];
    [(PHSearchRequest *)self cacheContactsForVoicemails:v9];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if ([v8 evaluateWithObject:v15])
          {
            long long v16 = [(PHSearchRequest *)self phoneVoiceMailFromVMVoicemail:v15];
            [v5 addObject:v16];

            long long v17 = [(SAPhoneSearch *)self last];
            if ([v17 BOOLValue] && objc_msgSend(v5, "count"))
            {

              goto LABEL_27;
            }
            unint64_t v18 = [v5 count];

            if (v18 > 0x19) {
              goto LABEL_27;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_27:
    long long v19 = v10;
LABEL_28:
  }
  else
  {
    uint64_t v8 = [(PHSearchRequest *)self recentCallsFilterPredicate];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v19 = [(PHSearchRequest *)self recentCalls];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          if ([v8 evaluateWithObject:v24])
          {
            uint64_t v25 = [(PHSearchRequest *)self phoneCallHistoryFromRecentCall:v24];
            [v5 addObject:v25];

            id v10 = [(SAPhoneSearch *)self last];
            if ([v10 BOOLValue] && objc_msgSend(v5, "count")) {
              goto LABEL_28;
            }
            unint64_t v26 = [v5 count];

            if (v26 > 0x19) {
              goto LABEL_29;
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v21);
    }
  }
LABEL_29:

  int v27 = PHDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v41 = v28;
    _os_log_impl(&dword_2352C7000, v27, OS_LOG_TYPE_DEFAULT, "After filtering, results contains %lu objects.", buf, 0xCu);
  }

  v29 = [MEMORY[0x263F64B60] searchCompleted];
  [v29 setPhoneSearchResults:v5];
  v30 = [v29 dictionary];
  id v31 = (void *)[v30 copy];
  v4[2](v4, v31);
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
}

- (CHManager)recentsManager
{
  return self->_recentsManager;
}

- (void)setRecentsManager:(id)a3
{
}

- (NSMutableDictionary)contactsByVoicemailIdentifier
{
  return self->_contactsByVoicemailIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsByVoicemailIdentifier, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);

  objc_storeStrong((id *)&self->_specifiedContactIdentifiers, 0);
}

@end