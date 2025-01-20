@interface CKDPOperation
- (BOOL)hasAnonymousCKUserID;
- (BOOL)hasLast;
- (BOOL)hasOperationUUID;
- (BOOL)hasRequestSignature;
- (BOOL)hasSynchronousMode;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)last;
- (BOOL)readFrom:(id)a3;
- (BOOL)synchronousMode;
- (CKDPIdentifier)anonymousCKUserID;
- (NSData)requestSignature;
- (NSString)operationUUID;
- (id)_typeCKLogValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymousCKUserID:(id)a3;
- (void)setHasLast:(BOOL)a3;
- (void)setHasSynchronousMode:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLast:(BOOL)a3;
- (void)setOperationUUID:(id)a3;
- (void)setRequestSignature:(id)a3;
- (void)setSynchronousMode:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPOperation

- (BOOL)hasOperationUUID
{
  return self->_operationUUID != 0;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
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

- (int)StringAsType:(id)a3
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

- (void)setSynchronousMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_synchronousMode = a3;
}

- (void)setHasSynchronousMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSynchronousMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLast:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_last = a3;
}

- (void)setHasLast:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLast
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasRequestSignature
{
  return self->_requestSignature != 0;
}

- (BOOL)hasAnonymousCKUserID
{
  return self->_anonymousCKUserID != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPOperation;
  v4 = [(CKDPOperation *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  operationUUID = self->_operationUUID;
  if (operationUUID) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)operationUUID, @"operationUUID");
  }
  char has = (char)self->_has;
  if (has)
  {
    int type = self->_type;
    if (type <= 299)
    {
      if (type <= 249)
      {
        switch(type)
        {
          case 200:
            v10 = @"zoneSaveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"zoneSaveType", @"type");
            break;
          case 201:
            v10 = @"zoneRetrieveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"zoneRetrieveType", @"type");
            break;
          case 202:
            v10 = @"zoneDeleteType";
            objc_msgSend_setObject_forKey_(v6, v5, @"zoneDeleteType", @"type");
            break;
          case 203:
            v10 = @"zoneRetrieveChangesType";
            objc_msgSend_setObject_forKey_(v6, v5, @"zoneRetrieveChangesType", @"type");
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
            goto LABEL_78;
          case 210:
            v10 = @"recordSaveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"recordSaveType", @"type");
            break;
          case 211:
            v10 = @"recordRetrieveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"recordRetrieveType", @"type");
            break;
          case 212:
            v10 = @"recordRetrieveVersionsType";
            objc_msgSend_setObject_forKey_(v6, v5, @"recordRetrieveVersionsType", @"type");
            break;
          case 213:
            v10 = @"recordRetrieveChangesType";
            objc_msgSend_setObject_forKey_(v6, v5, @"recordRetrieveChangesType", @"type");
            break;
          case 214:
            v10 = @"recordDeleteType";
            objc_msgSend_setObject_forKey_(v6, v5, @"recordDeleteType", @"type");
            break;
          case 216:
            v10 = @"recordResolveTokenType";
            objc_msgSend_setObject_forKey_(v6, v5, @"recordResolveTokenType", @"type");
            break;
          case 217:
            v10 = @"fetchArchivedRecordsType";
            objc_msgSend_setObject_forKey_(v6, v5, @"fetchArchivedRecordsType", @"type");
            break;
          case 218:
            v10 = @"recordMoveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"recordMoveType", @"type");
            break;
          case 219:
            v10 = @"shareAccessType";
            objc_msgSend_setObject_forKey_(v6, v5, @"shareAccessType", @"type");
            break;
          case 220:
            v10 = @"queryRetrieveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"queryRetrieveType", @"type");
            break;
          case 221:
            v10 = @"shareDeclineType";
            objc_msgSend_setObject_forKey_(v6, v5, @"shareDeclineType", @"type");
            break;
          case 230:
            v10 = @"assetUploadTokenRetrieveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"assetUploadTokenRetrieveType", @"type");
            break;
          case 240:
            v10 = @"containerDeleteType";
            objc_msgSend_setObject_forKey_(v6, v5, @"containerDeleteType", @"type");
            break;
          case 243:
            v10 = @"userAvailableQuotaType";
            objc_msgSend_setObject_forKey_(v6, v5, @"userAvailableQuotaType", @"type");
            break;
          case 244:
            v10 = @"containerGetBundlesType";
            objc_msgSend_setObject_forKey_(v6, v5, @"containerGetBundlesType", @"type");
            break;
          default:
            if (type) {
              goto LABEL_78;
            }
            v10 = @"noneType";
            objc_msgSend_setObject_forKey_(v6, v5, @"noneType", @"type");
            break;
        }
        goto LABEL_79;
      }
      if (type > 269)
      {
        if (type == 270)
        {
          v10 = @"addAnonymousShareType";
          objc_msgSend_setObject_forKey_(v6, v5, @"addAnonymousShareType", @"type");
          goto LABEL_79;
        }
        if (type == 271)
        {
          v10 = @"removeAnonymousShareType";
          objc_msgSend_setObject_forKey_(v6, v5, @"removeAnonymousShareType", @"type");
          goto LABEL_79;
        }
      }
      else
      {
        if (type == 250)
        {
          v10 = @"webAuthTokenRetrieveType";
          objc_msgSend_setObject_forKey_(v6, v5, @"webAuthTokenRetrieveType", @"type");
          goto LABEL_79;
        }
        if (type == 260)
        {
          v10 = @"dataRepairUpdateMissingAssetStatusType";
          objc_msgSend_setObject_forKey_(v6, v5, @"dataRepairUpdateMissingAssetStatusType", @"type");
LABEL_79:

          char has = (char)self->_has;
          goto LABEL_80;
        }
      }
    }
    else
    {
      if (type <= 502)
      {
        switch(type)
        {
          case 400:
            v10 = @"userRetrieveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"userRetrieveType", @"type");
            break;
          case 401:
            v10 = @"userQueryType";
            objc_msgSend_setObject_forKey_(v6, v5, @"userQueryType", @"type");
            break;
          case 402:
            v10 = @"userPrivacySettingsRetrieveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsRetrieveType", @"type");
            break;
          case 403:
            v10 = @"userPrivacySettingsUpdateType";
            objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsUpdateType", @"type");
            break;
          case 404:
            v10 = @"userPrivacySettingsResetType";
            objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsResetType", @"type");
            break;
          case 405:
            v10 = @"userPrivacySettingsBatchLookup";
            objc_msgSend_setObject_forKey_(v6, v5, @"userPrivacySettingsBatchLookup", @"type");
            break;
          case 406:
            v10 = @"sharePermissionSettingsUpdateType";
            objc_msgSend_setObject_forKey_(v6, v5, @"sharePermissionSettingsUpdateType", @"type");
            break;
          case 407:
            v10 = @"adopterCapabilitiesSaveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"adopterCapabilitiesSaveType", @"type");
            break;
          case 408:
            v10 = @"adopterCapabilitiesCheckType";
            objc_msgSend_setObject_forKey_(v6, v5, @"adopterCapabilitiesCheckType", @"type");
            break;
          case 409:
            v10 = @"zoneUsageSaveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"zoneUsageSaveType", @"type");
            break;
          case 410:
            v10 = @"shareUsageSaveType";
            objc_msgSend_setObject_forKey_(v6, v5, @"shareUsageSaveType", @"type");
            break;
          default:
            switch(type)
            {
              case 300:
                v10 = @"subscriptionCreateType";
                objc_msgSend_setObject_forKey_(v6, v5, @"subscriptionCreateType", @"type");
                break;
              case 301:
                v10 = @"subscriptionRetrieveType";
                objc_msgSend_setObject_forKey_(v6, v5, @"subscriptionRetrieveType", @"type");
                break;
              case 302:
                v10 = @"subscriptionDeleteType";
                objc_msgSend_setObject_forKey_(v6, v5, @"subscriptionDeleteType", @"type");
                break;
              case 311:
                v10 = @"mergeableDeltaSaveType";
                objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaSaveType", @"type");
                break;
              case 312:
                v10 = @"mergeableDeltaMetadataRetrieveType";
                objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaMetadataRetrieveType", @"type");
                break;
              case 313:
                v10 = @"mergeableDeltaReplaceType";
                objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaReplaceType", @"type");
                break;
              case 314:
                v10 = @"mergeableDeltaRetrieveType";
                objc_msgSend_setObject_forKey_(v6, v5, @"mergeableDeltaRetrieveType", @"type");
                break;
              case 320:
                v10 = @"privateSearchSetType";
                objc_msgSend_setObject_forKey_(v6, v5, @"privateSearchSetType", @"type");
                break;
              case 321:
                v10 = @"privateSearchGetType";
                objc_msgSend_setObject_forKey_(v6, v5, @"privateSearchGetType", @"type");
                break;
              case 322:
                v10 = @"privateSearchDeleteType";
                objc_msgSend_setObject_forKey_(v6, v5, @"privateSearchDeleteType", @"type");
                break;
              default:
                goto LABEL_78;
            }
            break;
        }
        goto LABEL_79;
      }
      if (type <= 899)
      {
        switch(type)
        {
          case 800:
            v10 = @"pushRegisterType";
            objc_msgSend_setObject_forKey_(v6, v5, @"pushRegisterType", @"type");
            break;
          case 801:
            v10 = @"pushUnregisterType";
            objc_msgSend_setObject_forKey_(v6, v5, @"pushUnregisterType", @"type");
            break;
          case 802:
            v10 = @"pushBadgeType";
            objc_msgSend_setObject_forKey_(v6, v5, @"pushBadgeType", @"type");
            break;
          case 803:
            v10 = @"pushSyncType";
            objc_msgSend_setObject_forKey_(v6, v5, @"pushSyncType", @"type");
            break;
          case 804:
            v10 = @"pushReadType";
            objc_msgSend_setObject_forKey_(v6, v5, @"pushReadType", @"type");
            break;
          default:
            if (type == 503)
            {
              v10 = @"shareAcceptType";
              objc_msgSend_setObject_forKey_(v6, v5, @"shareAcceptType", @"type");
            }
            else
            {
              if (type != 513) {
                goto LABEL_78;
              }
              v10 = @"shareVettingInitiateType";
              objc_msgSend_setObject_forKey_(v6, v5, @"shareVettingInitiateType", @"type");
            }
            break;
        }
        goto LABEL_79;
      }
      switch(type)
      {
        case 900:
          v10 = @"archiveRecordsType";
          objc_msgSend_setObject_forKey_(v6, v5, @"archiveRecordsType", @"type");
          goto LABEL_79;
        case 901:
          v10 = @"datarepairMarkAssetBrokenType";
          objc_msgSend_setObject_forKey_(v6, v5, @"datarepairMarkAssetBrokenType", @"type");
          goto LABEL_79;
        case 1101:
          v10 = @"functionInvokeType";
          objc_msgSend_setObject_forKey_(v6, v5, @"functionInvokeType", @"type");
          goto LABEL_79;
      }
    }
