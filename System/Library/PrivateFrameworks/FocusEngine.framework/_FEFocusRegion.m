@interface _FEFocusRegion
- (BOOL)_canBeOccludedByRegionsAbove;
- (BOOL)_canOccludeRegionsBelow;
- (BOOL)_ignoresSpeedBumpEdges;
- (BOOL)_isUnclippable;
- (BOOL)_shouldCropRegionToSearchArea;
- (BOOL)_shouldUseNextFocusedItemForLinearSorting;
- (BOOL)isEqual:(id)a3;
- (CGRect)regionFrame;
- (_FECoordinateSpace)regionCoordinateSpace;
- (_FEFocusRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (float)_focusPriority;
- (id)_debugAssociatedObject;
- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3;
- (id)_defaultFocusItem;
- (id)_descriptionBuilder;
- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (id)_focusedItemForLinearSorting:(id)a3 inMap:(id)a4 withSnapshot:(id)a5;
- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5;
- (id)description;
- (int64_t)_preferredDistanceComparisonType;
- (unint64_t)_boundariesBlockingFocusMovementRequest:(id)a3;
- (unint64_t)_effectiveBoundariesBlockingFocusMovementRequest:(id)a3;
- (unint64_t)_effectiveFocusableBoundariesForHeading:(unint64_t)a3;
- (unint64_t)_focusableBoundaries;
- (unint64_t)hash;
@end

@implementation _FEFocusRegion

- (_FEFocusRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  if (!v11)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_FEFocusRegion.m", 235, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)_FEFocusRegion;
  v12 = [(_FEFocusRegion *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->_regionFrame.origin.CGFloat x = x;
    v12->_regionFrame.origin.CGFloat y = y;
    v12->_regionFrame.size.CGFloat width = width;
    v12->_regionFrame.size.CGFloat height = height;
    objc_storeStrong((id *)&v12->_regionCoordinateSpace, a4);
  }

  return v13;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (CGRectIsEmpty(v16))
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_FEFocusRegion.m", 247, @"Invalid parameter not satisfying: %@", @"!CGRectIsEmpty(frame)" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  else if (v10)
  {
    goto LABEL_3;
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"_FEFocusRegion.m", 248, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];

LABEL_3:
  id v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:coordinateSpace:", v10, x, y, width, height);

  return v11;
}

- (id)_descriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [(_FEFocusRegion *)self regionFrame];
  v8 = _FEStringFromCGRect(v4, v5, v6, v7);
  id v9 = (id)[v3 appendObject:v8 withName:@"frame"];

  id v10 = [(_FEFocusRegion *)self regionCoordinateSpace];

  if (v10)
  {
    id v11 = [(_FEFocusRegion *)self regionCoordinateSpace];
    if (v11)
    {
      v12 = NSString;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];
    }
    else
    {
      v15 = @"(nil)";
    }
    id v17 = (id)[v3 appendObject:v15 withName:@"coordinateSpace"];
  }
  else
  {
    id v16 = (id)[v3 appendObject:@"global" withName:@"coordinateSpace"];
  }
  return v3;
}

- (id)description
{
  v2 = [(_FEFocusRegion *)self _descriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (_FEFocusRegion *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(_FEFocusRegion *)self isMemberOfClass:objc_opt_class()])
    {
      double v5 = v4;
      regionCoordinateSpace = v5->_regionCoordinateSpace;
      double v7 = self->_regionCoordinateSpace;
      v8 = regionCoordinateSpace;
      if (v7 == v8)
      {
      }
      else
      {
        id v9 = v8;
        if (!v7 || !v8)
        {

LABEL_13:
          BOOL v11 = 0;
          goto LABEL_14;
        }
        int v10 = [(_FECoordinateSpace *)v7 isEqual:v8];

        if (!v10) {
          goto LABEL_13;
        }
      }
      BOOL v11 = CGRectEqualToRect(self->_regionFrame, v5->_regionFrame);
LABEL_14:

      goto LABEL_15;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_FECoordinateSpace *)self->_regionCoordinateSpace hash];
  int8x16_t v4 = vorrq_s8(vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_regionFrame.origin), (int8x16_t)xmmword_24F427640), vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_regionFrame.size), (int8x16_t)xmmword_24F427630));
  return *(void *)&vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ v3;
}

- (BOOL)_canOccludeRegionsBelow
{
  return 1;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  return 1;
}

- (BOOL)_shouldCropRegionToSearchArea
{
  return 1;
}

- (BOOL)_isUnclippable
{
  return 0;
}

- (id)_defaultFocusItem
{
  return 0;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  return 0;
}

- (BOOL)_shouldUseNextFocusedItemForLinearSorting
{
  return 1;
}

- (id)_focusedItemForLinearSorting:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  return (id)[a5 _cachedNextFocusedItemForRegion:self withFocusMovementRequest:a3 inMap:a4];
}

- (unint64_t)_focusableBoundaries
{
  return 0;
}

- (unint64_t)_boundariesBlockingFocusMovementRequest:(id)a3
{
  return 0;
}

- (int64_t)_preferredDistanceComparisonType
{
  return 0;
}

- (float)_focusPriority
{
  return 0.0;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return 0;
}

- (unint64_t)_effectiveFocusableBoundariesForHeading:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v4 = [(_FEFocusRegion *)self _focusableBoundaries];
  return _UIEffectiveFocusRegionBoundariesForHeading(v4, v3);
}

- (unint64_t)_effectiveBoundariesBlockingFocusMovementRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_FEFocusRegion *)self _boundariesBlockingFocusMovementRequest:v4];
  double v6 = [v4 movementInfo];

  unint64_t v7 = _UIEffectiveFocusRegionBoundariesForHeading(v5, [v6 heading]);
  return v7;
}

- (id)_debugAssociatedObject
{
  return 0;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  return 0;
}

- (CGRect)regionFrame
{
  double x = self->_regionFrame.origin.x;
  double y = self->_regionFrame.origin.y;
  double width = self->_regionFrame.size.width;
  double height = self->_regionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (_FECoordinateSpace)regionCoordinateSpace
{
  return self->_regionCoordinateSpace;
}

- (void).cxx_destruct
{
}

@end