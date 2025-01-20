@interface HDCodableTinkerPairingRequest
- (BOOL)hasGuardianDSID;
- (BOOL)hasGuardianFirstName;
- (BOOL)hasGuardianIcloudIdentifier;
- (BOOL)hasGuardianLastName;
- (BOOL)hasProfileIdentifier;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasSetupType;
- (BOOL)hasTinkerFirstName;
- (BOOL)hasTinkerLastName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)profileIdentifier;
- (NSString)guardianFirstName;
- (NSString)guardianIcloudIdentifier;
- (NSString)guardianLastName;
- (NSString)requestIdentifier;
- (NSString)tinkerFirstName;
- (NSString)tinkerLastName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)setupTypeAsString:(int)a3;
- (int)StringAsSetupType:(id)a3;
- (int)setupType;
- (int64_t)guardianDSID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGuardianDSID:(int64_t)a3;
- (void)setGuardianFirstName:(id)a3;
- (void)setGuardianIcloudIdentifier:(id)a3;
- (void)setGuardianLastName:(id)a3;
- (void)setHasGuardianDSID:(BOOL)a3;
- (void)setHasSetupType:(BOOL)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSetupType:(int)a3;
- (void)setTinkerFirstName:(id)a3;
- (void)setTinkerLastName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableTinkerPairingRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasGuardianIcloudIdentifier
{
  return self->_guardianIcloudIdentifier != 0;
}

- (int)setupType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_setupType;
  }
  else {
    return 0;
  }
}

- (void)setSetupType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_setupType = a3;
}

- (void)setHasSetupType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSetupType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)setupTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"TinkerPairingMigrationSetup";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"TinkerPairingInitialSetup";
  }
  return v4;
}

- (int)StringAsSetupType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TinkerPairingInitialSetup"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TinkerPairingMigrationSetup"];
  }

  return v4;
}

- (BOOL)hasGuardianFirstName
{
  return self->_guardianFirstName != 0;
}

- (BOOL)hasGuardianLastName
{
  return self->_guardianLastName != 0;
}

- (void)setGuardianDSID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_guardianDSID = a3;
}

- (void)setHasGuardianDSID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGuardianDSID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasProfileIdentifier
{
  return self->_profileIdentifier != 0;
}

- (BOOL)hasTinkerFirstName
{
  return self->_tinkerFirstName != 0;
}

