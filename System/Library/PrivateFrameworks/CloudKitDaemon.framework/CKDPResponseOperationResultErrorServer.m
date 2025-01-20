@interface CKDPResponseOperationResultErrorServer
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationResultErrorServer

- (id)_typeCKLogValue
{
  uint64_t v4 = objc_msgSend_type(self, a2, v2);
  v5 = @"unknown";
  switch((int)v4)
  {
    case 1:
      break;
    case 2:
      v5 = @"overloaded";
      break;
    case 3:
      v5 = @"notFound";
      break;
    case 4:
      v5 = @"containerUnavailable";
      break;
    case 5:
LABEL_5:
      objc_msgSend_stringWithFormat_(NSString, v3, @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      v5 = @"mescalSignatureParseError";
      break;
    case 7:
      v5 = @"zoneBusy";
      break;
    case 8:
      v5 = @"zoneUnavailable";
      break;
    case 9:
      v5 = @"transactionTimeout";
      break;
    default:
      switch((int)v4)
      {
        case 200001:
          v5 = @"partitionLookupFailed";
          break;
        case 200002:
          v5 = @"timeoutOnInternalBackends";
          break;
        case 200003:
          v5 = @"solrError";
          break;
        case 200004:
          v5 = @"userAssignmentLocked";
          break;
        case 200005:
          v5 = @"quotaServiceUnavailable";
          break;
        default:
          goto LABEL_5;
      }
      break;
  }
  return v5;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
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
  uint64_t v4 = @"unknown";
  switch(a3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      uint64_t v4 = @"overloaded";
      break;
    case 3:
      uint64_t v4 = @"notFound";
      break;
    case 4:
      uint64_t v4 = @"containerUnavailable";
      break;
    case 5:
LABEL_9:
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      break;
    case 6:
      uint64_t v4 = @"mescalSignatureParseError";
      break;
    case 7:
      uint64_t v4 = @"zoneBusy";
      break;
    case 8:
      uint64_t v4 = @"zoneUnavailable";
      break;
    case 9:
      uint64_t v4 = @"transactionTimeout";
      break;
    default:
      switch(a3)
      {
        case 200001:
          uint64_t v4 = @"partitionLookupFailed";
          break;
        case 200002:
          uint64_t v4 = @"timeoutOnInternalBackends";
          break;
        case 200003:
          uint64_t v4 = @"solrError";
          break;
        case 200004:
          uint64_t v4 = @"userAssignmentLocked";
          break;
        case 200005:
          uint64_t v4 = @"quotaServiceUnavailable";
          break;
        default:
          goto LABEL_9;
      }
      break;
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"unknown"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"overloaded"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"notFound"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"containerUnavailable"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"mescalSignatureParseError"))
  {
    int v6 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"zoneBusy"))
  {
    int v6 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"zoneUnavailable"))
  {
    int v6 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v3, v12, @"transactionTimeout"))
  {
    int v6 = 9;
  }
  else
  {
    int v6 = 200001;
    if ((objc_msgSend_isEqualToString_(v3, v13, @"partitionLookupFailed") & 1) == 0)
    {
      if (objc_msgSend_isEqualToString_(v3, v14, @"timeoutOnInternalBackends"))
      {
        int v6 = 200002;
      }
      else if (objc_msgSend_isEqualToString_(v3, v15, @"solrError"))
      {
        int v6 = 200003;
      }
      else if (objc_msgSend_isEqualToString_(v3, v16, @"userAssignmentLocked"))
      {
        int v6 = 200004;
      }
      else if (objc_msgSend_isEqualToString_(v3, v17, @"quotaServiceUnavailable"))
      {
        int v6 = 200005;
      }
      else
      {
        int v6 = 1;
      }
    }
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResultErrorServer;
  uint64_t v4 = [(CKDPResponseOperationResultErrorServer *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    v7 = @"unknown";
    switch((int)type)
    {
      case 1:
LABEL_17:
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, @"type");
        break;
      case 2:
        v7 = @"overloaded";
        objc_msgSend_setObject_forKey_(v5, v4, @"overloaded", @"type");
        break;
      case 3:
        v7 = @"notFound";
        objc_msgSend_setObject_forKey_(v5, v4, @"notFound", @"type");
        break;
      case 4:
        v7 = @"containerUnavailable";
        objc_msgSend_setObject_forKey_(v5, v4, @"containerUnavailable", @"type");
        break;
      case 5:
LABEL_6:
        objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", type);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"type");
        break;
      case 6:
        v7 = @"mescalSignatureParseError";
        objc_msgSend_setObject_forKey_(v5, v4, @"mescalSignatureParseError", @"type");
        break;
      case 7:
        v7 = @"zoneBusy";
        objc_msgSend_setObject_forKey_(v5, v4, @"zoneBusy", @"type");
        break;
      case 8:
        v7 = @"zoneUnavailable";
        objc_msgSend_setObject_forKey_(v5, v4, @"zoneUnavailable", @"type");
        break;
      case 9:
        v7 = @"transactionTimeout";
        objc_msgSend_setObject_forKey_(v5, v4, @"transactionTimeout", @"type");
        break;
      default:
        switch((int)type)
        {
          case 200001:
            v7 = @"partitionLookupFailed";
            objc_msgSend_setObject_forKey_(v5, v4, @"partitionLookupFailed", @"type");
            break;
          case 200002:
            v7 = @"timeoutOnInternalBackends";
            objc_msgSend_setObject_forKey_(v5, v4, @"timeoutOnInternalBackends", @"type");
            break;
          case 200003:
            v7 = @"solrError";
            objc_msgSend_setObject_forKey_(v5, v4, @"solrError", @"type");
            break;
          case 200004:
            v7 = @"userAssignmentLocked";
            objc_msgSend_setObject_forKey_(v5, v4, @"userAssignmentLocked", @"type");
            break;
          case 200005:
            v7 = @"quotaServiceUnavailable";
            goto LABEL_17;
          default:
            goto LABEL_6;
        }
        break;
    }
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorServerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_type;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_type;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_6;
  }
  BOOL v7 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_type == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v7 = 0;
  }
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_type;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t type = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end