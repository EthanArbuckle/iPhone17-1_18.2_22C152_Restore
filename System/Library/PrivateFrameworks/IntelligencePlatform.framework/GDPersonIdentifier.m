@interface GDPersonIdentifier
- (GDPersonIdentifier)initWithRelationshipIdTriplesIterator:(id)a3;
- (GDRelationshipIdentifier)relationshipIdentifier;
- (NSString)hasProfileImage;
- (NSString)identifier;
- (NSString)type;
@end

@implementation GDPersonIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasProfileImage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

- (NSString)hasProfileImage
{
  return self->_hasProfileImage;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)type
{
  return self->_type;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (GDPersonIdentifier)initWithRelationshipIdTriplesIterator:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)GDPersonIdentifier;
  v5 = [(GDPersonIdentifier *)&v46 init];
  if (v5)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v40 = v4;
    id obj = v4;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v7)
    {
      uint64_t v12 = v7;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (!v5->_relationshipIdentifier)
          {
            v16 = [GDRelationshipIdentifier alloc];
            v21 = objc_msgSend_relationshipId(v15, v17, v18, v19, v20);
            uint64_t v25 = objc_msgSend_initWithString_(v16, v22, (uint64_t)v21, v23, v24);
            relationshipIdentifier = v5->_relationshipIdentifier;
            v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v25;
          }
          v27 = objc_msgSend_relationshipPredicate(v15, v8, v9, v10, v11);
          p_type = (void **)&v5->_type;
          if ((objc_msgSend_isEqual_(v27, v28, @"PS396", v29, v30) & 1) != 0
            || (p_type = (void **)&v5->_identifier,
                (objc_msgSend_isEqual_(v27, v31, @"PS69", v33, v34) & 1) != 0)
            || (p_type = (void **)&v5->_hasProfileImage,
                objc_msgSend_isEqual_(v27, v31, @"nm_hasProfileImage", v33, v34)))
          {
            uint64_t v36 = objc_msgSend_object(v15, v31, v32, v33, v34);
            v37 = *p_type;
            *p_type = (void *)v36;
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v42, (uint64_t)v47, 16);
      }
      while (v12);
    }

    if (!v5->_relationshipIdentifier || !v5->_type)
    {
      v38 = 0;
      id v4 = v40;
      goto LABEL_20;
    }
    id v4 = v40;
    if (!v5->_identifier)
    {
      v38 = 0;
      goto LABEL_20;
    }
  }
  v38 = v5;
LABEL_20:

  return v38;
}

@end