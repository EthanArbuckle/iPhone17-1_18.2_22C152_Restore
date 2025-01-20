@interface _FEFocusEnvironmentScrollableContainerTuple
+ (id)tupleWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4;
- (BOOL)isEqual:(id)a3;
- (_FEFocusEnvironment)owningEnvironment;
- (_FEFocusEnvironmentScrollableContainerTuple)initWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4;
- (_FEFocusItemScrollableContainer)scrollableContainer;
- (id)description;
- (unint64_t)hash;
@end

@implementation _FEFocusEnvironmentScrollableContainerTuple

- (_FEFocusEnvironmentScrollableContainerTuple)initWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
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
    [v15 handleFailureInMethod:a2, self, @"_FEFocusItemContainer.m", 458, @"Invalid parameter not satisfying: %@", @"owningEnvironment != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_FEFocusItemContainer.m", 459, @"Invalid parameter not satisfying: %@", @"scrollableContainer != nil" object file lineNumber description];

LABEL_3:
  v11 = [v8 _focusItemContainer];

  if (v11 != v10)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_FEFocusItemContainer.m", 460, @"Invalid parameter not satisfying: %@", @"owningEnvironment._focusItemContainer == scrollableContainer" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)_FEFocusEnvironmentScrollableContainerTuple;
  v12 = [(_FEFocusEnvironmentScrollableContainerTuple *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_scrollableContainer, a4);
  }

  return v13;
}

+ (id)tupleWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithOwningEnvironment:v7 scrollableContainer:v6];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 || (uint64_t v5 = objc_opt_class(), v5 != objc_opt_class()))
  {
    BOOL v6 = 0;
    goto LABEL_12;
  }
  id v7 = v4;
  id v8 = logger();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    v10 = [(_FEFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
    v11 = [v7 scrollableContainer];
    if (v10 == v11)
    {
      v17 = [(_FEFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
      objc_super v18 = [v7 owningEnvironment];

      if (v17 == v18) {
        goto LABEL_8;
      }
      v10 = logger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [(_FEFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
        if (v19)
        {
          v20 = NSString;
          v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          v23 = [v20 stringWithFormat:@"<%@: %p>", v22, v19];
        }
        else
        {
          v23 = @"(nil)";
        }
        v36 = (void *)v19;
        v24 = v23;
        v25 = [(_FEFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
        if (v25)
        {
          v26 = NSString;
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          v29 = [v26 stringWithFormat:@"<%@: %p>", v28, v25];
        }
        else
        {
          v29 = @"(nil)";
        }
        v30 = v29;
        v31 = [v7 owningEnvironment];
        if (v31)
        {
          v32 = NSString;
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          v35 = [v32 stringWithFormat:@"<%@: %p>", v34, v31];
        }
        else
        {
          v35 = @"(nil)";
        }
        *(_DWORD *)buf = 138412802;
        v38 = v24;
        __int16 v39 = 2112;
        v40 = v30;
        __int16 v41 = 2112;
        v42 = v35;
        _os_log_impl(&dword_24F3F0000, v10, OS_LOG_TYPE_INFO, "Warning: encountered a single _FEFocusItemContainer: %@ yielded by two mismatched owning _FEFocusEnvironments: %@ and %@. _FEFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);
      }
    }
    else
    {
    }
  }
LABEL_8:
  v12 = [(_FEFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
  v13 = [v7 owningEnvironment];
  if (v12 == v13)
  {
    v14 = [(_FEFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
    v15 = [v7 scrollableContainer];
    BOOL v6 = v14 == v15;
  }
  else
  {
    BOOL v6 = 0;
  }

LABEL_12:
  return v6;
}

- (unint64_t)hash
{
  v3 = [(_FEFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(_FEFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; owningEnvironment: %@; scrollableContainer: %@>",
    v5,
    self,
    self->_owningEnvironment,
  unint64_t v6 = self->_scrollableContainer);

  return v6;
}

- (_FEFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (_FEFocusItemScrollableContainer)scrollableContainer
{
  return self->_scrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end