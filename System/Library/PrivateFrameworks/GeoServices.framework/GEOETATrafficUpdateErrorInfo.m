@interface GEOETATrafficUpdateErrorInfo
+ (BOOL)supportsSecureCoding;
+ (NSString)key;
- (GEOETATrafficUpdateErrorInfo)initWithCoder:(id)a3;
- (GEOETATrafficUpdateErrorInfo)initWithResponse:(id)a3;
- (NSArray)internalErrors;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOETATrafficUpdateErrorInfo

- (GEOETATrafficUpdateErrorInfo)initWithResponse:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOETATrafficUpdateErrorInfo;
  v5 = [(GEOETATrafficUpdateErrorInfo *)&v14 init];
  if (v5)
  {
    v6 = [v4 internalErrors];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
      v9 = [v4 internalErrors];
      uint64_t v10 = [v8 initWithArray:v9 copyItems:1];
      internalErrors = v5->_internalErrors;
      v5->_internalErrors = (NSArray *)v10;
    }
    v12 = v5;
  }

  return v5;
}

+ (NSString)key
{
  return (NSString *)@"ETATrafficUpdateErrorInfo";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (GEOETATrafficUpdateErrorInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOETATrafficUpdateErrorInfo;
  v5 = [(GEOETATrafficUpdateErrorInfo *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_internalErrors"];
    internalErrors = v5->_internalErrors;
    v5->_internalErrors = (NSArray *)v6;

    id v8 = v5;
  }

  return v5;
}

- (NSArray)internalErrors
{
  return self->_internalErrors;
}

- (void).cxx_destruct
{
}

@end