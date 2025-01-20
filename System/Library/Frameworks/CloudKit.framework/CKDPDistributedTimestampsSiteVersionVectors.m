@interface CKDPDistributedTimestampsSiteVersionVectors
- (BOOL)hasContentsVector;
- (BOOL)hasDependenciesVector;
- (BOOL)hasPreviousVector;
- (BOOL)hasRemovalsVector;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDistributedTimestampsVersionVector)contentsVector;
- (CKDPDistributedTimestampsVersionVector)dependenciesVector;
- (CKDPDistributedTimestampsVersionVector)previousVector;
- (CKDPDistributedTimestampsVersionVector)removalsVector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentsVector:(id)a3;
- (void)setDependenciesVector:(id)a3;
- (void)setPreviousVector:(id)a3;
- (void)setRemovalsVector:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPDistributedTimestampsSiteVersionVectors

- (BOOL)hasPreviousVector
{
  return self->_previousVector != 0;
}

- (BOOL)hasContentsVector
{
  return self->_contentsVector != 0;
}

- (BOOL)hasRemovalsVector
{
  return self->_removalsVector != 0;
}

- (BOOL)hasDependenciesVector
{
  return self->_dependenciesVector != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPDistributedTimestampsSiteVersionVectors;
  v4 = [(CKDPDistributedTimestampsSiteVersionVectors *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  previousVector = self->_previousVector;
  if (previousVector)
  {
    uint64_t v10 = objc_msgSend_dictionaryRepresentation(previousVector, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, @"previousVector");
  }
  contentsVector = self->_contentsVector;
  if (contentsVector)
  {
    objc_super v13 = objc_msgSend_dictionaryRepresentation(contentsVector, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, @"contentsVector");
  }
  removalsVector = self->_removalsVector;
  if (removalsVector)
  {
    v16 = objc_msgSend_dictionaryRepresentation(removalsVector, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, @"removalsVector");
  }
  dependenciesVector = self->_dependenciesVector;
  if (dependenciesVector)
  {
    v19 = objc_msgSend_dictionaryRepresentation(dependenciesVector, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v19, @"dependenciesVector");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDistributedTimestampsSiteVersionVectorsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_previousVector)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_contentsVector)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_removalsVector)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_dependenciesVector)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  previousVector = self->_previousVector;
  id v11 = v4;
  if (previousVector)
  {
    objc_msgSend_setPreviousVector_(v4, v5, (uint64_t)previousVector, v6);
    id v4 = v11;
  }
  contentsVector = self->_contentsVector;
  if (contentsVector)
  {
    objc_msgSend_setContentsVector_(v11, v5, (uint64_t)contentsVector, v6);
    id v4 = v11;
  }
  removalsVector = self->_removalsVector;
  if (removalsVector)
  {
    objc_msgSend_setRemovalsVector_(v11, v5, (uint64_t)removalsVector, v6);
    id v4 = v11;
  }
  dependenciesVector = self->_dependenciesVector;
  if (dependenciesVector)
  {
    objc_msgSend_setDependenciesVector_(v11, v5, (uint64_t)dependenciesVector, v6);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_previousVector, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[3];
  v12[3] = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_contentsVector, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[1];
  v12[1] = v19;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_removalsVector, v21, (uint64_t)a3, v22);
  v24 = (void *)v12[4];
  v12[4] = v23;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_dependenciesVector, v25, (uint64_t)a3, v26);
  v28 = (void *)v12[2];
  v12[2] = v27;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((previousVector = self->_previousVector, uint64_t v11 = v4[3], !((unint64_t)previousVector | v11))
     || objc_msgSend_isEqual_(previousVector, v8, v11, v9))
    && ((contentsVector = self->_contentsVector, uint64_t v13 = v4[1], !((unint64_t)contentsVector | v13))
     || objc_msgSend_isEqual_(contentsVector, v8, v13, v9))
    && ((removalsVector = self->_removalsVector, uint64_t v15 = v4[4], !((unint64_t)removalsVector | v15))
     || objc_msgSend_isEqual_(removalsVector, v8, v15, v9)))
  {
    dependenciesVector = self->_dependenciesVector;
    uint64_t v17 = v4[2];
    if ((unint64_t)dependenciesVector | v17) {
      char isEqual = objc_msgSend_isEqual_(dependenciesVector, v8, v17, v9);
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
  uint64_t v5 = objc_msgSend_hash(self->_previousVector, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_contentsVector, v6, v7, v8) ^ v5;
  uint64_t v13 = objc_msgSend_hash(self->_removalsVector, v10, v11, v12);
  return v9 ^ v13 ^ objc_msgSend_hash(self->_dependenciesVector, v14, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  previousVector = self->_previousVector;
  uint64_t v7 = v4[3];
  uint64_t v14 = v4;
  if (previousVector)
  {
    if (!v7) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(previousVector, (const char *)v4, v7, v5);
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    objc_msgSend_setPreviousVector_(self, (const char *)v4, v7, v5);
  }
  id v4 = v14;
LABEL_7:
  contentsVector = self->_contentsVector;
  uint64_t v9 = v4[1];
  if (contentsVector)
  {
    if (!v9) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(contentsVector, (const char *)v4, v9, v5);
  }
  else
  {
    if (!v9) {
      goto LABEL_13;
    }
    objc_msgSend_setContentsVector_(self, (const char *)v4, v9, v5);
  }
  id v4 = v14;
LABEL_13:
  removalsVector = self->_removalsVector;
  uint64_t v11 = v4[4];
  if (removalsVector)
  {
    if (!v11) {
      goto LABEL_19;
    }
    objc_msgSend_mergeFrom_(removalsVector, (const char *)v4, v11, v5);
  }
  else
  {
    if (!v11) {
      goto LABEL_19;
    }
    objc_msgSend_setRemovalsVector_(self, (const char *)v4, v11, v5);
  }
  id v4 = v14;
LABEL_19:
  dependenciesVector = self->_dependenciesVector;
  uint64_t v13 = v4[2];
  if (dependenciesVector)
  {
    if (!v13) {
      goto LABEL_25;
    }
    dependenciesVector = objc_msgSend_mergeFrom_(dependenciesVector, (const char *)v4, v13, v5);
  }
  else
  {
    if (!v13) {
      goto LABEL_25;
    }
    dependenciesVector = objc_msgSend_setDependenciesVector_(self, (const char *)v4, v13, v5);
  }
  id v4 = v14;
LABEL_25:

  MEMORY[0x1F41817F8](dependenciesVector, v4);
}

- (CKDPDistributedTimestampsVersionVector)previousVector
{
  return self->_previousVector;
}

- (void)setPreviousVector:(id)a3
{
}

- (CKDPDistributedTimestampsVersionVector)contentsVector
{
  return self->_contentsVector;
}

- (void)setContentsVector:(id)a3
{
}

- (CKDPDistributedTimestampsVersionVector)removalsVector
{
  return self->_removalsVector;
}

- (void)setRemovalsVector:(id)a3
{
}

- (CKDPDistributedTimestampsVersionVector)dependenciesVector
{
  return self->_dependenciesVector;
}

- (void)setDependenciesVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalsVector, 0);
  objc_storeStrong((id *)&self->_previousVector, 0);
  objc_storeStrong((id *)&self->_dependenciesVector, 0);

  objc_storeStrong((id *)&self->_contentsVector, 0);
}

@end