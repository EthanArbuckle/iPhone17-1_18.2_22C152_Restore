@interface HDCodableNanoSyncMessage
+ (id)messageFromPersistentUserInfo:(id)a3;
+ (id)messageWithSyncStore:(id)a3 profile:(id)a4;
- (BOOL)hasActivationRestore;
- (BOOL)hasChangeSet;
- (BOOL)hasCurrentSyncIdentity;
- (BOOL)hasEntityVersionMap;
- (BOOL)hasHealthPairingUUID;
- (BOOL)hasPersistentPairingUUID;
- (BOOL)hasStatus;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableNanoSyncActivationRestore)activationRestore;
- (HDCodableNanoSyncChangeSet)changeSet;
- (HDCodableNanoSyncStatus)status;
- (HDCodableSyncEntityVersionMap)entityVersionMap;
- (HDCodableSyncIdentity)currentSyncIdentity;
- (NSData)healthPairingUUID;
- (NSData)persistentPairingUUID;
- (NSString)description;
- (id)copyPersistentUserInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedHealthPairingUUID;
- (id)decodedPersistentPairingUUID;
- (id)dictionaryRepresentation;
- (id)nanoSyncDescription;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationRestore:(id)a3;
- (void)setChangeSet:(id)a3;
- (void)setCurrentSyncIdentity:(id)a3;
- (void)setEntityVersionMap:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHealthPairingUUID:(id)a3;
- (void)setPersistentPairingUUID:(id)a3;
- (void)setStatus:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNanoSyncMessage

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setPersistentPairingUUID:(id)a3
{
}

- (void)setHealthPairingUUID:(id)a3
{
}

- (void)setChangeSet:(id)a3
{
}

- (void)setStatus:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_persistentPairingUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_healthPairingUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_changeSet)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_activationRestore)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_entityVersionMap)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_currentSyncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyPersistentUserInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(HDCodableNanoSyncActivationRestore *)self->_activationRestore addToPersistentUserInfo:v3];
  [(HDCodableNanoSyncStatus *)self->_status addToPersistentUserInfo:v3];
  [(HDCodableNanoSyncChangeSet *)self->_changeSet addToPersistentUserInfo:v3];
  return v3;
}

+ (id)messageFromPersistentUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(HDCodableNanoSyncMessage);
  id v5 = +[HDCodableNanoSyncActivationRestore retreiveFromPersistentUserInfo:v3];
  [(HDCodableNanoSyncMessage *)v4 setActivationRestore:v5];

  v6 = +[HDCodableNanoSyncChangeSet retreiveFromPersistentUserInfo:v3];
  [(HDCodableNanoSyncMessage *)v4 setChangeSet:v6];

  v7 = +[HDCodableNanoSyncStatus retreiveFromPersistentUserInfo:v3];

  [(HDCodableNanoSyncMessage *)v4 setStatus:v7];

  return v4;
}

- (void)setActivationRestore:(id)a3
{
}

- (id)nanoSyncDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDCodableNanoSyncMessage_NanoSyncSupport__nanoSyncDescription__block_invoke;
  aBlock[3] = &unk_1E6302B50;
  id v9 = v3;
  id v4 = v3;
  id v5 = (void (**)(void *, HDCodableNanoSyncActivationRestore *))_Block_copy(aBlock);
  v5[2](v5, self->_activationRestore);
  v5[2](v5, (HDCodableNanoSyncActivationRestore *)self->_changeSet);
  v5[2](v5, (HDCodableNanoSyncActivationRestore *)self->_status);
  v6 = [v4 componentsJoinedByString:@", "];

  return v6;
}

void __64__HDCodableNanoSyncMessage_NanoSyncSupport__nanoSyncDescription__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = NSString;
    id v5 = [a2 nanoSyncDescription];
    id v4 = [v3 stringWithFormat:@"<%@>", v5];
    [v2 addObject:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_persistentPairingUUID, 0);
  objc_storeStrong((id *)&self->_healthPairingUUID, 0);
  objc_storeStrong((id *)&self->_entityVersionMap, 0);
  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);

  objc_storeStrong((id *)&self->_activationRestore, 0);
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (HDCodableNanoSyncStatus)status
{
  return self->_status;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)version
{
  return self->_version;
}

