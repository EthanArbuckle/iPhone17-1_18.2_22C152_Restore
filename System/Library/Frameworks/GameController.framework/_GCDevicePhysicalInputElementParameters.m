@interface _GCDevicePhysicalInputElementParameters
+ (id)parametersWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)aliases;
- (uint64_t)identifier;
- (uint64_t)localizedName;
- (uint64_t)symbol;
- (unint64_t)hash;
- (void)setAliases:(void *)a1;
- (void)setIdentifier:(void *)a1;
- (void)setLocalizedName:(void *)a1;
- (void)setSymbol:(void *)a1;
@end

@implementation _GCDevicePhysicalInputElementParameters

- (uint64_t)identifier
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)aliases
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)localizedName
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)symbol
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

+ (id)parametersWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputElementParameters;
  v4 = [(_GCDevicePhysicalInputViewParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 1, self->_identifier);
  objc_storeStrong(v4 + 2, self->_aliases);
  objc_storeStrong(v4 + 3, self->_localizedName);
  objc_storeStrong(v4 + 4, self->_symbol);
  return v4;
}

- (unint64_t)hash
{
  if (self) {
    self = (_GCDevicePhysicalInputElementParameters *)self->_identifier;
  }
  return [(_GCDevicePhysicalInputElementParameters *)self hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputElementParameters;
  if ([(_GCDevicePhysicalInputViewParameters *)&v11 isEqual:v4]
    && ((identifier = self->_identifier, identifier == (NSString *)v4[1])
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((aliases = self->_aliases, aliases == (NSSet *)v4[2]) || -[NSSet isEqual:](aliases, "isEqual:"))
    && ((localizedName = self->_localizedName, localizedName == (NSString *)v4[3])
     || -[NSString isEqual:](localizedName, "isEqual:")))
  {
    symbol = self->_symbol;
    if (symbol == (GCDevicePhysicalInputSymbolDescription *)v4[4]) {
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

- (void)setIdentifier:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 8);
  }
}

- (void)setAliases:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
  }
}

- (void)setLocalizedName:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
  }
}

- (void)setSymbol:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_aliases, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end