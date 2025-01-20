@interface AppleIDPasswordMetadata
+ (BOOL)supportsSecureCoding;
- (AppleIDPasswordMetadata)initWithCoder:(id)a3;
- (AppleIDPasswordMetadata)initWithProto:(id)a3 salt:(id)a4 iterations:(int)a5;
- (NSData)salt;
- (NSString)proto;
- (int)iterations;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AppleIDPasswordMetadata

- (AppleIDPasswordMetadata)initWithProto:(id)a3 salt:(id)a4 iterations:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AppleIDPasswordMetadata;
  v11 = [(AppleIDPasswordMetadata *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_proto, a3);
    objc_storeStrong((id *)&v12->_salt, a4);
    v12->_iterations = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  v6 = objc_msgSend_proto(self, v4, v5);
  objc_msgSend_encodeObject_forKey_(v16, v7, (uint64_t)v6, @"proto");

  id v10 = objc_msgSend_salt(self, v8, v9);
  objc_msgSend_encodeObject_forKey_(v16, v11, (uint64_t)v10, @"salt");

  uint64_t v14 = objc_msgSend_iterations(self, v12, v13);
  objc_msgSend_encodeInt32_forKey_(v16, v15, v14, @"iterations");
}

- (AppleIDPasswordMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AppleIDPasswordMetadata;
  uint64_t v5 = [(AppleIDPasswordMetadata *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"proto");
    proto = v5->_proto;
    v5->_proto = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"salt");
    salt = v5->_salt;
    v5->_salt = (NSData *)v12;

    v5->_iterations = objc_msgSend_decodeInt32ForKey_(v4, v14, @"iterations");
  }

  return v5;
}

- (NSString)proto
{
  return self->_proto;
}

- (NSData)salt
{
  return self->_salt;
}

- (int)iterations
{
  return self->_iterations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);

  objc_storeStrong((id *)&self->_proto, 0);
}

@end