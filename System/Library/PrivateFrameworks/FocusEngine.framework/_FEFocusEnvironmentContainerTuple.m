@interface _FEFocusEnvironmentContainerTuple
+ (_FEFocusEnvironmentContainerTuple)tupleWithOwningEnvironment:(id)a3 itemContainer:(id)a4;
+ (_FEFocusEnvironmentContainerTuple)tupleWithRequiredContainerFromEnvironment:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEnvironmentContainerTuple:(id)a3;
- (BOOL)isScrollableContainer;
- (_FEFocusEnvironment)owningEnvironment;
- (_FEFocusEnvironmentContainerTuple)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4;
- (_FEFocusItemContainer)itemContainer;
- (id)description;
- (unint64_t)hash;
@end

@implementation _FEFocusEnvironmentContainerTuple

- (_FEFocusEnvironmentContainerTuple)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_FEFocusItemContainer.m", 394, @"Invalid parameter not satisfying: %@", @"owningEnvironment != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_FEFocusItemContainer.m", 395, @"Invalid parameter not satisfying: %@", @"itemContainer != nil" object file lineNumber description];

LABEL_3:
  v11 = [v8 _focusItemContainer];

  if (v11 != v10)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_FEFocusItemContainer.m", 396, @"Invalid parameter not satisfying: %@", @"owningEnvironment._focusItemContainer == itemContainer" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)_FEFocusEnvironmentContainerTuple;
  v12 = [(_FEFocusEnvironmentContainerTuple *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_itemContainer, a4);
    v13->_isScrollableContainer = _FEFocusItemContainerIsScrollableContainer(v10);
  }

  return v13;
}

+ (_FEFocusEnvironmentContainerTuple)tupleWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithOwningEnvironment:v7 itemContainer:v6];

  return (_FEFocusEnvironmentContainerTuple *)v8;
}

+ (_FEFocusEnvironmentContainerTuple)tupleWithRequiredContainerFromEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 _focusItemContainer];
  id v6 = [a1 tupleWithOwningEnvironment:v4 itemContainer:v5];

  return (_FEFocusEnvironmentContainerTuple *)v6;
}

- (BOOL)isEqualToEnvironmentContainerTuple:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  owningEnvironment = self->_owningEnvironment;
  itemContainer = self->_itemContainer;
  id v8 = (_FEFocusEnvironment *)v4[2];
  id v7 = (_FEFocusItemContainer *)v4[3];
  id v9 = logger();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10 && itemContainer == v7 && owningEnvironment != v8)
  {
    v15 = logger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v35 = v7;
      v36 = v8;
      v33 = owningEnvironment;
      v34 = itemContainer;
      v16 = [(_FEFocusEnvironmentContainerTuple *)self itemContainer];
      if (v16)
      {
        v17 = NSString;
        objc_super v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        v20 = [v17 stringWithFormat:@"<%@: %p>", v19, v16];
      }
      else
      {
        v20 = @"(nil)";
      }
      v21 = v20;
      v22 = [(_FEFocusEnvironmentContainerTuple *)self owningEnvironment];
      if (v22)
      {
        v23 = NSString;
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [v23 stringWithFormat:@"<%@: %p>", v25, v22];
      }
      else
      {
        v26 = @"(nil)";
      }
      v27 = v26;
      v28 = [v4 owningEnvironment];
      if (v28)
      {
        v29 = NSString;
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = [v29 stringWithFormat:@"<%@: %p>", v31, v28];
      }
      else
      {
        v32 = @"(nil)";
      }
      *(_DWORD *)buf = 138412802;
      v38 = v21;
      __int16 v39 = 2112;
      v40 = v27;
      __int16 v41 = 2112;
      v42 = v32;
      _os_log_impl(&dword_24F3F0000, v15, OS_LOG_TYPE_INFO, "Warning: encountered a single _FEFocusItemContainer: %@ yielded by two mismatched owning _FEFocusEnvironments: %@ and %@. _FEFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);

      owningEnvironment = v33;
      itemContainer = v34;
      id v7 = v35;
      id v8 = v36;
    }
  }
  BOOL v12 = owningEnvironment == v8 && itemContainer == v7;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = v4
    && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())
    && [(_FEFocusEnvironmentContainerTuple *)self isEqualToEnvironmentContainerTuple:v4];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_FEFocusEnvironmentContainerTuple *)self owningEnvironment];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(_FEFocusEnvironmentContainerTuple *)self itemContainer];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; owningEnvironment: %@; itemContainer: %@>",
    v5,
    self,
    self->_owningEnvironment,
  unint64_t v6 = self->_itemContainer);

  return v6;
}

- (_FEFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (_FEFocusItemContainer)itemContainer
{
  return self->_itemContainer;
}

- (BOOL)isScrollableContainer
{
  return self->_isScrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end