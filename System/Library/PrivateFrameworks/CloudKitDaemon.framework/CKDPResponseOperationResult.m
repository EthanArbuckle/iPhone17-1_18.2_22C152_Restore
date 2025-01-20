@interface CKDPResponseOperationResult
- (BOOL)hasCode;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPResponseOperationResultError)error;
- (id)codeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCode:(id)a3;
- (int)code;
- (unint64_t)hash;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setError:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationResult

- (int)code
{
  if (*(unsigned char *)&self->_has) {
    return self->_code;
  }
  else {
    return 1;
  }
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)codeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
  }
  else
  {
    v3 = (void *)*((void *)&off_1E64F1EC0 + a3 - 1);
  }
  return v3;
}

- (int)StringAsCode:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"success"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"partial"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"failure"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"indeterminate"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResult;
  v4 = [(CKDPResponseOperationResult *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    int v7 = self->_code - 1;
    if (v7 >= 4)
    {
      v8 = objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_code);
    }
    else
    {
      v8 = (void *)*((void *)&off_1E64F1EC0 + v7);
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v8, @"code");
  }
  error = self->_error;
  if (error)
  {
    v10 = objc_msgSend_dictionaryRepresentation(error, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"error");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_code;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  error = self->_error;
  if (error)
  {
    int v7 = v4;
    objc_msgSend_setError_(v4, v5, (uint64_t)error);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  int v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 8) = self->_code;
    *(unsigned char *)(v10 + 24) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_error, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[3] & 1) == 0 || self->_code != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (v4[3])
  {
LABEL_9:
    char isEqual = 0;
    goto LABEL_10;
  }
  error = self->_error;
  uint64_t v9 = v4[2];
  if ((unint64_t)error | v9) {
    char isEqual = objc_msgSend_isEqual_(error, v7, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_code;
  }
  else {
    uint64_t v3 = 0;
  }
  return objc_msgSend_hash(self->_error, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (const char *)a3;
  uint64_t v5 = v4;
  if (v4[24])
  {
    self->_code = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  error = self->_error;
  uint64_t v7 = *((void *)v5 + 2);
  if (error)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(error, v5, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setError_(self, v5, v7);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPResponseOperationResultError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  id v21 = a3;
  switch(objc_msgSend_code(self, v6, v7))
  {
    case 1u:
      uint64_t v13 = @"success";
      objc_msgSend_writeString_(v21, v8, @"success");
      break;
    case 2u:
    case 4u:
      uint64_t v10 = objc_msgSend_code(self, v8, v9);
      if ((v10 - 1) >= 4)
      {
        objc_msgSend_stringWithFormat_(NSString, v11, @"(unknown: %i)", v10);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E64F4E80[(int)v10 - 1];
      }
      objc_msgSend_stringByAppendingString_(v12, v11, @" failure");
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_writeString_(v21, v16, (uint64_t)v13);
      break;
    case 3u:
      uint64_t v13 = @"failure";
      objc_msgSend_writeString_(v21, v8, @"failure");
      break;
    default:
      uint64_t v13 = 0;
      objc_msgSend_writeString_(v21, v8, 0);
      break;
  }
  if (objc_msgSend_hasError(self, v14, v15))
  {
    v19 = objc_msgSend_error(self, v17, v18);
    objc_msgSend__CKLogToFileHandle_atDepth_(v19, v20, (uint64_t)v21, (a4 + 1));
  }
}

@end