- (id)decodedPersistentPairingUUID
{
  if (self->_persistentPairingUUID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)decodedHealthPairingUUID
{
  if (self->_healthPairingUUID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (HDCodableNanoSyncChangeSet)changeSet
{
  return self->_changeSet;
}

+ (id)messageWithSyncStore:(id)a3 profile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setVersion:", objc_msgSend(v7, "protocolVersion"));
  id v9 = [v7 persistentUUID];
  v10 = objc_msgSend(v9, "hk_dataForUUIDBytes");
  [v8 setPersistentPairingUUID:v10];

  uint64_t v11 = [v7 healthUUID];
  v12 = objc_msgSend((id)v11, "hk_dataForUUIDBytes");
  [v8 setHealthPairingUUID:v12];

  LOBYTE(v11) = [v7 isMaster];
  if ((v11 & 1) == 0)
  {
    v13 = [v6 daemon];
    v14 = [v13 behavior];
    char v15 = [v14 tinkerModeEnabled];

    if ((v15 & 1) == 0)
    {
      v16 = [v6 syncIdentityManager];
      v17 = [v16 currentSyncIdentity];
      v18 = [v17 identity];
      v19 = [v18 codableSyncIdentity];
      [v8 setCurrentSyncIdentity:v19];
    }
  }

  return v8;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPersistentPairingUUID
{
  return self->_persistentPairingUUID != 0;
}

- (BOOL)hasHealthPairingUUID
{
  return self->_healthPairingUUID != 0;
}

- (BOOL)hasChangeSet
{
  return self->_changeSet != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasActivationRestore
{
  return self->_activationRestore != 0;
}

- (BOOL)hasEntityVersionMap
{
  return self->_entityVersionMap != 0;
}

- (BOOL)hasCurrentSyncIdentity
{
  return self->_currentSyncIdentity != 0;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNanoSyncMessage;
  id v4 = [(HDCodableNanoSyncMessage *)&v8 description];
  id v5 = [(HDCodableNanoSyncMessage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  persistentPairingUUID = self->_persistentPairingUUID;
  if (persistentPairingUUID) {
    [v3 setObject:persistentPairingUUID forKey:@"persistentPairingUUID"];
  }
  healthPairingUUID = self->_healthPairingUUID;
  if (healthPairingUUID) {
    [v3 setObject:healthPairingUUID forKey:@"healthPairingUUID"];
  }
  changeSet = self->_changeSet;
  if (changeSet)
  {
    objc_super v8 = [(HDCodableNanoSyncChangeSet *)changeSet dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"changeSet"];
  }
  status = self->_status;
  if (status)
  {
    v10 = [(HDCodableNanoSyncStatus *)status dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"status"];
  }
  activationRestore = self->_activationRestore;
  if (activationRestore)
  {
    v12 = [(HDCodableNanoSyncActivationRestore *)activationRestore dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"activationRestore"];
  }
  entityVersionMap = self->_entityVersionMap;
  if (entityVersionMap)
  {
    v14 = [(HDCodableSyncEntityVersionMap *)entityVersionMap dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"entityVersionMap"];
  }
  currentSyncIdentity = self->_currentSyncIdentity;
  if (currentSyncIdentity)
  {
    v16 = [(HDCodableSyncIdentity *)currentSyncIdentity dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"currentSyncIdentity"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_version;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  id v5 = v4;
  if (self->_persistentPairingUUID)
  {
    objc_msgSend(v4, "setPersistentPairingUUID:");
    id v4 = v5;
  }
  if (self->_healthPairingUUID)
  {
    objc_msgSend(v5, "setHealthPairingUUID:");
    id v4 = v5;
  }
  if (self->_changeSet)
  {
    objc_msgSend(v5, "setChangeSet:");
    id v4 = v5;
  }
  if (self->_status)
  {
    objc_msgSend(v5, "setStatus:");
    id v4 = v5;
  }
  if (self->_activationRestore)
  {
    objc_msgSend(v5, "setActivationRestore:");
    id v4 = v5;
  }
  if (self->_entityVersionMap)
  {
    objc_msgSend(v5, "setEntityVersionMap:");
    id v4 = v5;
  }
  if (self->_currentSyncIdentity)
  {
    objc_msgSend(v5, "setCurrentSyncIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 64) = self->_version;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_persistentPairingUUID copyWithZone:a3];
  objc_super v8 = (void *)v6[6];
  v6[6] = v7;

  uint64_t v9 = [(NSData *)self->_healthPairingUUID copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(HDCodableNanoSyncChangeSet *)self->_changeSet copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(HDCodableNanoSyncStatus *)self->_status copyWithZone:a3];
  v14 = (void *)v6[7];
  v6[7] = v13;

  id v15 = [(HDCodableNanoSyncActivationRestore *)self->_activationRestore copyWithZone:a3];
  v16 = (void *)v6[1];
  v6[1] = v15;

  id v17 = [(HDCodableSyncEntityVersionMap *)self->_entityVersionMap copyWithZone:a3];
  v18 = (void *)v6[4];
  v6[4] = v17;

  id v19 = [(HDCodableSyncIdentity *)self->_currentSyncIdentity copyWithZone:a3];
  v20 = (void *)v6[3];
  v6[3] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_version != *((_DWORD *)v4 + 16)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  persistentPairingUUID = self->_persistentPairingUUID;
  if ((unint64_t)persistentPairingUUID | *((void *)v4 + 6)
    && !-[NSData isEqual:](persistentPairingUUID, "isEqual:"))
  {
    goto LABEL_21;
  }
  healthPairingUUID = self->_healthPairingUUID;
  if ((unint64_t)healthPairingUUID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](healthPairingUUID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  changeSet = self->_changeSet;
  if ((unint64_t)changeSet | *((void *)v4 + 2))
  {
    if (!-[HDCodableNanoSyncChangeSet isEqual:](changeSet, "isEqual:")) {
      goto LABEL_21;
    }
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 7))
  {
    if (!-[HDCodableNanoSyncStatus isEqual:](status, "isEqual:")) {
      goto LABEL_21;
    }
  }
  activationRestore = self->_activationRestore;
  if ((unint64_t)activationRestore | *((void *)v4 + 1))
  {
    if (!-[HDCodableNanoSyncActivationRestore isEqual:](activationRestore, "isEqual:")) {
      goto LABEL_21;
    }
  }
  entityVersionMap = self->_entityVersionMap;
  if ((unint64_t)entityVersionMap | *((void *)v4 + 4))
  {
    if (!-[HDCodableSyncEntityVersionMap isEqual:](entityVersionMap, "isEqual:")) {
      goto LABEL_21;
    }
  }
  currentSyncIdentity = self->_currentSyncIdentity;
  if ((unint64_t)currentSyncIdentity | *((void *)v4 + 3)) {
    char v12 = -[HDCodableSyncIdentity isEqual:](currentSyncIdentity, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_persistentPairingUUID hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_healthPairingUUID hash];
  unint64_t v6 = v4 ^ v5 ^ [(HDCodableNanoSyncChangeSet *)self->_changeSet hash];
  unint64_t v7 = [(HDCodableNanoSyncStatus *)self->_status hash];
  unint64_t v8 = v7 ^ [(HDCodableNanoSyncActivationRestore *)self->_activationRestore hash];
  unint64_t v9 = v6 ^ v8 ^ [(HDCodableSyncEntityVersionMap *)self->_entityVersionMap hash];
  return v9 ^ [(HDCodableSyncIdentity *)self->_currentSyncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 68))
  {
    self->_version = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  v16 = v4;
  if (*((void *)v4 + 6))
  {
    -[HDCodableNanoSyncMessage setPersistentPairingUUID:](self, "setPersistentPairingUUID:");
    uint64_t v5 = v16;
  }
  if (v5[5])
  {
    -[HDCodableNanoSyncMessage setHealthPairingUUID:](self, "setHealthPairingUUID:");
    uint64_t v5 = v16;
  }
  changeSet = self->_changeSet;
  uint64_t v7 = v5[2];
  if (changeSet)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[HDCodableNanoSyncChangeSet mergeFrom:](changeSet, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[HDCodableNanoSyncMessage setChangeSet:](self, "setChangeSet:");
  }
  uint64_t v5 = v16;
LABEL_13:
  status = self->_status;
  uint64_t v9 = v5[7];
  if (status)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[HDCodableNanoSyncStatus mergeFrom:](status, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[HDCodableNanoSyncMessage setStatus:](self, "setStatus:");
  }
  uint64_t v5 = v16;
LABEL_19:
  activationRestore = self->_activationRestore;
  uint64_t v11 = v5[1];
  if (activationRestore)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[HDCodableNanoSyncActivationRestore mergeFrom:](activationRestore, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[HDCodableNanoSyncMessage setActivationRestore:](self, "setActivationRestore:");
  }
  uint64_t v5 = v16;
LABEL_25:
  entityVersionMap = self->_entityVersionMap;
  uint64_t v13 = v5[4];
  if (entityVersionMap)
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[HDCodableSyncEntityVersionMap mergeFrom:](entityVersionMap, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[HDCodableNanoSyncMessage setEntityVersionMap:](self, "setEntityVersionMap:");
  }
  uint64_t v5 = v16;
LABEL_31:
  currentSyncIdentity = self->_currentSyncIdentity;
  uint64_t v15 = v5[3];
  if (currentSyncIdentity)
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[HDCodableSyncIdentity mergeFrom:](currentSyncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[HDCodableNanoSyncMessage setCurrentSyncIdentity:](self, "setCurrentSyncIdentity:");
  }
  uint64_t v5 = v16;
LABEL_37:
}

- (NSData)persistentPairingUUID
{
  return self->_persistentPairingUUID;
}

- (NSData)healthPairingUUID
{
  return self->_healthPairingUUID;
}

- (HDCodableNanoSyncActivationRestore)activationRestore
{
  return self->_activationRestore;
}

- (HDCodableSyncEntityVersionMap)entityVersionMap
{
  return self->_entityVersionMap;
}

- (void)setEntityVersionMap:(id)a3
{
}

- (HDCodableSyncIdentity)currentSyncIdentity
{
  return self->_currentSyncIdentity;
}

- (void)setCurrentSyncIdentity:(id)a3
{
}

@end