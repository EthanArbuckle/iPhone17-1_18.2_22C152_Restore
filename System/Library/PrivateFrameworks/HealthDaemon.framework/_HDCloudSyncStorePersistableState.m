@interface _HDCloudSyncStorePersistableState
- (BOOL)hasEncounteredGapInCurrentEpoch;
- (BOOL)pendingFullSync;
- (CKServerChangeToken)serverChangeToken;
- (HDSyncIdentity)syncIdentity;
- (NSDate)lastCheckDate;
- (NSDate)lastSyncDate;
- (NSDate)rebaseDeadline;
- (NSDictionary)emptyZoneDateByZoneID;
- (NSString)containerIdentifier;
- (NSString)ownerIdentifier;
- (_HDCloudSyncStorePersistableState)initWithServerChangeToken:(id)a3 baselineEpoch:(unint64_t)a4 rebaseDeadline:(id)a5 lastSyncDate:(id)a6 emptyZones:(id)a7 lastCheckDate:(id)a8 ownerIdentifier:(id)a9 containerIdentifier:(id)a10 syncIdentity:(id)a11 syncProtocolVersion:(int)a12;
- (_HDCloudSyncStorePersistableState)stateWithBaselineEpoch:(unint64_t)a3;
- (_HDCloudSyncStorePersistableState)stateWithEmptyZones:(id)a3;
- (_HDCloudSyncStorePersistableState)stateWithGapEncountered:(BOOL)a3;
- (_HDCloudSyncStorePersistableState)stateWithPendingFullSync:(BOOL)a3;
- (_HDCloudSyncStorePersistableState)stateWithServerChangeToken:(id)a3;
- (_HDCloudSyncStorePersistableState)stateWithSyncProtocolVersion:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stateByRecordingLastCheckDate:(id)a3;
- (id)stateByRecordingLastSyncDate:(id)a3;
- (id)stateByRequiringUrgentRebase;
- (id)stateByResettingRebaselineDeadline;
- (int)syncProtocolVersion;
- (unint64_t)baselineEpoch;
@end

@implementation _HDCloudSyncStorePersistableState

- (_HDCloudSyncStorePersistableState)initWithServerChangeToken:(id)a3 baselineEpoch:(unint64_t)a4 rebaseDeadline:(id)a5 lastSyncDate:(id)a6 emptyZones:(id)a7 lastCheckDate:(id)a8 ownerIdentifier:(id)a9 containerIdentifier:(id)a10 syncIdentity:(id)a11 syncProtocolVersion:(int)a12
{
  id v35 = a3;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v36.receiver = self;
  v36.super_class = (Class)_HDCloudSyncStorePersistableState;
  v22 = [(_HDCloudSyncStorePersistableState *)&v36 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_serverChangeToken, a3);
    v23->_baselineEpoch = a4;
    objc_storeStrong((id *)&v23->_rebaseDeadline, a5);
    objc_storeStrong((id *)&v23->_lastSyncDate, a6);
    objc_storeStrong((id *)&v23->_emptyZoneDateByZoneID, a7);
    objc_storeStrong((id *)&v23->_lastCheckDate, a8);
    uint64_t v24 = [v19 copy];
    ownerIdentifier = v23->_ownerIdentifier;
    v23->_ownerIdentifier = (NSString *)v24;

    uint64_t v26 = [v20 copy];
    containerIdentifier = v23->_containerIdentifier;
    v23->_containerIdentifier = (NSString *)v26;

    uint64_t v28 = [v21 copy];
    syncIdentity = v23->_syncIdentity;
    v23->_syncIdentity = (HDSyncIdentity *)v28;

    *(_WORD *)&v23->_hasEncounteredGapInCurrentEpoch = 0;
    v23->_syncProtocolVersion = a12;
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LODWORD(v6) = self->_syncProtocolVersion;
  id result = (id)[v4 initWithServerChangeToken:self->_serverChangeToken baselineEpoch:self->_baselineEpoch rebaseDeadline:self->_rebaseDeadline lastSyncDate:self->_lastSyncDate emptyZones:self->_emptyZoneDateByZoneID lastCheckDate:self->_lastCheckDate ownerIdentifier:self->_ownerIdentifier containerIdentifier:self->_containerIdentifier syncIdentity:self->_syncIdentity syncProtocolVersion:v6];
  *((unsigned char *)result + 8) = self->_hasEncounteredGapInCurrentEpoch;
  *((unsigned char *)result + 9) = self->_pendingFullSync;
  return result;
}

