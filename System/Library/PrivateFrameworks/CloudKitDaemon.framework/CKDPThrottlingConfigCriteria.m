@interface CKDPThrottlingConfigCriteria
- (BOOL)hasBundleID;
- (BOOL)hasContainerEnvironment;
- (BOOL)hasContainerName;
- (BOOL)hasDatabaseType;
- (BOOL)hasInvernessFunctionName;
- (BOOL)hasInvernessServiceName;
- (BOOL)hasOperationGroupName;
- (BOOL)hasOperationType;
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (NSString)containerName;
- (NSString)invernessFunctionName;
- (NSString)invernessServiceName;
- (NSString)operationGroupName;
- (NSString)zoneName;
- (id)containerEnvironmentAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)databaseTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)operationTypeAsString:(int)a3;
- (int)StringAsContainerEnvironment:(id)a3;
- (int)StringAsDatabaseType:(id)a3;
- (int)StringAsOperationType:(id)a3;
- (int)containerEnvironment;
- (int)databaseType;
- (int)operationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContainerEnvironment:(int)a3;
- (void)setContainerName:(id)a3;
- (void)setDatabaseType:(int)a3;
- (void)setHasContainerEnvironment:(BOOL)a3;
- (void)setHasDatabaseType:(BOOL)a3;
- (void)setHasOperationType:(BOOL)a3;
- (void)setInvernessFunctionName:(id)a3;
- (void)setInvernessServiceName:(id)a3;
- (void)setOperationGroupName:(id)a3;
- (void)setOperationType:(int)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPThrottlingConfigCriteria

- (BOOL)hasContainerName
{
  return self->_containerName != 0;
}

- (int)containerEnvironment
{
  if (*(unsigned char *)&self->_has) {
    return self->_containerEnvironment;
  }
  else {
    return 1;
  }
}

- (void)setContainerEnvironment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_containerEnvironment = a3;
}

- (void)setHasContainerEnvironment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainerEnvironment
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)containerEnvironmentAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"production";
  }
  else if (a3 == 2)
  {
    v4 = @"sandbox";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsContainerEnvironment:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"production") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"sandbox")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (int)operationType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_operationType;
  }
  else {
    return 0;
  }
}

- (void)setOperationType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_operationType = a3;
}

