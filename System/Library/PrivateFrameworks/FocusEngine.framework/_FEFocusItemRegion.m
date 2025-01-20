@interface _FEFocusItemRegion
- (BOOL)_canBeOccludedByRegionsAbove;
- (BOOL)_canOccludeRegionsBelow;
- (BOOL)isEqual:(id)a3;
- (_FEFocusItem)item;
- (_FEFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (_FEFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 item:(id)a5 focusSystem:(id)a6;
- (id)_debugAssociatedObject;
- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3;
- (id)_defaultFocusItem;
- (id)_descriptionBuilder;
- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (int64_t)_preferredDistanceComparisonType;
- (unint64_t)_focusableBoundaries;
@end

@implementation _FEFocusItemRegion

- (_FEFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  return -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](self, "initWithFrame:coordinateSpace:item:focusSystem:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_FEFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 item:(id)a5 focusSystem:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)_FEFocusItemRegion;
  v15 = -[_FEFocusRegion initWithFrame:coordinateSpace:](&v33, sel_initWithFrame_coordinateSpace_, a4, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    v17 = v15;
    id v18 = v13;
    id v19 = v14;
    objc_storeWeak((id *)&v17->_item, v18);
    unsigned __int8 v34 = 0;
    if (v18)
    {
      char IsEligibleForFocusOcclusion = _FEFocusEnvironmentIsEligibleForFocusOcclusion(v18, &v34);
      int v21 = v34;
    }
    else
    {
      int v21 = 0;
      char IsEligibleForFocusOcclusion = 0;
    }
    *(unsigned char *)&v17->_char flags = *(unsigned char *)&v17->_flags & 0xFE | IsEligibleForFocusOcclusion;
    if (!v19 && v21)
    {
      id v19 = +[_FEFocusSystem focusSystemForEnvironment:v18];
      v22 = [MEMORY[0x263F08690] currentHandler];
      v23 = objc_msgSend(NSString, "stringWithUTF8String:", "void _CommonInit(_FEFocusItemRegion *__strong, id<_FEFocusItem>  _Nullable __strong, _FEFocusSystem *__strong)");
      if (v19)
      {
        v24 = NSString;
        id v32 = v13;
        id v25 = v19;
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        v28 = [v24 stringWithFormat:@"<%@: %p>", v27, v25];

        id v13 = v32;
      }
      else
      {
        v28 = @"(nil)";
      }
      [v22 handleFailureInFunction:v23, @"_FEFocusItemRegion.m", 45, @"_FEFocusItemRegion got called with a nil focus system. Inferring focus system found %@", v28 file lineNumber description];

      int v21 = v34;
    }
    if (v21)
    {
      if (_FEFocusItemCanBecomeFocused(v18, v19)) {
        LOBYTE(v21) = 2;
      }
      else {
        LOBYTE(v21) = 0;
      }
    }
    *(unsigned char *)&v17->_char flags = *(unsigned char *)&v17->_flags & 0xFD | v21;
    char flags = (char)v17->_flags;
    if ((flags & 2) != 0)
    {
      char v30 = 0;
    }
    else
    {
      if (_FEFocusItemIsTransparentFocusItem(v18)) {
        char v30 = 4;
      }
      else {
        char v30 = 0;
      }
      char flags = (char)v17->_flags;
    }
    *(unsigned char *)&v17->_char flags = flags & 0xFB | v30;
  }
  return v16;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_FEFocusItemRegion;
  uint64_t v5 = -[_FEFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_storeWeak((id *)(v5 + 56), WeakRetained);

  *($4C59EE55ECBB4E4B9AB7F9871DE0ED47 *)(v5 + 48) = self->_flags;
  return (id)v5;
}

- (id)_descriptionBuilder
{
  v13.receiver = self;
  v13.super_class = (Class)_FEFocusItemRegion;
  v3 = [(_FEFocusRegion *)&v13 _descriptionBuilder];
  v4 = [(_FEFocusItemRegion *)self item];
  if (v4)
  {
    uint64_t v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    objc_super v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];
  }
  else
  {
    objc_super v8 = @"(nil)";
  }
  id v9 = (id)[v3 appendObject:v8 withName:@"item"];

  id v10 = (id)[v3 appendBool:(*(unsigned char *)&self->_flags >> 1) & 1 withName:@"focusable"];
  id v11 = (id)[v3 appendBool:(*(unsigned char *)&self->_flags >> 2) & 1 withName:@"transparent"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_FEFocusItemRegion;
  if ([(_FEFocusRegion *)&v15 isEqual:v4])
  {
    uint64_t v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    id v7 = objc_loadWeakRetained(v5 + 7);
    id v8 = WeakRetained;
    id v9 = v7;
    id v10 = v9;
    if (v8 != v9)
    {
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
      }
      else
      {
        int v13 = [v8 isEqual:v9];

        if (v13) {
          goto LABEL_12;
        }
      }
      BOOL v12 = 0;
LABEL_16:

      goto LABEL_17;
    }

LABEL_12:
    BOOL v12 = ((*((unsigned char *)v5 + 48) ^ *(unsigned char *)&self->_flags) & 3) == 0
       && ((*((unsigned char *)v5 + 48) ^ *(unsigned char *)&self->_flags) & 4) == 0;
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_canOccludeRegionsBelow
{
  return (*(unsigned char *)&self->_flags & 5) == 1;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return 0;
  }
  v3 = [(_FEFocusItemRegion *)self item];
  BOOL v2 = v3 != 0;

  return v2;
}

- (id)_defaultFocusItem
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    BOOL v2 = [(_FEFocusItemRegion *)self item];
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (unint64_t)_focusableBoundaries
{
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return 0;
  }
  v3 = [(_FEFocusItemRegion *)self item];
  BOOL v4 = v3 != 0;

  return 32 * v4;
}

- (int64_t)_preferredDistanceComparisonType
{
  v3.receiver = self;
  v3.super_class = (Class)_FEFocusItemRegion;
  return [(_FEFocusRegion *)&v3 _preferredDistanceComparisonType];
}

- (id)_debugAssociatedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return WeakRetained;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  BOOL v4 = [(_FEFocusItemRegion *)self _focusableBoundaries];
  if (v4)
  {
    BOOL v4 = +[_FEFocusRegionDebugDrawingConfiguration itemConfigurationForRegion:self];
  }
  return v4;
}

- (_FEFocusItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (_FEFocusItem *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end