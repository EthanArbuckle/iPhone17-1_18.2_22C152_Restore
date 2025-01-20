@interface CKCDPCodeServiceRequestRequestContext
- (BOOL)hasApplicationBundleId;
- (BOOL)hasClientInfo;
- (BOOL)hasContainerName;
- (BOOL)hasDatabaseEnvironment;
- (BOOL)hasDatabaseOwnerId;
- (BOOL)hasDatabaseType;
- (BOOL)hasDeviceId;
- (BOOL)hasDsid;
- (BOOL)hasOperationGroup;
- (BOOL)hasUserAgent;
- (BOOL)hasUserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCDPCodeServiceRequestDatabaseOwner)databaseOwnerId;
- (CKCDPCodeServiceRequestOperationGroup)operationGroup;
- (NSString)applicationBundleId;
- (NSString)clientInfo;
- (NSString)containerName;
- (NSString)deviceId;
- (NSString)userAgent;
- (NSString)userId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)databaseEnvironmentAsString:(int)a3;
- (id)databaseTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsDatabaseEnvironment:(id)a3;
- (int)StringAsDatabaseType:(id)a3;
- (int)databaseEnvironment;
- (int)databaseType;
- (unint64_t)dsid;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationBundleId:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setDatabaseEnvironment:(int)a3;
- (void)setDatabaseOwnerId:(id)a3;
- (void)setDatabaseType:(int)a3;
- (void)setDeviceId:(id)a3;
- (void)setDsid:(unint64_t)a3;
- (void)setHasDatabaseEnvironment:(BOOL)a3;
- (void)setHasDatabaseType:(BOOL)a3;
- (void)setHasDsid:(BOOL)a3;
- (void)setOperationGroup:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestRequestContext

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasContainerName
{
  return self->_containerName != 0;
}

- (int)databaseEnvironment
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_databaseEnvironment;
  }
  else {
    return 0;
  }
}

- (void)setDatabaseEnvironment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_databaseEnvironment = a3;
}

- (void)setHasDatabaseEnvironment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatabaseEnvironment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)databaseEnvironmentAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"production";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"sandbox";
  }
  return v4;
}

- (int)StringAsDatabaseEnvironment:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"sandbox")) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v5, @"production");
  }

  return isEqualToString;
}

- (int)databaseType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_databaseType;
  }
  else {
    return 0;
  }
}

- (void)setDatabaseType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_databaseType = a3;
}

- (void)setHasDatabaseType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDatabaseType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)databaseTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F8BA8[a3];
  }
  return v3;
}

- (int)StringAsDatabaseType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"privateDatabase"))
  {
    int v6 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"publicDatabase"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"sharedDatabase"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"orgDatabase"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"teamDatabase"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"gameDatabase"))
  {
    int v6 = 5;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)hasDeviceId
{
  return self->_deviceId != 0;
}

- (BOOL)hasApplicationBundleId
{
  return self->_applicationBundleId != 0;
}

- (BOOL)hasClientInfo
{
  return self->_clientInfo != 0;
}

- (void)setDsid:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dsid = a3;
}

- (void)setHasDsid:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDsid
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (BOOL)hasOperationGroup
{
  return self->_operationGroup != 0;
}