LABEL_78:
    objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_type);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"type");
    goto LABEL_79;
  }
LABEL_80:
  if ((has & 4) != 0)
  {
    v12 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_synchronousMode);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"synchronousMode");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_last);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"last");
  }
  requestSignature = self->_requestSignature;
  if (requestSignature) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)requestSignature, @"requestSignature");
  }
  anonymousCKUserID = self->_anonymousCKUserID;
  if (anonymousCKUserID)
  {
    v18 = objc_msgSend_dictionaryRepresentation(anonymousCKUserID, v5, (uint64_t)requestSignature);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"anonymousCKUserID");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_operationUUID)
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_requestSignature)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_anonymousCKUserID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  operationUUID = self->_operationUUID;
  id v10 = v4;
  if (operationUUID)
  {
    objc_msgSend_setOperationUUID_(v4, v5, (uint64_t)operationUUID);
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((unsigned char *)v4 + 40) |= 1u;
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
  *((unsigned char *)v4 + 37) = self->_synchronousMode;
  *((unsigned char *)v4 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 36) = self->_last;
    *((unsigned char *)v4 + 40) |= 2u;
  }
LABEL_7:
  requestSignature = self->_requestSignature;
  if (requestSignature)
  {
    objc_msgSend_setRequestSignature_(v10, v5, (uint64_t)requestSignature);
    id v4 = v10;
  }
  anonymousCKUserID = self->_anonymousCKUserID;
  if (anonymousCKUserID)
  {
    objc_msgSend_setAnonymousCKUserID_(v10, v5, (uint64_t)anonymousCKUserID);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_operationUUID, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v10 + 37) = self->_synchronousMode;
    *(unsigned char *)(v10 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v10 + 32) = self->_type;
  *(unsigned char *)(v10 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(unsigned char *)(v10 + 36) = self->_last;
    *(unsigned char *)(v10 + 40) |= 2u;
  }
