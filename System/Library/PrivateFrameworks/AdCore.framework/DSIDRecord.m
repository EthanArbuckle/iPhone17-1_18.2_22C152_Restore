@interface DSIDRecord
- (BOOL)accountAgeUnknown;
- (BOOL)accountIsT13;
- (BOOL)accountIsU13;
- (BOOL)accountIsU18;
- (BOOL)dirty;
- (BOOL)iAdIDRecordsDirty;
- (BOOL)isActiveRecord;
- (BOOL)isDPIDLocal;
- (BOOL)isDPIDManatee;
- (BOOL)isPlaceholderAccount;
- (BOOL)isRestrictedByApple;
- (BOOL)lastSentPersonalizedAdsStatus;
- (BOOL)notificationRequired;
- (BOOL)sensitiveContentEligible;
- (BOOL)shouldSendNotification;
- (DSIDRecord)initWithDSID:(id)a3 serializedRecord:(id)a4 version:(int)a5;
- (NSMutableDictionary)ADIDRecords;
- (NSString)DSID;
- (NSString)iAdIDBeforeReset;
- (NSString)iCloudDSID;
- (NSString)segmentData;
- (id)_parseItunesFlags;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)encryptedIDForClientType:(int64_t)a3;
- (id)idAccountsDictionaryRepresentation;
- (id)idForClientType:(int64_t)a3;
- (int)deviceIDRotationTimestamp;
- (int)effectiveBirthYear;
- (int)lastSegmentServedTimestamp;
- (int)lastSentPersonalizedAdsTimestamp;
- (int)lastSentSegmentDataTimestamp;
- (int)nextReconcileTimestamp;
- (int)noiseAppliedVersion;
- (int)personalizedAdsTimestamp;
- (int)segmentDataTimestamp;
- (int64_t)lastJingleAccountStatus;
- (void)setADIDRecords:(id)a3;
- (void)setAccountAgeUnknown:(BOOL)a3;
- (void)setAccountIsT13:(BOOL)a3;
- (void)setAccountIsU13:(BOOL)a3;
- (void)setAccountIsU18:(BOOL)a3;
- (void)setDSID:(id)a3;
- (void)setDeviceIDRotationTimestamp:(int)a3;
- (void)setDirty:(BOOL)a3;
- (void)setEffectiveBirthYear:(int)a3;
- (void)setIAdIDBeforeReset:(id)a3;
- (void)setICloudDSID:(id)a3;
- (void)setID:(id)a3 forClientType:(int64_t)a4;
- (void)setIsDPIDLocal:(BOOL)a3;
- (void)setIsDPIDManatee:(BOOL)a3;
- (void)setIsPlaceholderAccount:(BOOL)a3;
- (void)setLastJingleAccountStatus:(int64_t)a3;
- (void)setLastSegmentServedTimestamp:(int)a3;
- (void)setLastSentPersonalizedAdsStatus:(BOOL)a3;
- (void)setLastSentPersonalizedAdsTimestamp:(int)a3;
- (void)setLastSentSegmentDataTimestamp:(int)a3;
- (void)setNextReconcileTimestamp:(int)a3;
- (void)setNoiseAppliedVersion:(int)a3;
- (void)setNotificationRequired:(BOOL)a3;
- (void)setPersonalizedAdsTimestamp:(int)a3;
- (void)setSegmentData:(id)a3;
- (void)setSegmentDataTimestamp:(int)a3;
- (void)setSensitiveContentEligible:(BOOL)a3;
@end

@implementation DSIDRecord

void __52__DSIDRecord_initWithDSID_serializedRecord_version___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  v5 = [a3 valueForKey:@"kADiAdIDRecord_iAdIDKey"];
  if (v5) {
    objc_msgSend(*(id *)(a1 + 32), "setID:forClientType:", v5, objc_msgSend(v6, "integerValue"));
  }
}

- (void)setID:(id)a3 forClientType:(int64_t)a4
{
  id v10 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  v7 = [[ADIDRecord alloc] initWithID:v10];
  v8 = [(DSIDRecord *)v6 ADIDRecords];
  v9 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v7 forKeyedSubscript:v9];

  objc_sync_exit(v6);
}