- (void)setHasOperationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOperationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)operationTypeAsString:(int)a3
{
  if (a3 <= 299)
  {
    if (a3 > 249)
    {
      if (a3 > 269)
      {
        if (a3 == 270)
        {
          v4 = @"addAnonymousShareType";
        }
        else
        {
          if (a3 != 271) {
            goto LABEL_185;
          }
          v4 = @"removeAnonymousShareType";
        }
      }
      else if (a3 == 250)
      {
        v4 = @"webAuthTokenRetrieveType";
      }
      else
      {
        if (a3 != 260) {
          goto LABEL_185;
        }
        v4 = @"dataRepairUpdateMissingAssetStatusType";
      }
    }
    else
    {
      switch(a3)
      {
        case 200:
          v4 = @"zoneSaveType";
          break;
        case 201:
          v4 = @"zoneRetrieveType";
          break;
        case 202:
          v4 = @"zoneDeleteType";
          break;
        case 203:
          v4 = @"zoneRetrieveChangesType";
          break;
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 215:
        case 222:
        case 223:
        case 224:
        case 225:
        case 226:
        case 227:
        case 228:
        case 229:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 238:
        case 239:
        case 241:
        case 242:
          goto LABEL_185;
        case 210:
          v4 = @"recordSaveType";
          break;
        case 211:
          v4 = @"recordRetrieveType";
          break;
        case 212:
          v4 = @"recordRetrieveVersionsType";
          break;
        case 213:
          v4 = @"recordRetrieveChangesType";
          break;
        case 214:
          v4 = @"recordDeleteType";
          break;
        case 216:
          v4 = @"recordResolveTokenType";
          break;
        case 217:
          v4 = @"fetchArchivedRecordsType";
          break;
        case 218:
          v4 = @"recordMoveType";
          break;
        case 219:
          v4 = @"shareAccessType";
          break;
        case 220:
          v4 = @"queryRetrieveType";
          break;
        case 221:
          v4 = @"shareDeclineType";
          break;
        case 230:
          v4 = @"assetUploadTokenRetrieveType";
          break;
        case 240:
          v4 = @"containerDeleteType";
          break;
        case 243:
          v4 = @"userAvailableQuotaType";
          break;
        case 244:
          v4 = @"containerGetBundlesType";
          break;
        default:
          if (a3) {
            goto LABEL_185;
          }
          v4 = @"noneType";
          break;
      }
    }
  }
  else
  {
    if (a3 <= 502)
    {
      switch(a3)
      {
        case 400:
          v4 = @"userRetrieveType";
          break;
        case 401:
          v4 = @"userQueryType";
          break;
        case 402:
          v4 = @"userPrivacySettingsRetrieveType";
          break;
        case 403:
          v4 = @"userPrivacySettingsUpdateType";
          break;
        case 404:
          v4 = @"userPrivacySettingsResetType";
          break;
        case 405:
          v4 = @"userPrivacySettingsBatchLookup";
          break;
        case 406:
          v4 = @"sharePermissionSettingsUpdateType";
          break;
        case 407:
          v4 = @"adopterCapabilitiesSaveType";
          break;
        case 408:
          v4 = @"adopterCapabilitiesCheckType";
          break;
        case 409:
          v4 = @"zoneUsageSaveType";
          break;
        case 410:
          v4 = @"shareUsageSaveType";
          break;
        default:
          switch(a3)
          {
            case 300:
              v4 = @"subscriptionCreateType";
              break;
            case 301:
              v4 = @"subscriptionRetrieveType";
              break;
            case 302:
              v4 = @"subscriptionDeleteType";
              break;
            case 311:
              v4 = @"mergeableDeltaSaveType";
              break;
            case 312:
              v4 = @"mergeableDeltaMetadataRetrieveType";
              break;
            case 313:
              v4 = @"mergeableDeltaReplaceType";
              break;
            case 314:
              v4 = @"mergeableDeltaRetrieveType";
              break;
            case 320:
              v4 = @"privateSearchSetType";
              break;
            case 321:
              v4 = @"privateSearchGetType";
              break;
            case 322:
              v4 = @"privateSearchDeleteType";
              break;
            default:
              goto LABEL_185;
          }
          break;
      }
      return v4;
    }
    if (a3 <= 899)
    {
      switch(a3)
      {
        case 800:
          v4 = @"pushRegisterType";
          break;
        case 801:
          v4 = @"pushUnregisterType";
          break;
        case 802:
          v4 = @"pushBadgeType";
          break;
        case 803:
          v4 = @"pushSyncType";
          break;
        case 804:
          v4 = @"pushReadType";
          break;
        default:
          if (a3 == 503)
          {
            v4 = @"shareAcceptType";
          }
          else
          {
            if (a3 != 513) {
              goto LABEL_185;
            }
            v4 = @"shareVettingInitiateType";
          }
          break;
      }
      return v4;
    }
    switch(a3)
    {
      case 900:
        v4 = @"archiveRecordsType";
        break;
      case 901:
        v4 = @"datarepairMarkAssetBrokenType";
        break;
      case 1101:
        v4 = @"functionInvokeType";
        return v4;
      default:
LABEL_185:
        objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
    }
  }
  return v4;
}