- (BOOL)hasDatabaseOwnerId
{
  return self->_databaseOwnerId != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestRequestContext;
  v4 = [(CKCDPCodeServiceRequestRequestContext *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  userId = self->_userId;
  if (userId) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)userId, @"userId");
  }
  containerName = self->_containerName;
  if (containerName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)containerName, @"containerName");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int databaseEnvironment = self->_databaseEnvironment;
    if (databaseEnvironment)
    {
      if (databaseEnvironment == 1)
      {
        objc_super v11 = @"production";
        objc_msgSend_setObject_forKey_(v6, v5, @"production", @"databaseEnvironment");
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_databaseEnvironment);
        objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"databaseEnvironment");
      }
    }
    else
    {
      objc_super v11 = @"sandbox";
      objc_msgSend_setObject_forKey_(v6, v5, @"sandbox", @"databaseEnvironment");
    }

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t databaseType = self->_databaseType;
    if (databaseType >= 6)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_databaseType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E64F8BA8[databaseType];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v14, @"databaseType");
  }
  deviceId = self->_deviceId;
  if (deviceId) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceId, @"deviceId");
  }
  applicationBundleId = self->_applicationBundleId;
  if (applicationBundleId) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationBundleId, @"applicationBundleId");
  }
  clientInfo = self->_clientInfo;
  if (clientInfo) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientInfo, @"clientInfo");
  }
  if (*(unsigned char *)&self->_has)
  {
    v18 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v5, self->_dsid);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"dsid");
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)userAgent, @"userAgent");
  }
  operationGroup = self->_operationGroup;
  if (operationGroup)
  {
    v22 = objc_msgSend_dictionaryRepresentation(operationGroup, v5, (uint64_t)userAgent);
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, @"operationGroup");
  }
  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    v25 = objc_msgSend_dictionaryRepresentation(databaseOwnerId, v5, (uint64_t)userAgent);
    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v25, @"databaseOwnerId");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C5036200((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_containerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_deviceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_applicationBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_clientInfo)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_operationGroup)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_databaseOwnerId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  userId = self->_userId;
  id v15 = v4;
  if (userId)
  {
    objc_msgSend_setUserId_(v4, v5, (uint64_t)userId);
    id v4 = v15;
  }
  containerName = self->_containerName;
  if (containerName)
  {
    objc_msgSend_setContainerName_(v15, v5, (uint64_t)containerName);
    id v4 = v15;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_databaseEnvironment;
    *((unsigned char *)v4 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_databaseType;
    *((unsigned char *)v4 + 96) |= 4u;
  }
  deviceId = self->_deviceId;
  if (deviceId)
  {
    objc_msgSend_setDeviceId_(v15, v5, (uint64_t)deviceId);
    id v4 = v15;
  }
  applicationBundleId = self->_applicationBundleId;
  if (applicationBundleId)
  {
    objc_msgSend_setApplicationBundleId_(v15, v5, (uint64_t)applicationBundleId);
    id v4 = v15;
  }
  clientInfo = self->_clientInfo;
  if (clientInfo)
  {
    objc_msgSend_setClientInfo_(v15, v5, (uint64_t)clientInfo);
    id v4 = v15;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_dsid;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  userAgent = self->_userAgent;
  if (userAgent)
  {
    objc_msgSend_setUserAgent_(v15, v5, (uint64_t)userAgent);
    id v4 = v15;
  }
  operationGroup = self->_operationGroup;
  if (operationGroup)
  {
    objc_msgSend_setOperationGroup_(v15, v5, (uint64_t)operationGroup);
    id v4 = v15;
  }
  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    objc_msgSend_setDatabaseOwnerId_(v15, v5, (uint64_t)databaseOwnerId);
    id v4 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_userId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_containerName, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v15;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_databaseEnvironment;
    *(unsigned char *)(v10 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_databaseType;
    *(unsigned char *)(v10 + 96) |= 4u;
  }
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_deviceId, v17, (uint64_t)a3);
  v20 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v19;

  uint64_t v22 = objc_msgSend_copyWithZone_(self->_applicationBundleId, v21, (uint64_t)a3);
  v23 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v22;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_clientInfo, v24, (uint64_t)a3);
  v26 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v25;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v10 + 8) = self->_dsid;
    *(unsigned char *)(v10 + 96) |= 1u;
  }
  uint64_t v28 = objc_msgSend_copyWithZone_(self->_userAgent, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 80);
  *(void *)(v10 + 80) = v28;

  uint64_t v31 = objc_msgSend_copyWithZone_(self->_operationGroup, v30, (uint64_t)a3);
  v32 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = v31;

  uint64_t v34 = objc_msgSend_copyWithZone_(self->_databaseOwnerId, v33, (uint64_t)a3);
  v35 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v34;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_33;
  }
  userId = self->_userId;
  uint64_t v9 = v4[11];
  if ((unint64_t)userId | v9)
  {
    if (!objc_msgSend_isEqual_(userId, v7, v9)) {
      goto LABEL_33;
    }
  }
  containerName = self->_containerName;
  uint64_t v11 = v4[4];
  if ((unint64_t)containerName | v11)
  {
    if (!objc_msgSend_isEqual_(containerName, v7, v11)) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0 || self->_databaseEnvironment != *((_DWORD *)v4 + 10)) {
      goto LABEL_33;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
LABEL_33:
    char isEqual = 0;
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0 || self->_databaseType != *((_DWORD *)v4 + 14)) {
      goto LABEL_33;
    }
  }
  else if ((v4[12] & 4) != 0)
  {
    goto LABEL_33;
  }
  deviceId = self->_deviceId;
  uint64_t v13 = v4[8];
  if ((unint64_t)deviceId | v13 && !objc_msgSend_isEqual_(deviceId, v7, v13)) {
    goto LABEL_33;
  }
  applicationBundleId = self->_applicationBundleId;
  uint64_t v15 = v4[2];
  if ((unint64_t)applicationBundleId | v15)
  {
    if (!objc_msgSend_isEqual_(applicationBundleId, v7, v15)) {
      goto LABEL_33;
    }
  }
  clientInfo = self->_clientInfo;
  uint64_t v17 = v4[3];
  if ((unint64_t)clientInfo | v17)
  {
    if (!objc_msgSend_isEqual_(clientInfo, v7, v17)) {
      goto LABEL_33;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0 || self->_dsid != v4[1]) {
      goto LABEL_33;
    }
  }
  else if (v4[12])
  {
    goto LABEL_33;
  }
  userAgent = self->_userAgent;
  uint64_t v19 = v4[10];
  if ((unint64_t)userAgent | v19 && !objc_msgSend_isEqual_(userAgent, v7, v19)) {
    goto LABEL_33;
  }
  operationGroup = self->_operationGroup;
  uint64_t v21 = v4[9];
  if ((unint64_t)operationGroup | v21)
  {
    if (!objc_msgSend_isEqual_(operationGroup, v7, v21)) {
      goto LABEL_33;
    }
  }
  databaseOwnerId = self->_databaseOwnerId;
  uint64_t v23 = v4[6];
  if ((unint64_t)databaseOwnerId | v23) {
    char isEqual = objc_msgSend_isEqual_(databaseOwnerId, v7, v23);
  }
  else {
    char isEqual = 1;
  }
