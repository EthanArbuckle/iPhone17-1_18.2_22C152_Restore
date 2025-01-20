@interface EscrowPrerecord
+ (id)createPrerecordFromCandidate:(id)a3 storedCertificate:(id)a4 request:(id)a5 error:(id *)a6;
- (BOOL)hasBottleID;
- (BOOL)hasDsid;
- (BOOL)hasDuplicateEscrowBlob;
- (BOOL)hasEscrowBaseURL;
- (BOOL)hasEscrowBlob;
- (BOOL)hasEscrowedSPKI;
- (BOOL)hasICloudEnvironment;
- (BOOL)hasPasscodeGeneration;
- (BOOL)hasPassphraseType;
- (BOOL)hasSosBackupKeybagDigest;
- (BOOL)hasSosBackupKeybagPassword;
- (BOOL)hasSosPeerID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EscrowPrerecord)initWithCandidate:(id)a3 certificate:(id)a4 escrowBlob:(id)a5 passphraseType:(int)a6;
- (EscrowPrerecordPasscodeGeneration)passcodeGeneration;
- (NSData)duplicateEscrowBlob;
- (NSData)escrowBlob;
- (NSData)escrowedSPKI;
- (NSData)sosBackupKeybagDigest;
- (NSData)sosBackupKeybagPassword;
- (NSString)bottleID;
- (NSString)dsid;
- (NSString)escrowBaseURL;
- (NSString)iCloudEnvironment;
- (NSString)sosPeerID;
- (NSString)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)passphraseTypeAsString:(int)a3;
- (int)StringAsPassphraseType:(id)a3;
- (int)passphraseType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBottleID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setDuplicateEscrowBlob:(id)a3;
- (void)setEscrowBaseURL:(id)a3;
- (void)setEscrowBlob:(id)a3;
- (void)setEscrowedSPKI:(id)a3;
- (void)setHasPassphraseType:(BOOL)a3;
- (void)setICloudEnvironment:(id)a3;
- (void)setPasscodeGeneration:(id)a3;
- (void)setPassphraseType:(int)a3;
- (void)setSosBackupKeybagDigest:(id)a3;
- (void)setSosBackupKeybagPassword:(id)a3;
- (void)setSosPeerID:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EscrowPrerecord

- (BOOL)hasICloudEnvironment
{
  return self->_iCloudEnvironment != 0;
}

- (BOOL)hasEscrowBaseURL
{
  return self->_escrowBaseURL != 0;
}

- (BOOL)hasDsid
{
  return self->_dsid != 0;
}

- (BOOL)hasEscrowBlob
{
  return self->_escrowBlob != 0;
}

- (BOOL)hasSosPeerID
{
  return self->_sosPeerID != 0;
}

- (BOOL)hasSosBackupKeybagPassword
{
  return self->_sosBackupKeybagPassword != 0;
}

- (BOOL)hasSosBackupKeybagDigest
{
  return self->_sosBackupKeybagDigest != 0;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasBottleID
{
  return self->_bottleID != 0;
}

- (BOOL)hasEscrowedSPKI
{
  return self->_escrowedSPKI != 0;
}

- (int)passphraseType
{
  if (*(unsigned char *)&self->_has) {
    return self->_passphraseType;
  }
  else {
    return 0;
  }
}

- (void)setPassphraseType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_passphraseType = a3;
}

- (void)setHasPassphraseType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPassphraseType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)passphraseTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_100071C50[a3];
  }

  return v3;
}

- (int)StringAsPassphraseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FourDigitNumeric"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SixDigitNumeric"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Complex"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDuplicateEscrowBlob
{
  return self->_duplicateEscrowBlob != 0;
}

