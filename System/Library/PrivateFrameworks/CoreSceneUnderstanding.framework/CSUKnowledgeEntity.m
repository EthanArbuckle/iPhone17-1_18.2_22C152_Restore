@interface CSUKnowledgeEntity
- (CSUKnowledgeEntity)initWithDictionary:(id)a3;
- (CSUKnowledgeEntity)initWithQID:(id)a3 withHumanReadableLabel:(id)a4 withHumanReadableSynonyms:(id)a5 withVersion:(int)a6;
- (NSDictionary)dictionary;
- (NSSet)humanReadableSynonyms;
- (NSString)QID;
- (NSString)humanReadableLabel;
- (int)version;
@end

@implementation CSUKnowledgeEntity

- (CSUKnowledgeEntity)initWithQID:(id)a3 withHumanReadableLabel:(id)a4 withHumanReadableSynonyms:(id)a5 withVersion:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CSUKnowledgeEntity;
  v14 = [(CSUKnowledgeEntity *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_QID, a3);
    objc_storeStrong((id *)&v15->_humanReadableLabel, a4);
    objc_storeStrong((id *)&v15->_humanReadableSynonyms, a5);
    v15->_version = a6;
    v16 = v15;
  }

  return v15;
}

- (CSUKnowledgeEntity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"humanReadableSynonyms", v6, v7);
  id v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v10, v11, v12);
  char isEqual = objc_msgSend_isEqual_(v8, v14, (uint64_t)v13, v15, v16);

  if (isEqual)
  {
    v21 = 0;
  }
  else
  {
    v22 = (void *)MEMORY[0x263EFFA08];
    v23 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"humanReadableSynonyms", v19, v20);
    v21 = objc_msgSend_setWithArray_(v22, v24, (uint64_t)v23, v25, v26);
  }
  v27 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"QID", v19, v20);
  v31 = objc_msgSend_objectForKeyedSubscript_(v4, v28, @"humanReadableLabel", v29, v30);
  v35 = objc_msgSend_objectForKeyedSubscript_(v4, v32, @"version", v33, v34);
  uint64_t v40 = objc_msgSend_integerValue(v35, v36, v37, v38, v39);
  v42 = (CSUKnowledgeEntity *)objc_msgSend_initWithQID_withHumanReadableLabel_withHumanReadableSynonyms_withVersion_(self, v41, (uint64_t)v27, (uint64_t)v31, (uint64_t)v21, v40);

  return v42;
}

- (NSDictionary)dictionary
{
  v17[4] = *MEMORY[0x263EF8340];
  v16[0] = @"QID";
  v16[1] = @"humanReadableLabel";
  humanReadableLabel = self->_humanReadableLabel;
  v17[0] = self->_QID;
  v17[1] = humanReadableLabel;
  v16[2] = @"humanReadableSynonyms";
  humanReadableSynonyms = self->_humanReadableSynonyms;
  if (humanReadableSynonyms) {
    objc_msgSend_allObjects(humanReadableSynonyms, a2, v2, v3, v4);
  }
  else {
  v8 = objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v2, v3, v4);
  }
  v17[2] = v8;
  v16[3] = @"version";
  uint64_t v12 = objc_msgSend_numberWithInt_(NSNumber, v9, self->_version, v10, v11);
  v17[3] = v12;
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v17, (uint64_t)v16, 4);

  return (NSDictionary *)v14;
}

- (NSString)QID
{
  return self->_QID;
}

- (NSString)humanReadableLabel
{
  return self->_humanReadableLabel;
}

- (NSSet)humanReadableSynonyms
{
  return self->_humanReadableSynonyms;
}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableSynonyms, 0);
  objc_storeStrong((id *)&self->_humanReadableLabel, 0);
  objc_storeStrong((id *)&self->_QID, 0);
}

@end