- (NSMutableDictionary)ADIDRecords
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (DSIDRecord)initWithDSID:(id)a3 serializedRecord:(id)a4 version:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v54.receiver = self;
    v54.super_class = (Class)DSIDRecord;
    id v10 = [(DSIDRecord *)&v54 init];
    v11 = v10;
    if (v10)
    {
      p_DSID = (id *)&v10->_DSID;
      objc_storeStrong((id *)&v10->_DSID, a3);
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      ADIDRecords = v11->_ADIDRecords;
      v11->_ADIDRecords = v13;

      v11->_lastJingleAccountStatus = -1;
      if (v9)
      {
        v15 = [v9 valueForKey:@"kADDSIDRecord_AccountIs13Key"];
        v11->_accountIsT13 = [v15 BOOLValue];

        v16 = [v9 valueForKey:@"kADDSIDRecord_AccountIsU13Key"];
        v11->_accountIsU13 = [v16 BOOLValue];

        v17 = [v9 valueForKey:@"kADDSIDRecord_AccountIsU18Key"];
        v11->_accountIsU18 = [v17 BOOLValue];

        v18 = [v9 valueForKey:@"kADDSIDRecord_AccountAgeUnknownKey"];
        v11->_accountAgeUnknown = [v18 BOOLValue];

        v19 = [v9 valueForKey:@"kADDSIDRecord_SensitiveContentEligibleKey"];
        v11->_sensitiveContentEligible = [v19 BOOLValue];

        v20 = [v9 valueForKey:@"kADDSIDRecord_EffectiveBirthYearKey"];
        v11->_effectiveBirthYear = [v20 intValue];

        v21 = [v9 valueForKey:@"kADDSIDRecord_NoiseAppliedVersionKey"];
        v11->_noiseAppliedVersion = [v21 intValue];

        v22 = [v9 valueForKey:@"kADDSIDRecord_IsDPIDManatee"];
        v11->_isDPIDManatee = [v22 BOOLValue];

        v23 = [v9 valueForKey:@"kADDSIDRecord_IsDPIDLocal"];
        v11->_isDPIDLocal = [v23 BOOLValue];

        v24 = [v9 valueForKey:@"kADDSIDRecord_PersonalizedAdsTimestampKey"];
        v11->_personalizedAdsTimestamp = [v24 intValue];

        v25 = [v9 valueForKey:@"kADDSIDRecord_LastJingleAccountStatusKey"];
        v11->_lastJingleAccountStatus = [v25 integerValue];

        v26 = [v9 valueForKey:@"kADiAdIDRecord_LastSentPersonalizedAdsStatusKey"];
        v11->_lastSentPersonalizedAdsStatus = [v26 BOOLValue];

        v27 = [v9 valueForKey:@"kADiAdIDRecord_LastSentPersonalizedAdsTimestampKey"];
        v11->_lastSentPersonalizedAdsTimestamp = [v27 intValue];

        v28 = [v9 valueForKey:@"kADDSIDRecord_SegmentDataTimestampKey"];
        v11->_segmentDataTimestamp = [v28 intValue];

        v29 = [v9 valueForKey:@"kADiAdIDRecord_LastSentSegmentDataTimestampKey"];
        v11->_lastSentSegmentDataTimestamp = [v29 intValue];

        v30 = [v9 valueForKey:@"kADiAdIDRecord_LastSegmentServedTimestampKey"];
        v11->_lastSegmentServedTimestamp = [v30 intValue];

        v31 = [v9 valueForKey:@"kADiAdIDRecord_NextReconcileTimestamp"];
        v11->_nextReconcileTimestamp = [v31 intValue];

        v32 = [v9 valueForKey:@"kADDSIDRecord_DeviceIDRotationTimestampKey"];
        v11->_deviceIDRotationTimestamp = [v32 intValue];

        v33 = +[ADCoreDefaults sharedInstance];
        char v34 = [v33 BOOLForKey:@"EnableCustomPayload"];

        if (v34)
        {
          v35 = +[ADCoreSettings sharedInstance];
          uint64_t v36 = [v35 customJinglePayload];
          segmentData = v11->_segmentData;
          v11->_segmentData = (NSString *)v36;

          v38 = @"CUSTOM";
        }
        else
        {
          uint64_t v40 = [v9 valueForKey:@"kADDSIDRecord_SegmentDataKey"];
          v35 = v11->_segmentData;
          v11->_segmentData = (NSString *)v40;
          v38 = @"ACTUAL";
        }

        v41 = [NSString stringWithFormat:@"Saving the %@ segment payload with data: %@", v38, v11->_segmentData];
        _ADLog(@"iAdIDLogging", v41, 0);

        v42 = [v9 valueForKey:@"kADDSIDRecord_iAdIDRecordsKey"];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __52__DSIDRecord_initWithDSID_serializedRecord_version___block_invoke;
        v52[3] = &unk_1E68A07E0;
        v43 = v11;
        v53 = v43;
        [v42 enumerateKeysAndObjectsUsingBlock:v52];
        OSStatus v51 = 0;
        v44 = GetKeychainPropertyListForKey(@"_ADClientDPIDStorageContainerKey", &v51);
        v45 = v44;
        if (!v51 && v44)
        {
          v46 = [v44 valueForKey:*p_DSID];
          v47 = v46;
          if (v46)
          {
            v48 = [v46 valueForKey:@"ADClientDPIDRecordKey"];
            if (v48)
            {
              if ([*p_DSID isEqualToString:@"0"])
              {
                v49 = [NSString stringWithFormat:@"Found a DPID record for DSID 0 in keychain. Please file a radar."];
                _ADLog(@"iAdIDLogging", v49, 0);
              }
              else
              {
                [(DSIDRecord *)v43 setID:v48 forClientType:5];
              }
            }
          }
        }
      }
      [(DSIDRecord *)v11 setDirty:1];
    }
    self = v11;
    v39 = self;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
  if (!a3)
  {
    v4 = [(DSIDRecord *)self ADIDRecords];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __23__DSIDRecord_setDirty___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v32__0__NSNumber_8__ADIDRecord_16_B24l;
    BOOL v6 = a3;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

- (id)idAccountsDictionaryRepresentation
{
  v3 = [(DSIDRecord *)self idForClientType:6];
  v4 = [(DSIDRecord *)self idForClientType:2];
  v5 = [(DSIDRecord *)self idForClientType:3];
  BOOL v6 = [(DSIDRecord *)self idForClientType:4];
  v7 = [(DSIDRecord *)self idForClientType:5];
  id v8 = [(DSIDRecord *)self idForClientType:0];
  id v9 = [(DSIDRecord *)self _parseItunesFlags];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v9];
  [v10 setValue:v3 forKey:@"deviceNewsPlusSubscriberID"];
  [v10 setValue:v4 forKey:@"anonymousDemandID"];
  [v10 setValue:v5 forKey:@"contentID"];
  [v10 setValue:v6 forKey:@"toroID"];
  [v10 setValue:v7 forKey:@"DPID"];
  [v10 setValue:v8 forKey:@"iAdID"];
  v11 = [(DSIDRecord *)self segmentData];
  [v10 setValue:v11 forKey:@"segmentData"];

  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v10];

  return v12;
}