- (int)StringAsOperationType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"noneType"))
  {
    int v6 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"zoneSaveType"))
  {
    int v6 = 200;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"zoneRetrieveType"))
  {
    int v6 = 201;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"zoneDeleteType"))
  {
    int v6 = 202;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"zoneRetrieveChangesType"))
  {
    int v6 = 203;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"recordSaveType"))
  {
    int v6 = 210;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"recordRetrieveType"))
  {
    int v6 = 211;
  }
  else if (objc_msgSend_isEqualToString_(v3, v12, @"recordRetrieveVersionsType"))
  {
    int v6 = 212;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"recordRetrieveChangesType"))
  {
    int v6 = 213;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"recordDeleteType"))
  {
    int v6 = 214;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"recordResolveTokenType"))
  {
    int v6 = 216;
  }
  else if (objc_msgSend_isEqualToString_(v3, v16, @"fetchArchivedRecordsType"))
  {
    int v6 = 217;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"recordMoveType"))
  {
    int v6 = 218;
  }
  else if (objc_msgSend_isEqualToString_(v3, v18, @"shareAccessType"))
  {
    int v6 = 219;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"queryRetrieveType"))
  {
    int v6 = 220;
  }
  else if (objc_msgSend_isEqualToString_(v3, v20, @"shareDeclineType"))
  {
    int v6 = 221;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, @"assetUploadTokenRetrieveType"))
  {
    int v6 = 230;
  }
  else if (objc_msgSend_isEqualToString_(v3, v22, @"containerDeleteType"))
  {
    int v6 = 240;
  }
  else if (objc_msgSend_isEqualToString_(v3, v23, @"userAvailableQuotaType"))
  {
    int v6 = 243;
  }
  else if (objc_msgSend_isEqualToString_(v3, v24, @"containerGetBundlesType"))
  {
    int v6 = 244;
  }
  else if (objc_msgSend_isEqualToString_(v3, v25, @"webAuthTokenRetrieveType"))
  {
    int v6 = 250;
  }
  else if (objc_msgSend_isEqualToString_(v3, v26, @"dataRepairUpdateMissingAssetStatusType"))
  {
    int v6 = 260;
  }
  else if (objc_msgSend_isEqualToString_(v3, v27, @"addAnonymousShareType"))
  {
    int v6 = 270;
  }
  else if (objc_msgSend_isEqualToString_(v3, v28, @"removeAnonymousShareType"))
  {
    int v6 = 271;
  }
  else if (objc_msgSend_isEqualToString_(v3, v29, @"subscriptionCreateType"))
  {
    int v6 = 300;
  }
  else if (objc_msgSend_isEqualToString_(v3, v30, @"subscriptionRetrieveType"))
  {
    int v6 = 301;
  }
  else if (objc_msgSend_isEqualToString_(v3, v31, @"subscriptionDeleteType"))
  {
    int v6 = 302;
  }
  else if (objc_msgSend_isEqualToString_(v3, v32, @"mergeableDeltaSaveType"))
  {
    int v6 = 311;
  }
  else if (objc_msgSend_isEqualToString_(v3, v33, @"mergeableDeltaMetadataRetrieveType"))
  {
    int v6 = 312;
  }
  else if (objc_msgSend_isEqualToString_(v3, v34, @"mergeableDeltaReplaceType"))
  {
    int v6 = 313;
  }
  else if (objc_msgSend_isEqualToString_(v3, v35, @"mergeableDeltaRetrieveType"))
  {
    int v6 = 314;
  }
  else if (objc_msgSend_isEqualToString_(v3, v36, @"privateSearchSetType"))
  {
    int v6 = 320;
  }
  else if (objc_msgSend_isEqualToString_(v3, v37, @"privateSearchGetType"))
  {
    int v6 = 321;
  }
  else if (objc_msgSend_isEqualToString_(v3, v38, @"privateSearchDeleteType"))
  {
    int v6 = 322;
  }
  else if (objc_msgSend_isEqualToString_(v3, v39, @"userRetrieveType"))
  {
    int v6 = 400;
  }
  else if (objc_msgSend_isEqualToString_(v3, v40, @"userQueryType"))
  {
    int v6 = 401;
  }
  else if (objc_msgSend_isEqualToString_(v3, v41, @"userPrivacySettingsRetrieveType"))
  {
    int v6 = 402;
  }
  else if (objc_msgSend_isEqualToString_(v3, v42, @"userPrivacySettingsUpdateType"))
  {
    int v6 = 403;
  }
  else if (objc_msgSend_isEqualToString_(v3, v43, @"userPrivacySettingsResetType"))
  {
    int v6 = 404;
  }
  else if (objc_msgSend_isEqualToString_(v3, v44, @"userPrivacySettingsBatchLookup"))
  {
    int v6 = 405;
  }
  else if (objc_msgSend_isEqualToString_(v3, v45, @"sharePermissionSettingsUpdateType"))
  {
    int v6 = 406;
  }
  else if (objc_msgSend_isEqualToString_(v3, v46, @"adopterCapabilitiesSaveType"))
  {
    int v6 = 407;
  }
  else if (objc_msgSend_isEqualToString_(v3, v47, @"adopterCapabilitiesCheckType"))
  {
    int v6 = 408;
  }
  else if (objc_msgSend_isEqualToString_(v3, v48, @"zoneUsageSaveType"))
  {
    int v6 = 409;
  }
  else if (objc_msgSend_isEqualToString_(v3, v49, @"shareUsageSaveType"))
  {
    int v6 = 410;
  }
  else if (objc_msgSend_isEqualToString_(v3, v50, @"shareAcceptType"))
  {
    int v6 = 503;
  }
  else if (objc_msgSend_isEqualToString_(v3, v51, @"shareVettingInitiateType"))
  {
    int v6 = 513;
  }
  else if (objc_msgSend_isEqualToString_(v3, v52, @"pushRegisterType"))
  {
    int v6 = 800;
  }
  else if (objc_msgSend_isEqualToString_(v3, v53, @"pushUnregisterType"))
  {
    int v6 = 801;
  }
  else if (objc_msgSend_isEqualToString_(v3, v54, @"pushBadgeType"))
  {
    int v6 = 802;
  }
  else if (objc_msgSend_isEqualToString_(v3, v55, @"pushSyncType"))
  {
    int v6 = 803;
  }
  else if (objc_msgSend_isEqualToString_(v3, v56, @"pushReadType"))
  {
    int v6 = 804;
  }
  else if (objc_msgSend_isEqualToString_(v3, v57, @"archiveRecordsType"))
  {
    int v6 = 900;
  }
  else if (objc_msgSend_isEqualToString_(v3, v58, @"datarepairMarkAssetBrokenType"))
  {
    int v6 = 901;
  }
  else if (objc_msgSend_isEqualToString_(v3, v59, @"functionInvokeType"))
  {
    int v6 = 1101;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int)databaseType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_databaseType;
  }
  else {
    return 1;
  }
}

