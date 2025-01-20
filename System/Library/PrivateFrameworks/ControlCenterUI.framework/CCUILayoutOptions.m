@interface CCUILayoutOptions
- (BOOL)isEqual:(id)a3;
- (CCUILayoutOptions)init;
- (double)itemEdgeSize;
- (double)itemSpacing;
- (id)_initWithLayoutOptions:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation CCUILayoutOptions

- (CCUILayoutOptions)init
{
  return (CCUILayoutOptions *)[(CCUILayoutOptions *)self _initWithLayoutOptions:0];
}

- (id)_initWithLayoutOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUILayoutOptions;
  v5 = [(CCUILayoutOptions *)&v9 init];
  if (v5)
  {
    [v4 itemEdgeSize];
    v5->_itemEdgeSize = v6;
    [v4 itemSpacing];
    v5->_itemSpacing = v7;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(CCUILayoutOptions *)self itemEdgeSize];
  id v4 = (id)objc_msgSend(v3, "appendFloat:withName:", @"Item Edge Size");
  [(CCUILayoutOptions *)self itemSpacing];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"Item Spacing");
  double v6 = [v3 build];

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  [(CCUILayoutOptions *)self itemEdgeSize];
  id v4 = (id)objc_msgSend(v3, "appendCGFloat:");
  [(CCUILayoutOptions *)self itemSpacing];
  id v5 = (id)objc_msgSend(v3, "appendCGFloat:");
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCUILayoutOptions *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      [(CCUILayoutOptions *)self itemEdgeSize];
      [(CCUILayoutOptions *)v5 itemEdgeSize];
      if (BSCompareFloats())
      {
        BOOL v6 = 0;
      }
      else
      {
        [(CCUILayoutOptions *)self itemSpacing];
        [(CCUILayoutOptions *)v5 itemSpacing];
        BOOL v6 = BSCompareFloats() == 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CCUIMutableLayoutOptions alloc];

  return [(CCUILayoutOptions *)v4 _initWithLayoutOptions:self];
}

- (double)itemEdgeSize
{
  return self->_itemEdgeSize;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

@end