- (id)idForClientType:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  ADIDRecords = v4->_ADIDRecords;
  BOOL v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)ADIDRecords objectForKeyedSubscript:v6];
  id v8 = [v7 ID];

  objc_sync_exit(v4);
  return v8;
}

- (NSString)segmentData
{
  return self->_segmentData;
}

- (id)_parseItunesFlags
{
  v29[10] = *MEMORY[0x1E4F143B8];
  v3 = [(DSIDRecord *)self DSID];
  v26 = [(DSIDRecord *)self iCloudDSID];
  v27 = v3;
  uint64_t v4 = objc_msgSend(v3, "isEqualToString:");
  BOOL v5 = [(DSIDRecord *)self accountAgeUnknown];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [(DSIDRecord *)self accountIsU13];
    if ([(DSIDRecord *)self accountIsU18] && [(DSIDRecord *)self accountIsT13])
    {
      uint64_t v6 = 1;
    }
    else if ([(DSIDRecord *)self accountIsU18] && ![(DSIDRecord *)self accountIsT13])
    {
      uint64_t v6 = [(DSIDRecord *)self accountIsU13] ^ 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
    if ([(DSIDRecord *)self accountAgeUnknown] || [(DSIDRecord *)self accountIsU13]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [(DSIDRecord *)self accountIsU18] ^ 1;
    }
  }
  id v9 = +[ADCoreSettings sharedInstance];
  v28[0] = @"iTunesDSID";
  v25 = [(DSIDRecord *)self DSID];
  v29[0] = v25;
  v28[1] = @"isChild";
  v24 = [NSNumber numberWithBool:v8];
  v29[1] = v24;
  v28[2] = @"isAdolescent";
  v23 = [NSNumber numberWithBool:v6];
  v29[2] = v23;
  v28[3] = @"isAdult";
  v22 = [NSNumber numberWithBool:v7];
  v29[3] = v22;
  v28[4] = @"ageUnknown";
  id v10 = [NSNumber numberWithBool:v5];
  v29[4] = v10;
  v28[5] = @"isiCloudLoggedIn";
  v11 = NSNumber;
  v12 = [(DSIDRecord *)self iCloudDSID];
  v13 = [v11 numberWithInt:v12 != 0];
  v29[5] = v13;
  v28[6] = @"isiTunesLoggedIn";
  v14 = NSNumber;
  v15 = [(DSIDRecord *)self DSID];
  v16 = [v14 numberWithInt:v15 != 0];
  v29[6] = v16;
  v28[7] = @"isiCloudSameAsiTunes";
  v17 = [NSNumber numberWithBool:v4];
  v29[7] = v17;
  v28[8] = @"isNoServicesRegion";
  v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isRestrictedRegion"));
  v29[8] = v18;
  v28[9] = @"sensitiveContentEligible";
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord sensitiveContentEligible](self, "sensitiveContentEligible"));
  v29[9] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:10];

  return v20;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (BOOL)accountIsU18
{
  return self->_accountIsU18;
}

