@interface HMCRedirectorStrongTuple
- (BOOL)isEqual:(id)a3;
- (id)attributeDescriptions;
- (id)description;
- (unint64_t)hash;
@end

@implementation HMCRedirectorStrongTuple

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_tuple, 0);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  if (self) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  v6 = NSStringFromSelector(selector);
  v7 = [NSString stringWithFormat:@"<HMCRedirectorStrongTuple -[%@ %@]>", v4, v6];

  return v7;
}

- (id)attributeDescriptions
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  if (self) {
    id target = self->_target;
  }
  else {
    id target = 0;
  }
  id v5 = target;
  v6 = (void *)[v3 initWithName:@"Target" value:v5];
  v13[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  if (self) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  v9 = NSStringFromSelector(selector);
  v10 = (void *)[v7 initWithName:@"Selector" value:v9];
  v13[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  v6 = v5;
  id v7 = v6;
  if (v6)
  {
    if (self) {
      tuple = self->_tuple;
    }
    else {
      tuple = 0;
    }
    uint64_t v9 = v6[1];
    v10 = tuple;
    char v11 = [(HMCRedirectorTuple *)v10 isEqual:v9];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  if (self) {
    self = (HMCRedirectorStrongTuple *)self->_tuple;
  }
  return [(HMCRedirectorStrongTuple *)self hash];
}

@end