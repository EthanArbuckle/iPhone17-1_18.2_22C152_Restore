@interface CKDPDateStatistics
- (BOOL)hasCreation;
- (BOOL)hasModification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)creation;
- (CKDPDate)modification;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreation:(id)a3;
- (void)setModification:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPDateStatistics

- (BOOL)hasCreation
{
  return self->_creation != 0;
}

- (BOOL)hasModification
{
  return self->_modification != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPDateStatistics;
  v4 = [(CKDPDateStatistics *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  creation = self->_creation;
  if (creation)
  {
    v8 = objc_msgSend_dictionaryRepresentation(creation, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"creation");
  }
  modification = self->_modification;
  if (modification)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(modification, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"modification");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDateStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_creation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_modification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  creation = self->_creation;
  id v8 = v4;
  if (creation)
  {
    objc_msgSend_setCreation_(v4, v5, (uint64_t)creation);
    id v4 = v8;
  }
  modification = self->_modification;
  if (modification)
  {
    objc_msgSend_setModification_(v8, v5, (uint64_t)modification);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_creation, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_modification, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((creation = self->_creation, uint64_t v9 = v4[1], !((unint64_t)creation | v9))
     || objc_msgSend_isEqual_(creation, v7, v9)))
  {
    modification = self->_modification;
    uint64_t v11 = v4[2];
    if ((unint64_t)modification | v11) {
      char isEqual = objc_msgSend_isEqual_(modification, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_creation, a2, v2);
  return objc_msgSend_hash(self->_modification, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  creation = self->_creation;
  uint64_t v6 = v4[1];
  uint64_t v9 = v4;
  if (creation)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(creation, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setCreation_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v9;
LABEL_7:
  modification = self->_modification;
  uint64_t v8 = v4[2];
  if (modification)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(modification, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setModification_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPDate)creation
{
  return self->_creation;
}

- (void)setCreation:(id)a3
{
}

- (CKDPDate)modification
{
  return self->_modification;
}

- (void)setModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modification, 0);
  objc_storeStrong((id *)&self->_creation, 0);
}

@end