- (_HDCloudSyncStorePersistableState)stateWithServerChangeToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(_HDCloudSyncStorePersistableState *)self copy];
  uint64_t v6 = (void *)v5[5];
  v5[5] = v4;

  return (_HDCloudSyncStorePersistableState *)v5;
}

- (id)stateByResettingRebaselineDeadline
{
  v2 = (void *)[(_HDCloudSyncStorePersistableState *)self copy];
  v3 = (void *)v2[7];
  v2[7] = 0;

  return v2;
}

- (id)stateByRequiringUrgentRebase
{
  v2 = (void *)[(_HDCloudSyncStorePersistableState *)self copy];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v4 = (void *)v2[7];
  v2[7] = v3;

  return v2;
}

- (id)stateByRecordingLastSyncDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(_HDCloudSyncStorePersistableState *)self copy];
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[8];
  v5[8] = v6;

  return v5;
}

- (_HDCloudSyncStorePersistableState)stateWithEmptyZones:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(_HDCloudSyncStorePersistableState *)self copy];
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[9];
  v5[9] = v6;

  return (_HDCloudSyncStorePersistableState *)v5;
}

- (id)stateByRecordingLastCheckDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(_HDCloudSyncStorePersistableState *)self copy];
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[10];
  v5[10] = v6;

  return v5;
}

- (_HDCloudSyncStorePersistableState)stateWithGapEncountered:(BOOL)a3
{
  id v4 = (unsigned char *)[(_HDCloudSyncStorePersistableState *)self copy];
  v4[8] = a3;

  return (_HDCloudSyncStorePersistableState *)v4;
}

- (_HDCloudSyncStorePersistableState)stateWithBaselineEpoch:(unint64_t)a3
{
  id v4 = (void *)[(_HDCloudSyncStorePersistableState *)self copy];
  v4[6] = a3;

  return (_HDCloudSyncStorePersistableState *)v4;
}

- (_HDCloudSyncStorePersistableState)stateWithSyncProtocolVersion:(int)a3
{
  id v4 = (_DWORD *)[(_HDCloudSyncStorePersistableState *)self copy];
  v4[3] = a3;

  return (_HDCloudSyncStorePersistableState *)v4;
}

- (_HDCloudSyncStorePersistableState)stateWithPendingFullSync:(BOOL)a3
{
  id v4 = (unsigned char *)[(_HDCloudSyncStorePersistableState *)self copy];
  v4[9] = a3;

  return (_HDCloudSyncStorePersistableState *)v4;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (unint64_t)baselineEpoch
{
  return self->_baselineEpoch;
}

- (NSDate)rebaseDeadline
{
  return self->_rebaseDeadline;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (NSDictionary)emptyZoneDateByZoneID
{
  return self->_emptyZoneDateByZoneID;
}

- (NSDate)lastCheckDate
{
  return self->_lastCheckDate;
}

- (BOOL)hasEncounteredGapInCurrentEpoch
{
  return self->_hasEncounteredGapInCurrentEpoch;
}

- (int)syncProtocolVersion
{
  return self->_syncProtocolVersion;
}

- (BOOL)pendingFullSync
{
  return self->_pendingFullSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCheckDate, 0);
  objc_storeStrong((id *)&self->_emptyZoneDateByZoneID, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_rebaseDeadline, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

@end