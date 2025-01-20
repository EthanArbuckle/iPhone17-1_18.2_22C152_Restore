@interface BDSCRDTModelSyncVersionInfo
+ (BOOL)supportsSecureCoding;
- (BDSCRDTModelSyncVersionInfo)initWithCoder:(id)a3;
- (BDSCRDTModelSyncVersionInfo)initWithData:(id)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation BDSCRDTModelSyncVersionInfo

- (BDSCRDTModelSyncVersionInfo)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSCRDTModelSyncVersionInfo;
  v6 = [(BDSCRDTModelSyncVersionInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCRDTModelSyncVersionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSCRDTModelSyncVersionInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSCRDTModelSyncVersionInfo *)self data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSCRDTModelSyncVersionInfo);
  if (v4)
  {
    id v5 = [(BDSCRDTModelSyncVersionInfo *)self data];
    [(BDSCRDTModelSyncVersionInfo *)v4 setData:v5];
  }
  return v4;
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