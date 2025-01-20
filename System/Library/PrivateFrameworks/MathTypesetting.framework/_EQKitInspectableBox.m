@interface _EQKitInspectableBox
- (BOOL)isEqual:(id)a3;
- (EQKitBox)box;
- (EQKitInspectable)cachedChildren;
- (EQKitInspectable)inspectableChildren;
- (NSString)inspectableName;
- (NSString)inspectableNameForIcon;
- (_EQKitInspectableBox)initWithBox:(id)a3;
- (_NSRange)inspectableNameRange;
- (double)inspectableDepth;
- (double)inspectableHeight;
- (double)inspectableWidth;
- (void)setCachedChildren:(id)a3;
@end

@implementation _EQKitInspectableBox

- (_EQKitInspectableBox)initWithBox:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_EQKitInspectableBox;
  result = [(_EQKitInspectableBox *)&v5 init];
  if (result) {
    result->_box = (EQKitBox *)a3;
  }
  return result;
}

- (double)inspectableWidth
{
  [(EQKitBox *)self->_box width];
  return result;
}

- (double)inspectableHeight
{
  [(EQKitBox *)self->_box height];
  return result;
}

- (double)inspectableDepth
{
  [(EQKitBox *)self->_box depth];
  return result;
}

- (NSString)inspectableNameForIcon
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)inspectableName
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (void *)[(EQKitBox *)self->_box attribution];
    return (NSString *)[v3 source];
  }
  else
  {
    objc_super v5 = (objc_class *)objc_opt_class();
    return NSStringFromClass(v5);
  }
}

- (_NSRange)inspectableNameRange
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (void *)[(EQKitBox *)self->_box attribution];
    NSUInteger v4 = [v3 range];
  }
  else
  {
    NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v5 = 0;
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (EQKitInspectable)inspectableChildren
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  _NSRange result = self->_cachedChildren;
  if (!result)
  {
    if ([(EQKitBox *)self->_box canContainBoxes])
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = [(EQKitBox *)self->_box containedBoxes];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(v4, "addObject:", -[_EQKitInspectableBox initWithBox:]([_EQKitInspectableBox alloc], "initWithBox:", *(void *)(*((void *)&v10 + 1) + 8 * v9++)));
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
      _NSRange result = (EQKitInspectable *)[v4 copy];
      self->_cachedChildren = result;
    }
    else
    {
      return self->_cachedChildren;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(_EQKitInspectableBox *)self box];
  uint64_t v6 = [a3 box];

  return [(EQKitBox *)v5 isEqual:v6];
}

- (EQKitBox)box
{
  return self->_box;
}

- (EQKitInspectable)cachedChildren
{
  return self->_cachedChildren;
}

- (void)setCachedChildren:(id)a3
{
  self->_cachedChildren = (EQKitInspectable *)a3;
}

@end