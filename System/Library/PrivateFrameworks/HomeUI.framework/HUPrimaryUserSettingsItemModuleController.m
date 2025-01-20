@interface HUPrimaryUserSettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (id)updatePrimaryUserSelectionType:(unint64_t)a3 user:(id)a4;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUPrimaryUserSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(HUItemModuleController *)self module];
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  v8 = v6;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

LABEL_7:
    v8 = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [v8 primaryUserSettingsHeaderItem];
    char v12 = [v4 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
  }
  v13 = objc_opt_class();

  return (Class)v13;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUPrimaryUserSettingsItemModuleController;
  [(HUItemModuleController *)&v18 setupCell:v6 forItem:v7];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v6;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      v14 = v12;
      if (v13) {
        goto LABEL_12;
      }
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];
    }
    v14 = 0;
LABEL_12:

    v17 = objc_alloc_init(HUIconCellContentMetrics);
    -[HUIconCellContentMetrics setContentInset:](v17, "setContentInset:", 10.0, 0.0, 10.0, 0.0);
    -[HUIconCellContentMetrics setIconSize:](v17, "setIconSize:", 36.0, 32.0);
    [v14 setContentMetrics:v17];
    [v14 setIconDisplayStyle:1];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HUPrimaryUserSettingsItemModuleController;
  [(HUItemModuleController *)&v35 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  id v13 = v10;
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (!v12)
  {
    if (!v15) {
      goto LABEL_29;
    }
    uint64_t v26 = objc_opt_class();
    id v27 = v8;
    if (v27)
    {
      if (objc_opt_isKindOfClass()) {
        v28 = v27;
      }
      else {
        v28 = 0;
      }
      v19 = v27;
      if (v28) {
        goto LABEL_24;
      }
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      v30 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v29 handleFailureInFunction:v30, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v26, objc_opt_class() file lineNumber description];
    }
    v19 = 0;
LABEL_24:

    v25 = v15;
    goto LABEL_25;
  }
  uint64_t v16 = objc_opt_class();
  id v17 = v8;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v18 = v17;
    }
    else {
      objc_super v18 = 0;
    }
    v19 = v17;
    if (v18) {
      goto LABEL_15;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v20 handleFailureInFunction:v21, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v16, objc_opt_class() file lineNumber description];
  }
  v19 = 0;
LABEL_15:

  v22 = [v12 home];
  v23 = [v12 user];
  v24 = objc_msgSend(v22, "hf_handleForUser:", v23);
  [v19 setUserHandle:v24];

  v25 = v13;
LABEL_25:
  v31 = [v25 latestResults];
  v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  int v33 = [v32 BOOLValue];

  if (v33) {
    uint64_t v34 = 3;
  }
  else {
    uint64_t v34 = 0;
  }
  [v19 setAccessoryType:v34];

LABEL_29:
}

- (unint64_t)didSelectItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Did select item: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 user];
  }
  else
  {
    id v9 = 0;
  }
  objc_opt_class();
  id v10 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  id v13 = [(HUPrimaryUserSettingsItemModuleController *)self updatePrimaryUserSelectionType:v12 == 0 user:v9];
  return 0;
}

- (id)updatePrimaryUserSelectionType:(unint64_t)a3 user:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  id v7 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 updatePrimaryUserSelectionType:a3 user:v6];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__HUPrimaryUserSettingsItemModuleController_updatePrimaryUserSelectionType_user___block_invoke;
  v14[3] = &unk_1E63850B8;
  id v15 = v6;
  id v11 = v6;
  id v12 = (id)[v10 addCompletionBlock:v14];

  return v10;
}

void __81__HUPrimaryUserSettingsItemModuleController_updatePrimaryUserSelectionType_user___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed to update primary user to %@ with error %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

@end