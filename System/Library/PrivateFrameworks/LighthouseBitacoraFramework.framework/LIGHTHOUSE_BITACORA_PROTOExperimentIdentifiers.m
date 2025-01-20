@interface LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers
- (BOOL)hasTrialDeploymentID;
- (BOOL)hasTrialExperimentID;
- (BOOL)hasTrialTreatmentID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)trialDeploymentID;
- (NSString)trialExperimentID;
- (NSString)trialTreatmentID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTrialDeploymentID:(id)a3;
- (void)setTrialExperimentID:(id)a3;
- (void)setTrialTreatmentID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers

- (BOOL)hasTrialExperimentID
{
  return self->_trialExperimentID != 0;
}

- (BOOL)hasTrialDeploymentID
{
  return self->_trialDeploymentID != 0;
}

- (BOOL)hasTrialTreatmentID
{
  return self->_trialTreatmentID != 0;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers;
  v4 = [(LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *)&v15 description];
  v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  v9 = v6;
  trialExperimentID = self->_trialExperimentID;
  if (trialExperimentID) {
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)trialExperimentID, @"trialExperimentID", v8);
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID) {
    objc_msgSend_setObject_forKey_(v9, v7, (uint64_t)trialDeploymentID, @"trialDeploymentID", v8);
  }
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID) {
    objc_msgSend_setObject_forKey_(v9, v7, (uint64_t)trialTreatmentID, @"trialTreatmentID", v8);
  }
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_trialExperimentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_trialDeploymentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_trialTreatmentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  trialExperimentID = self->_trialExperimentID;
  id v11 = v4;
  if (trialExperimentID)
  {
    objc_msgSend_setTrialExperimentID_(v4, v5, (uint64_t)trialExperimentID, v6, v7);
    id v4 = v11;
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID)
  {
    objc_msgSend_setTrialDeploymentID_(v11, v5, (uint64_t)trialDeploymentID, v6, v7);
    id v4 = v11;
  }
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID)
  {
    objc_msgSend_setTrialTreatmentID_(v11, v5, (uint64_t)trialTreatmentID, v6, v7);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_trialExperimentID, v15, (uint64_t)a3, v16, v17);
  v19 = (void *)v14[2];
  v14[2] = v18;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_trialDeploymentID, v20, (uint64_t)a3, v21, v22);
  v24 = (void *)v14[1];
  v14[1] = v23;

  uint64_t v28 = objc_msgSend_copyWithZone_(self->_trialTreatmentID, v25, (uint64_t)a3, v26, v27);
  v29 = (void *)v14[3];
  v14[3] = v28;

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)
    && ((trialExperimentID = self->_trialExperimentID, uint64_t v13 = v4[2], !((unint64_t)trialExperimentID | v13))
     || objc_msgSend_isEqual_(trialExperimentID, v9, v13, v10, v11))
    && ((trialDeploymentID = self->_trialDeploymentID, uint64_t v15 = v4[1], !((unint64_t)trialDeploymentID | v15))
     || objc_msgSend_isEqual_(trialDeploymentID, v9, v15, v10, v11)))
  {
    trialTreatmentID = self->_trialTreatmentID;
    uint64_t v17 = v4[3];
    if ((unint64_t)trialTreatmentID | v17) {
      char isEqual = objc_msgSend_isEqual_(trialTreatmentID, v9, v17, v10, v11);
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
  uint64_t v6 = objc_msgSend_hash(self->_trialExperimentID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_trialDeploymentID, v7, v8, v9, v10) ^ v6;
  return v11 ^ objc_msgSend_hash(self->_trialTreatmentID, v12, v13, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v10 = a3;
  uint64_t v7 = v10[2];
  if (v7) {
    objc_msgSend_setTrialExperimentID_(self, v4, v7, v5, v6);
  }
  uint64_t v8 = v10[1];
  if (v8) {
    objc_msgSend_setTrialDeploymentID_(self, v4, v8, v5, v6);
  }
  uint64_t v9 = v10[3];
  if (v9) {
    objc_msgSend_setTrialTreatmentID_(self, v4, v9, v5, v6);
  }
}

- (NSString)trialExperimentID
{
  return self->_trialExperimentID;
}

- (void)setTrialExperimentID:(id)a3
{
}

- (NSString)trialDeploymentID
{
  return self->_trialDeploymentID;
}

- (void)setTrialDeploymentID:(id)a3
{
}

- (NSString)trialTreatmentID
{
  return self->_trialTreatmentID;
}

- (void)setTrialTreatmentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialDeploymentID, 0);
}

@end