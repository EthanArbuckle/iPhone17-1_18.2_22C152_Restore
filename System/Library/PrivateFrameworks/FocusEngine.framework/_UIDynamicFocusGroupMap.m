@interface _UIDynamicFocusGroupMap
- (_UIDynamicFocusGroupMap)init;
- (_UIDynamicFocusGroupMap)initWithBackingFocusGroupMap:(id)a3;
- (_UIDynamicFocusGroupMap)initWithCoordinateSpace:(id)a3;
- (id)focusGroupIdentifierForItem:(id)a3;
@end

@implementation _UIDynamicFocusGroupMap

- (_UIDynamicFocusGroupMap)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"-init is not a valid initializer for %@", v6 format];

  return 0;
}

- (_UIDynamicFocusGroupMap)initWithCoordinateSpace:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicFocusGroupMap;
  v5 = [(_UIDynamicFocusGroupMap *)&v10 init];
  if (v5)
  {
    v6 = [_FEFocusGroupMap alloc];
    uint64_t v7 = [(_FEFocusGroupMap *)v6 initWithItems:MEMORY[0x263EFFA68] coordinateSpace:v4];
    impl = v5->_impl;
    v5->_impl = (_FEFocusGroupMap *)v7;
  }
  return v5;
}

- (_UIDynamicFocusGroupMap)initWithBackingFocusGroupMap:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDynamicFocusGroupMap;
  v5 = [(_UIDynamicFocusGroupMap *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    impl = v5->_impl;
    v5->_impl = (_FEFocusGroupMap *)v6;
  }
  return v5;
}

- (id)focusGroupIdentifierForItem:(id)a3
{
  id v4 = a3;
  v5 = [(_FEFocusGroupMap *)self->_impl focusGroupForItem:v4];
  if (!v5)
  {
    v5 = [(_FEFocusGroupMap *)self->_impl _indexEnvironment:v4];
  }
  uint64_t v6 = [v5 identifier];

  return v6;
}

- (void).cxx_destruct
{
}

@end