@interface GDEntitySimilarityRequest
+ (BOOL)supportsSecureCoding;
- (GDEntityIdentifier)entityId1;
- (GDEntityIdentifier)entityId2;
- (GDEntitySimilarityRequest)initWithCoder:(id)a3;
- (GDEntitySimilarityRequest)initWithEntityId1:(id)a3 entityId2:(id)a4 entitySimilarityMode:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)entitySimilarityMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDEntitySimilarityRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityId2, 0);

  objc_storeStrong((id *)&self->_entityId1, 0);
}

- (GDEntityIdentifier)entityId2
{
  return self->_entityId2;
}

- (GDEntityIdentifier)entityId1
{
  return self->_entityId1;
}

- (int64_t)entitySimilarityMode
{
  return self->_entitySimilarityMode;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7 = objc_msgSend_initWithFormat_(v3, v4, @"GDEntitySimilarityRequest<entityId1: %@, entityId2: %@, entitySimilarityMode: %ld>", v5, v6, self->_entityId1, self->_entityId2, self->_entitySimilarityMode);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  entityId1 = self->_entityId1;
  entityId2 = self->_entityId2;
  int64_t entitySimilarityMode = self->_entitySimilarityMode;

  return (id)objc_msgSend_initWithEntityId1_entityId2_entitySimilarityMode_(v9, v10, (uint64_t)entityId1, (uint64_t)entityId2, entitySimilarityMode);
}

- (GDEntitySimilarityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_entityId1);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_entityId2);
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11, v13);

  uint64_t v15 = objc_opt_class();
  v16 = NSStringFromSelector(sel_entitySimilarityMode);
  v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16, v18);

  uint64_t v24 = (int)objc_msgSend_intValue(v19, v20, v21, v22, v23);
  v26 = (GDEntitySimilarityRequest *)objc_msgSend_initWithEntityId1_entityId2_entitySimilarityMode_(self, v25, (uint64_t)v9, (uint64_t)v14, v24);

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  entityId1 = self->_entityId1;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_entityId1);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)entityId1, (uint64_t)v6, v8);

  entityId2 = self->_entityId2;
  uint64_t v10 = NSStringFromSelector(sel_entityId2);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)entityId2, (uint64_t)v10, v12);

  objc_msgSend_numberWithInteger_(NSNumber, v13, self->_entitySimilarityMode, v14, v15);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v16 = NSStringFromSelector(sel_entitySimilarityMode);
  objc_msgSend_encodeObject_forKey_(v5, v17, (uint64_t)v19, (uint64_t)v16, v18);
}

- (GDEntitySimilarityRequest)initWithEntityId1:(id)a3 entityId2:(id)a4 entitySimilarityMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)GDEntitySimilarityRequest;
  uint64_t v14 = [(GDEntitySimilarityRequest *)&v24 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v10, v11, v12, v13);
    entityId1 = v14->_entityId1;
    v14->_entityId1 = (GDEntityIdentifier *)v15;

    uint64_t v21 = objc_msgSend_copy(v9, v17, v18, v19, v20);
    entityId2 = v14->_entityId2;
    v14->_entityId2 = (GDEntityIdentifier *)v21;

    v14->_int64_t entitySimilarityMode = a5;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end