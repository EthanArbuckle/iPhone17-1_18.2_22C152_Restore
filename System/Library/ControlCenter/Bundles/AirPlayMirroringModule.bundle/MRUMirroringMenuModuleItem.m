@interface MRUMirroringMenuModuleItem
- (BOOL)isEqual:(id)a3;
- (NSString)symbolName;
- (unint64_t)hash;
- (void)setSymbolName:(id)a3;
@end

@implementation MRUMirroringMenuModuleItem

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUMirroringMenuModuleItem;
  if ([(CCUIMenuModuleItem *)&v9 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(MRUMirroringMenuModuleItem *)self symbolName];
    v6 = [v4 symbolName];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)MRUMirroringMenuModuleItem;
  unint64_t v3 = [(CCUIMenuModuleItem *)&v7 hash];
  id v4 = [(MRUMirroringMenuModuleItem *)self symbolName];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end