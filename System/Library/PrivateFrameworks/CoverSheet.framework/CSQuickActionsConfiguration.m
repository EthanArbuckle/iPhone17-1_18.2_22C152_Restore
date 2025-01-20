@interface CSQuickActionsConfiguration
- (CSQuickActionsConfiguration)initWithPosterActionsConfiguration:(id)a3;
- (NSArray)controls;
- (int64_t)_categoryFromPosterCategory:(int64_t)a3;
- (int64_t)_typeFromControlType:(unint64_t)a3;
- (void)setControls:(id)a3;
@end

@implementation CSQuickActionsConfiguration

- (CSQuickActionsConfiguration)initWithPosterActionsConfiguration:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSQuickActionsConfiguration;
  v5 = [(CSQuickActionsConfiguration *)&v28 init];
  if (v5)
  {
    v6 = [v4 leadingControl];
    v7 = [v4 trailingControl];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __66__CSQuickActionsConfiguration_initWithPosterActionsConfiguration___block_invoke;
    v26 = &unk_1E6ADA940;
    v8 = v5;
    v27 = v8;
    v9 = (void (**)(void, void, void))MEMORY[0x1D9487300](&v23);
    if (v6)
    {
      if (objc_msgSend(v6, "category", v23, v24, v25, v26) == 3)
      {
        uint64_t v10 = ((void (**)(void, void *, uint64_t))v9)[2](v9, v6, 1);
        goto LABEL_8;
      }
      v13 = [CSQuickActionControl alloc];
      uint64_t v12 = -[CSQuickActionsConfiguration _categoryFromPosterCategory:](v8, "_categoryFromPosterCategory:", [v6 category]);
      v11 = v13;
    }
    else
    {
      v11 = [CSQuickActionControl alloc];
      uint64_t v12 = 1;
    }
    uint64_t v10 = -[CSQuickActionControl initWithCategory:position:](v11, "initWithCategory:position:", v12, 1, v23, v24, v25, v26);
LABEL_8:
    v14 = (void *)v10;
    if (v7)
    {
      if ([v7 category] == 3)
      {
        uint64_t v15 = ((void (**)(void, void *, uint64_t))v9)[2](v9, v7, 2);
LABEL_14:
        v19 = (void *)v15;
        v29[0] = v14;
        v29[1] = v15;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
        controls = v8->_controls;
        v8->_controls = (NSArray *)v20;

        goto LABEL_15;
      }
      v18 = [CSQuickActionControl alloc];
      uint64_t v17 = -[CSQuickActionsConfiguration _categoryFromPosterCategory:](v8, "_categoryFromPosterCategory:", [v7 category]);
      v16 = v18;
    }
    else
    {
      v16 = [CSQuickActionControl alloc];
      uint64_t v17 = 2;
    }
    uint64_t v15 = [(CSQuickActionControl *)v16 initWithCategory:v17 position:2];
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

CSQuickActionSystemControl *__66__CSQuickActionsConfiguration_initWithPosterActionsConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [CSQuickActionSystemControl alloc];
  v7 = [v5 identity];
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v5 type];

  uint64_t v10 = -[CSQuickActionSystemControl initWithControlIdentity:type:position:](v6, "initWithControlIdentity:type:position:", v7, [v8 _typeFromControlType:v9], a3);

  return v10;
}

- (int64_t)_categoryFromPosterCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int64_t)_typeFromControlType:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (NSArray)controls
{
  return self->_controls;
}

- (void)setControls:(id)a3
{
}

- (void).cxx_destruct
{
}

@end