- (BOOL)hasTinkerLastName
{
  return self->_tinkerLastName != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableTinkerPairingRequest;
  int v4 = [(HDCodableTinkerPairingRequest *)&v8 description];
  v5 = [(HDCodableTinkerPairingRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v3 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  guardianIcloudIdentifier = self->_guardianIcloudIdentifier;
  if (guardianIcloudIdentifier) {
    [v4 setObject:guardianIcloudIdentifier forKey:@"guardianIcloudIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int setupType = self->_setupType;
    if (setupType)
    {
      if (setupType == 1)
      {
        objc_super v8 = @"TinkerPairingMigrationSetup";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_setupType);
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_super v8 = @"TinkerPairingInitialSetup";
    }
    [v4 setObject:v8 forKey:@"setupType"];
  }
  guardianFirstName = self->_guardianFirstName;
  if (guardianFirstName) {
    [v4 setObject:guardianFirstName forKey:@"guardianFirstName"];
  }
  guardianLastName = self->_guardianLastName;
  if (guardianLastName) {
    [v4 setObject:guardianLastName forKey:@"guardianLastName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithLongLong:self->_guardianDSID];
    [v4 setObject:v11 forKey:@"guardianDSID"];
  }
  profileIdentifier = self->_profileIdentifier;
  if (profileIdentifier) {
    [v4 setObject:profileIdentifier forKey:@"profileIdentifier"];
  }
  tinkerFirstName = self->_tinkerFirstName;
  if (tinkerFirstName) {
    [v4 setObject:tinkerFirstName forKey:@"tinkerFirstName"];
  }
  tinkerLastName = self->_tinkerLastName;
  if (tinkerLastName) {
    [v4 setObject:tinkerLastName forKey:@"tinkerLastName"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTinkerPairingRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_guardianIcloudIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_guardianFirstName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_guardianLastName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_profileIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_tinkerFirstName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_tinkerLastName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_guardianIcloudIdentifier)
  {
    objc_msgSend(v5, "setGuardianIcloudIdentifier:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_setupType;
    *((unsigned char *)v4 + 80) |= 2u;
  }
  if (self->_guardianFirstName)
  {
    objc_msgSend(v5, "setGuardianFirstName:");
    id v4 = v5;
  }
  if (self->_guardianLastName)
  {
    objc_msgSend(v5, "setGuardianLastName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_guardianDSID;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_profileIdentifier)
  {
    objc_msgSend(v5, "setProfileIdentifier:");
    id v4 = v5;
  }
  if (self->_tinkerFirstName)
  {
    objc_msgSend(v5, "setTinkerFirstName:");
    id v4 = v5;
  }
  if (self->_tinkerLastName)
  {
    objc_msgSend(v5, "setTinkerLastName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_guardianIcloudIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_setupType;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  uint64_t v10 = [(NSString *)self->_guardianFirstName copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_guardianLastName copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_guardianDSID;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v14 = [(NSData *)self->_profileIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSString *)self->_tinkerFirstName copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSString *)self->_tinkerLastName copyWithZone:a3];
  v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:")) {
      goto LABEL_26;
    }
  }
  guardianIcloudIdentifier = self->_guardianIcloudIdentifier;
  if ((unint64_t)guardianIcloudIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](guardianIcloudIdentifier, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_setupType != *((_DWORD *)v4 + 14)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_26:
    char v12 = 0;
    goto LABEL_27;
  }
  guardianFirstName = self->_guardianFirstName;
  if ((unint64_t)guardianFirstName | *((void *)v4 + 2)
    && !-[NSString isEqual:](guardianFirstName, "isEqual:"))
  {
    goto LABEL_26;
  }
  guardianLastName = self->_guardianLastName;
  if ((unint64_t)guardianLastName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](guardianLastName, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_guardianDSID != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_26;
  }
  profileIdentifier = self->_profileIdentifier;
  if ((unint64_t)profileIdentifier | *((void *)v4 + 5)
    && !-[NSData isEqual:](profileIdentifier, "isEqual:"))
  {
    goto LABEL_26;
  }
  tinkerFirstName = self->_tinkerFirstName;
  if ((unint64_t)tinkerFirstName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](tinkerFirstName, "isEqual:")) {
      goto LABEL_26;
    }
  }
  tinkerLastName = self->_tinkerLastName;
  if ((unint64_t)tinkerLastName | *((void *)v4 + 9)) {
    char v12 = -[NSString isEqual:](tinkerLastName, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_27:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_guardianIcloudIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_setupType;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_guardianFirstName hash];
  NSUInteger v7 = [(NSString *)self->_guardianLastName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_guardianDSID;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSData *)self->_profileIdentifier hash];
  NSUInteger v10 = [(NSString *)self->_tinkerFirstName hash];
  return v9 ^ v10 ^ [(NSString *)self->_tinkerLastName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 6))
  {
    -[HDCodableTinkerPairingRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableTinkerPairingRequest setGuardianIcloudIdentifier:](self, "setGuardianIcloudIdentifier:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    self->_int setupType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    -[HDCodableTinkerPairingRequest setGuardianFirstName:](self, "setGuardianFirstName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCodableTinkerPairingRequest setGuardianLastName:](self, "setGuardianLastName:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 80))
  {
    self->_guardianDSID = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCodableTinkerPairingRequest setProfileIdentifier:](self, "setProfileIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 8))
  {
    -[HDCodableTinkerPairingRequest setTinkerFirstName:](self, "setTinkerFirstName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 9))
  {
    -[HDCodableTinkerPairingRequest setTinkerLastName:](self, "setTinkerLastName:");
    id v4 = v5;
  }
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)guardianIcloudIdentifier
{
  return self->_guardianIcloudIdentifier;
}

- (void)setGuardianIcloudIdentifier:(id)a3
{
}

- (NSString)guardianFirstName
{
  return self->_guardianFirstName;
}

- (void)setGuardianFirstName:(id)a3
{
}

- (NSString)guardianLastName
{
  return self->_guardianLastName;
}

- (void)setGuardianLastName:(id)a3
{
}

- (int64_t)guardianDSID
{
  return self->_guardianDSID;
}

- (NSData)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)tinkerFirstName
{
  return self->_tinkerFirstName;
}

- (void)setTinkerFirstName:(id)a3
{
}

- (NSString)tinkerLastName
{
  return self->_tinkerLastName;
}

- (void)setTinkerLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinkerLastName, 0);
  objc_storeStrong((id *)&self->_tinkerFirstName, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_guardianLastName, 0);
  objc_storeStrong((id *)&self->_guardianIcloudIdentifier, 0);

  objc_storeStrong((id *)&self->_guardianFirstName, 0);
}

@end