- (BOOL)accountIsU13
{
  return self->_accountIsU13;
}

- (BOOL)accountAgeUnknown
{
  return self->_accountAgeUnknown;
}

- (NSString)iCloudDSID
{
  return self->_iCloudDSID;
}

- (BOOL)sensitiveContentEligible
{
  return self->_sensitiveContentEligible;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(DSIDRecord *)v6 DSID];
    BOOL v8 = (void *)[v7 copyWithZone:a3];
    [v5 setDSID:v8];

    objc_msgSend(v5, "setAccountIsT13:", -[DSIDRecord accountIsT13](v6, "accountIsT13"));
    objc_msgSend(v5, "setAccountIsU13:", -[DSIDRecord accountIsU13](v6, "accountIsU13"));
    objc_msgSend(v5, "setAccountIsU18:", -[DSIDRecord accountIsU18](v6, "accountIsU18"));
    objc_msgSend(v5, "setAccountAgeUnknown:", -[DSIDRecord accountAgeUnknown](v6, "accountAgeUnknown"));
    objc_msgSend(v5, "setSensitiveContentEligible:", -[DSIDRecord sensitiveContentEligible](v6, "sensitiveContentEligible"));
    objc_msgSend(v5, "setEffectiveBirthYear:", -[DSIDRecord effectiveBirthYear](v6, "effectiveBirthYear"));
    objc_msgSend(v5, "setNoiseAppliedVersion:", -[DSIDRecord noiseAppliedVersion](v6, "noiseAppliedVersion"));
    id v9 = [(DSIDRecord *)v6 ADIDRecords];
    id v10 = (void *)[v9 mutableCopyWithZone:a3];
    [v5 setADIDRecords:v10];

    objc_msgSend(v5, "setLastJingleAccountStatus:", -[DSIDRecord lastJingleAccountStatus](v6, "lastJingleAccountStatus"));
    objc_msgSend(v5, "setPersonalizedAdsTimestamp:", -[DSIDRecord personalizedAdsTimestamp](v6, "personalizedAdsTimestamp"));
    objc_msgSend(v5, "setLastSentPersonalizedAdsStatus:", -[DSIDRecord lastSentPersonalizedAdsStatus](v6, "lastSentPersonalizedAdsStatus"));
    v11 = [(DSIDRecord *)v6 segmentData];
    v12 = (void *)[v11 copyWithZone:a3];
    [v5 setSegmentData:v12];

    objc_msgSend(v5, "setSegmentDataTimestamp:", -[DSIDRecord segmentDataTimestamp](v6, "segmentDataTimestamp"));
    objc_msgSend(v5, "setLastSentPersonalizedAdsTimestamp:", -[DSIDRecord lastSentPersonalizedAdsTimestamp](v6, "lastSentPersonalizedAdsTimestamp"));
    objc_msgSend(v5, "setLastSentSegmentDataTimestamp:", -[DSIDRecord lastSentSegmentDataTimestamp](v6, "lastSentSegmentDataTimestamp"));
    objc_msgSend(v5, "setLastSegmentServedTimestamp:", -[DSIDRecord lastSegmentServedTimestamp](v6, "lastSegmentServedTimestamp"));
    objc_msgSend(v5, "setNextReconcileTimestamp:", -[DSIDRecord nextReconcileTimestamp](v6, "nextReconcileTimestamp"));
    objc_msgSend(v5, "setDeviceIDRotationTimestamp:", -[DSIDRecord deviceIDRotationTimestamp](v6, "deviceIDRotationTimestamp"));
    objc_sync_exit(v6);
  }
  return v5;
}

