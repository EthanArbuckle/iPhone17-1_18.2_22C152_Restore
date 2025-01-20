@interface AXLiveRegionNode
+ (id)createNodeFromObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)label;
- (NSString)value;
- (id)object;
- (unint64_t)traits;
- (void)setLabel:(id)a3;
- (void)setObject:(id)a3;
- (void)setTraits:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation AXLiveRegionNode

+ (id)createNodeFromObject:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXLiveRegionNode);
  v5 = [v3 accessibilityLabel];
  [(AXLiveRegionNode *)v4 setLabel:v5];

  v6 = [v3 accessibilityValue];
  [(AXLiveRegionNode *)v4 setValue:v6];

  -[AXLiveRegionNode setTraits:](v4, "setTraits:", [v3 accessibilityTraits]);
  [(AXLiveRegionNode *)v4 setObject:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(AXLiveRegionNode *)self object];
    v6 = [v4 object];
    if (v5 == v6)
    {
      v8 = [(AXLiveRegionNode *)self label];
      v9 = [v4 label];
      if ([v8 isEqualToString:v9])
      {
        v10 = [(AXLiveRegionNode *)self value];
        v11 = [v4 value];
        if ([v10 isEqualToString:v11])
        {
          unint64_t v12 = [(AXLiveRegionNode *)self traits];
          BOOL v7 = v12 == [v4 traits];
        }
        else
        {
          BOOL v7 = 0;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (unint64_t)traits
{
  return self->_traits;
}

- (void)setTraits:(unint64_t)a3
{
  self->_traits = a3;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end