@interface CLSAttachmentEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)validateObject:(id *)a3;
- (CLSAttachmentEvent)initWithAttachmentID:(id)a3 classID:(id)a4 handoutID:(id)a5 eventType:(int64_t)a6;
- (CLSAttachmentEvent)initWithCoder:(id)a3;
- (NSString)attachmentID;
- (NSString)classID;
- (NSString)handoutID;
- (NSString)recipientPersonID;
- (id)description;
- (id)dictionaryRepresentation;
- (int)handoutAttachmentType;
- (int64_t)contextType;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAttachmentID:(id)a3;
- (void)setClassID:(id)a3;
- (void)setContextType:(int64_t)a3;
- (void)setHandoutAttachmentType:(int)a3;
- (void)setHandoutID:(id)a3;
- (void)setRecipientPersonID:(id)a3;
@end

@implementation CLSAttachmentEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSAttachmentEvent)initWithAttachmentID:(id)a3 classID:(id)a4 handoutID:(id)a5 eventType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLSAttachmentEvent;
  v14 = [(CLSInsightEvent *)&v17 initWithType:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attachmentID, a3);
    objc_storeStrong((id *)&v15->_classID, a4);
    objc_storeStrong((id *)&v15->_handoutID, a5);
  }

  return v15;
}

- (BOOL)validateObject:(id *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CLSAttachmentEvent;
  BOOL v5 = -[CLSInsightEvent validateObject:](&v31, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_attachmentID, v6, v7))
    {
      if (objc_msgSend_length(self->_classID, v8, v9))
      {
        if (objc_msgSend_length(self->_handoutID, v10, v11))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        id v12 = NSString;
        v22 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v23 = objc_opt_class();
        v16 = objc_msgSend_bundleForClass_(v22, v24, v23);
        objc_msgSend_localizedStringForKey_value_table_(v16, v25, @"ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_HANDOUT_ID", &stru_1F37A1D30, @"ClassKit");
      }
      else
      {
        id v12 = NSString;
        v18 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v19 = objc_opt_class();
        v16 = objc_msgSend_bundleForClass_(v18, v20, v19);
        objc_msgSend_localizedStringForKey_value_table_(v16, v21, @"ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_CLASS_ID", &stru_1F37A1D30, @"ClassKit");
      }
    }
    else
    {
      id v12 = NSString;
      id v13 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v14 = objc_opt_class();
      v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
      objc_msgSend_localizedStringForKey_value_table_(v16, v17, @"ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_ATTACHMENT_ID", &stru_1F37A1D30, @"ClassKit");
    v26 = };
    v28 = objc_msgSend_stringWithFormat_(v12, v27, (uint64_t)v26);

    objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E4F28C58], v29, (uint64_t)a3, 2, self, v28);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CLSAttachmentEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CLSAttachmentEvent;
  BOOL v5 = [(CLSInsightEvent *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"attachmentID");
    attachmentID = v5->_attachmentID;
    v5->_attachmentID = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"classID");
    classID = v5->_classID;
    v5->_classID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"handoutID");
    handoutID = v5->_handoutID;
    v5->_handoutID = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"recipientPersonID");
    recipientPersonID = v5->_recipientPersonID;
    v5->_recipientPersonID = (NSString *)v20;

    v5->_handoutAttachmentType = objc_msgSend_decodeIntegerForKey_(v4, v22, @"handoutAttachmentType");
    v5->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v23, @"contextType");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CLSAttachmentEvent;
  id v4 = a3;
  [(CLSInsightEvent *)&v11 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_attachmentID, @"attachmentID", v11.receiver, v11.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_classID, @"classID");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_handoutID, @"handoutID");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_recipientPersonID, @"recipientPersonID");
  objc_msgSend_encodeInteger_forKey_(v4, v9, self->_handoutAttachmentType, @"handoutAttachmentType");
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_contextType, @"contextType");
}

- (id)dictionaryRepresentation
{
  v14.receiver = self;
  v14.super_class = (Class)CLSAttachmentEvent;
  v3 = [(CLSInsightEvent *)&v14 dictionaryRepresentation];
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_attachmentID, @"attachmentID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_classID, @"classID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_handoutID, @"handoutID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)self->_recipientPersonID, @"recipientPersonID");
  uint64_t v9 = NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, @"handoutAttachmentType");

  objc_super v11 = DefaultNameFromContextType(self->_contextType);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"contextType");

  return v3;
}

- (void)mergeWithObject:(id)a3
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSAttachmentEvent;
  [(CLSInsightEvent *)&v20 mergeWithObject:v4];
  v22[0] = @"attachmentID";
  v22[1] = @"classID";
  v22[2] = @"handoutID";
  v22[3] = @"recipientPersonID";
  v22[4] = @"handoutAttachmentType";
  v22[5] = @"contextType";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v22, 6);
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
        objc_super v14 = objc_msgSend_valueForKey_(v4, v9, v13, (void)v16);
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }
}

- (void)setAppIdentifier:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v7 = objc_msgSend_appIdentifier(self, v5, v6);
  if (v4 | v7)
  {
    uint64_t v10 = (void *)v7;
    uint64_t v11 = objc_msgSend_appIdentifier(self, v8, v9);
    objc_super v14 = v11;
    if (v4 && v11)
    {
      v15 = objc_msgSend_appIdentifier(self, v12, v13);
      char isEqualToString = objc_msgSend_isEqualToString_(v15, v16, v4);

      if (isEqualToString) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    objc_super v20 = objc_msgSend_copy((void *)v4, v18, v19);
    v21.receiver = self;
    v21.super_class = (Class)CLSAttachmentEvent;
    [(CLSObject *)&v21 setAppIdentifier:v20];
  }
LABEL_8:
}

- (id)description
{
  v17.receiver = self;
  v17.super_class = (Class)CLSAttachmentEvent;
  v3 = [(CLSInsightEvent *)&v17 description];
  uint64_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, @" (attachmentID: %@)", self->_attachmentID);
  objc_msgSend_appendFormat_(v6, v8, @" (classID: %@)", self->_classID);
  objc_msgSend_appendFormat_(v6, v9, @" (handoutID: %@)", self->_handoutID);
  objc_msgSend_appendFormat_(v6, v10, @" (recipientPersonID: %@)", self->_recipientPersonID);
  uint64_t v12 = NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v11);
  objc_msgSend_appendFormat_(v6, v13, @" (attachmentType: %@)", v12);

  objc_super v14 = DefaultNameFromContextType(self->_contextType);
  objc_msgSend_appendFormat_(v6, v15, @" (contextType: %@)", v14);

  return v6;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
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

- (NSString)recipientPersonID
{
  return self->_recipientPersonID;
}

- (void)setRecipientPersonID:(id)a3
{
}

- (int)handoutAttachmentType
{
  return self->_handoutAttachmentType;
}

- (void)setHandoutAttachmentType:(int)a3
{
  self->_handoutAttachmentType = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientPersonID, 0);
  objc_storeStrong((id *)&self->_handoutID, 0);
  objc_storeStrong((id *)&self->_classID, 0);

  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end