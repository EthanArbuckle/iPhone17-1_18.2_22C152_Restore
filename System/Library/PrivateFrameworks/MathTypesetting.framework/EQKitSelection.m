@interface EQKitSelection
- (BOOL)containsBox:(id)a3;
- (BOOL)isEqual:(id)a3;
- (EQKitBox)box;
- (EQKitSelection)initWithBox:(id)a3;
- (EQKitSelection)initWithInspectable:(id)a3;
- (id)inspectables;
@end

@implementation EQKitSelection

- (EQKitSelection)initWithBox:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitSelection;
  result = [(EQKitSelection *)&v5 init];
  if (result) {
    result->_box = (EQKitBox *)a3;
  }
  return result;
}

- (EQKitSelection)initWithInspectable:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EQKitSelection;
  v4 = [(EQKitSelection *)&v6 init];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_box = (EQKitBox *)[a3 box];
    }
  }
  return v4;
}

- (id)inspectables
{
  v3[1] = *MEMORY[0x263EF8340];
  if (!self->_box) {
    return (id)MEMORY[0x263EFFA68];
  }
  v3[0] = [[_EQKitInspectableBox alloc] initWithBox:self->_box];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (BOOL)containsBox:(id)a3
{
  return self->_box == a3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_super v5 = [(EQKitSelection *)self box];
  uint64_t v6 = [a3 box];

  return [(EQKitBox *)v5 isEqual:v6];
}

- (EQKitBox)box
{
  return self->_box;
}

@end