- (void)setDatabaseType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_databaseType = a3;
}

- (void)setHasDatabaseType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatabaseType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)databaseTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F8950[a3 - 1];
  }
  return v3;
}

- (int)StringAsDatabaseType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"privateDB"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"publicDB"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"sharedDB"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"orgDB"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasInvernessServiceName
{
  return self->_invernessServiceName != 0;
}

- (BOOL)hasInvernessFunctionName
{
  return self->_invernessFunctionName != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPThrottlingConfigCriteria;
  v4 = [(CKDPThrottlingConfigCriteria *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  containerName = self->_containerName;
  if (containerName) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)containerName, @"containerName");
  }
  char has = (char)self->_has;
  if (has)
  {
    int containerEnvironment = self->_containerEnvironment;
    if (containerEnvironment == 1)
    {
      v10 = @"production";
      objc_msgSend_setObject_forKey_(v6, v5, @"production", @"containerEnvironment");
    }
    else if (containerEnvironment == 2)
    {
      v10 = @"sandbox";
      objc_msgSend_setObject_forKey_(v6, v5, @"sandbox", @"containerEnvironment");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_containerEnvironment);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"containerEnvironment");
    }

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_93;
      }
      goto LABEL_89;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  int operationType = self->_operationType;
  if (operationType > 299)
  {
    if (operationType <= 502)
    {
      switch(operationType)
      {
        case 400:
          v13 = @"userRetrieveType";
          objc_msgSend_setObject_forKey_(v6, v5, @"userRetrieveType", @"operationType");
          break;
        case 401:
          v13 = @"userQueryType";
          objc_msgSend_setObject_forKey_(v6, v5, @"userQueryType", @"operationType");
          break;
        case 402:
          v13 = @"userPrivacySettingsRetrieveType";
          objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsRetrieveType", @"operationType");
          break;
        case 403:
          v13 = @"userPrivacySettingsUpdateType";
          objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsUpdateType", @"operationType");
          break;
        case 404:
          v13 = @"userPrivacySettingsResetType";
          objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsResetType", @"operationType");
          break;
        case 405:
          v13 = @"userPrivacySettingsBatchLookup";
          objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsBatchLookup", @"operationType");
          break;
        case 406:
          v13 = @"sharePermissionSettingsUpdateType";
          objc_msgSend_setObject_forKey_(v6, v5, @"sharePermissionSettingsUpdateType", @"operationType");
          break;
        case 407:
          v13 = @"adopterCapabilitiesSaveType";
          objc_msgSend_setObject_forKey_(v6, v5, @"adopterCapabilitiesSaveType", @"operationType");
          break;
        case 408:
          v13 = @"adopterCapabilitiesCheckType";
          objc_msgSend_setObject_forKey_(v6, v5, @"adopterCapabilitiesCheckType", @"operationType");
          break;
        case 409:
          v13 = @"zoneUsageSaveType";
          objc_msgSend_setObject_forKey_(v6, v5, @"zoneUsageSaveType", @"operationType");
          break;
        case 410:
          v13 = @"shareUsageSaveType";
          objc_msgSend_setObject_forKey_(v6, v5, @"shareUsageSaveType", @"operationType");
          break;
        default:
          switch(operationType)
          {
            case 300:
              v13 = @"subscriptionCreateType";
              objc_msgSend_setObject_forKey_(v6, v5, @"subscriptionCreateType", @"operationType");
              break;
            case 301:
              v13 = @"subscriptionRetrieveType";
              objc_msgSend_setObject_forKey_(v6, v5, @"subscriptionRetrieveType", @"operationType");
              break;
            case 302:
              v13 = @"subscriptionDeleteType";
              objc_msgSend_setObject_forKey_(v6, v5, @"subscriptionDeleteType", @"operationType");
              break;
            case 311:
              v13 = @"mergeableDeltaSaveType";
              objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaSaveType", @"operationType");
              break;
            case 312:
              v13 = @"mergeableDeltaMetadataRetrieveType";
              objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaMetadataRetrieveType", @"operationType");
              break;
            case 313:
              v13 = @"mergeableDeltaReplaceType";
              objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaReplaceType", @"operationType");
              break;
            case 314:
              v13 = @"mergeableDeltaRetrieveType";
              objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaRetrieveType", @"operationType");
              break;
            case 320:
              v13 = @"privateSearchSetType";
              objc_msgSend_setObject_forKey_(v6, v5, @"privateSearchSetType", @"operationType");
              break;
            case 321:
              v13 = @"privateSearchGetType";
              objc_msgSend_setObject_forKey_(v6, v5, @"privateSearchGetType", @"operationType");
              break;
            case 322:
              v13 = @"privateSearchDeleteType";
              objc_msgSend_setObject_forKey_(v6, v5, @"privateSearchDeleteType", @"operationType");
              break;
            default:
              goto LABEL_87;
          }
          break;
      }
      goto LABEL_88;
    }
    if (operationType <= 899)
    {
      switch(operationType)
      {
        case 800:
          v13 = @"pushRegisterType";
          objc_msgSend_setObject_forKey_(v6, v5, @"pushRegisterType", @"operationType");
          break;
        case 801:
          v13 = @"pushUnregisterType";
          objc_msgSend_setObject_forKey_(v6, v5, @"pushUnregisterType", @"operationType");
          break;
        case 802:
          v13 = @"pushBadgeType";
          objc_msgSend_setObject_forKey_(v6, v5, @"pushBadgeType", @"operationType");
          break;
        case 803:
          v13 = @"pushSyncType";
          objc_msgSend_setObject_forKey_(v6, v5, @"pushSyncType", @"operationType");
          break;
        case 804:
          v13 = @"pushReadType";
          objc_msgSend_setObject_forKey_(v6, v5, @"pushReadType", @"operationType");
          break;
        default:
          if (operationType == 503)
          {
            v13 = @"shareAcceptType";
            objc_msgSend_setObject_forKey_(v6, v5, @"shareAcceptType", @"operationType");
          }
          else
          {
            if (operationType != 513) {
              goto LABEL_87;
            }
            v13 = @"shareVettingInitiateType";
            objc_msgSend_setObject_forKey_(v6, v5, @"shareVettingInitiateType", @"operationType");
          }
          break;
      }
      goto LABEL_88;
    }
    switch(operationType)
    {
      case 900:
        v13 = @"archiveRecordsType";
        objc_msgSend_setObject_forKey_(v6, v5, @"archiveRecordsType", @"operationType");
        goto LABEL_88;
      case 901:
        v13 = @"datarepairMarkAssetBrokenType";
        objc_msgSend_setObject_forKey_(v6, v5, @"datarepairMarkAssetBrokenType", @"operationType");
        goto LABEL_88;
      case 1101:
        v13 = @"functionInvokeType";
        objc_msgSend_setObject_forKey_(v6, v5, @"functionInvokeType", @"operationType");
        goto LABEL_88;
    }
LABEL_87:
    objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_operationType);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"operationType");
    goto LABEL_88;
  }
  if (operationType > 249)
  {
    if (operationType > 269)
    {
      if (operationType == 270)
      {
        v13 = @"addAnonymousShareType";
        objc_msgSend_setObject_forKey_(v6, v5, @"addAnonymousShareType", @"operationType");
        goto LABEL_88;
      }
      if (operationType == 271)
      {
        v13 = @"removeAnonymousShareType";
        objc_msgSend_setObject_forKey_(v6, v5, @"removeAnonymousShareType", @"operationType");
        goto LABEL_88;
      }
    }
    else
    {
      if (operationType == 250)
      {
        v13 = @"webAuthTokenRetrieveType";
        objc_msgSend_setObject_forKey_(v6, v5, @"webAuthTokenRetrieveType", @"operationType");
        goto LABEL_88;
      }
      if (operationType == 260)
      {
        v13 = @"dataRepairUpdateMissingAssetStatusType";
        objc_msgSend_setObject_forKey_(v6, v5, @"dataRepairUpdateMissingAssetStatusType", @"operationType");
        goto LABEL_88;
      }
    }
    goto LABEL_87;
  }
  switch(operationType)
  {
    case 200:
      v13 = @"zoneSaveType";
      objc_msgSend_setObject_forKey_(v6, v5, @"zoneSaveType", @"operationType");
      break;
    case 201:
      v13 = @"zoneRetrieveType";
      objc_msgSend_setObject_forKey_(v6, v5, @"zoneRetrieveType", @"operationType");
      break;
    case 202:
      v13 = @"zoneDeleteType";
      objc_msgSend_setObject_forKey_(v6, v5, @"zoneDeleteType", @"operationType");
      break;
    case 203:
      v13 = @"zoneRetrieveChangesType";
      objc_msgSend_setObject_forKey_(v6, v5, @"zoneRetrieveChangesType", @"operationType");
      break;
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 215:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 236:
    case 237:
    case 238:
    case 239:
    case 241:
    case 242:
      goto LABEL_87;
    case 210:
      v13 = @"recordSaveType";
      objc_msgSend_setObject_forKey_(v6, v5, @"recordSaveType", @"operationType");
      break;
    case 211:
      v13 = @"recordRetrieveType";
      objc_msgSend_setObject_forKey_(v6, v5, @"recordRetrieveType", @"operationType");
      break;
    case 212:
      v13 = @"recordRetrieveVersionsType";
      objc_msgSend_setObject_forKey_(v6, v5, @"recordRetrieveVersionsType", @"operationType");
      break;
    case 213:
      v13 = @"recordRetrieveChangesType";
      objc_msgSend_setObject_forKey_(v6, v5, @"recordRetrieveChangesType", @"operationType");
      break;
    case 214:
      v13 = @"recordDeleteType";
      objc_msgSend_setObject_forKey_(v6, v5, @"recordDeleteType", @"operationType");
      break;
    case 216:
      v13 = @"recordResolveTokenType";
      objc_msgSend_setObject_forKey_(v6, v5, @"recordResolveTokenType", @"operationType");
      break;
    case 217:
      v13 = @"fetchArchivedRecordsType";
      objc_msgSend_setObject_forKey_(v6, v5, @"fetchArchivedRecordsType", @"operationType");
      break;
    case 218:
      v13 = @"recordMoveType";
      objc_msgSend_setObject_forKey_(v6, v5, @"recordMoveType", @"operationType");
      break;
    case 219:
      v13 = @"shareAccessType";
      objc_msgSend_setObject_forKey_(v6, v5, @"shareAccessType", @"operationType");
      break;
    case 220:
      v13 = @"queryRetrieveType";
      objc_msgSend_setObject_forKey_(v6, v5, @"queryRetrieveType", @"operationType");
      break;
    case 221:
      v13 = @"shareDeclineType";
      objc_msgSend_setObject_forKey_(v6, v5, @"shareDeclineType", @"operationType");
      break;
    case 230:
      v13 = @"assetUploadTokenRetrieveType";
      objc_msgSend_setObject_forKey_(v6, v5, @"assetUploadTokenRetrieveType", @"operationType");
      break;
    case 240:
      v13 = @"containerDeleteType";
      objc_msgSend_setObject_forKey_(v6, v5, @"containerDeleteType", @"operationType");
      break;
    case 243:
      v13 = @"userAvailableQuotaType";
      objc_msgSend_setObject_forKey_(v6, v5, @"userAvailableQuotaType", @"operationType");
      break;
    case 244:
      v13 = @"containerGetBundlesType";
      objc_msgSend_setObject_forKey_(v6, v5, @"containerGetBundlesType", @"operationType");
      break;
    default:
      if (operationType) {
        goto LABEL_87;
      }
      v13 = @"noneType";
      objc_msgSend_setObject_forKey_(v6, v5, @"noneType", @"operationType");
      break;
  }
