@interface CKDPResponseOperationResultError
- (BOOL)hasAuxiliaryError;
- (BOOL)hasClientError;
- (BOOL)hasErrorDescription;
- (BOOL)hasErrorInternal;
- (BOOL)hasErrorKey;
- (BOOL)hasExtensionError;
- (BOOL)hasRetryAfterSeconds;
- (BOOL)hasServerError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPResponseOperationResultErrorAuxiliaryError)auxiliaryError;
- (CKDPResponseOperationResultErrorClient)clientError;
- (CKDPResponseOperationResultErrorExtension)extensionError;
- (CKDPResponseOperationResultErrorServer)serverError;
- (NSString)errorDescription;
- (NSString)errorInternal;
- (NSString)errorKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)retryAfterSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuxiliaryError:(id)a3;
- (void)setClientError:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorInternal:(id)a3;
- (void)setErrorKey:(id)a3;
- (void)setExtensionError:(id)a3;
- (void)setHasRetryAfterSeconds:(BOOL)a3;
- (void)setRetryAfterSeconds:(int)a3;
- (void)setServerError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationResultError

- (BOOL)hasClientError
{
  return self->_clientError != 0;
}

- (BOOL)hasServerError
{
  return self->_serverError != 0;
}

- (BOOL)hasExtensionError
{
  return self->_extensionError != 0;
}

- (BOOL)hasAuxiliaryError
{
  return self->_auxiliaryError != 0;
}

- (void)setRetryAfterSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_retryAfterSeconds = a3;
}

- (void)setHasRetryAfterSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRetryAfterSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)hasErrorKey
{
  return self->_errorKey != 0;
}

- (BOOL)hasErrorInternal
{
  return self->_errorInternal != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResultError;
  v4 = [(CKDPResponseOperationResultError *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  clientError = self->_clientError;
  if (clientError)
  {
    v8 = objc_msgSend_dictionaryRepresentation(clientError, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"clientError");
  }
  serverError = self->_serverError;
  if (serverError)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(serverError, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"serverError");
  }
  extensionError = self->_extensionError;
  if (extensionError)
  {
    v14 = objc_msgSend_dictionaryRepresentation(extensionError, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"extensionError");
  }
  auxiliaryError = self->_auxiliaryError;
  if (auxiliaryError)
  {
    v17 = objc_msgSend_dictionaryRepresentation(auxiliaryError, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"auxiliaryError");
  }
  if (*(unsigned char *)&self->_has)
  {
    v19 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_retryAfterSeconds);
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, @"retryAfterSeconds");
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)errorDescription, @"errorDescription");
  }
  errorKey = self->_errorKey;
  if (errorKey) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)errorKey, @"errorKey");
  }
  errorInternal = self->_errorInternal;
  if (errorInternal) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)errorInternal, @"errorInternal");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_serverError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorInternal)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_extensionError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_auxiliaryError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  clientError = self->_clientError;
  id v13 = v4;
  if (clientError)
  {
    objc_msgSend_setClientError_(v4, v5, (uint64_t)clientError);
    id v4 = v13;
  }
  serverError = self->_serverError;
  if (serverError)
  {
    objc_msgSend_setServerError_(v13, v5, (uint64_t)serverError);
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 14) = self->_retryAfterSeconds;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
  {
    objc_msgSend_setErrorDescription_(v13, v5, (uint64_t)errorDescription);
    id v4 = v13;
  }
  errorKey = self->_errorKey;
  if (errorKey)
  {
    objc_msgSend_setErrorKey_(v13, v5, (uint64_t)errorKey);
    id v4 = v13;
  }
  errorInternal = self->_errorInternal;
  if (errorInternal)
  {
    objc_msgSend_setErrorInternal_(v13, v5, (uint64_t)errorInternal);
    id v4 = v13;
  }
  extensionError = self->_extensionError;
  if (extensionError)
  {
    objc_msgSend_setExtensionError_(v13, v5, (uint64_t)extensionError);
    id v4 = v13;
  }
  auxiliaryError = self->_auxiliaryError;
  if (auxiliaryError)
  {
    objc_msgSend_setAuxiliaryError_(v13, v5, (uint64_t)auxiliaryError);
    id v4 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_clientError, v11, (uint64_t)a3);
  id v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_serverError, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 56) = self->_retryAfterSeconds;
    *(unsigned char *)(v10 + 72) |= 1u;
  }
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_errorDescription, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_errorKey, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_errorInternal, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_extensionError, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v27;

  uint64_t v30 = objc_msgSend_copyWithZone_(self->_auxiliaryError, v29, (uint64_t)a3);
  v31 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v30;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_21;
  }
  clientError = self->_clientError;
  uint64_t v9 = v4[2];
  if ((unint64_t)clientError | v9)
  {
    if (!objc_msgSend_isEqual_(clientError, v7, v9)) {
      goto LABEL_21;
    }
  }
  serverError = self->_serverError;
  uint64_t v11 = v4[8];
  if ((unint64_t)serverError | v11)
  {
    if (!objc_msgSend_isEqual_(serverError, v7, v11)) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[9] & 1) == 0 || self->_retryAfterSeconds != *((_DWORD *)v4 + 14)) {
      goto LABEL_21;
    }
  }
  else if (v4[9])
  {
LABEL_21:
    char isEqual = 0;
    goto LABEL_22;
  }
  errorDescription = self->_errorDescription;
  uint64_t v13 = v4[3];
  if ((unint64_t)errorDescription | v13 && !objc_msgSend_isEqual_(errorDescription, v7, v13)) {
    goto LABEL_21;
  }
  errorKey = self->_errorKey;
  uint64_t v15 = v4[5];
  if ((unint64_t)errorKey | v15)
  {
    if (!objc_msgSend_isEqual_(errorKey, v7, v15)) {
      goto LABEL_21;
    }
  }
  errorInternal = self->_errorInternal;
  uint64_t v17 = v4[4];
  if ((unint64_t)errorInternal | v17)
  {
    if (!objc_msgSend_isEqual_(errorInternal, v7, v17)) {
      goto LABEL_21;
    }
  }
  extensionError = self->_extensionError;
  uint64_t v19 = v4[6];
  if ((unint64_t)extensionError | v19)
  {
    if (!objc_msgSend_isEqual_(extensionError, v7, v19)) {
      goto LABEL_21;
    }
  }
  auxiliaryError = self->_auxiliaryError;
  uint64_t v21 = v4[1];
  if ((unint64_t)auxiliaryError | v21) {
    char isEqual = objc_msgSend_isEqual_(auxiliaryError, v7, v21);
  }
  else {
    char isEqual = 1;
  }