- (id)encryptedIDForClientType:(int64_t)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  ADIDRecords = v4->_ADIDRecords;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)ADIDRecords objectForKeyedSubscript:v6];

  BOOL v8 = [v7 encryptedID];

  objc_sync_exit(v4);
  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DSIDRecord;
  uint64_t v4 = [(DSIDRecord *)&v8 description];
  BOOL v5 = dumpObject(self);
  uint64_t v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord accountIsU13](self, "accountIsU13"));
  [v3 setObject:v4 forKeyedSubscript:@"kADDSIDRecord_AccountIsU13Key"];

  BOOL v5 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord accountIsT13](self, "accountIsT13"));
  [v3 setObject:v5 forKeyedSubscript:@"kADDSIDRecord_AccountIs13Key"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord accountIsU18](self, "accountIsU18"));
  [v3 setObject:v6 forKeyedSubscript:@"kADDSIDRecord_AccountIsU18Key"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord accountAgeUnknown](self, "accountAgeUnknown"));
  [v3 setObject:v7 forKeyedSubscript:@"kADDSIDRecord_AccountAgeUnknownKey"];

  objc_super v8 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord sensitiveContentEligible](self, "sensitiveContentEligible"));
  [v3 setObject:v8 forKeyedSubscript:@"kADDSIDRecord_SensitiveContentEligibleKey"];

  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord effectiveBirthYear](self, "effectiveBirthYear"));
  [v3 setObject:v9 forKeyedSubscript:@"kADDSIDRecord_EffectiveBirthYearKey"];

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord noiseAppliedVersion](self, "noiseAppliedVersion"));
  [v3 setObject:v10 forKeyedSubscript:@"kADDSIDRecord_NoiseAppliedVersionKey"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord isDPIDManatee](self, "isDPIDManatee"));
  [v3 setObject:v11 forKeyedSubscript:@"kADDSIDRecord_IsDPIDManatee"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord isDPIDLocal](self, "isDPIDLocal"));
  [v3 setObject:v12 forKeyedSubscript:@"kADDSIDRecord_IsDPIDLocal"];

  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord personalizedAdsTimestamp](self, "personalizedAdsTimestamp"));
  [v3 setObject:v13 forKeyedSubscript:@"kADDSIDRecord_PersonalizedAdsTimestampKey"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[DSIDRecord lastSentPersonalizedAdsStatus](self, "lastSentPersonalizedAdsStatus"));
  [v3 setObject:v14 forKeyedSubscript:@"kADiAdIDRecord_LastSentPersonalizedAdsStatusKey"];

  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord lastSentPersonalizedAdsTimestamp](self, "lastSentPersonalizedAdsTimestamp"));
  [v3 setObject:v15 forKeyedSubscript:@"kADiAdIDRecord_LastSentPersonalizedAdsTimestampKey"];

  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[DSIDRecord lastJingleAccountStatus](self, "lastJingleAccountStatus"));
  [v3 setObject:v16 forKeyedSubscript:@"kADDSIDRecord_LastJingleAccountStatusKey"];

  v17 = [(DSIDRecord *)self segmentData];
  [v3 setObject:v17 forKeyedSubscript:@"kADDSIDRecord_SegmentDataKey"];

  v18 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord segmentDataTimestamp](self, "segmentDataTimestamp"));
  [v3 setObject:v18 forKeyedSubscript:@"kADDSIDRecord_SegmentDataTimestampKey"];

  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord lastSentSegmentDataTimestamp](self, "lastSentSegmentDataTimestamp"));
  [v3 setObject:v19 forKeyedSubscript:@"kADiAdIDRecord_LastSentSegmentDataTimestampKey"];

  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord lastSegmentServedTimestamp](self, "lastSegmentServedTimestamp"));
  [v3 setObject:v20 forKeyedSubscript:@"kADiAdIDRecord_LastSegmentServedTimestampKey"];

  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord nextReconcileTimestamp](self, "nextReconcileTimestamp"));
  [v3 setObject:v21 forKeyedSubscript:@"kADiAdIDRecord_NextReconcileTimestamp"];

  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[DSIDRecord deviceIDRotationTimestamp](self, "deviceIDRotationTimestamp"));
  [v3 setObject:v22 forKeyedSubscript:@"kADDSIDRecord_DeviceIDRotationTimestampKey"];

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23 = self;
  objc_sync_enter(v23);
  ADIDRecords = v23->_ADIDRecords;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __38__DSIDRecord_dictionaryRepresentation__block_invoke;
  v26[3] = &unk_1E68A0808;
  v26[4] = &v27;
  [(NSMutableDictionary *)ADIDRecords enumerateKeysAndObjectsUsingBlock:v26];
  objc_sync_exit(v23);

  [v3 setObject:v28[5] forKeyedSubscript:@"kADDSIDRecord_iAdIDRecordsKey"];
  _Block_object_dispose(&v27, 8);

  return v3;
}

