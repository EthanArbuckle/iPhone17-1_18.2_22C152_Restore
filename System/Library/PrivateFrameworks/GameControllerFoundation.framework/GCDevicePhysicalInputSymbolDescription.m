@interface GCDevicePhysicalInputSymbolDescription
+ (BOOL)supportsSecureCoding;
+ (id)symbolWithSFSymbolsName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GCDevicePhysicalInputSymbolDescription)init;
- (GCDevicePhysicalInputSymbolDescription)initWithCoder:(id)a3;
- (GCDevicePhysicalInputSymbolDescription)initWithSFSymbolsName:(id)a3;
- (NSString)sfSymbolsName;
- (id)description;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCDevicePhysicalInputSymbolDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)symbolWithSFSymbolsName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSFSymbolsName:v4];

  return v5;
}

- (GCDevicePhysicalInputSymbolDescription)initWithSFSymbolsName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCDevicePhysicalInputSymbolDescription.m", 23, @"Invalid parameter not satisfying: %s", "symbolName != nil");
  }
  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputSymbolDescription;
  v6 = [(GCDevicePhysicalInputSymbolDescription *)&v11 init];
  uint64_t v7 = [v5 copy];
  sfSymbolsName = v6->_sfSymbolsName;
  v6->_sfSymbolsName = (NSString *)v7;

  return v6;
}

- (GCDevicePhysicalInputSymbolDescription)init
{
  return self;
}

- (GCDevicePhysicalInputSymbolDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sfSymbolsName"];

  v6 = [(GCDevicePhysicalInputSymbolDescription *)self initWithSFSymbolsName:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  return [(NSString *)self->_sfSymbolsName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->_sfSymbolsName isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)description
{
  return self->_sfSymbolsName;
}

- (id)redactedDescription
{
  return self->_sfSymbolsName;
}

- (NSString)sfSymbolsName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end