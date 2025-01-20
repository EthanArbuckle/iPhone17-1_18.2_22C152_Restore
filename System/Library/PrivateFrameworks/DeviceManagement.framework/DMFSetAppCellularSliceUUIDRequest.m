@interface DMFSetAppCellularSliceUUIDRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetAppCellularSliceUUIDRequest)initWithCoder:(id)a3;
- (NSString)UUIDString;
- (void)encodeWithCoder:(id)a3;
- (void)setUUIDString:(id)a3;
@end

@implementation DMFSetAppCellularSliceUUIDRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB7C0;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppCellularSliceUUIDRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppCellularSliceUUIDRequest;
  v5 = [(DMFAppRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"UUIDString"];
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppCellularSliceUUIDRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFSetAppCellularSliceUUIDRequest *)self UUIDString];
  [v4 encodeObject:v5 forKey:@"UUIDString"];
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end