- (BOOL)hasPasscodeGeneration
{
  return self->_passcodeGeneration != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)EscrowPrerecord;
  id v3 = [(EscrowPrerecord *)&v7 description];
  int v4 = [(EscrowPrerecord *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  iCloudEnvironment = self->_iCloudEnvironment;
  if (iCloudEnvironment) {
    [v3 setObject:iCloudEnvironment forKey:@"iCloudEnvironment"];
  }
  escrowBaseURL = self->_escrowBaseURL;
  if (escrowBaseURL) {
    [v4 setObject:escrowBaseURL forKey:@"escrowBaseURL"];
  }
  dsid = self->_dsid;
  if (dsid) {
    [v4 setObject:dsid forKey:@"dsid"];
  }
  escrowBlob = self->_escrowBlob;
  if (escrowBlob) {
    [v4 setObject:escrowBlob forKey:@"escrowBlob"];
  }
  sosPeerID = self->_sosPeerID;
  if (sosPeerID) {
    [v4 setObject:sosPeerID forKey:@"sosPeerID"];
  }
  sosBackupKeybagPassword = self->_sosBackupKeybagPassword;
  if (sosBackupKeybagPassword) {
    [v4 setObject:sosBackupKeybagPassword forKey:@"sosBackupKeybagPassword"];
  }
  sosBackupKeybagDigest = self->_sosBackupKeybagDigest;
  if (sosBackupKeybagDigest) {
    [v4 setObject:sosBackupKeybagDigest forKey:@"sosBackupKeybagDigest"];
  }
  timestamp = self->_timestamp;
  if (timestamp) {
    [v4 setObject:timestamp forKey:@"timestamp"];
  }
  bottleID = self->_bottleID;
  if (bottleID) {
    [v4 setObject:bottleID forKey:@"bottleID"];
  }
  escrowedSPKI = self->_escrowedSPKI;
  if (escrowedSPKI) {
    [v4 setObject:escrowedSPKI forKey:@"escrowedSPKI"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t passphraseType = self->_passphraseType;
    if (passphraseType >= 4)
    {
      v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_passphraseType];
    }
    else
    {
      v16 = off_100071C50[passphraseType];
    }
    [v4 setObject:v16 forKey:@"passphraseType"];
  }
  duplicateEscrowBlob = self->_duplicateEscrowBlob;
  if (duplicateEscrowBlob) {
    [v4 setObject:duplicateEscrowBlob forKey:@"duplicateEscrowBlob"];
  }
  passcodeGeneration = self->_passcodeGeneration;
  if (passcodeGeneration)
  {
    v19 = [(EscrowPrerecordPasscodeGeneration *)passcodeGeneration dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"passcodeGeneration"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100037138((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iCloudEnvironment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_escrowBaseURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dsid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_escrowBlob)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sosPeerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sosBackupKeybagPassword)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sosBackupKeybagDigest)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_timestamp)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bottleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_escrowedSPKI)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_duplicateEscrowBlob)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_passcodeGeneration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iCloudEnvironment)
  {
    objc_msgSend(v4, "setICloudEnvironment:");
    id v4 = v5;
  }
  if (self->_escrowBaseURL)
  {
    objc_msgSend(v5, "setEscrowBaseURL:");
    id v4 = v5;
  }
  if (self->_dsid)
  {
    objc_msgSend(v5, "setDsid:");
    id v4 = v5;
  }
  if (self->_escrowBlob)
  {
    objc_msgSend(v5, "setEscrowBlob:");
    id v4 = v5;
  }
  if (self->_sosPeerID)
  {
    objc_msgSend(v5, "setSosPeerID:");
    id v4 = v5;
  }
  if (self->_sosBackupKeybagPassword)
  {
    objc_msgSend(v5, "setSosBackupKeybagPassword:");
    id v4 = v5;
  }
  if (self->_sosBackupKeybagDigest)
  {
    objc_msgSend(v5, "setSosBackupKeybagDigest:");
    id v4 = v5;
  }
  if (self->_timestamp)
  {
    objc_msgSend(v5, "setTimestamp:");
    id v4 = v5;
  }
  if (self->_bottleID)
  {
    objc_msgSend(v5, "setBottleID:");
    id v4 = v5;
  }
  if (self->_escrowedSPKI)
  {
    objc_msgSend(v5, "setEscrowedSPKI:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 18) = self->_passphraseType;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  if (self->_duplicateEscrowBlob)
  {
    objc_msgSend(v5, "setDuplicateEscrowBlob:");
    id v4 = v5;
  }
  if (self->_passcodeGeneration)
  {
    objc_msgSend(v5, "setPasscodeGeneration:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_iCloudEnvironment copyWithZone:a3];
  objc_super v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(NSString *)self->_escrowBaseURL copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_dsid copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(NSData *)self->_escrowBlob copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  id v14 = [(NSString *)self->_sosPeerID copyWithZone:a3];
  v15 = (void *)v5[12];
  v5[12] = v14;

  id v16 = [(NSData *)self->_sosBackupKeybagPassword copyWithZone:a3];
  v17 = (void *)v5[11];
  v5[11] = v16;

  id v18 = [(NSData *)self->_sosBackupKeybagDigest copyWithZone:a3];
  v19 = (void *)v5[10];
  v5[10] = v18;

  id v20 = [(NSString *)self->_timestamp copyWithZone:a3];
  v21 = (void *)v5[13];
  v5[13] = v20;

  id v22 = [(NSString *)self->_bottleID copyWithZone:a3];
  v23 = (void *)v5[1];
  v5[1] = v22;

  id v24 = [(NSData *)self->_escrowedSPKI copyWithZone:a3];
  v25 = (void *)v5[6];
  v5[6] = v24;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 18) = self->_passphraseType;
    *((unsigned char *)v5 + 112) |= 1u;
  }
  id v26 = [(NSData *)self->_duplicateEscrowBlob copyWithZone:a3];
  v27 = (void *)v5[3];
  v5[3] = v26;

  id v28 = [(EscrowPrerecordPasscodeGeneration *)self->_passcodeGeneration copyWithZone:a3];
  v29 = (void *)v5[8];
  v5[8] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  iCloudEnvironment = self->_iCloudEnvironment;
  if ((unint64_t)iCloudEnvironment | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](iCloudEnvironment, "isEqual:")) {
      goto LABEL_31;
    }
  }
  escrowBaseURL = self->_escrowBaseURL;
  if ((unint64_t)escrowBaseURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](escrowBaseURL, "isEqual:")) {
      goto LABEL_31;
    }
  }
  dsid = self->_dsid;
  if ((unint64_t)dsid | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](dsid, "isEqual:")) {
      goto LABEL_31;
    }
  }
  escrowBlob = self->_escrowBlob;
  if ((unint64_t)escrowBlob | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](escrowBlob, "isEqual:")) {
      goto LABEL_31;
    }
  }
  sosPeerID = self->_sosPeerID;
  if ((unint64_t)sosPeerID | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](sosPeerID, "isEqual:")) {
      goto LABEL_31;
    }
  }
  sosBackupKeybagPassword = self->_sosBackupKeybagPassword;
  if ((unint64_t)sosBackupKeybagPassword | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](sosBackupKeybagPassword, "isEqual:")) {
      goto LABEL_31;
    }
  }
  sosBackupKeybagDigest = self->_sosBackupKeybagDigest;
  if ((unint64_t)sosBackupKeybagDigest | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](sosBackupKeybagDigest, "isEqual:")) {
      goto LABEL_31;
    }
  }
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](timestamp, "isEqual:")) {
      goto LABEL_31;
    }
  }
  bottleID = self->_bottleID;
  if ((unint64_t)bottleID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bottleID, "isEqual:")) {
      goto LABEL_31;
    }
  }
  escrowedSPKI = self->_escrowedSPKI;
  if ((unint64_t)escrowedSPKI | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](escrowedSPKI, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_passphraseType != *((_DWORD *)v4 + 18)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
LABEL_31:
    unsigned __int8 v17 = 0;
    goto LABEL_32;
  }
  duplicateEscrowBlob = self->_duplicateEscrowBlob;
  if ((unint64_t)duplicateEscrowBlob | *((void *)v4 + 3)
    && !-[NSData isEqual:](duplicateEscrowBlob, "isEqual:"))
  {
    goto LABEL_31;
  }
  passcodeGeneration = self->_passcodeGeneration;
  if ((unint64_t)passcodeGeneration | *((void *)v4 + 8)) {
    unsigned __int8 v17 = -[EscrowPrerecordPasscodeGeneration isEqual:](passcodeGeneration, "isEqual:");
  }
  else {
    unsigned __int8 v17 = 1;
  }
