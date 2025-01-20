@interface CLSHandoutEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)validateObject:(id *)a3;
- (CLSHandoutEvent)initWithClassID:(id)a3 handoutID:(id)a4 eventType:(int64_t)a5;
- (CLSHandoutEvent)initWithCoder:(id)a3;
- (NSArray)attachmentDetails;
- (NSArray)recipientIDs;
- (NSDate)dueDate;
- (NSString)classID;
- (NSString)handoutID;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)setAttachmentDetails:(id)a3;
- (void)setClassID:(id)a3;
- (void)setDueDate:(id)a3;
- (void)setHandoutID:(id)a3;
- (void)setRecipientIDs:(id)a3;
@end

@implementation CLSHandoutEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSHandoutEvent)initWithClassID:(id)a3 handoutID:(id)a4 eventType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSHandoutEvent;
  v11 = [(CLSInsightEvent *)&v14 initWithType:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_classID, a3);
    objc_storeStrong((id *)&v12->_handoutID, a4);
  }

  return v12;
}

- (BOOL)validateObject:(id *)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CLSHandoutEvent;
  BOOL v5 = -[CLSInsightEvent validateObject:](&v25, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_classID, v6, v7))
    {
      if (objc_msgSend_length(self->_handoutID, v8, v9))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      id v10 = NSString;
      v16 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v17 = objc_opt_class();
      objc_super v14 = objc_msgSend_bundleForClass_(v16, v18, v17);
      objc_msgSend_localizedStringForKey_value_table_(v14, v19, @"ERROR_DESCRIPTION_HANDOUT_EVENT_NO_HANDOUT_ID", &stru_1F37A1D30, @"ClassKit");
    }
    else
    {
      id v10 = NSString;
      v11 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v12 = objc_opt_class();
      objc_super v14 = objc_msgSend_bundleForClass_(v11, v13, v12);
      objc_msgSend_localizedStringForKey_value_table_(v14, v15, @"ERROR_DESCRIPTION_HANDOUT_EVENT_NO_CLASS_ID", &stru_1F37A1D30, @"ClassKit");
    v20 = };
    v22 = objc_msgSend_stringWithFormat_(v10, v21, (uint64_t)v20);

    objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E4F28C58], v23, (uint64_t)a3, 2, self, v22);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CLSHandoutEvent)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CLSHandoutEvent;
  BOOL v5 = [(CLSInsightEvent *)&v35 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"classID");
    classID = v5->_classID;
    v5->_classID = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"handoutID");
    handoutID = v5->_handoutID;
    v5->_handoutID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"dueDate");
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v37, 2);
    v22 = objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"recipientIDs");
    recipientIDs = v5->_recipientIDs;
    v5->_recipientIDs = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v36, 2);
    v30 = objc_msgSend_setWithArray_(v26, v29, (uint64_t)v28);
    uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, @"attachmentDetails");
    attachmentDetails = v5->_attachmentDetails;
    v5->_attachmentDetails = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSHandoutEvent;
  id v4 = a3;
  [(CLSInsightEvent *)&v10 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_classID, @"classID", v10.receiver, v10.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_handoutID, @"handoutID");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_dueDate, @"dueDate");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_recipientIDs, @"recipientIDs");
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_attachmentDetails, @"attachmentDetails");
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)CLSHandoutEvent;
  v3 = [(CLSInsightEvent *)&v11 dictionaryRepresentation];
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_classID, @"classID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_handoutID, @"handoutID");
  dueDate = self->_dueDate;
  if (dueDate) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)dueDate, @"dueDate");
  }
  recipientIDs = self->_recipientIDs;
  if (recipientIDs) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)recipientIDs, @"recipientIDs");
  }
  attachmentDetails = self->_attachmentDetails;
  if (attachmentDetails) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)attachmentDetails, @"attachmentDetails");
  }

  return v3;
}

- (void)mergeWithObject:(id)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSHandoutEvent;
  [(CLSInsightEvent *)&v20 mergeWithObject:v4];
  v22[0] = @"classID";
  v22[1] = @"handoutID";
  v22[2] = @"dueDate";
  v22[3] = @"recipientIDs";
  v22[4] = @"attachmentDetails";
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

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)CLSHandoutEvent;
  v3 = [(CLSInsightEvent *)&v13 description];
  id v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, @" (classID: %@)", self->_classID);
  objc_msgSend_appendFormat_(v6, v8, @" (handoutID: %@)", self->_handoutID);
  objc_msgSend_appendFormat_(v6, v9, @" (dueDate: %@)", self->_dueDate);
  objc_msgSend_appendFormat_(v6, v10, @" (recipientIDs: %@)", self->_recipientIDs);
  objc_msgSend_appendFormat_(v6, v11, @" (attachmentDetails: %@)", self->_attachmentDetails);

  return v6;
}

- (NSString)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
}

- (NSString)handoutID
{
  return self->_handoutID;
}

- (void)setHandoutID:(id)a3
{
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (NSArray)recipientIDs
{
  return self->_recipientIDs;
}

- (void)setRecipientIDs:(id)a3
{
}

- (NSArray)attachmentDetails
{
  return self->_attachmentDetails;
}

- (void)setAttachmentDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentDetails, 0);
  objc_storeStrong((id *)&self->_recipientIDs, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_handoutID, 0);

  objc_storeStrong((id *)&self->_classID, 0);
}

@end