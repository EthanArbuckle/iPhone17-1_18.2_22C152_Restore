@interface CLSHandoutEventAttachmentDetail
+ (BOOL)supportsSecureCoding;
- (BOOL)validateObject:(id *)a3;
- (CLSHandoutEventAttachmentDetail)init;
- (CLSHandoutEventAttachmentDetail)initWithAttachmentID:(id)a3 handoutAttachmentType:(int)a4 contextType:(int64_t)a5 appIdentifier:(id)a6;
- (CLSHandoutEventAttachmentDetail)initWithCoder:(id)a3;
- (NSString)attachmentID;
- (id)_init;
- (id)description;
- (id)dictionaryRepresentation;
- (int)handoutAttachmentType;
- (int64_t)contextType;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithObject:(id)a3;
@end

@implementation CLSHandoutEventAttachmentDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSHandoutEventAttachmentDetail)initWithAttachmentID:(id)a3 handoutAttachmentType:(int)a4 contextType:(int64_t)a5 appIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CLSHandoutEventAttachmentDetail;
  v13 = [(CLSObject *)&v17 _init];
  v14 = (CLSHandoutEventAttachmentDetail *)v13;
  if (v13)
  {
    objc_storeStrong(v13 + 14, a3);
    v14->_handoutAttachmentType = a4;
    v14->_contextType = a5;
    objc_msgSend_setAppIdentifier_(v14, v15, (uint64_t)v12);
  }

  return v14;
}

- (CLSHandoutEventAttachmentDetail)init
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
  return (id)MEMORY[0x1F4181798](self, sel_initWithAttachmentID_handoutAttachmentType_contextType_appIdentifier_, &stru_1F37A1D30);
}

- (BOOL)validateObject:(id *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CLSHandoutEventAttachmentDetail;
  BOOL v5 = -[CLSObject validateObject:](&v19, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_attachmentID, v6, v7))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = NSString;
      v9 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v10 = objc_opt_class();
      id v12 = objc_msgSend_bundleForClass_(v9, v11, v10);
      v14 = objc_msgSend_localizedStringForKey_value_table_(v12, v13, @"ERROR_DESCRIPTION_HANDOUT_EVENT_DETAIL_NO_ATTACHMENT_ID", &stru_1F37A1D30, @"ClassKit");
      v16 = objc_msgSend_stringWithFormat_(v8, v15, (uint64_t)v14);

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E4F28C58], v17, (uint64_t)a3, 2, self, v16);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CLSHandoutEventAttachmentDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSHandoutEventAttachmentDetail;
  BOOL v5 = [(CLSObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"attachmentID");
    attachmentID = v5->_attachmentID;
    v5->_attachmentID = (NSString *)v8;

    v5->_handoutAttachmentType = objc_msgSend_decodeIntegerForKey_(v4, v10, @"handoutAttachmentType");
    v5->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v11, @"contextType");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSHandoutEventAttachmentDetail;
  id v4 = a3;
  [(CLSObject *)&v8 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_attachmentID, @"attachmentID", v8.receiver, v8.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_handoutAttachmentType, @"handoutAttachmentType");
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_contextType, @"contextType");
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)CLSHandoutEventAttachmentDetail;
  v3 = [(CLSObject *)&v11 dictionaryRepresentation];
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_attachmentID, @"attachmentID");
  uint64_t v6 = NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v5);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, @"handoutAttachmentType");

  objc_super v8 = DefaultNameFromContextType(self->_contextType);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, @"contextType");

  return v3;
}

- (void)mergeWithObject:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSHandoutEventAttachmentDetail;
  [(CLSObject *)&v20 mergeWithObject:v4];
  v22[0] = @"attachmentID";
  v22[1] = @"handoutAttachmentType";
  v22[2] = @"contextType";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v22, 3);
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
        v14 = objc_msgSend_valueForKey_(v4, v9, v13, (void)v16);
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }
}

- (id)description
{
  v22.receiver = self;
  v22.super_class = (Class)CLSHandoutEventAttachmentDetail;
  v3 = [(CLSObject *)&v22 description];
  id v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, @" (attachmentID: %@)", self->_attachmentID);
  v9 = NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v8);
  objc_msgSend_appendFormat_(v6, v10, @" (handoutAttachmentType: %@)", v9);

  uint64_t v11 = DefaultNameFromContextType(self->_contextType);
  objc_msgSend_appendFormat_(v6, v12, @" (contextType: %@)", v11);

  v15 = objc_msgSend_appIdentifier(self, v13, v14);

  if (v15)
  {
    long long v18 = objc_msgSend_appIdentifier(self, v16, v17);
    objc_msgSend_appendFormat_(v6, v19, @" (appIdentifier: %@)", v18);
  }
  objc_super v20 = objc_msgSend_copy(v6, v16, v17);

  return v20;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (int)handoutAttachmentType
{
  return self->_handoutAttachmentType;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void).cxx_destruct
{
}

@end