LABEL_32:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_iCloudEnvironment hash];
  NSUInteger v4 = [(NSString *)self->_escrowBaseURL hash];
  NSUInteger v5 = [(NSString *)self->_dsid hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_escrowBlob hash];
  NSUInteger v7 = [(NSString *)self->_sosPeerID hash];
  unint64_t v8 = (unint64_t)[(NSData *)self->_sosBackupKeybagPassword hash];
  unint64_t v9 = (unint64_t)[(NSData *)self->_sosBackupKeybagDigest hash];
  NSUInteger v10 = [(NSString *)self->_timestamp hash];
  NSUInteger v11 = [(NSString *)self->_bottleID hash];
  unint64_t v12 = (unint64_t)[(NSData *)self->_escrowedSPKI hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v13 = 2654435761 * self->_passphraseType;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  unint64_t v15 = (unint64_t)[(NSData *)self->_duplicateEscrowBlob hash];
  return v14 ^ v15 ^ [(EscrowPrerecordPasscodeGeneration *)self->_passcodeGeneration hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  NSUInteger v7 = v4;
  if (*((void *)v4 + 7))
  {
    -[EscrowPrerecord setICloudEnvironment:](self, "setICloudEnvironment:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[EscrowPrerecord setEscrowBaseURL:](self, "setEscrowBaseURL:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[EscrowPrerecord setDsid:](self, "setDsid:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[EscrowPrerecord setEscrowBlob:](self, "setEscrowBlob:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 12))
  {
    -[EscrowPrerecord setSosPeerID:](self, "setSosPeerID:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[EscrowPrerecord setSosBackupKeybagPassword:](self, "setSosBackupKeybagPassword:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[EscrowPrerecord setSosBackupKeybagDigest:](self, "setSosBackupKeybagDigest:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[EscrowPrerecord setTimestamp:](self, "setTimestamp:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[EscrowPrerecord setBottleID:](self, "setBottleID:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[EscrowPrerecord setEscrowedSPKI:](self, "setEscrowedSPKI:");
    NSUInteger v4 = v7;
  }
  if (v4[28])
  {
    self->_uint64_t passphraseType = v4[18];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[EscrowPrerecord setDuplicateEscrowBlob:](self, "setDuplicateEscrowBlob:");
    NSUInteger v4 = v7;
  }
  passcodeGeneration = self->_passcodeGeneration;
  uint64_t v6 = *((void *)v4 + 8);
  if (passcodeGeneration)
  {
    if (v6) {
      -[EscrowPrerecordPasscodeGeneration mergeFrom:](passcodeGeneration, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[EscrowPrerecord setPasscodeGeneration:](self, "setPasscodeGeneration:");
  }

  _objc_release_x1();
}

- (NSString)iCloudEnvironment
{
  return self->_iCloudEnvironment;
}

- (void)setICloudEnvironment:(id)a3
{
}

- (NSString)escrowBaseURL
{
  return self->_escrowBaseURL;
}

- (void)setEscrowBaseURL:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSData)escrowBlob
{
  return self->_escrowBlob;
}

- (void)setEscrowBlob:(id)a3
{
}

- (NSString)sosPeerID
{
  return self->_sosPeerID;
}

- (void)setSosPeerID:(id)a3
{
}

- (NSData)sosBackupKeybagPassword
{
  return self->_sosBackupKeybagPassword;
}

- (void)setSosBackupKeybagPassword:(id)a3
{
}

- (NSData)sosBackupKeybagDigest
{
  return self->_sosBackupKeybagDigest;
}

- (void)setSosBackupKeybagDigest:(id)a3
{
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)bottleID
{
  return self->_bottleID;
}

- (void)setBottleID:(id)a3
{
}

- (NSData)escrowedSPKI
{
  return self->_escrowedSPKI;
}

- (void)setEscrowedSPKI:(id)a3
{
}

- (NSData)duplicateEscrowBlob
{
  return self->_duplicateEscrowBlob;
}

- (void)setDuplicateEscrowBlob:(id)a3
{
}

- (EscrowPrerecordPasscodeGeneration)passcodeGeneration
{
  return self->_passcodeGeneration;
}

- (void)setPasscodeGeneration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sosPeerID, 0);
  objc_storeStrong((id *)&self->_sosBackupKeybagPassword, 0);
  objc_storeStrong((id *)&self->_sosBackupKeybagDigest, 0);
  objc_storeStrong((id *)&self->_passcodeGeneration, 0);
  objc_storeStrong((id *)&self->_iCloudEnvironment, 0);
  objc_storeStrong((id *)&self->_escrowedSPKI, 0);
  objc_storeStrong((id *)&self->_escrowBlob, 0);
  objc_storeStrong((id *)&self->_escrowBaseURL, 0);
  objc_storeStrong((id *)&self->_duplicateEscrowBlob, 0);
  objc_storeStrong((id *)&self->_dsid, 0);

  objc_storeStrong((id *)&self->_bottleID, 0);
}

- (EscrowPrerecord)initWithCandidate:(id)a3 certificate:(id)a4 escrowBlob:(id)a5 passphraseType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)EscrowPrerecord;
  uint64_t v13 = [(EscrowPrerecord *)&v33 init];
  if (v13)
  {
    uint64_t v14 = [v10 sosPeerID];
    sosPeerID = v13->_sosPeerID;
    v13->_sosPeerID = (NSString *)v14;

    uint64_t v16 = [v10 sosBackupKeybagPassword];
    sosBackupKeybagPassword = v13->_sosBackupKeybagPassword;
    v13->_sosBackupKeybagPassword = (NSData *)v16;

    uint64_t v18 = [v10 sosBackupKeybagDigest];
    sosBackupKeybagDigest = v13->_sosBackupKeybagDigest;
    v13->_sosBackupKeybagDigest = (NSData *)v18;

    uint64_t v20 = [v10 timestamp];
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSString *)v20;

    uint64_t v22 = [v10 bottleID];
    bottleID = v13->_bottleID;
    v13->_bottleID = (NSString *)v22;

    uint64_t v24 = [v10 escrowedSPKI];
    escrowedSPKI = v13->_escrowedSPKI;
    v13->_escrowedSPKI = (NSData *)v24;

    objc_storeStrong((id *)&v13->_escrowBlob, a5);
    uint64_t v26 = [v11 dsid];
    dsid = v13->_dsid;
    v13->_dsid = (NSString *)v26;

    uint64_t v28 = [v11 iCloudEnvironment];
    iCloudEnvironment = v13->_iCloudEnvironment;
    v13->_iCloudEnvironment = (NSString *)v28;

    uint64_t v30 = [v11 escrowBaseURL];
    escrowBaseURL = v13->_escrowBaseURL;
    v13->_escrowBaseURL = (NSString *)v30;

    [(EscrowPrerecord *)v13 setPassphraseType:v6];
  }

  return v13;
}

+ (id)createPrerecordFromCandidate:(id)a3 storedCertificate:(id)a4 request:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 recordContents];
  [v11 setEscrowRecord:v12];

  uint64_t v13 = [v9 sosPeerID];
  [v11 setRecordID:v13];

  uint64_t v14 = [[EscrowEnrollmentRequest alloc] initWithRequest:v11];
  unint64_t v15 = [(EscrowGenericRequest *)v14 recoveryPassphrase];
  id v16 = [v15 length];

  if (v16)
  {
    unsigned __int8 v17 = [v10 escrowCertificate];
    uint64_t v18 = +[EscrowService createEscrowBlobWithCertificate:v17 escrowRequest:v14 error:a6];

    if ([v11 requiresDoubleEnrollment])
    {
      v19 = [v10 duplicateEscrowCertificate];

      uint64_t v20 = CloudServicesLog();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "double enrollment: creating duplicate escrow blob for prerecord", buf, 2u);
        }

        [(EscrowGenericRequest *)v14 setDuplicate:1];
        uint64_t v22 = [v10 duplicateEscrowCertificate];
        id v41 = 0;
        v23 = +[EscrowService createEscrowBlobWithCertificate:v22 escrowRequest:v14 error:&v41];
        uint64_t v20 = v41;

        uint64_t v24 = +[CloudServicesAnalytics logger];
        [v24 logResultForEvent:CloudServicesAnalyticsDoubleCreateBlob hardFailure:1 result:v20];

        if (!v23)
        {
          v25 = CloudServicesLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43[0] = v20;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "double enrollment: failed to create duplicate escrow blob: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "double enrollment: missing duplicate escrow certificate, not creating duplicate escrow blob for prerecord", buf, 2u);
        }
        v23 = 0;
      }

      if (!v18) {
        goto LABEL_24;
      }
    }
    else
    {
      v23 = 0;
      if (!v18)
      {
LABEL_24:
        v35 = CloudServicesLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_10004E344((const __CFString **)a6, v35);
        }

        v27 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    uint64_t v28 = [v11 metadata];
    v29 = [v28 objectForKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
    unsigned int v30 = [v29 BOOLValue];

    if (v30)
    {
      v31 = [v11 metadata];
      v32 = [v31 objectForKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
      id v33 = [v32 unsignedIntegerValue];

      if (v33 == (id)4)
      {
        uint64_t v34 = 1;
        goto LABEL_32;
      }
      if (v33 == (id)6)
      {
        uint64_t v34 = 2;
LABEL_32:
        v37 = CloudServicesLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = [v11 metadata];
          *(_DWORD *)buf = 67109378;
          LODWORD(v43[0]) = v34;
          WORD2(v43[0]) = 2112;
          *(void *)((char *)v43 + 6) = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "createPrerecordFromCandidate: Successfully made an escrow blob: type: %d metadata: %@", buf, 0x12u);
        }
        v39 = [[EscrowPrerecord alloc] initWithCandidate:v9 certificate:v10 escrowBlob:v18 passphraseType:v34];
        v27 = v39;
        if (v23) {
          [(EscrowPrerecord *)v39 setDuplicateEscrowBlob:v23];
        }
        goto LABEL_36;
      }
      v36 = CloudServicesLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Unknown numeric length of passcode?", buf, 2u);
      }
    }
    uint64_t v34 = 3;
    goto LABEL_32;
  }
  uint64_t v26 = CloudServicesLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_10004E300(v26);
  }

  if (a6)
  {
    +[CloudServicesError errorWithCode:22 error:0 format:@"Missing required parameters"];
    v27 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
LABEL_37:

  return v27;
}

@end