LABEL_88:

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_93;
  }
LABEL_89:
  unsigned int v15 = self->_databaseType - 1;
  if (v15 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_databaseType);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E64F8950[v15];
  }
  objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v16, @"databaseType");

LABEL_93:
  zoneName = self->_zoneName;
  if (zoneName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)zoneName, @"zoneName");
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupName, @"operationGroupName");
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)bundleID, @"bundleID");
  }
  invernessServiceName = self->_invernessServiceName;
  if (invernessServiceName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)invernessServiceName, @"invernessServiceName");
  }
  invernessFunctionName = self->_invernessFunctionName;
  if (invernessFunctionName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)invernessFunctionName, @"invernessFunctionName");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C50299D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_containerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_operationGroupName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_invernessServiceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_invernessFunctionName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  containerName = self->_containerName;
  id v13 = v4;
  if (containerName)
  {
    objc_msgSend_setContainerName_(v4, v5, (uint64_t)containerName);
    id v4 = v13;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_containerEnvironment;
    *((unsigned char *)v4 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 16) = self->_operationType;
  *((unsigned char *)v4 + 80) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 8) = self->_databaseType;
    *((unsigned char *)v4 + 80) |= 2u;
  }
LABEL_7:
  zoneName = self->_zoneName;
  if (zoneName)
  {
    objc_msgSend_setZoneName_(v13, v5, (uint64_t)zoneName);
    id v4 = v13;
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    objc_msgSend_setOperationGroupName_(v13, v5, (uint64_t)operationGroupName);
    id v4 = v13;
  }
  invernessServiceName = self->_invernessServiceName;
  if (invernessServiceName)
  {
    objc_msgSend_setInvernessServiceName_(v13, v5, (uint64_t)invernessServiceName);
    id v4 = v13;
  }
  invernessFunctionName = self->_invernessFunctionName;
  if (invernessFunctionName)
  {
    objc_msgSend_setInvernessFunctionName_(v13, v5, (uint64_t)invernessFunctionName);
    id v4 = v13;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    objc_msgSend_setBundleID_(v13, v5, (uint64_t)bundleID);
    id v4 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_containerName, v11, (uint64_t)a3);
  id v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v10 + 64) = self->_operationType;
    *(unsigned char *)(v10 + 80) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v10 + 16) = self->_containerEnvironment;
  *(unsigned char *)(v10 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v10 + 32) = self->_databaseType;
    *(unsigned char *)(v10 + 80) |= 2u;
  }
