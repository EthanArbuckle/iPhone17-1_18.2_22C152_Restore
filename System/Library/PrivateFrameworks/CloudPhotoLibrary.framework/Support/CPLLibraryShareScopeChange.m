@interface CPLLibraryShareScopeChange
- (id)ckRecordForLibraryShareSettingsWithZoneID:(id)a3 userID:(id)a4;
- (void)updateExitConfigFromPreviousScopeChange:(id)a3;
- (void)updateLibraryShareSettingsWithCKRecord:(id)a3;
- (void)updateWithExitConfigRecord:(id)a3;
- (void)updateWithExitStatesRecord:(id)a3;
@end

@implementation CPLLibraryShareScopeChange

- (void)updateWithExitStatesRecord:(id)a3
{
  id v5 = [a3 objectForKey:@"exitingParticipantUserIds"];
  if ([v5 count]) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(CPLLibraryShareScopeChange *)self setExitingUserIdentifiers:v4];
}

- (void)updateWithExitConfigRecord:(id)a3
{
  id v16 = a3;
  id v4 = [v16 objectForKey:@"retentionPolicy"];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 integerValue];
    if (v6 == (id)2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = v6 == (id)1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(CPLLibraryShareScopeChange *)self setExitRetentionPolicy:v7];
  v8 = [v16 objectForKey:@"exitType"];
  v9 = v8;
  if (v8)
  {
    v10 = (char *)[v8 integerValue];
    if ((unint64_t)v10 < 3) {
      v11 = v10 + 1;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  [(CPLLibraryShareScopeChange *)self setExitType:v11];
  v12 = [v16 objectForKey:@"exitSource"];
  v13 = v12;
  if (v12 && (unint64_t v14 = (unint64_t)[v12 integerValue], v14 <= 4)) {
    uint64_t v15 = qword_10024A0A0[v14];
  }
  else {
    uint64_t v15 = 0;
  }
  [(CPLLibraryShareScopeChange *)self setExitSource:v15];
}

- (void)updateExitConfigFromPreviousScopeChange:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v6;
      -[CPLLibraryShareScopeChange setExitRetentionPolicy:](self, "setExitRetentionPolicy:", [v4 exitRetentionPolicy]);
      -[CPLLibraryShareScopeChange setExitType:](self, "setExitType:", [v4 exitType]);
      id v5 = [v4 exitSource];

      [(CPLLibraryShareScopeChange *)self setExitSource:v5];
    }
  }
}

- (void)updateLibraryShareSettingsWithCKRecord:(id)a3
{
  id v6 = a3;
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing])
  {
    id v4 = objc_msgSend(v6, "cpl_legacyDecryptedObjectForKey:validateClass:", @"userScopeDefinedRulesEnc", objc_opt_class());
    [(CPLLibraryShareScopeChange *)self setUserDefinedRules:v4];
  }
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing])
  {
    id v5 = objc_msgSend(v6, "cpl_legacyDecryptedObjectForKey:validateClass:", @"userViewedTrashNotificationDateEnc", objc_opt_class());
    [(CPLLibraryShareScopeChange *)self setUserViewedParticipantTrashNotificationDate:v5];
  }
}

- (id)ckRecordForLibraryShareSettingsWithZoneID:(id)a3 userID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing])
  {
    v8 = CPLLibraryShareSettingsRecordID(v6, v7);
    if (v8)
    {
      id v9 = [objc_alloc((Class)CKRecord) initWithRecordType:@"CPLScopeUserSettings" recordID:v8];
      v10 = [(CPLLibraryShareScopeChange *)self userDefinedRules];

      if (v10)
      {
        v11 = [(CPLLibraryShareScopeChange *)self userDefinedRules];
        objc_msgSend(v9, "cpl_setLegacyEncryptedObject:forKey:", v11, @"userScopeDefinedRulesEnc");
      }
      if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing])
      {
        v12 = [(CPLLibraryShareScopeChange *)self userViewedParticipantTrashNotificationDate];
        objc_msgSend(v9, "cpl_setLegacyEncryptedObject:forKey:", v12, @"userViewedTrashNotificationDateEnc");
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end