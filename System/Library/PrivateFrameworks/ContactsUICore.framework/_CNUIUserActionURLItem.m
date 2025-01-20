@interface _CNUIUserActionURLItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isSensitive;
- (CNFuture)url;
- (_CNUIUserActionURLItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
- (_CNUIUserActionURLItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 isSensitive:(BOOL)a7 group:(int64_t)a8 options:(unint64_t)a9;
- (id)description;
- (id)performActionWithContext:(id)a3;
- (id)performActionWithContext:(id)a3 shouldCurateIfPerformed:(BOOL)a4;
- (unint64_t)hash;
@end

@implementation _CNUIUserActionURLItem

- (_CNUIUserActionURLItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  return [(_CNUIUserActionURLItem *)self initWithType:a3 contactProperty:a4 bundleIdentifier:a5 url:a6 isSensitive:0 group:a7 options:a8];
}

- (_CNUIUserActionURLItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 isSensitive:(BOOL)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_CNUIUserActionURLItem;
  v17 = [(CNUIUserActionItem *)&v21 initWithType:a3 contactProperty:a4 bundleIdentifier:a5 group:a8 options:a9];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_url, a6);
    v18->_isSensitive = a7;
    v19 = v18;
  }

  return v18;
}

- (id)performActionWithContext:(id)a3
{
  return [(_CNUIUserActionURLItem *)self performActionWithContext:a3 shouldCurateIfPerformed:1];
}

- (id)performActionWithContext:(id)a3 shouldCurateIfPerformed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(_CNUIUserActionURLItem *)self url];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x263F335E0];
    v11 = +[CNContactsUIError errorWithCode:201];
    id v9 = [v10 futureWithError:v11];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke;
  v18[3] = &unk_2640178F8;
  id v12 = v6;
  id v19 = v12;
  v20 = self;
  v13 = [v9 flatMap:v18];
  if (v4)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke_3;
    v15[3] = &unk_264017920;
    id v16 = v12;
    v17 = self;
    [v13 addSuccessBlock:v15];
  }
  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  BOOL v4 = [(CNUIUserActionItem *)self type];
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  id v6 = [(CNUIUserActionItem *)self label];
  id v7 = (id)[v3 appendObject:v6 withName:@"label"];

  v8 = [(CNUIUserActionItem *)self targetHandle];
  id v9 = (id)[v3 appendObject:v8 withName:@"targetHandle"];

  v10 = [(CNUIUserActionItem *)self bundleIdentifier];
  id v11 = (id)[v3 appendObject:v10 withName:@"bundleIdentifier"];

  id v12 = [(_CNUIUserActionURLItem *)self url];
  id v13 = (id)[v3 appendObject:v12 withName:@"url"];

  id v14 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"isSensitive", -[_CNUIUserActionURLItem isSensitive](self, "isSensitive"));
  id v15 = (id)objc_msgSend(v3, "appendName:integerValue:", @"group", -[CNUIUserActionItem group](self, "group"));
  id v16 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"options", -[CNUIUserActionItem options](self, "options"));
  v17 = [v3 build];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F335D0];
  uint64_t v6 = objc_opt_class();
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __34___CNUIUserActionURLItem_isEqual___block_invoke;
  v24[3] = &unk_2640172E0;
  v24[4] = self;
  id v25 = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __34___CNUIUserActionURLItem_isEqual___block_invoke_2;
  aBlock[3] = &unk_2640172E0;
  aBlock[4] = self;
  id v7 = v25;
  id v23 = v7;
  v8 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __34___CNUIUserActionURLItem_isEqual___block_invoke_3;
  v20[3] = &unk_2640172E0;
  v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  v10 = _Block_copy(v20);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __34___CNUIUserActionURLItem_isEqual___block_invoke_4;
  v17 = &unk_2640172E0;
  v18 = self;
  id v19 = v9;
  id v11 = v9;
  id v12 = _Block_copy(&v14);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v11, v6, self, v24, v8, v10, v12, 0, v14, v15, v16, v17, v18);

  return (char)self;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x263F335E8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __30___CNUIUserActionURLItem_hash__block_invoke;
  v12[3] = &unk_264017308;
  v12[4] = self;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __30___CNUIUserActionURLItem_hash__block_invoke_2;
  aBlock[3] = &unk_264017308;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __30___CNUIUserActionURLItem_hash__block_invoke_3;
  v10[3] = &unk_264017308;
  v10[4] = self;
  id v5 = _Block_copy(v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30___CNUIUserActionURLItem_hash__block_invoke_4;
  v9[3] = &unk_264017308;
  v9[4] = self;
  uint64_t v6 = _Block_copy(v9);
  unint64_t v7 = objc_msgSend(v3, "hashWithBlocks:", v12, v4, v5, v6, 0);

  return v7;
}

- (CNFuture)url
{
  return self->_url;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (void).cxx_destruct
{
}

@end