LABEL_5:
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_zoneName, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_operationGroupName, v18, (uint64_t)a3);
  v20 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v19;

  uint64_t v22 = objc_msgSend_copyWithZone_(self->_invernessServiceName, v21, (uint64_t)a3);
  v23 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v22;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_invernessFunctionName, v24, (uint64_t)a3);
  v26 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v25;

  uint64_t v28 = objc_msgSend_copyWithZone_(self->_bundleID, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v28;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_29;
  }
  containerName = self->_containerName;
  uint64_t v9 = v4[3];
  if ((unint64_t)containerName | v9)
  {
    if (!objc_msgSend_isEqual_(containerName, v7, v9)) {
      goto LABEL_29;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[10] & 1) == 0 || self->_containerEnvironment != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if (v4[10])
  {
LABEL_29:
    char isEqual = 0;
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[10] & 4) == 0 || self->_operationType != *((_DWORD *)v4 + 16)) {
      goto LABEL_29;
    }
  }
  else if ((v4[10] & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[10] & 2) == 0 || self->_databaseType != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((v4[10] & 2) != 0)
  {
    goto LABEL_29;
  }
  zoneName = self->_zoneName;
  uint64_t v11 = v4[9];
  if ((unint64_t)zoneName | v11 && !objc_msgSend_isEqual_(zoneName, v7, v11)) {
    goto LABEL_29;
  }
  operationGroupName = self->_operationGroupName;
  uint64_t v13 = v4[7];
  if ((unint64_t)operationGroupName | v13)
  {
    if (!objc_msgSend_isEqual_(operationGroupName, v7, v13)) {
      goto LABEL_29;
    }
  }
  invernessServiceName = self->_invernessServiceName;
  uint64_t v15 = v4[6];
  if ((unint64_t)invernessServiceName | v15)
  {
    if (!objc_msgSend_isEqual_(invernessServiceName, v7, v15)) {
      goto LABEL_29;
    }
  }
  invernessFunctionName = self->_invernessFunctionName;
  uint64_t v17 = v4[5];
  if ((unint64_t)invernessFunctionName | v17)
  {
    if (!objc_msgSend_isEqual_(invernessFunctionName, v7, v17)) {
      goto LABEL_29;
    }
  }
  bundleID = self->_bundleID;
  uint64_t v19 = v4[1];
  if ((unint64_t)bundleID | v19) {
    char isEqual = objc_msgSend_isEqual_(bundleID, v7, v19);
  }
  else {
    char isEqual = 1;
  }
LABEL_30:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_containerName, a2, v2);
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = 2654435761 * self->_containerEnvironment;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_operationType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_databaseType;
LABEL_8:
  uint64_t v10 = v7 ^ v4 ^ v8 ^ v9 ^ objc_msgSend_hash(self->_zoneName, v5, v6);
  uint64_t v13 = objc_msgSend_hash(self->_operationGroupName, v11, v12);
  uint64_t v16 = v13 ^ objc_msgSend_hash(self->_invernessServiceName, v14, v15);
  uint64_t v19 = v10 ^ v16 ^ objc_msgSend_hash(self->_invernessFunctionName, v17, v18);
  return v19 ^ objc_msgSend_hash(self->_bundleID, v20, v21);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 3);
  id v13 = v4;
  if (v6)
  {
    objc_msgSend_setContainerName_(self, v5, v6);
    id v4 = v13;
  }
  char v7 = *((unsigned char *)v4 + 80);
  if (v7)
  {
    self->_int containerEnvironment = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 80);
    if ((v7 & 4) == 0)
    {
LABEL_5:
      if ((v7 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_int operationType = *((_DWORD *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_6:
    self->_databaseType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  uint64_t v8 = *((void *)v4 + 9);
  if (v8)
  {
    objc_msgSend_setZoneName_(self, v5, v8);
    id v4 = v13;
  }
  uint64_t v9 = *((void *)v4 + 7);
  if (v9)
  {
    objc_msgSend_setOperationGroupName_(self, v5, v9);
    id v4 = v13;
  }
  uint64_t v10 = *((void *)v4 + 6);
  if (v10)
  {
    objc_msgSend_setInvernessServiceName_(self, v5, v10);
    id v4 = v13;
  }
  uint64_t v11 = *((void *)v4 + 5);
  if (v11)
  {
    objc_msgSend_setInvernessFunctionName_(self, v5, v11);
    id v4 = v13;
  }
  uint64_t v12 = *((void *)v4 + 1);
  if (v12)
  {
    objc_msgSend_setBundleID_(self, v5, v12);
    id v4 = v13;
  }
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)invernessServiceName
{
  return self->_invernessServiceName;
}

- (void)setInvernessServiceName:(id)a3
{
}

- (NSString)invernessFunctionName
{
  return self->_invernessFunctionName;
}

- (void)setInvernessFunctionName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_invernessServiceName, 0);
  objc_storeStrong((id *)&self->_invernessFunctionName, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end