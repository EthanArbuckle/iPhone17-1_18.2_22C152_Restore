@interface GCDevicePhysicalInputSourceDescription
+ (BOOL)supportsSecureCoding;
+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4;
+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 sfSymbolsName:(id)a5;
+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 sfSymbolsName:(id)a5 direction:(unint64_t)a6;
+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5;
+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5 direction:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (GCDevicePhysicalInputSourceDescription)init;
- (GCDevicePhysicalInputSourceDescription)initWithCoder:(id)a3;
- (GCDevicePhysicalInputSourceDescription)initWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5 direction:(unint64_t)a6;
- (GCDevicePhysicalInputSymbolDescription)symbol;
- (NSSet)elementAliases;
- (NSString)elementLocalizedName;
- (id)description;
- (unint64_t)direction;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCDevicePhysicalInputSourceDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5 direction:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithElementAliases:v12 localizedName:v11 symbol:v10 direction:a6];

  return v13;
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5
{
  return (id)[a1 sourceWithElementAliases:a3 localizedName:a4 symbol:a5 direction:0];
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 sfSymbolsName:(id)a5 direction:(unint64_t)a6
{
  if (a5)
  {
    id v10 = a4;
    id v11 = a3;
    id v12 = +[GCDevicePhysicalInputSymbolDescription symbolWithSFSymbolsName:a5];
    v13 = [a1 sourceWithElementAliases:v11 localizedName:v10 symbol:v12 direction:a6];
  }
  else
  {
    id v11 = a4;
    id v12 = a3;
    v13 = [a1 sourceWithElementAliases:v12 localizedName:v11 symbol:0 direction:a6];
  }

  return v13;
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 sfSymbolsName:(id)a5
{
  return (id)[a1 sourceWithElementAliases:a3 localizedName:a4 sfSymbolsName:a5 direction:0];
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4
{
  return (id)[a1 sourceWithElementAliases:a3 localizedName:a4 sfSymbolsName:0];
}

- (GCDevicePhysicalInputSourceDescription)initWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5 direction:(unint64_t)a6
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  if (![v13 count])
  {
    v22 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCDevicePhysicalInputSourceDescription.m", 49, @"Invalid parameter not satisfying: %s", "elementAliases.count > 0");
  }
  v23.receiver = self;
  v23.super_class = (Class)GCDevicePhysicalInputSourceDescription;
  v14 = [(GCDevicePhysicalInputSourceDescription *)&v23 init];
  uint64_t v15 = [v13 copy];

  elementAliases = v14->_elementAliases;
  v14->_elementAliases = (NSSet *)v15;

  uint64_t v17 = [v12 copy];
  elementLocalizedName = v14->_elementLocalizedName;
  v14->_elementLocalizedName = (NSString *)v17;

  uint64_t v19 = [v11 copy];
  symbol = v14->_symbol;
  v14->_symbol = (GCDevicePhysicalInputSymbolDescription *)v19;

  v14->_direction = a6;
  return v14;
}

- (GCDevicePhysicalInputSourceDescription)init
{
  return self;
}

- (GCDevicePhysicalInputSourceDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"elementAliases"];

  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"elementLocalizedName"];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
  uint64_t v12 = [v4 decodeIntegerForKey:@"direction"];

  id v13 = [(GCDevicePhysicalInputSourceDescription *)self initWithElementAliases:v7 localizedName:v10 symbol:v11 direction:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  elementAliases = self->_elementAliases;
  id v5 = a3;
  [v5 encodeObject:elementAliases forKey:@"elementAliases"];
  [v5 encodeObject:self->_elementLocalizedName forKey:@"elementLocalizedName"];
  [v5 encodeObject:self->_symbol forKey:@"symbol"];
  [v5 encodeInteger:self->_direction forKey:@"direction"];
}

- (unint64_t)hash
{
  return [(NSSet *)self->_elementAliases hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSSet *)self->_elementAliases isEqual:v4[1]]
    && ((elementLocalizedName = self->_elementLocalizedName, elementLocalizedName == (NSString *)v4[2])
     || -[NSString isEqual:](elementLocalizedName, "isEqual:"))
    && ((symbol = self->_symbol, symbol == (GCDevicePhysicalInputSymbolDescription *)v4[3])
     || -[GCDevicePhysicalInputSymbolDescription isEqual:](symbol, "isEqual:"))
    && self->_direction == v4[4];

  return v7;
}

- (id)description
{
  v3 = [(NSSet *)self->_elementAliases allObjects];
  id v4 = [v3 componentsJoinedByString:@", "];

  id v5 = objc_opt_new();
  v6 = v5;
  unint64_t direction = self->_direction;
  if (direction)
  {
    [v5 addObject:@"up"];
    unint64_t direction = self->_direction;
    if ((direction & 4) == 0)
    {
LABEL_3:
      if ((direction & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((direction & 4) == 0)
  {
    goto LABEL_3;
  }
  [v6 addObject:@"down"];
  unint64_t direction = self->_direction;
  if ((direction & 8) == 0)
  {
LABEL_4:
    if ((direction & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v6 addObject:@"left"];
  if ((self->_direction & 2) != 0) {
LABEL_5:
  }
    [v6 addObject:@"right"];
LABEL_6:
  elementLocalizedName = self->_elementLocalizedName;
  symbol = self->_symbol;
  id v10 = [v6 componentsJoinedByString:@"|"];
  id v11 = +[NSString stringWithFormat:@"[%@] '%@' '%@' %@", v4, elementLocalizedName, symbol, v10];

  return v11;
}

- (NSSet)elementAliases
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)elementLocalizedName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (GCDevicePhysicalInputSymbolDescription)symbol
{
  return (GCDevicePhysicalInputSymbolDescription *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_elementLocalizedName, 0);

  objc_storeStrong((id *)&self->_elementAliases, 0);
}

@end