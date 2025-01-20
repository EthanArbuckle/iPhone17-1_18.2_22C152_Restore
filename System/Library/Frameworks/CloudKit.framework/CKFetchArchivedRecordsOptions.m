@interface CKFetchArchivedRecordsOptions
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (CKFetchArchivedRecordsOptions)init;
- (CKFetchArchivedRecordsOptions)initWithCoder:(id)a3;
- (CKFetchArchivedRecordsOptions)initWithPreviousServerChangeToken:(id)a3;
- (CKServerChangeToken)previousServerChangeToken;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPreviousServerChangeToken:(id)a3;
@end

@implementation CKFetchArchivedRecordsOptions

- (CKFetchArchivedRecordsOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchArchivedRecordsOptions;
  return [(CKFetchArchivedRecordsOptions *)&v3 init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CKFetchArchivedRecordsOptions;
  return objc_msgSendSuper2(&v3, "new");
}

- (CKFetchArchivedRecordsOptions)initWithPreviousServerChangeToken:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFetchArchivedRecordsOptions;
  v8 = [(CKFetchArchivedRecordsOptions *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    previousServerChangeToken = v8->_previousServerChangeToken;
    v8->_previousServerChangeToken = (CKServerChangeToken *)v9;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKFetchArchivedRecordsOptions alloc];
  v8 = objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  v11 = objc_msgSend_initWithPreviousServerChangeToken_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, @"previousServerChangeToken");
}

- (CKFetchArchivedRecordsOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFetchArchivedRecordsOptions;
  v5 = [(CKFetchArchivedRecordsOptions *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"previousServerChangeToken");
    previousServerChangeToken = v5->_previousServerChangeToken;
    v5->_previousServerChangeToken = (CKServerChangeToken *)v9;
  }

  return v5;
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end