@interface LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers
- (BOOL)hasBmltIdentifiers;
- (BOOL)hasExperimentIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers)bmltIdentifiers;
- (LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers)experimentIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBmltIdentifiers:(id)a3;
- (void)setExperimentIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers

- (BOOL)hasExperimentIdentifiers
{
  return self->_experimentIdentifiers != 0;
}

- (BOOL)hasBmltIdentifiers
{
  return self->_bmltIdentifiers != 0;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers;
  v4 = [(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *)&v15 description];
  v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  experimentIdentifiers = self->_experimentIdentifiers;
  if (experimentIdentifiers)
  {
    uint64_t v12 = objc_msgSend_dictionaryRepresentation(experimentIdentifiers, v6, v7, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v13, (uint64_t)v12, @"experimentIdentifiers", v14);
  }
  bmltIdentifiers = self->_bmltIdentifiers;
  if (bmltIdentifiers)
  {
    v16 = objc_msgSend_dictionaryRepresentation(bmltIdentifiers, v6, v7, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v17, (uint64_t)v16, @"bmltIdentifiers", v18);
  }
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_experimentIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bmltIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  experimentIdentifiers = self->_experimentIdentifiers;
  id v10 = v4;
  if (experimentIdentifiers)
  {
    objc_msgSend_setExperimentIdentifiers_(v4, v5, (uint64_t)experimentIdentifiers, v6, v7);
    id v4 = v10;
  }
  bmltIdentifiers = self->_bmltIdentifiers;
  if (bmltIdentifiers)
  {
    objc_msgSend_setBmltIdentifiers_(v10, v5, (uint64_t)bmltIdentifiers, v6, v7);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_experimentIdentifiers, v15, (uint64_t)a3, v16, v17);
  v19 = (void *)v14[2];
  v14[2] = v18;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_bmltIdentifiers, v20, (uint64_t)a3, v21, v22);
  v24 = (void *)v14[1];
  v14[1] = v23;

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)
    && ((experimentIdentifiers = self->_experimentIdentifiers,
         uint64_t v13 = v4[2],
         !((unint64_t)experimentIdentifiers | v13))
     || objc_msgSend_isEqual_(experimentIdentifiers, v9, v13, v10, v11)))
  {
    bmltIdentifiers = self->_bmltIdentifiers;
    uint64_t v15 = v4[1];
    if ((unint64_t)bmltIdentifiers | v15) {
      char isEqual = objc_msgSend_isEqual_(bmltIdentifiers, v9, v15, v10, v11);
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
  uint64_t v6 = objc_msgSend_hash(self->_experimentIdentifiers, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_bmltIdentifiers, v7, v8, v9, v10) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  experimentIdentifiers = self->_experimentIdentifiers;
  uint64_t v8 = v4[2];
  uint64_t v11 = v4;
  if (experimentIdentifiers)
  {
    if (!v8) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(experimentIdentifiers, (const char *)v4, v8, v5, v6);
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    objc_msgSend_setExperimentIdentifiers_(self, (const char *)v4, v8, v5, v6);
  }
  uint64_t v4 = v11;
LABEL_7:
  bmltIdentifiers = self->_bmltIdentifiers;
  uint64_t v10 = v4[1];
  if (bmltIdentifiers)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(bmltIdentifiers, (const char *)v4, v10, v5, v6);
    }
  }
  else if (v10)
  {
    objc_msgSend_setBmltIdentifiers_(self, (const char *)v4, v10, v5, v6);
  }
  MEMORY[0x270F9A758]();
}

- (LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (void)setExperimentIdentifiers:(id)a3
{
}

- (LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers)bmltIdentifiers
{
  return self->_bmltIdentifiers;
}

- (void)setBmltIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_bmltIdentifiers, 0);
}

@end