LABEL_5:
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_requestSignature, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_anonymousCKUserID, v18, (uint64_t)a3);
  v20 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v19;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_29;
  }
  operationUUID = self->_operationUUID;
  uint64_t v9 = v4[2];
  if ((unint64_t)operationUUID | v9)
  {
    if (!objc_msgSend_isEqual_(operationUUID, v7, v9)) {
      goto LABEL_29;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[5] & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if (v4[5])
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[5] & 4) == 0) {
      goto LABEL_29;
    }
    if (self->_synchronousMode)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_29;
    }
  }
  else if ((v4[5] & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[5] & 2) != 0)
    {
      if (self->_last)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_29;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_25;
      }
    }
LABEL_29:
    char isEqual = 0;
    goto LABEL_30;
  }
  if ((v4[5] & 2) != 0) {
    goto LABEL_29;
  }
LABEL_25:
  requestSignature = self->_requestSignature;
  uint64_t v11 = v4[3];
  if ((unint64_t)requestSignature | v11 && !objc_msgSend_isEqual_(requestSignature, v7, v11)) {
    goto LABEL_29;
  }
  anonymousCKUserID = self->_anonymousCKUserID;
  uint64_t v13 = v4[1];
  if ((unint64_t)anonymousCKUserID | v13) {
    char isEqual = objc_msgSend_isEqual_(anonymousCKUserID, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_30:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_operationUUID, a2, v2);
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
  uint64_t v7 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_synchronousMode;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_last;
LABEL_8:
  uint64_t v10 = v7 ^ v4 ^ v8 ^ v9 ^ objc_msgSend_hash(self->_requestSignature, v5, v6);
  return v10 ^ objc_msgSend_hash(self->_anonymousCKUserID, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 2);
  id v10 = v4;
  if (v5)
  {
    objc_msgSend_setOperationUUID_(self, (const char *)v4, v5);
    id v4 = v10;
  }
  char v6 = *((unsigned char *)v4 + 40);
  if (v6)
  {
    self->_int type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 40);
    if ((v6 & 4) == 0)
    {
LABEL_5:
      if ((v6 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_synchronousMode = *((unsigned char *)v4 + 37);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_6:
    self->_last = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  uint64_t v7 = *((void *)v4 + 3);
  if (v7)
  {
    objc_msgSend_setRequestSignature_(self, (const char *)v4, v7);
    id v4 = v10;
  }
  anonymousCKUserID = self->_anonymousCKUserID;
  uint64_t v9 = *((void *)v4 + 1);
  if (anonymousCKUserID)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(anonymousCKUserID, (const char *)v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setAnonymousCKUserID_(self, (const char *)v4, v9);
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)operationUUID
{
  return self->_operationUUID;
}

- (void)setOperationUUID:(id)a3
{
}

- (BOOL)synchronousMode
{
  return self->_synchronousMode;
}

- (BOOL)last
{
  return self->_last;
}

- (NSData)requestSignature
{
  return self->_requestSignature;
}

- (void)setRequestSignature:(id)a3
{
}

- (CKDPIdentifier)anonymousCKUserID
{
  return self->_anonymousCKUserID;
}

- (void)setAnonymousCKUserID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSignature, 0);
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong((id *)&self->_anonymousCKUserID, 0);
}

- (id)_typeCKLogValue
{
  uint64_t v3 = objc_msgSend_type(self, a2, v2);
  if ((int)v3 > 299)
  {
    if ((int)v3 <= 502)
    {
      switch((int)v3)
      {
        case 400:
          char v6 = @"userRetrieveType";
          uint64_t v7 = objc_msgSend_length(@"userRetrieveType", v4, v5);
          break;
        case 401:
          char v6 = @"userQueryType";
          uint64_t v7 = objc_msgSend_length(@"userQueryType", v4, v5);
          break;
        case 402:
          char v6 = @"userPrivacySettingsRetrieveType";
          uint64_t v7 = objc_msgSend_length(@"userPrivacySettingsRetrieveType", v4, v5);
          break;
        case 403:
          char v6 = @"userPrivacySettingsUpdateType";
          uint64_t v7 = objc_msgSend_length(@"userPrivacySettingsUpdateType", v4, v5);
          break;
        case 404:
          char v6 = @"userPrivacySettingsResetType";
          uint64_t v7 = objc_msgSend_length(@"userPrivacySettingsResetType", v4, v5);
          break;
        case 405:
          char v6 = @"userPrivacySettingsBatchLookup";
          uint64_t v7 = objc_msgSend_length(@"userPrivacySettingsBatchLookup", v4, v5);
          break;
        case 406:
          char v6 = @"sharePermissionSettingsUpdateType";
          uint64_t v7 = objc_msgSend_length(@"sharePermissionSettingsUpdateType", v4, v5);
          break;
        case 407:
          char v6 = @"adopterCapabilitiesSaveType";
          uint64_t v7 = objc_msgSend_length(@"adopterCapabilitiesSaveType", v4, v5);
          break;
        case 408:
          char v6 = @"adopterCapabilitiesCheckType";
          uint64_t v7 = objc_msgSend_length(@"adopterCapabilitiesCheckType", v4, v5);
          break;
        case 409:
          char v6 = @"zoneUsageSaveType";
          uint64_t v7 = objc_msgSend_length(@"zoneUsageSaveType", v4, v5);
          break;
        case 410:
          char v6 = @"shareUsageSaveType";
          uint64_t v7 = objc_msgSend_length(@"shareUsageSaveType", v4, v5);
          break;
        default:
          switch((int)v3)
          {
            case 300:
              char v6 = @"subscriptionCreateType";
              uint64_t v7 = objc_msgSend_length(@"subscriptionCreateType", v4, v5);
              break;
            case 301:
              char v6 = @"subscriptionRetrieveType";
              uint64_t v7 = objc_msgSend_length(@"subscriptionRetrieveType", v4, v5);
              break;
            case 302:
              char v6 = @"subscriptionDeleteType";
              uint64_t v7 = objc_msgSend_length(@"subscriptionDeleteType", v4, v5);
              break;
            case 311:
              char v6 = @"mergeableDeltaSaveType";
              uint64_t v7 = objc_msgSend_length(@"mergeableDeltaSaveType", v4, v5);
              break;
            case 312:
              char v6 = @"mergeableDeltaMetadataRetrieveType";
              uint64_t v7 = objc_msgSend_length(@"mergeableDeltaMetadataRetrieveType", v4, v5);
              break;
            case 313:
              char v6 = @"mergeableDeltaReplaceType";
              uint64_t v7 = objc_msgSend_length(@"mergeableDeltaReplaceType", v4, v5);
              break;
            case 314:
              char v6 = @"mergeableDeltaRetrieveType";
              uint64_t v7 = objc_msgSend_length(@"mergeableDeltaRetrieveType", v4, v5);
              break;
            case 320:
              char v6 = @"privateSearchSetType";
              uint64_t v7 = objc_msgSend_length(@"privateSearchSetType", v4, v5);
              break;
            case 321:
              char v6 = @"privateSearchGetType";
              uint64_t v7 = objc_msgSend_length(@"privateSearchGetType", v4, v5);
              break;
            case 322:
              char v6 = @"privateSearchDeleteType";
              uint64_t v7 = objc_msgSend_length(@"privateSearchDeleteType", v4, v5);
              break;
            default:
              goto LABEL_75;
          }
          break;
      }
      goto LABEL_76;
    }
    if ((int)v3 <= 899)
    {
      switch((int)v3)
      {
        case 800:
          char v6 = @"pushRegisterType";
          uint64_t v7 = objc_msgSend_length(@"pushRegisterType", v4, v5);
          break;
        case 801:
          char v6 = @"pushUnregisterType";
          uint64_t v7 = objc_msgSend_length(@"pushUnregisterType", v4, v5);
          break;
        case 802:
          char v6 = @"pushBadgeType";
          uint64_t v7 = objc_msgSend_length(@"pushBadgeType", v4, v5);
          break;
        case 803:
          char v6 = @"pushSyncType";
          uint64_t v7 = objc_msgSend_length(@"pushSyncType", v4, v5);
          break;
        case 804:
          char v6 = @"pushReadType";
          uint64_t v7 = objc_msgSend_length(@"pushReadType", v4, v5);
          break;
        default:
          if (v3 == 503)
          {
            char v6 = @"shareAcceptType";
            uint64_t v7 = objc_msgSend_length(@"shareAcceptType", v4, v5);
          }
          else
          {
            if (v3 != 513) {
              goto LABEL_75;
            }
            char v6 = @"shareVettingInitiateType";
            uint64_t v7 = objc_msgSend_length(@"shareVettingInitiateType", v4, v5);
          }
          break;
      }
      goto LABEL_76;
    }
    switch(v3)
    {
      case 0x384:
        char v6 = @"archiveRecordsType";
        uint64_t v7 = objc_msgSend_length(@"archiveRecordsType", v4, v5);
        goto LABEL_76;
      case 0x385:
        char v6 = @"datarepairMarkAssetBrokenType";
        uint64_t v7 = objc_msgSend_length(@"datarepairMarkAssetBrokenType", v4, v5);
        goto LABEL_76;
      case 0x44D:
        char v6 = @"functionInvokeType";
        uint64_t v7 = objc_msgSend_length(@"functionInvokeType", v4, v5);
        goto LABEL_76;
    }
LABEL_75:
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend_length(v6, v9, v10);
    goto LABEL_76;
  }
  if ((int)v3 > 249)
  {
    if ((int)v3 > 269)
    {
      if (v3 == 270)
      {
        char v6 = @"addAnonymousShareType";
        uint64_t v7 = objc_msgSend_length(@"addAnonymousShareType", v4, v5);
        goto LABEL_76;
      }
      if (v3 == 271)
      {
        char v6 = @"removeAnonymousShareType";
        uint64_t v7 = objc_msgSend_length(@"removeAnonymousShareType", v4, v5);
        goto LABEL_76;
      }
    }
    else
    {
      if (v3 == 250)
      {
        char v6 = @"webAuthTokenRetrieveType";
        uint64_t v7 = objc_msgSend_length(@"webAuthTokenRetrieveType", v4, v5);
        goto LABEL_76;
      }
      if (v3 == 260)
      {
        char v6 = @"dataRepairUpdateMissingAssetStatusType";
        uint64_t v7 = objc_msgSend_length(@"dataRepairUpdateMissingAssetStatusType", v4, v5);
        goto LABEL_76;
      }
    }
    goto LABEL_75;
  }
  switch((int)v3)
  {
    case 200:
      char v6 = @"zoneSaveType";
      uint64_t v7 = objc_msgSend_length(@"zoneSaveType", v4, v5);
      break;
    case 201:
      char v6 = @"zoneRetrieveType";
      uint64_t v7 = objc_msgSend_length(@"zoneRetrieveType", v4, v5);
      break;
    case 202:
      char v6 = @"zoneDeleteType";
      uint64_t v7 = objc_msgSend_length(@"zoneDeleteType", v4, v5);
      break;
    case 203:
      char v6 = @"zoneRetrieveChangesType";
      uint64_t v7 = objc_msgSend_length(@"zoneRetrieveChangesType", v4, v5);
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
      goto LABEL_75;
    case 210:
      char v6 = @"recordSaveType";
      uint64_t v7 = objc_msgSend_length(@"recordSaveType", v4, v5);
      break;
    case 211:
      char v6 = @"recordRetrieveType";
      uint64_t v7 = objc_msgSend_length(@"recordRetrieveType", v4, v5);
      break;
    case 212:
      char v6 = @"recordRetrieveVersionsType";
      uint64_t v7 = objc_msgSend_length(@"recordRetrieveVersionsType", v4, v5);
      break;
    case 213:
      char v6 = @"recordRetrieveChangesType";
      uint64_t v7 = objc_msgSend_length(@"recordRetrieveChangesType", v4, v5);
      break;
    case 214:
      char v6 = @"recordDeleteType";
      uint64_t v7 = objc_msgSend_length(@"recordDeleteType", v4, v5);
      break;
    case 216:
      char v6 = @"recordResolveTokenType";
      uint64_t v7 = objc_msgSend_length(@"recordResolveTokenType", v4, v5);
      break;
    case 217:
      char v6 = @"fetchArchivedRecordsType";
      uint64_t v7 = objc_msgSend_length(@"fetchArchivedRecordsType", v4, v5);
      break;
    case 218:
      char v6 = @"recordMoveType";
      uint64_t v7 = objc_msgSend_length(@"recordMoveType", v4, v5);
      break;
    case 219:
      char v6 = @"shareAccessType";
      uint64_t v7 = objc_msgSend_length(@"shareAccessType", v4, v5);
      break;
    case 220:
      char v6 = @"queryRetrieveType";
      uint64_t v7 = objc_msgSend_length(@"queryRetrieveType", v4, v5);
      break;
    case 221:
      char v6 = @"shareDeclineType";
      uint64_t v7 = objc_msgSend_length(@"shareDeclineType", v4, v5);
      break;
    case 230:
      char v6 = @"assetUploadTokenRetrieveType";
      uint64_t v7 = objc_msgSend_length(@"assetUploadTokenRetrieveType", v4, v5);
      break;
    case 240:
      char v6 = @"containerDeleteType";
      uint64_t v7 = objc_msgSend_length(@"containerDeleteType", v4, v5);
      break;
    case 243:
      char v6 = @"userAvailableQuotaType";
      uint64_t v7 = objc_msgSend_length(@"userAvailableQuotaType", v4, v5);
      break;
    case 244:
      char v6 = @"containerGetBundlesType";
      uint64_t v7 = objc_msgSend_length(@"containerGetBundlesType", v4, v5);
      break;
    default:
      if (v3) {
        goto LABEL_75;
      }
      char v6 = @"noneType";
      uint64_t v7 = objc_msgSend_length(@"noneType", v4, v5);
      break;
  }
LABEL_76:
  uint64_t v11 = objc_msgSend_substringToIndex_(v6, v8, v7 - 4);

  return v11;
}

@end