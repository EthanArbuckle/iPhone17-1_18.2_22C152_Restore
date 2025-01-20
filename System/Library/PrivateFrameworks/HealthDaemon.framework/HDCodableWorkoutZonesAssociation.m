@interface HDCodableWorkoutZonesAssociation
- (BOOL)hasSyncIdentity;
- (BOOL)hasWorkoutUUID;
- (BOOL)hasZonesSampleUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)workoutUUID;
- (NSData)zonesSampleUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setWorkoutUUID:(id)a3;
- (void)setZonesSampleUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutZonesAssociation

- (BOOL)hasWorkoutUUID
{
  return self->_workoutUUID != 0;
}

- (BOOL)hasZonesSampleUUID
{
  return self->_zonesSampleUUID != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutZonesAssociation;
  v4 = [(HDCodableWorkoutZonesAssociation *)&v8 description];
  v5 = [(HDCodableWorkoutZonesAssociation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  workoutUUID = self->_workoutUUID;
  if (workoutUUID) {
    [v3 setObject:workoutUUID forKey:@"workoutUUID"];
  }
  zonesSampleUUID = self->_zonesSampleUUID;
  if (zonesSampleUUID) {
    [v4 setObject:zonesSampleUUID forKey:@"zonesSampleUUID"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    objc_super v8 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutZonesAssociationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_workoutUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_zonesSampleUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_workoutUUID)
  {
    objc_msgSend(v4, "setWorkoutUUID:");
    id v4 = v5;
  }
  if (self->_zonesSampleUUID)
  {
    objc_msgSend(v5, "setZonesSampleUUID:");
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_workoutUUID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_zonesSampleUUID copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((workoutUUID = self->_workoutUUID, !((unint64_t)workoutUUID | v4[2]))
     || -[NSData isEqual:](workoutUUID, "isEqual:"))
    && ((zonesSampleUUID = self->_zonesSampleUUID, !((unint64_t)zonesSampleUUID | v4[3]))
     || -[NSData isEqual:](zonesSampleUUID, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[1]) {
      char v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_workoutUUID hash];
  uint64_t v4 = [(NSData *)self->_zonesSampleUUID hash] ^ v3;
  return v4 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    [(HDCodableWorkoutZonesAssociation *)self setWorkoutUUID:"setWorkoutUUID:"];
    uint64_t v4 = v7;
  }
  if (v4[3])
  {
    -[HDCodableWorkoutZonesAssociation setZonesSampleUUID:](self, "setZonesSampleUUID:");
    uint64_t v4 = v7;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v6 = v4[1];
  if (syncIdentity)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableWorkoutZonesAssociation setSyncIdentity:](self, "setSyncIdentity:");
  }
  uint64_t v4 = v7;
LABEL_11:
}

- (NSData)workoutUUID
{
  return self->_workoutUUID;
}

- (void)setWorkoutUUID:(id)a3
{
}

- (NSData)zonesSampleUUID
{
  return self->_zonesSampleUUID;
}

- (void)setZonesSampleUUID:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonesSampleUUID, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_storeStrong((id *)&self->_syncIdentity, 0);
}

@end