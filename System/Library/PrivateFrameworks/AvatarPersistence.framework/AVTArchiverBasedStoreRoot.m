@interface AVTArchiverBasedStoreRoot
+ (BOOL)supportsSecureCoding;
- (AVTArchiverBasedStoreRoot)initWithCoder:(id)a3;
- (AVTArchiverBasedStoreRoot)initWithDomains:(id)a3 records:(id)a4;
- (NSArray)domains;
- (NSArray)records;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVTArchiverBasedStoreRoot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTArchiverBasedStoreRoot)initWithDomains:(id)a3 records:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTArchiverBasedStoreRoot;
  v8 = [(AVTArchiverBasedStoreRoot *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domains = v8->_domains;
    v8->_domains = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    records = v8->_records;
    v8->_records = (NSArray *)v11;
  }
  return v8;
}

- (AVTArchiverBasedStoreRoot)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"domains"];

  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"records"];

  v13 = [(AVTArchiverBasedStoreRoot *)self initWithDomains:v8 records:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTArchiverBasedStoreRoot *)self domains];
  [v4 encodeObject:v5 forKey:@"domains"];

  id v6 = [(AVTArchiverBasedStoreRoot *)self records];
  [v4 encodeObject:v6 forKey:@"records"];
}

- (NSArray)domains
{
  return self->_domains;
}

- (NSArray)records
{
  return self->_records;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_domains, 0);
}

@end