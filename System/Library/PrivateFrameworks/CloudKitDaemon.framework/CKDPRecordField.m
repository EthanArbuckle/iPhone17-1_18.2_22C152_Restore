@interface CKDPRecordField
+ (Class)actionType;
+ (id)emptyFieldWithKey:(id)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordFieldIdentifier)identifier;
- (CKDPRecordFieldValue)value;
- (NSMutableArray)actions;
- (id)actionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)actionsCount;
- (unint64_t)hash;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)addAction:(id)a3;
- (void)clearActions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActions:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordField

+ (id)emptyFieldWithKey:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  objc_msgSend_setIdentifier_(v4, v6, (uint64_t)v5);

  v9 = objc_msgSend_identifier(v4, v7, v8);
  objc_msgSend_setName_(v9, v10, (uint64_t)v3);

  v11 = objc_opt_new();
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  return v4;
}

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v19 = a3;
  v6 = (void *)MEMORY[0x1C8789E70]();
  v9 = objc_msgSend_identifier(self, v7, v8);
  v12 = objc_msgSend_name(v9, v10, v11);
  objc_msgSend_writeString_(v19, v13, (uint64_t)v12);

  if (qword_1EBBCFEB0 != -1) {
    dispatch_once(&qword_1EBBCFEB0, &unk_1F2043CF0);
  }
  objc_msgSend_writeData_(v19, v14, qword_1EBBCFEA8);
  v17 = objc_msgSend_value(self, v15, v16);
  objc_msgSend__CKLogToFileHandle_atDepth_(v17, v18, (uint64_t)v19, v4);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)clearActions
{
  objc_msgSend_removeAllObjects(self->_actions, a2, v2);
}

- (void)addAction:(id)a3
{
  uint64_t v4 = (const char *)a3;
  actions = self->_actions;
  uint64_t v8 = (char *)v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_actions;
    self->_actions = v6;

    uint64_t v4 = v8;
    actions = self->_actions;
  }
  objc_msgSend_addObject_(actions, v4, (uint64_t)v4);
}

- (unint64_t)actionsCount
{
  return objc_msgSend_count(self->_actions, a2, v2);
}

- (id)actionAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_actions, a2, a3);
}

+ (Class)actionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordField;
  uint64_t v4 = [(CKDPRecordField *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  identifier = self->_identifier;
  if (identifier)
  {
    uint64_t v8 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"identifier");
  }
  value = self->_value;
  if (value)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(value, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"value");
  }
  if (objc_msgSend_count(self->_actions, v4, v5))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_actions, v14, v15);
    v18 = objc_msgSend_initWithCapacity_(v13, v17, v16);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = self->_actions;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v31, v35, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v19);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v31 + 1) + 8 * i), v22, v23, (void)v31);
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v31, v35, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, @"action");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordFieldReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_value) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_actions;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setIdentifier_(v17, v4, (uint64_t)identifier);
  }
  value = self->_value;
  if (value) {
    objc_msgSend_setValue_(v17, v4, (uint64_t)value);
  }
  if (objc_msgSend_actionsCount(self, v4, (uint64_t)value))
  {
    objc_msgSend_clearActions(v17, v7, v8);
    uint64_t v11 = objc_msgSend_actionsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v13 = v11;
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v15 = objc_msgSend_actionAtIndex_(self, v12, i);
        objc_msgSend_addAction_(v17, v16, (uint64_t)v15);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  uint64_t v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_value, v14, (uint64_t)a3);
  uint64_t v16 = (void *)v10[3];
  v10[3] = v15;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = self->_actions;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v27, v31, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * v23), v20, (uint64_t)a3, (void)v27);
        objc_msgSend_addAction_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v27, v31, 16);
    }
    while (v21);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((identifier = self->_identifier, uint64_t v9 = v4[2], !((unint64_t)identifier | v9))
     || objc_msgSend_isEqual_(identifier, v7, v9))
    && ((value = self->_value, uint64_t v11 = v4[3], !((unint64_t)value | v11))
     || objc_msgSend_isEqual_(value, v7, v11)))
  {
    actions = self->_actions;
    uint64_t v13 = v4[1];
    if ((unint64_t)actions | v13) {
      char isEqual = objc_msgSend_isEqual_(actions, v7, v13);
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
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_value, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_actions, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  identifier = self->_identifier;
  uint64_t v7 = *((void *)v5 + 2);
  if (identifier)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(identifier, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setIdentifier_(self, v4, v7);
  }
  value = self->_value;
  uint64_t v9 = *((void *)v5 + 3);
  if (value)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(value, v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setValue_(self, v4, v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *((id *)v5 + 1);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v17, v21, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_addAction_(self, v13, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v17, v21, 16);
    }
    while (v14);
  }
}

- (CKDPRecordFieldIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CKDPRecordFieldValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end