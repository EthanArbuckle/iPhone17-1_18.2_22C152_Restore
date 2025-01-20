@interface HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo
- (BOOL)hasAccessoryUUID;
- (BOOL)hasIdsDestination;
- (BOOL)hasIdsIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accessoryUUID;
- (NSString)idsDestination;
- (NSString)idsIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryUUID:(id)a3;
- (void)setIdsDestination:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (void)setIdsDestination:(id)a3
{
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSString)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[1]) {
    -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setAccessoryUUID:](self, "setAccessoryUUID:");
  }
  if (v4[3]) {
    -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setIdsIdentifier:](self, "setIdsIdentifier:");
  }
  if (v4[2]) {
    -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setIdsDestination:](self, "setIdsDestination:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accessoryUUID hash];
  NSUInteger v4 = [(NSString *)self->_idsIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_idsDestination hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((accessoryUUID = self->_accessoryUUID, !((unint64_t)accessoryUUID | v4[1]))
     || -[NSString isEqual:](accessoryUUID, "isEqual:"))
    && ((idsIdentifier = self->_idsIdentifier, !((unint64_t)idsIdentifier | v4[3]))
     || -[NSString isEqual:](idsIdentifier, "isEqual:")))
  {
    idsDestination = self->_idsDestination;
    if ((unint64_t)idsDestination | v4[2]) {
      char v8 = -[NSString isEqual:](idsDestination, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accessoryUUID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_idsIdentifier copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_idsDestination copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accessoryUUID)
  {
    objc_msgSend(v4, "setAccessoryUUID:");
    id v4 = v5;
  }
  if (self->_idsIdentifier)
  {
    objc_msgSend(v5, "setIdsIdentifier:");
    id v4 = v5;
  }
  if (self->_idsDestination)
  {
    objc_msgSend(v5, "setIdsDestination:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accessoryUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_idsIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_idsDestination)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  id v5 = (int *)MEMORY[0x263F62288];
  uint64_t v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v8 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = 24;
        goto LABEL_24;
      }
      if (v18 == 1)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = 8;
LABEL_24:
        v21 = *(Class *)((char *)&self->super.super.isa + v20);
        *(Class *)((char *)&self->super.super.isa + v20) = v19;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    PBReaderReadString();
    v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 16;
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  accessoryUUID = self->_accessoryUUID;
  if (accessoryUUID) {
    [v3 setObject:accessoryUUID forKey:@"accessoryUUID"];
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier) {
    [v4 setObject:idsIdentifier forKey:@"idsIdentifier"];
  }
  idsDestination = self->_idsDestination;
  if (idsDestination) {
    [v4 setObject:idsDestination forKey:@"idsDestination"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo;
  id v4 = [(HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo *)&v8 description];
  id v5 = [(HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIdsDestination
{
  return self->_idsDestination != 0;
}

- (BOOL)hasIdsIdentifier
{
  return self->_idsIdentifier != 0;
}

- (BOOL)hasAccessoryUUID
{
  return self->_accessoryUUID != 0;
}

@end