void __38__DSIDRecord_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 dictionaryRepresentation];
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v7 = [v5 stringValue];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)isPlaceholderAccount
{
  DSID = self->_DSID;
  if (DSID)
  {
    return [(NSString *)DSID isEqualToString:@"0"];
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@"Current DSID is null!"];
    _ADLog(@"iAdIDLogging", v4, 0);

    return 1;
  }
}

- (BOOL)isRestrictedByApple
{
  if ([(DSIDRecord *)self accountIsU13] || [(DSIDRecord *)self accountIsU18]) {
    return 1;
  }
  uint64_t v4 = +[ADCoreSettings sharedInstance];
  if ([v4 isManagedAppleID])
  {
    char v3 = 1;
  }
  else
  {
    id v5 = +[ADCoreSettings sharedInstance];
    char v3 = [v5 educationModeEnabled];
  }
  return v3;
}

uint64_t __23__DSIDRecord_setDirty___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 setDirty:*(unsigned __int8 *)(a1 + 32)];
  *a4 = 0;
  return result;
}

- (BOOL)iAdIDRecordsDirty
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(DSIDRecord *)self ADIDRecords];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__DSIDRecord_iAdIDRecordsDirty__block_invoke;
  v4[3] = &unk_1E68A0808;
  v4[4] = &v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __31__DSIDRecord_iAdIDRecordsDirty__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 dirty];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (BOOL)dirty
{
  return self->_dirty || [(DSIDRecord *)self iAdIDRecordsDirty];
}

- (BOOL)shouldSendNotification
{
  if ([(DSIDRecord *)self notificationRequired]) {
    return 1;
  }
  return [(DSIDRecord *)self iAdIDRecordsDirty];
}

- (void)setNotificationRequired:(BOOL)a3
{
  self->_notificationRequired = a3;
}

