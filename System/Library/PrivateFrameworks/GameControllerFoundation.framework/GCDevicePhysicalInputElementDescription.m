@interface GCDevicePhysicalInputElementDescription
+ (BOOL)supportsSecureCoding;
+ (id)descriptionWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)validate:(id *)a3;
- (GCDevicePhysicalInputElementDescription)init;
- (GCDevicePhysicalInputElementDescription)initWithCoder:(id)a3;
- (GCDevicePhysicalInputSymbolDescription)symbol;
- (NSSet)aliases;
- (NSString)identifier;
- (NSString)localizedName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAliases:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setSymbol:(id)a3;
@end

@implementation GCDevicePhysicalInputElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setIdentifier:v3];

  return v4;
}

- (GCDevicePhysicalInputElementDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputElementDescription;
  return [(GCDevicePhysicalInputViewDescription *)&v3 init];
}

- (GCDevicePhysicalInputElementDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GCDevicePhysicalInputElementDescription *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"aliases"];
  aliases = v5->_aliases;
  v5->_aliases = (NSSet *)v10;

  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v12, objc_opt_class(), 0);
  uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"localizedName"];
  localizedName = v5->_localizedName;
  v5->_localizedName = (NSString *)v14;

  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];

  symbol = v5->_symbol;
  v5->_symbol = (GCDevicePhysicalInputSymbolDescription *)v16;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_aliases forKey:@"aliases"];
  [v5 encodeObject:self->_localizedName forKey:@"localizedName"];
  [v5 encodeObject:self->_symbol forKey:@"symbol"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = (id *)objc_opt_new();
  objc_storeStrong(v4 + 2, self->_identifier);
  objc_storeStrong(v4 + 3, self->_aliases);
  objc_storeStrong(v4 + 4, self->_localizedName);
  objc_storeStrong(v4 + 5, self->_symbol);
  return v4;
}

- (BOOL)validate:(id *)a3
{
  if (self->_identifier)
  {
    if ([(NSSet *)self->_aliases count]) {
      return 1;
    }
    if (a3)
    {
      NSErrorUserInfoKey v8 = NSLocalizedFailureReasonErrorKey;
      v9 = @"Element must have one or more 'aliases'.";
      id v5 = &v9;
      uint64_t v6 = &v8;
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
    v11 = @"Element must have an 'identifier'.";
    id v5 = &v11;
    uint64_t v6 = &v10;
LABEL_8:
    v7 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v6 count:1];
    *a3 = +[NSError errorWithDomain:@"GCDevicePhysicalInputError" code:0 userInfo:v7];
  }
  return 0;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((identifier = self->_identifier, identifier == (NSString *)v4[2])
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((aliases = self->_aliases, aliases == (NSSet *)v4[3]) || -[NSSet isEqual:](aliases, "isEqual:"))
    && ((localizedName = self->_localizedName, localizedName == (NSString *)v4[4])
     || -[NSString isEqual:](localizedName, "isEqual:")))
  {
    symbol = self->_symbol;
    if (symbol == (GCDevicePhysicalInputSymbolDescription *)v4[5]) {
      char v9 = 1;
    }
    else {
      char v9 = -[GCDevicePhysicalInputSymbolDescription isEqual:](symbol, "isEqual:");
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  identifier = self->_identifier;
  id v4 = [(NSSet *)self->_aliases allObjects];
  id v5 = [v4 componentsJoinedByString:@", "];
  uint64_t v6 = +[NSString stringWithFormat:@"Element '%@' [%@] '%@'", identifier, v5, self->_localizedName];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSSet)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (GCDevicePhysicalInputSymbolDescription)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_aliases, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end