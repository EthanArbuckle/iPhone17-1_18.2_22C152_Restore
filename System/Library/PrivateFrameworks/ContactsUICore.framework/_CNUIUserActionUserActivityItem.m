@interface _CNUIUserActionUserActivityItem
- (BOOL)_isIntent:(id)a3 equalToOther:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSUserActivity)userActivity;
- (_CNUIUserActionUserActivityItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
- (id)_personFromIntent:(id)a3;
- (id)description;
- (id)performActionWithContext:(id)a3;
- (unint64_t)_hashForIntent:(id)a3;
- (unint64_t)hash;
@end

@implementation _CNUIUserActionUserActivityItem

- (_CNUIUserActionUserActivityItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_CNUIUserActionUserActivityItem;
  v16 = [(CNUIUserActionItem *)&v20 initWithType:a3 contactProperty:a4 bundleIdentifier:a5 group:a7 options:a8];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userActivity, a6);
    v18 = v17;
  }

  return v17;
}

- (id)performActionWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [(_CNUIUserActionUserActivityItem *)v5 userActivity];
  v7 = [(CNUIUserActionItem *)v5 bundleIdentifier];
  if ([(CNUIUserActionItem *)v5 shouldCurateIfPerformed])
  {
    v8 = [v4 actionCurator];
    uint64_t v9 = [v8 curateUserAction:v5];

    v5 = (_CNUIUserActionUserActivityItem *)v9;
  }
  v10 = [v4 userActivityOpener];
  v11 = [MEMORY[0x263F33660] globalAsyncScheduler];
  v12 = [v10 openUserActivity:v6 usingBundleIdentifier:v7 withScheduler:v11];

  if (v5)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60___CNUIUserActionUserActivityItem_performActionWithContext___block_invoke;
    v14[3] = &unk_264017920;
    id v15 = v4;
    v16 = v5;
    [v12 addSuccessBlock:v14];
  }
  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUIUserActionItem *)self type];
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  v6 = [(CNUIUserActionItem *)self label];
  id v7 = (id)[v3 appendObject:v6 withName:@"label"];

  v8 = [(CNUIUserActionItem *)self targetHandle];
  id v9 = (id)[v3 appendObject:v8 withName:@"targetHandle"];

  v10 = [(CNUIUserActionItem *)self bundleIdentifier];
  id v11 = (id)[v3 appendObject:v10 withName:@"bundleIdentifier"];

  v12 = [(_CNUIUserActionUserActivityItem *)self userActivity];
  id v13 = (id)[v3 appendObject:v12 withName:@"userActivity"];

  id v14 = (id)objc_msgSend(v3, "appendName:integerValue:", @"group", -[CNUIUserActionItem group](self, "group"));
  id v15 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"options", -[CNUIUserActionItem options](self, "options"));
  v16 = [v3 build];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F335D0];
  uint64_t v6 = objc_opt_class();
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke;
  v24[3] = &unk_2640172E0;
  v24[4] = self;
  id v25 = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_2;
  aBlock[3] = &unk_2640172E0;
  aBlock[4] = self;
  id v7 = v25;
  id v23 = v7;
  v8 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_3;
  v20[3] = &unk_2640172E0;
  v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  v10 = _Block_copy(v20);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_4;
  v18[3] = &unk_2640172E0;
  v18[4] = self;
  id v11 = v9;
  id v19 = v11;
  v12 = _Block_copy(v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_5;
  v16[3] = &unk_2640172E0;
  v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  id v14 = _Block_copy(v16);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v13, v6, self, v24, v8, v10, v12, v14, 0);

  return (char)self;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x263F335E8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke;
  v14[3] = &unk_264017308;
  void v14[4] = self;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_2;
  aBlock[3] = &unk_264017308;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_3;
  v12[3] = &unk_264017308;
  v12[4] = self;
  id v5 = _Block_copy(v12);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_4;
  v11[3] = &unk_264017308;
  v11[4] = self;
  uint64_t v6 = _Block_copy(v11);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_5;
  v10[3] = &unk_264017308;
  v10[4] = self;
  id v7 = _Block_copy(v10);
  unint64_t v8 = objc_msgSend(v3, "hashWithBlocks:", v14, v4, v5, v6, v7, 0);

  return v8;
}

- (BOOL)_isIntent:(id)a3 equalToOther:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v8 = [(_CNUIUserActionUserActivityItem *)self _personFromIntent:v6];
    id v9 = [(_CNUIUserActionUserActivityItem *)self _personFromIntent:v7];
    v10 = (void *)MEMORY[0x263F335D0];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58___CNUIUserActionUserActivityItem__isIntent_equalToOther___block_invoke;
    v22[3] = &unk_2640172E0;
    id v23 = v8;
    id v24 = v9;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __58___CNUIUserActionUserActivityItem__isIntent_equalToOther___block_invoke_2;
    id v19 = &unk_2640172E0;
    id v20 = v23;
    id v21 = v24;
    id v11 = v24;
    id v12 = v23;
    id v13 = _Block_copy(&aBlock);
    char v14 = objc_msgSend(v10, "isObject:equalToOther:withBlocks:", v12, v11, v22, v13, 0, aBlock, v17, v18, v19);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)_hashForIntent:(id)a3
{
  v3 = [(_CNUIUserActionUserActivityItem *)self _personFromIntent:a3];
  id v4 = (void *)MEMORY[0x263F335E8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50___CNUIUserActionUserActivityItem__hashForIntent___block_invoke;
  v14[3] = &unk_264017308;
  id v15 = v3;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __50___CNUIUserActionUserActivityItem__hashForIntent___block_invoke_2;
  id v12 = &unk_264017308;
  id v13 = v15;
  id v5 = v15;
  id v6 = _Block_copy(&aBlock);
  unint64_t v7 = objc_msgSend(v4, "hashWithBlocks:", v14, v6, 0, aBlock, v10, v11, v12);

  return v7;
}

- (id)_personFromIntent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 contacts];
LABEL_5:
    id v5 = v4;
    id v6 = [v4 firstObject];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 recipients];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
}

@end