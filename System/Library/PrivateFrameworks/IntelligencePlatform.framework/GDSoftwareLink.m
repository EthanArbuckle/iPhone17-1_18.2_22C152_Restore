@interface GDSoftwareLink
- (GDEntityIdentifier)softwareEntityIdentifier;
- (GDRelationshipIdentifier)relationshipIdentifier;
- (GDSoftwareLink)initWithRelationshipIdTriplesIterator:(id)a3;
- (NSString)conversationIdentifier;
- (NSString)identifierType;
@end

@implementation GDSoftwareLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierType, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareEntityIdentifier, 0);

  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

- (NSString)identifierType
{
  return self->_identifierType;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (GDEntityIdentifier)softwareEntityIdentifier
{
  return self->_softwareEntityIdentifier;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (GDSoftwareLink)initWithRelationshipIdTriplesIterator:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)GDSoftwareLink;
  v5 = [(GDSoftwareLink *)&v63 init];
  if (!v5)
  {
LABEL_20:
    v56 = v5;
    goto LABEL_23;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v58 = v4;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v59, (uint64_t)v64, 16);
  if (!v8) {
    goto LABEL_18;
  }
  uint64_t v13 = v8;
  uint64_t v14 = *(void *)v60;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v60 != v14) {
        objc_enumerationMutation(v6);
      }
      v16 = *(void **)(*((void *)&v59 + 1) + 8 * v15);
      if (!v5->_relationshipIdentifier)
      {
        v17 = [GDRelationshipIdentifier alloc];
        v22 = objc_msgSend_relationshipId(v16, v18, v19, v20, v21);
        uint64_t v26 = objc_msgSend_initWithString_(v17, v23, (uint64_t)v22, v24, v25);
        relationshipIdentifier = v5->_relationshipIdentifier;
        v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v26;
      }
      v28 = objc_msgSend_relationshipPredicate(v16, v9, v10, v11, v12);
      if (objc_msgSend_isEqual_(v28, v29, @"nm_softwareIdentifier", v30, v31))
      {
        v35 = [GDEntityIdentifier alloc];
        conversationIdentifier = objc_msgSend_object(v16, v36, v37, v38, v39);
        uint64_t v44 = objc_msgSend_initWithString_(v35, v41, (uint64_t)conversationIdentifier, v42, v43);
        softwareEntityIdentifier = v5->_softwareEntityIdentifier;
        v5->_softwareEntityIdentifier = (GDEntityIdentifier *)v44;
      }
      else if (objc_msgSend_isEqual_(v28, v32, @"PS69", v33, v34))
      {
        uint64_t v50 = objc_msgSend_object(v16, v46, v47, v48, v49);
        conversationIdentifier = v5->_conversationIdentifier;
        v5->_conversationIdentifier = (NSString *)v50;
      }
      else
      {
        if (!objc_msgSend_isEqual_(v28, v46, @"PS396", v48, v49)) {
          goto LABEL_16;
        }
        uint64_t v55 = objc_msgSend_object(v16, v51, v52, v53, v54);
        conversationIdentifier = v5->_identifierType;
        v5->_identifierType = (NSString *)v55;
      }

LABEL_16:
      ++v15;
    }
    while (v13 != v15);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v59, (uint64_t)v64, 16);
  }
  while (v13);
LABEL_18:

  if (v5->_relationshipIdentifier)
  {
    id v4 = v58;
    if (v5->_softwareEntityIdentifier) {
      goto LABEL_20;
    }
    v56 = 0;
  }
  else
  {
    v56 = 0;
    id v4 = v58;
  }
LABEL_23:

  return v56;
}

@end