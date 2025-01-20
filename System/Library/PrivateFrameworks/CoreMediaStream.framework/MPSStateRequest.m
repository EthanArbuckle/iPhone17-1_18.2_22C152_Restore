@interface MPSStateRequest
- (BOOL)hasBackupDeviceID;
- (BOOL)hasBackupDeviceUDID;
- (BOOL)hasBackupDeviceUUID;
- (BOOL)hasICPLDeviceID;
- (BOOL)hasMPSDeviceID;
- (BOOL)hasOriginalLibrarySize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)backupDeviceID;
- (NSString)backupDeviceUDID;
- (NSString)backupDeviceUUID;
- (NSString)iCPLDeviceID;
- (NSString)mPSDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)originalLibrarySize;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackupDeviceID:(id)a3;
- (void)setBackupDeviceUDID:(id)a3;
- (void)setBackupDeviceUUID:(id)a3;
- (void)setHasOriginalLibrarySize:(BOOL)a3;
- (void)setICPLDeviceID:(id)a3;
- (void)setMPSDeviceID:(id)a3;
- (void)setOriginalLibrarySize:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPSStateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mPSDeviceID, 0);
  objc_storeStrong((id *)&self->_iCPLDeviceID, 0);
  objc_storeStrong((id *)&self->_backupDeviceUUID, 0);
  objc_storeStrong((id *)&self->_backupDeviceUDID, 0);
  objc_storeStrong((id *)&self->_backupDeviceID, 0);
}

- (int64_t)originalLibrarySize
{
  return self->_originalLibrarySize;
}

- (void)setBackupDeviceUDID:(id)a3
{
}

- (NSString)backupDeviceUDID
{
  return self->_backupDeviceUDID;
}

- (void)setBackupDeviceUUID:(id)a3
{
}

- (NSString)backupDeviceUUID
{
  return self->_backupDeviceUUID;
}

- (void)setBackupDeviceID:(id)a3
{
}

- (NSString)backupDeviceID
{
  return self->_backupDeviceID;
}

- (void)setICPLDeviceID:(id)a3
{
}

- (NSString)iCPLDeviceID
{
  return self->_iCPLDeviceID;
}

- (void)setMPSDeviceID:(id)a3
{
}

- (NSString)mPSDeviceID
{
  return self->_mPSDeviceID;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[6])
  {
    -[MPSStateRequest setMPSDeviceID:](self, "setMPSDeviceID:");
    v4 = v5;
  }
  if (v4[5])
  {
    -[MPSStateRequest setICPLDeviceID:](self, "setICPLDeviceID:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[MPSStateRequest setBackupDeviceID:](self, "setBackupDeviceID:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[MPSStateRequest setBackupDeviceUUID:](self, "setBackupDeviceUUID:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[MPSStateRequest setBackupDeviceUDID:](self, "setBackupDeviceUDID:");
    v4 = v5;
  }
  if (v4[7])
  {
    self->_originalLibrarySize = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mPSDeviceID hash];
  NSUInteger v4 = [(NSString *)self->_iCPLDeviceID hash];
  NSUInteger v5 = [(NSString *)self->_backupDeviceID hash];
  NSUInteger v6 = [(NSString *)self->_backupDeviceUUID hash];
  NSUInteger v7 = [(NSString *)self->_backupDeviceUDID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_originalLibrarySize;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  mPSDeviceID = self->_mPSDeviceID;
  if ((unint64_t)mPSDeviceID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](mPSDeviceID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  iCPLDeviceID = self->_iCPLDeviceID;
  if ((unint64_t)iCPLDeviceID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](iCPLDeviceID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  backupDeviceID = self->_backupDeviceID;
  if ((unint64_t)backupDeviceID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](backupDeviceID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  backupDeviceUUID = self->_backupDeviceUUID;
  if ((unint64_t)backupDeviceUUID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](backupDeviceUUID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  backupDeviceUDID = self->_backupDeviceUDID;
  if ((unint64_t)backupDeviceUDID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](backupDeviceUDID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_originalLibrarySize == *((void *)v4 + 1))
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mPSDeviceID copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_iCPLDeviceID copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_backupDeviceID copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_backupDeviceUUID copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_backupDeviceUDID copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_originalLibrarySize;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mPSDeviceID)
  {
    objc_msgSend(v4, "setMPSDeviceID:");
    id v4 = v5;
  }
  if (self->_iCPLDeviceID)
  {
    objc_msgSend(v5, "setICPLDeviceID:");
    id v4 = v5;
  }
  if (self->_backupDeviceID)
  {
    objc_msgSend(v5, "setBackupDeviceID:");
    id v4 = v5;
  }
  if (self->_backupDeviceUUID)
  {
    objc_msgSend(v5, "setBackupDeviceUUID:");
    id v4 = v5;
  }
  if (self->_backupDeviceUDID)
  {
    objc_msgSend(v5, "setBackupDeviceUDID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_originalLibrarySize;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mPSDeviceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_iCPLDeviceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_backupDeviceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_backupDeviceUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_backupDeviceUDID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPSStateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  mPSDeviceID = self->_mPSDeviceID;
  if (mPSDeviceID) {
    [v3 setObject:mPSDeviceID forKey:@"MPSDeviceID"];
  }
  iCPLDeviceID = self->_iCPLDeviceID;
  if (iCPLDeviceID) {
    [v4 setObject:iCPLDeviceID forKey:@"iCPLDeviceID"];
  }
  backupDeviceID = self->_backupDeviceID;
  if (backupDeviceID) {
    [v4 setObject:backupDeviceID forKey:@"BackupDeviceID"];
  }
  backupDeviceUUID = self->_backupDeviceUUID;
  if (backupDeviceUUID) {
    [v4 setObject:backupDeviceUUID forKey:@"BackupDeviceUUID"];
  }
  backupDeviceUDID = self->_backupDeviceUDID;
  if (backupDeviceUDID) {
    [v4 setObject:backupDeviceUDID forKey:@"BackupDeviceUDID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v10 = [NSNumber numberWithLongLong:self->_originalLibrarySize];
    [v4 setObject:v10 forKey:@"OriginalLibrarySize"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPSStateRequest;
  id v4 = [(MPSStateRequest *)&v8 description];
  id v5 = [(MPSStateRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasOriginalLibrarySize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasOriginalLibrarySize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setOriginalLibrarySize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_originalLibrarySize = a3;
}

- (BOOL)hasBackupDeviceUDID
{
  return self->_backupDeviceUDID != 0;
}

- (BOOL)hasBackupDeviceUUID
{
  return self->_backupDeviceUUID != 0;
}

- (BOOL)hasBackupDeviceID
{
  return self->_backupDeviceID != 0;
}

- (BOOL)hasICPLDeviceID
{
  return self->_iCPLDeviceID != 0;
}

- (BOOL)hasMPSDeviceID
{
  return self->_mPSDeviceID != 0;
}

@end