LABEL_34:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_userId, a2, v2);
  uint64_t v9 = objc_msgSend_hash(self->_containerName, v5, v6);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_databaseEnvironment;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v11 = 2654435761 * self->_databaseType;
      goto LABEL_6;
    }
  }
  uint64_t v11 = 0;
LABEL_6:
  uint64_t v12 = objc_msgSend_hash(self->_deviceId, v7, v8);
  uint64_t v15 = objc_msgSend_hash(self->_applicationBundleId, v13, v14);
  uint64_t v18 = objc_msgSend_hash(self->_clientInfo, v16, v17);
  if (*(unsigned char *)&self->_has) {
    unint64_t v21 = 2654435761u * self->_dsid;
  }
  else {
    unint64_t v21 = 0;
  }
  unint64_t v22 = v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v15 ^ v18 ^ v21;
  uint64_t v23 = objc_msgSend_hash(self->_userAgent, v19, v20);
  uint64_t v26 = v23 ^ objc_msgSend_hash(self->_operationGroup, v24, v25);
  return v22 ^ v26 ^ objc_msgSend_hash(self->_databaseOwnerId, v27, v28);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 11);
  id v16 = v4;
  if (v5)
  {
    objc_msgSend_setUserId_(self, (const char *)v4, v5);
    id v4 = v16;
  }
  uint64_t v6 = *((void *)v4 + 4);
  if (v6)
  {
    objc_msgSend_setContainerName_(self, (const char *)v4, v6);
    id v4 = v16;
  }
  char v7 = *((unsigned char *)v4 + 96);
  if ((v7 & 2) != 0)
  {
    self->_int databaseEnvironment = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 96);
  }
  if ((v7 & 4) != 0)
  {
    self->_uint64_t databaseType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v8 = *((void *)v4 + 8);
  if (v8)
  {
    objc_msgSend_setDeviceId_(self, (const char *)v4, v8);
    id v4 = v16;
  }
  uint64_t v9 = *((void *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setApplicationBundleId_(self, (const char *)v4, v9);
    id v4 = v16;
  }
  uint64_t v10 = *((void *)v4 + 3);
  if (v10)
  {
    objc_msgSend_setClientInfo_(self, (const char *)v4, v10);
    id v4 = v16;
  }
  if (*((unsigned char *)v4 + 96))
  {
    self->_dsid = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v11 = *((void *)v4 + 10);
  if (v11)
  {
    objc_msgSend_setUserAgent_(self, (const char *)v4, v11);
    id v4 = v16;
  }
  operationGroup = self->_operationGroup;
  uint64_t v13 = *((void *)v4 + 9);
  if (operationGroup)
  {
    if (!v13) {
      goto LABEL_25;
    }
    objc_msgSend_mergeFrom_(operationGroup, (const char *)v4, v13);
  }
  else
  {
    if (!v13) {
      goto LABEL_25;
    }
    objc_msgSend_setOperationGroup_(self, (const char *)v4, v13);
  }
  id v4 = v16;
LABEL_25:
  databaseOwnerId = self->_databaseOwnerId;
  uint64_t v15 = *((void *)v4 + 6);
  if (databaseOwnerId)
  {
    if (v15) {
      objc_msgSend_mergeFrom_(databaseOwnerId, (const char *)v4, v15);
    }
  }
  else if (v15)
  {
    objc_msgSend_setDatabaseOwnerId_(self, (const char *)v4, v15);
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (void)setApplicationBundleId:(id)a3
{
}

- (NSString)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (CKCDPCodeServiceRequestOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (void)setOperationGroup:(id)a3
{
}

- (CKCDPCodeServiceRequestDatabaseOwner)databaseOwnerId
{
  return self->_databaseOwnerId;
}

- (void)setDatabaseOwnerId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_databaseOwnerId, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
}

@end