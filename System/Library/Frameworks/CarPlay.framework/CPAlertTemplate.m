@interface CPAlertTemplate
+ (BOOL)supportsSecureCoding;
+ (NSUInteger)maximumActionCount;
- (CPAlertTemplate)initWithCoder:(id)a3;
- (CPAlertTemplate)initWithTitleVariants:(NSArray *)titleVariants actions:(NSArray *)actions;
- (NSArray)actions;
- (NSArray)titleVariants;
- (void)_addAction:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleAlertActionForIdentifier:(id)a3;
@end

@implementation CPAlertTemplate

+ (NSUInteger)maximumActionCount
{
  if (CPCurrentProcessHasAudioEntitlement()) {
    return 1;
  }
  else {
    return 3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPAlertTemplate)initWithTitleVariants:(NSArray *)titleVariants actions:(NSArray *)actions
{
  v8 = titleVariants;
  v9 = actions;
  v16.receiver = self;
  v16.super_class = (Class)CPAlertTemplate;
  v10 = [(CPTemplate *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_titleVariants, titleVariants);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__CPAlertTemplate_initWithTitleVariants_actions___block_invoke;
    v13[3] = &unk_26430A4A8;
    SEL v15 = a2;
    v14 = v11;
    [(NSArray *)v9 enumerateObjectsUsingBlock:v13];
  }
  return v11;
}

void __49__CPAlertTemplate_initWithTitleVariants_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  v5 = *(const char **)(a1 + 40);
  id v6 = v3;
  v7 = [MEMORY[0x263EFFA08] setWithObject:v4];
  id v11 = v6;
  if (([v7 containsObject:object_getClass(v11)] & 1) == 0)
  {
    v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    v10 = NSStringFromSelector(v5);
    [v8 raise:v9, @"Unsupported object %@ passed to %@. Allowed classes: %@", v11, v10, v7, 0 format];
  }
  [*(id *)(a1 + 32) _addAction:v11];
}

- (CPAlertTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPAlertTemplate;
  v5 = [(CPTemplate *)&v17 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCPAlertTemplateTitlesKey"];
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kCPAlertTemplateActionsKey"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPAlertTemplate;
  id v4 = a3;
  [(CPTemplate *)&v7 encodeWithCoder:v4];
  v5 = [(CPAlertTemplate *)self titleVariants];
  [v4 encodeObject:v5 forKey:@"kCPAlertTemplateTitlesKey"];

  id v6 = [(CPAlertTemplate *)self actions];
  [v4 encodeObject:v6 forKey:@"kCPAlertTemplateActionsKey"];
}

- (void)_addAction:(id)a3
{
  id v18 = a3;
  id v4 = [(CPAlertTemplate *)self actions];

  if (v4)
  {
    v5 = [(CPAlertTemplate *)self actions];
    id v6 = [v5 arrayByAddingObject:v18];
    actions = self->_actions;
    self->_actions = v6;
  }
  else
  {
    v8 = [MEMORY[0x263EFF8C0] arrayWithObject:v18];
    v5 = self->_actions;
    self->_actions = v8;
  }

  unint64_t v9 = [(id)objc_opt_class() maximumActionCount];
  v10 = [(CPAlertTemplate *)self actions];
  unint64_t v11 = [v10 count];

  if (v11 > v9)
  {
    uint64_t v12 = [(CPAlertTemplate *)self actions];
    v13 = (void *)MEMORY[0x263F088D0];
    uint64_t v14 = [(CPAlertTemplate *)self actions];
    SEL v15 = objc_msgSend(v13, "indexSetWithIndexesInRange:", objc_msgSend(v14, "count") - v9, v9);
    objc_super v16 = [v12 objectsAtIndexes:v15];
    objc_super v17 = self->_actions;
    self->_actions = v16;
  }
}

- (void)handleAlertActionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  SEL v15 = __Block_byref_object_copy__1;
  objc_super v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v5 = [(CPAlertTemplate *)self actions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke;
  v9[3] = &unk_264309C98;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  objc_super v7 = [(id)v13[5] handler];

  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke_2;
    block[3] = &unk_264309CC0;
    block[4] = &v12;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }

  _Block_object_dispose(&v12, 8);
}

void __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_super v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) handler];
  v2[2](v2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_titleVariants, 0);
}

@end