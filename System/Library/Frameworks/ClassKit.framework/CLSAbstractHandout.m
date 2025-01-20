@interface CLSAbstractHandout
+ (BOOL)supportsSecureCoding;
- (CLSAbstractHandout)init;
- (CLSAbstractHandout)initWithCoder:(id)a3;
- (NSArray)assets;
- (NSDate)dateOfPublication;
- (NSDate)dueDate;
- (NSString)instructions;
- (NSString)title;
- (id)_init;
- (id)dictionaryRepresentation;
- (int64_t)version;
- (void)addAsset:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)removeAsset:(id)a3;
- (void)setDateOfPublication:(id)a3;
- (void)setDueDate:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation CLSAbstractHandout

- (CLSAbstractHandout)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSAbstractHandout;
  return [(CLSObject *)&v3 _init];
}

- (CLSAbstractHandout)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLSAbstractHandout;
  v5 = [(CLSObject *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"instructions");
    instructions = v5->_instructions;
    v5->_instructions = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"dueDate");
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"dateOfPublication");
    dateOfPublication = v5->_dateOfPublication;
    v5->_dateOfPublication = (NSDate *)v20;

    v5->_version = objc_msgSend_decodeIntegerForKey_(v4, v22, @"version");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSAbstractHandout;
  id v4 = a3;
  [(CLSObject *)&v10 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_instructions, @"instructions", v10.receiver, v10.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_title, @"title");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_dueDate, @"dueDate");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_dateOfPublication, @"dateOfPublication");
  objc_msgSend_encodeInteger_forKey_(v4, v9, self->_version, @"version");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  uint64_t v8 = (uint64_t)v5;
  title = self->_title;
  id v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);
}

- (NSString)instructions
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_instructions;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)setInstructions:(id)a3
{
  id v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  uint64_t v8 = (uint64_t)v5;
  instructions = self->_instructions;
  id v12 = (id)v8;
  if (v8 | (unint64_t)instructions
    && (!v8 || !instructions || (objc_msgSend_isEqualToString_(instructions, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_instructions, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);
}

- (NSDate)dueDate
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_dueDate;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)setDueDate:(id)a3
{
  id v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  uint64_t v8 = (uint64_t)v5;
  dueDate = self->_dueDate;
  id v12 = (id)v8;
  if (v8 | (unint64_t)dueDate
    && (!v8 || !dueDate || (objc_msgSend_isEqualToDate_(dueDate, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_dueDate, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);
}

- (NSDate)dateOfPublication
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_dateOfPublication;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)setDateOfPublication:(id)a3
{
  id v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  uint64_t v8 = (uint64_t)v5;
  dateOfPublication = self->_dateOfPublication;
  id v12 = (id)v8;
  if (v8 | (unint64_t)dateOfPublication
    && (!v8 || !dateOfPublication || (objc_msgSend_isEqualToDate_(dateOfPublication, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_dateOfPublication, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);
}

- (int64_t)version
{
  objc_msgSend_lock(self, a2, v2);
  int64_t version = self->_version;
  objc_msgSend_unlock(self, v5, v6);
  return version;
}

- (void)setVersion:(int64_t)a3
{
  objc_msgSend_lock(self, a2, a3);
  if (self->_version != a3)
  {
    self->_int64_t version = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }

  objc_msgSend_unlock(self, v5, v6);
}

- (id)dictionaryRepresentation
{
  v12.receiver = self;
  v12.super_class = (Class)CLSAbstractHandout;
  objc_super v3 = [(CLSObject *)&v12 dictionaryRepresentation];
  id v5 = v3;
  instructions = self->_instructions;
  if (instructions) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)instructions, @"instructions");
  }
  title = self->_title;
  if (title) {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)title, @"title");
  }
  dueDate = self->_dueDate;
  if (dueDate)
  {
    uint64_t v9 = objc_msgSend_mediumStringFromDate_(CLSUtil, v4, (uint64_t)dueDate);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, @"dueDate");
  }
  objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)self->_dateOfPublication, @"dateOfPublication");

  return v5;
}

- (void)mergeWithObject:(id)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSAbstractHandout;
  [(CLSObject *)&v20 mergeWithObject:v4];
  v22[0] = @"dateOfPublication";
  v22[1] = @"instructions";
  v22[2] = @"title";
  v22[3] = @"dueDate";
  v22[4] = @"version";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v22, 5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_valueForKey_(v4, v9, v13, (void)v16);
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }
}

- (NSArray)assets
{
  uint64_t v4 = objc_opt_class();

  return (NSArray *)objc_msgSend_childrenOfClass_(self, v3, v4);
}

- (void)addAsset:(id)a3
{
  id v30 = a3;
  if (objc_msgSend_type(v30, v5, v6) != 3)
  {
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  objc_msgSend_addChild_changedPropertyName_(self, v7, (uint64_t)v30, @"assets");
  objc_super v12 = objc_msgSend_parentObjectID(v30, v8, v9);
  uint64_t v13 = v30;
  if (!v12)
  {
    objc_super v3 = objc_msgSend_objectID(self, v10, v11);
    uint64_t v13 = v30;
    if (!v3) {
      goto LABEL_15;
    }
  }
  uint64_t v14 = objc_msgSend_parentObjectID(v13, v10, v11);
  if (!v14)
  {
    if (v12)
    {
LABEL_11:

LABEL_16:
      v28 = v30;
      goto LABEL_17;
    }
LABEL_10:

    goto LABEL_11;
  }
  long long v17 = (void *)v14;
  uint64_t v18 = objc_msgSend_objectID(self, v15, v16);
  if (!v18)
  {

    if (v12) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v21 = (void *)v18;
  v22 = objc_msgSend_parentObjectID(v30, v19, v20);
  v25 = objc_msgSend_objectID(self, v23, v24);
  int isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

  if (!v12)
  {

    v28 = v30;
    if ((isEqualToString & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  v28 = v30;
  if (isEqualToString)
  {
LABEL_15:
    objc_msgSend_setParentEntityType_(v30, v10, 1);
    goto LABEL_16;
  }
LABEL_17:
}

- (void)removeAsset:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_type(v8, v4, v5) != 3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend_removeChild_changedPropertyName_(self, v6, (uint64_t)v8, @"assets");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_dateOfPublication, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_instructions, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end