- (void)setAccountIsU13:(BOOL)a3
{
  if (self->_accountIsU13 != a3)
  {
    self->_accountIsU13 = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setAccountIsT13:(BOOL)a3
{
  if (self->_accountIsT13 != a3)
  {
    self->_accountIsT13 = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setAccountIsU18:(BOOL)a3
{
  if (self->_accountIsU18 != a3)
  {
    self->_accountIsU18 = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setAccountAgeUnknown:(BOOL)a3
{
  if (self->_accountAgeUnknown != a3)
  {
    self->_accountAgeUnknown = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setSensitiveContentEligible:(BOOL)a3
{
  if (self->_sensitiveContentEligible != a3)
  {
    self->_sensitiveContentEligible = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setEffectiveBirthYear:(int)a3
{
  if (self->_effectiveBirthYear != a3)
  {
    self->_effectiveBirthYear = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setNoiseAppliedVersion:(int)a3
{
  if (self->_noiseAppliedVersion != a3)
  {
    self->_noiseAppliedVersion = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setIsDPIDManatee:(BOOL)a3
{
  if (self->_isDPIDManatee != a3)
  {
    self->_isDPIDManatee = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setIsDPIDLocal:(BOOL)a3
{
  if (self->_isDPIDLocal != a3)
  {
    self->_isDPIDLocal = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setLastSentPersonalizedAdsStatus:(BOOL)a3
{
  if (self->_lastSentPersonalizedAdsStatus != a3)
  {
    self->_lastSentPersonalizedAdsStatus = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setLastSentPersonalizedAdsTimestamp:(int)a3
{
  if (self->_lastSentPersonalizedAdsTimestamp != a3)
  {
    self->_lastSentPersonalizedAdsTimestamp = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setLastJingleAccountStatus:(int64_t)a3
{
  if (self->_lastJingleAccountStatus != a3)
  {
    self->_lastJingleAccountStatus = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setSegmentData:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_segmentData, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_segmentData, a3);
    [(DSIDRecord *)self setDirty:1];
    [(DSIDRecord *)self setNotificationRequired:1];
  }
}

- (void)setSegmentDataTimestamp:(int)a3
{
  if (self->_segmentDataTimestamp != a3)
  {
    self->_segmentDataTimestamp = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setLastSentSegmentDataTimestamp:(int)a3
{
  if (self->_lastSentSegmentDataTimestamp != a3)
  {
    self->_lastSentSegmentDataTimestamp = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setLastSegmentServedTimestamp:(int)a3
{
  if (self->_lastSegmentServedTimestamp != a3)
  {
    self->_lastSegmentServedTimestamp = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setPersonalizedAdsTimestamp:(int)a3
{
  if (self->_personalizedAdsTimestamp != a3)
  {
    self->_personalizedAdsTimestamp = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setDeviceIDRotationTimestamp:(int)a3
{
  if (self->_deviceIDRotationTimestamp != a3)
  {
    self->_deviceIDRotationTimestamp = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (int)nextReconcileTimestamp
{
  return self->_nextReconcileTimestamp;
}

- (void)setNextReconcileTimestamp:(int)a3
{
  if (self->_nextReconcileTimestamp != a3)
  {
    self->_nextReconcileTimestamp = a3;
    [(DSIDRecord *)self setDirty:1];
  }
}

- (void)setDSID:(id)a3
{
}

- (void)setICloudDSID:(id)a3
{
}

- (BOOL)accountIsT13
{
  return self->_accountIsT13;
}

- (int)effectiveBirthYear
{
  return self->_effectiveBirthYear;
}

- (int)noiseAppliedVersion
{
  return self->_noiseAppliedVersion;
}

- (BOOL)isActiveRecord
{
  return self->_isActiveRecord;
}

- (void)setIsPlaceholderAccount:(BOOL)a3
{
  self->_isPlaceholderAccount = a3;
}

- (NSString)iAdIDBeforeReset
{
  return self->_iAdIDBeforeReset;
}

- (void)setIAdIDBeforeReset:(id)a3
{
}

- (BOOL)isDPIDManatee
{
  return self->_isDPIDManatee;
}

- (BOOL)isDPIDLocal
{
  return self->_isDPIDLocal;
}

- (int)personalizedAdsTimestamp
{
  return self->_personalizedAdsTimestamp;
}

- (int)segmentDataTimestamp
{
  return self->_segmentDataTimestamp;
}

- (int)lastSentSegmentDataTimestamp
{
  return self->_lastSentSegmentDataTimestamp;
}

- (int)lastSegmentServedTimestamp
{
  return self->_lastSegmentServedTimestamp;
}

- (int)deviceIDRotationTimestamp
{
  return self->_deviceIDRotationTimestamp;
}

- (void)setADIDRecords:(id)a3
{
}

- (int64_t)lastJingleAccountStatus
{
  return self->_lastJingleAccountStatus;
}

- (BOOL)lastSentPersonalizedAdsStatus
{
  return self->_lastSentPersonalizedAdsStatus;
}

- (int)lastSentPersonalizedAdsTimestamp
{
  return self->_lastSentPersonalizedAdsTimestamp;
}

- (BOOL)notificationRequired
{
  return self->_notificationRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ADIDRecords, 0);
  objc_storeStrong((id *)&self->_iAdIDBeforeReset, 0);
  objc_storeStrong((id *)&self->_segmentData, 0);
  objc_storeStrong((id *)&self->_iCloudDSID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end