@interface CLSAuthTreeNode
+ (BOOL)supportsSecureCoding;
- (CLSAuthTreeNode)initWithCoder:(id)a3;
- (CLSAuthTreeNode)initWithStatusID:(id)a3 identifier:(id)a4 status:(int64_t)a5;
- (NSString)identifier;
- (NSString)statusID;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLSAuthTreeNode

- (CLSAuthTreeNode)initWithStatusID:(id)a3 identifier:(id)a4 status:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSAuthTreeNode;
  v11 = [(CLSAuthTreeNode *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusID, a3);
    objc_storeStrong((id *)&v12->_identifier, a4);
    v12->_status = a5;
  }

  return v12;
}

- (CLSAuthTreeNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSAuthTreeNode;
  v5 = [(CLSAuthTreeNode *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"statusID");
    statusID = v5->_statusID;
    v5->_statusID = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"status");
    v5->_status = objc_msgSend_integerValue(v16, v17, v18);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  statusID = self->_statusID;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)statusID, @"statusID");
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)self->_identifier, @"identifier");
  objc_msgSend_numberWithInteger_(NSNumber, v8, self->_status);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)v10, @"status");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)statusID
{
  return self->_statusID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_statusID, 0);
}

@end