LABEL_22:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_clientError, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_serverError, v5, v6);
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_retryAfterSeconds;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v7 ^ v4 ^ v10 ^ objc_msgSend_hash(self->_errorDescription, v8, v9);
  uint64_t v14 = objc_msgSend_hash(self->_errorKey, v12, v13);
  uint64_t v17 = v14 ^ objc_msgSend_hash(self->_errorInternal, v15, v16);
  uint64_t v20 = v11 ^ v17 ^ objc_msgSend_hash(self->_extensionError, v18, v19);
  return v20 ^ objc_msgSend_hash(self->_auxiliaryError, v21, v22);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  clientError = self->_clientError;
  uint64_t v6 = *((void *)v4 + 2);
  id v16 = v4;
  if (clientError)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(clientError, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setClientError_(self, (const char *)v4, v6);
  }
  id v4 = v16;
LABEL_7:
  serverError = self->_serverError;
  uint64_t v8 = *((void *)v4 + 8);
  if (serverError)
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(serverError, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_setServerError_(self, (const char *)v4, v8);
  }
  id v4 = v16;
LABEL_13:
  if (*((unsigned char *)v4 + 72))
  {
    self->_retryAfterSeconds = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v9 = *((void *)v4 + 3);
  if (v9)
  {
    objc_msgSend_setErrorDescription_(self, (const char *)v4, v9);
    id v4 = v16;
  }
  uint64_t v10 = *((void *)v4 + 5);
  if (v10)
  {
    objc_msgSend_setErrorKey_(self, (const char *)v4, v10);
    id v4 = v16;
  }
  uint64_t v11 = *((void *)v4 + 4);
  if (v11)
  {
    objc_msgSend_setErrorInternal_(self, (const char *)v4, v11);
    id v4 = v16;
  }
  extensionError = self->_extensionError;
  uint64_t v13 = *((void *)v4 + 6);
  if (extensionError)
  {
    if (!v13) {
      goto LABEL_27;
    }
    objc_msgSend_mergeFrom_(extensionError, (const char *)v4, v13);
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    objc_msgSend_setExtensionError_(self, (const char *)v4, v13);
  }
  id v4 = v16;
LABEL_27:
  auxiliaryError = self->_auxiliaryError;
  uint64_t v15 = *((void *)v4 + 1);
  if (auxiliaryError)
  {
    if (v15) {
      objc_msgSend_mergeFrom_(auxiliaryError, (const char *)v4, v15);
    }
  }
  else if (v15)
  {
    objc_msgSend_setAuxiliaryError_(self, (const char *)v4, v15);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPResponseOperationResultErrorClient)clientError
{
  return self->_clientError;
}

- (void)setClientError:(id)a3
{
}

- (CKDPResponseOperationResultErrorServer)serverError
{
  return self->_serverError;
}

- (void)setServerError:(id)a3
{
}

- (CKDPResponseOperationResultErrorExtension)extensionError
{
  return self->_extensionError;
}

- (void)setExtensionError:(id)a3
{
}

- (CKDPResponseOperationResultErrorAuxiliaryError)auxiliaryError
{
  return self->_auxiliaryError;
}

- (void)setAuxiliaryError:(id)a3
{
}

- (int)retryAfterSeconds
{
  return self->_retryAfterSeconds;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)errorKey
{
  return self->_errorKey;
}

- (void)setErrorKey:(id)a3
{
}

- (NSString)errorInternal
{
  return self->_errorInternal;
}

- (void)setErrorInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverError, 0);
  objc_storeStrong((id *)&self->_extensionError, 0);
  objc_storeStrong((id *)&self->_errorKey, 0);
  objc_storeStrong((id *)&self->_errorInternal, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_clientError, 0);
  objc_storeStrong((id *)&self->_auxiliaryError, 0);
}

@end