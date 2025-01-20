@interface CKSyncEngineStateSerialization
+ (BOOL)supportsSecureCoding;
- (BOOL)CKDescriptionShouldPrintPointer;
- (CKSyncEngineStateSerialization)init;
- (CKSyncEngineStateSerialization)initWithCoder:(id)a3;
- (CKSyncEngineStateSerialization)initWithData:(id)a3;
- (NSData)data;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation CKSyncEngineStateSerialization

- (CKSyncEngineStateSerialization)init
{
  v2 = [CKException alloc];
  id v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E4F1C3C8], @"%s is unavailable", "-[CKSyncEngineStateSerialization init]");
  objc_exception_throw(v4);
}

- (CKSyncEngineStateSerialization)initWithData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSyncEngineStateSerialization;
  v8 = [(CKSyncEngineStateSerialization *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    data = v8->_data;
    v8->_data = (NSData *)v9;
  }
  return v8;
}

- (CKSyncEngineStateSerialization)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSyncEngineStateSerialization;
  v5 = [(CKSyncEngineStateSerialization *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_data);
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    data = v5->_data;
    v5->_data = (NSData *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v4 = a3;
  NSStringFromSelector(sel_data);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)data, (uint64_t)v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineStateSerialization *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineStateSerialization *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"StateSerialization";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  objc_msgSend_data(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v8, @"data", (uint64_t)v9, 0);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end