@interface HFStateDumpBuilder
+ (id)_coerceObjectToPropertyList:(id)a3 options:(unint64_t)a4;
+ (id)builderWithObject:(id)a3 context:(id)a4;
- (HFStateDumpBuilder)initWithObject:(id)a3 context:(id)a4;
- (HFStateDumpBuilderContext)context;
- (NSMutableArray)entries;
- (id)_filteredEntries;
- (id)_formattedObjectForEntry:(id)a3 withRepresentation:(unint64_t)a4;
- (id)_formattedObjectForObject:(id)a3 withRepresentation:(unint64_t)a4 context:(id)a5 options:(unint64_t)a6;
- (id)buildDescription;
- (id)buildPropertyListRepresentation;
- (id)object;
- (void)appendBool:(BOOL)a3 withName:(id)a4;
- (void)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5;
- (void)appendObject:(id)a3 withName:(id)a4;
- (void)appendObject:(id)a3 withName:(id)a4 context:(id)a5;
- (void)appendObject:(id)a3 withName:(id)a4 context:(id)a5 options:(unint64_t)a6;
- (void)appendObject:(id)a3 withName:(id)a4 options:(unint64_t)a5;
@end

@implementation HFStateDumpBuilder

+ (id)builderWithObject:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithObject:v7 context:v6];

  return v8;
}

- (HFStateDumpBuilder)initWithObject:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFStateDumpBuilder;
  v9 = [(HFStateDumpBuilder *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_object, a3);
    v11 = (void *)[v8 copy];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = +[HFStateDumpBuilderContext contextWithDetailLevel:0];
    }
    context = v10->_context;
    v10->_context = v13;

    uint64_t v15 = objc_opt_new();
    entries = v10->_entries;
    v10->_entries = (NSMutableArray *)v15;
  }
  return v10;
}

- (void)appendObject:(id)a3 withName:(id)a4
{
}

- (void)appendObject:(id)a3 withName:(id)a4 context:(id)a5
{
}

- (void)appendObject:(id)a3 withName:(id)a4 options:(unint64_t)a5
{
}

- (void)appendObject:(id)a3 withName:(id)a4 context:(id)a5 options:(unint64_t)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(HFStateDumpBuilder *)self context];
  v13 = [v12 objectsToExclude];
  char v14 = [v13 containsObject:v17];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = objc_alloc_init(HFStateDumpEntry);
    [(HFStateDumpEntry *)v15 setObject:v17];
    [(HFStateDumpEntry *)v15 setName:v10];
    [(HFStateDumpEntry *)v15 setContext:v11];
    [(HFStateDumpEntry *)v15 setOptions:a6];
    v16 = [(HFStateDumpBuilder *)self entries];
    [v16 addObject:v15];
  }
}

- (void)appendBool:(BOOL)a3 withName:(id)a4
{
  if (a3) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [(HFStateDumpBuilder *)self appendObject:v4 withName:a4];
}

- (void)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  if (a3 == a5) {
    -[HFStateDumpBuilder appendBool:withName:](self, "appendBool:withName:");
  }
}

- (id)buildPropertyListRepresentation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v4 = [(HFStateDumpBuilder *)self context];
  uint64_t v5 = [v4 derivedOutputStyle];

  if ((unint64_t)(v5 - 1) < 2)
  {
    a2 = (SEL)[@"<" mutableCopy];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    char v14 = [(HFStateDumpBuilder *)self _filteredEntries];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v21 = [(HFStateDumpBuilder *)self _formattedObjectForEntry:v20 withRepresentation:1];
          v22 = [v21 description];
          v23 = v22;
          if (v21 && [v22 length])
          {
            if (v17) {
              [(id)a2 appendString:@", "];
            }
            v24 = [v20 name];
            [(id)a2 appendFormat:@"%@: %@", v24, v23];

            ++v17;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v16);
    }

    [(id)a2 appendString:@">"];
  }
  else if (v5)
  {
    if (v5 == 3)
    {
      a2 = (SEL)objc_opt_new();
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = [(HFStateDumpBuilder *)self _filteredEntries];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            v12 = [(HFStateDumpBuilder *)self _formattedObjectForEntry:v11 withRepresentation:1];
            v13 = [v11 name];
            [(id)a2 setObject:v12 forKeyedSubscript:v13];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v8);
      }
    }
  }
  else
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"HFStateDumpBuilder.m" lineNumber:133 description:@"Unexpected output style!"];

    a2 = (SEL)@"(internal error)";
  }
  return (id)(id)a2;
}

