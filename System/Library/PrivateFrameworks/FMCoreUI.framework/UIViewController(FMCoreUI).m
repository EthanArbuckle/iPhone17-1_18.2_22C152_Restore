@interface UIViewController(FMCoreUI)
- (void)addConstraintsToFillSuperview;
@end

@implementation UIViewController(FMCoreUI)

- (void)addConstraintsToFillSuperview
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [a1 view];
  char v3 = [v2 translatesAutoresizingMaskIntoConstraints];

  if ((v3 & 1) == 0)
  {
    v4 = [a1 view];
    v5 = _NSDictionaryOfVariableBindings(&cfstr_View.isa, v4, 0);
    v6 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v5];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          LODWORD(v8) = 1148829696;
          [v12 setPriority:v8];
          [v12 setIdentifier:@"constraintToFillSuperview.V"];
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }
    v13 = [a1 view];
    v14 = [v13 superview];
    [v14 addConstraints:v6];

    v15 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:0 views:v5];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          LODWORD(v18) = 1148829696;
          [v22 setPriority:v18];
          [v22 setIdentifier:@"constraintToFillSuperview.H"];
        }
        uint64_t v19 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    v23 = [a1 view];
    v24 = [v23 superview];
    [v24 addConstraints:v16];
  }
}

@end