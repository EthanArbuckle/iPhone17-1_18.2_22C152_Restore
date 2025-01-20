@interface LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers
- (BOOL)hasTrialDeploymentID;
- (BOOL)hasTrialTaskID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)trialDeploymentID;
- (NSString)trialTaskID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTrialDeploymentID:(id)a3;
- (void)setTrialTaskID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers

- (BOOL)hasTrialTaskID
{
  return self->_trialTaskID != 0;
}

- (BOOL)hasTrialDeploymentID
{
  return self->_trialDeploymentID != 0;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers;
  v4 = [(LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *)&v15 description];
  v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  v9 = v6;
  trialTaskID = self->_trialTaskID;
  if (trialTaskID) {
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)trialTaskID, @"trialTaskID", v8);
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID) {
    objc_msgSend_setObject_forKey_(v9, v7, (uint64_t)trialDeploymentID, @"trialDeploymentID", v8);
  }
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_trialTaskID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_trialDeploymentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  trialTaskID = self->_trialTaskID;
  id v10 = v4;
  if (trialTaskID)
  {
    objc_msgSend_setTrialTaskID_(v4, v5, (uint64_t)trialTaskID, v6, v7);
    id v4 = v10;
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID)
  {
    objc_msgSend_setTrialDeploymentID_(v10, v5, (uint64_t)trialDeploymentID, v6, v7);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_trialTaskID, v15, (uint64_t)a3, v16, v17);
  v19 = (void *)v14[2];
  v14[2] = v18;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_trialDeploymentID, v20, (uint64_t)a3, v21, v22);
  v24 = (void *)v14[1];
  v14[1] = v23;

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)
    && ((trialTaskID = self->_trialTaskID, uint64_t v13 = v4[2], !((unint64_t)trialTaskID | v13))
     || objc_msgSend_isEqual_(trialTaskID, v9, v13, v10, v11)))
  {
    trialDeploymentID = self->_trialDeploymentID;
    uint64_t v15 = v4[1];
    if ((unint64_t)trialDeploymentID | v15) {
      char isEqual = objc_msgSend_isEqual_(trialDeploymentID, v9, v15, v10, v11);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_trialTaskID, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_trialDeploymentID, v7, v8, v9, v10) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v8 = v4[2];
  uint64_t v10 = v4;
  if (v8)
  {
    objc_msgSend_setTrialTaskID_(self, v5, v8, v6, v7);
    uint64_t v4 = v10;
  }
  uint64_t v9 = v4[1];
  if (v9)
  {
    objc_msgSend_setTrialDeploymentID_(self, v5, v9, v6, v7);
    uint64_t v4 = v10;
  }
}

- (NSString)trialTaskID
{
  return self->_trialTaskID;
}

- (void)setTrialTaskID:(id)a3
{
}

- (NSString)trialDeploymentID
{
  return self->_trialDeploymentID;
}

- (void)setTrialDeploymentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTaskID, 0);
  objc_storeStrong((id *)&self->_trialDeploymentID, 0);
}

@end