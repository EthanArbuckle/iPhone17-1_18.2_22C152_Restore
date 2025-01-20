@interface CRKDumpIDSInfoResultObject
+ (BOOL)supportsSecureCoding;
- (CRKDumpIDSInfoResultObject)initWithCoder:(id)a3;
- (CRKDumpIDSInfoResultObject)initWithInfo:(id)a3;
- (NSDictionary)info;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKDumpIDSInfoResultObject

- (CRKDumpIDSInfoResultObject)initWithInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKDumpIDSInfoResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    info = v5->_info;
    v5->_info = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKDumpIDSInfoResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKDumpIDSInfoResultObject *)self info];
  [v4 encodeObject:v5 forKey:@"info"];
}

- (CRKDumpIDSInfoResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKDumpIDSInfoResultObject;
  v5 = [(CATTaskResultObject *)&v21 initWithCoder:v4];
  if (v5)
  {
    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"info"];
    info = v5->_info;
    v5->_info = (NSDictionary *)v15;
  }
  return v5;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
}

@end