- (id)buildDescription
{
  v4 = (void *)MEMORY[0x263F58188];
  uint64_t v5 = [(HFStateDumpBuilder *)self object];
  id v6 = [v4 builderWithObject:v5];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __38__HFStateDumpBuilder_buildDescription__block_invoke;
  v21 = &unk_26408D450;
  v22 = self;
  id v7 = v6;
  id v23 = v7;
  uint64_t v8 = (void (**)(void))_Block_copy(&v18);
  uint64_t v9 = [(HFStateDumpBuilder *)self context];
  uint64_t v10 = [v9 derivedOutputStyle];

  if ((unint64_t)(v10 - 1) < 2)
  {
    v8[2](v8);
  }
  else if (v10)
  {
    if (v10 == 3)
    {
      id v11 = [(HFStateDumpBuilder *)self context];
      uint64_t v12 = [v11 multilinePrefix];
      v13 = (void *)v12;
      if (v12) {
        char v14 = (__CFString *)v12;
      }
      else {
        char v14 = &stru_26C081158;
      }
      [v7 appendBodySectionWithName:0 multilinePrefix:v14 block:v8];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HFStateDumpBuilder.m" lineNumber:175 description:@"Unexpected output style!"];
  }
  uint64_t v16 = [v7 build];

  return v16;
}

void __38__HFStateDumpBuilder_buildDescription__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) _filteredEntries];
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v25 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) _formattedObjectForEntry:v6 withRepresentation:0];
        char v8 = [v6 options];
        objc_opt_class();
        id v9 = v7;
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        id v11 = v10;

        id v12 = v9;
        if (v11) {
          goto LABEL_14;
        }
        objc_opt_class();
        id v13 = v9;
        id v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;
        id v15 = v14;

        id v12 = [v15 allObjects];

        if (v12)
        {
LABEL_14:
          uint64_t v16 = *(void **)(a1 + 40);
          uint64_t v17 = [v6 name];
          [v16 appendArraySection:v12 withName:v17 skipIfEmpty:v8 & 1];
        }
        else
        {
          objc_opt_class();
          id v12 = v13;
          if (objc_opt_isKindOfClass()) {
            uint64_t v18 = v12;
          }
          else {
            uint64_t v18 = 0;
          }
          id v19 = v18;

          v20 = *(void **)(a1 + 40);
          uint64_t v17 = [v6 name];
          uint64_t v21 = v8 & 1;
          if (v19)
          {
            [v20 appendDictionarySection:v19 withName:v17 skipIfEmpty:v21];
          }
          else
          {
            id v22 = (id)[v20 appendObject:v12 withName:v17 skipIfNil:v21];
            id v12 = 0;
          }
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v3 = v23;
    }
    while (v23);
  }
}

- (id)_formattedObjectForEntry:(id)a3 withRepresentation:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 object];
  char v8 = [v6 context];
  id v9 = v8;
  if (!v8)
  {
    id v9 = [(HFStateDumpBuilder *)self context];
  }
  uint64_t v10 = -[HFStateDumpBuilder _formattedObjectForObject:withRepresentation:context:options:](self, "_formattedObjectForObject:withRepresentation:context:options:", v7, a4, v9, [v6 options]);
  if (!v8) {

  }
  return v10;
}

