@interface DMFRefreshCellularPlansRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFRefreshCellularPlansRequest)initWithCoder:(id)a3;
- (NSURL)eSIMServerURL;
- (void)encodeWithCoder:(id)a3;
- (void)setESIMServerURL:(id)a3;
@end

@implementation DMFRefreshCellularPlansRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABA48;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRefreshCellularPlansRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFRefreshCellularPlansRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"eSIMServerURL"];
    eSIMServerURL = v5->_eSIMServerURL;
    v5->_eSIMServerURL = (NSURL *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFRefreshCellularPlansRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFRefreshCellularPlansRequest *)self eSIMServerURL];
  [v4 encodeObject:v5 forKey:@"eSIMServerURL"];
}

- (NSURL)eSIMServerURL
{
  return self->_eSIMServerURL;
}

- (void)setESIMServerURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end