- (id)_formattedObjectForObject:(id)a3 withRepresentation:(unint64_t)a4 context:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke;
  aBlock[3] = &unk_26409A900;
  id v12 = v11;
  id v51 = v12;
  v52 = self;
  id v13 = (void (**)(void))_Block_copy(aBlock);
  objc_opt_class();
  id v14 = v10;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  uint64_t v17 = v14;
  if (!v16)
  {
    objc_opt_class();
    id v18 = v14;
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;

    uint64_t v17 = [v20 allObjects];
  }
  objc_opt_class();
  id v21 = v14;
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  if ((a6 & 1) != 0 && (v17 && ![v17 count] || v23 && !objc_msgSend(v23, "count")))
  {
    id v32 = 0;
    goto LABEL_34;
  }
  unint64_t v40 = a6;
  id v24 = v21;
  if ([v24 conformsToProtocol:&unk_26C118910]) {
    long long v25 = v24;
  }
  else {
    long long v25 = 0;
  }
  id v26 = v25;

  if (!v26) {
    goto LABEL_28;
  }
  v39 = self;
  id v27 = v12;
  v13[2](v13);
  v29 = unint64_t v28 = a4;
  uint64_t v30 = objc_msgSend(v26, "hf_stateDumpBuilderWithContext:", v29);

  if (v28 == 1)
  {
    uint64_t v31 = [v30 buildPropertyListRepresentation];
    goto LABEL_26;
  }
  a4 = v28;
  if (v28)
  {

    id v12 = v27;
    self = v39;
LABEL_28:
    if (v17)
    {
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_2;
      v45[3] = &unk_26409A928;
      id v46 = v12;
      v47 = self;
      unint64_t v49 = a4;
      v48 = v13;
      objc_msgSend(v17, "na_map:", v45);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v23)
    {
      long long v33 = objc_opt_new();
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_3;
      v41[3] = &unk_26409A950;
      v41[4] = self;
      id v34 = v33;
      unint64_t v35 = a4;
      id v36 = v34;
      id v42 = v34;
      unint64_t v44 = v35;
      v43 = v13;
      [v23 enumerateKeysAndObjectsUsingBlock:v41];
      uint64_t v37 = v43;
      id v32 = v36;
    }
    else
    {
      id v32 = [(id)objc_opt_class() _coerceObjectToPropertyList:v24 options:v40];
    }
    goto LABEL_33;
  }
  uint64_t v31 = [v30 buildDescription];
LABEL_26:
  id v32 = (id)v31;
  id v12 = v27;

LABEL_33:
LABEL_34:

  return v32;
}

id __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v3 = [*(id *)(a1 + 40) object];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectsToExclude];
    uint64_t v5 = [*(id *)(a1 + 40) object];
    id v6 = [v4 setByAddingObject:v5];
    [v2 setObjectsToExclude:v6];
  }
  id v7 = [*(id *)(a1 + 32) multilinePrefix];
  char v8 = v7;
  if (!v7) {
    id v7 = &stru_26C081158;
  }
  id v9 = [(__CFString *)v7 stringByAppendingString:@"  "];
  [v2 setMultilinePrefix:v9];

  return v2;
}

id __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)[v3 mutableCopy];
  id v6 = [*(id *)(a1 + 32) multilinePrefix];
  id v7 = v6;
  if (!v6) {
    id v6 = &stru_26C081158;
  }
  char v8 = [(__CFString *)v6 stringByAppendingString:@"  "];
  [v5 setMultilinePrefix:v8];

  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = *(void **)(a1 + 40);
  id v11 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v12 = [v10 _formattedObjectForObject:v4 withRepresentation:v9 context:v11 options:0];

  return v12;
}

void __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v11 = [(id)objc_opt_class() _coerceObjectToPropertyList:v6 options:0];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v10 = [v7 _formattedObjectForObject:v5 withRepresentation:v8 context:v9 options:0];

  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
}

+ (id)_coerceObjectToPropertyList:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (!v8)
  {
    if (![v6 conformsToProtocol:&unk_26C1524E0])
    {
      objc_opt_class();
      id v11 = v6;
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
      id v13 = v12;

      if (v13) {
        [v13 UUIDString];
      }
      else {
      id v10 = [v11 description];
      }

      goto LABEL_21;
    }
    if (v4)
    {
      HFPrunePropertyList(v6);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v6;
    }
    goto LABEL_8;
  }
  if ((v4 & 1) == 0 || [v8 length])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Data (%luB)", objc_msgSend(v8, "length"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    id v10 = v9;
    goto LABEL_21;
  }
  id v10 = 0;
LABEL_21:

  return v10;
}

- (id)_filteredEntries
{
  uint64_t v3 = [(HFStateDumpBuilder *)self context];
  int v4 = [v3 excludePrimaryID];

  id v5 = [(HFStateDumpBuilder *)self entries];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = objc_msgSend(v5, "na_filter:", &__block_literal_global_202);

    id v6 = (void *)v7;
  }
  return v6;
}

BOOL __38__HFStateDumpBuilder__filteredEntries__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 options] & 2) == 0;
}

- (id)object
{
  return self->_object;
}

- (HFStateDumpBuilderContext)context
{
  return self->_context;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_object, 0);
}

@end