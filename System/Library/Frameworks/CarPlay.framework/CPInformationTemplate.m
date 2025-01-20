@interface CPInformationTemplate
+ (BOOL)supportsSecureCoding;
- (CPInformationTemplate)initWithCoder:(id)a3;
- (CPInformationTemplate)initWithTitle:(NSString *)title layout:(CPInformationTemplateLayout)layout items:(NSArray *)items actions:(NSArray *)actions;
- (CPInformationTemplateLayout)layout;
- (NSArray)actions;
- (NSArray)items;
- (NSString)title;
- (id)_sanitizeButtons:(id)a3;
- (id)_sanitizeItems:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)performUpdate;
- (void)setActions:(NSArray *)actions;
- (void)setItems:(NSArray *)items;
- (void)setTitle:(NSString *)title;
- (void)updateTemplatePropertiesFromTemplate:(id)a3;
@end

@implementation CPInformationTemplate

- (CPInformationTemplate)initWithTitle:(NSString *)title layout:(CPInformationTemplateLayout)layout items:(NSArray *)items actions:(NSArray *)actions
{
  v10 = title;
  v11 = items;
  v12 = actions;
  v21.receiver = self;
  v21.super_class = (Class)CPInformationTemplate;
  v13 = [(CPTemplate *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [(NSString *)v10 copy];
    v15 = v13->_title;
    v13->_title = (NSString *)v14;

    v13->_layout = layout;
    uint64_t v16 = [(CPInformationTemplate *)v13 _sanitizeItems:v11];
    v17 = v13->_items;
    v13->_items = (NSArray *)v16;

    uint64_t v18 = [(CPInformationTemplate *)v13 _sanitizeButtons:v12];
    v19 = v13->_actions;
    v13->_actions = (NSArray *)v18;
  }
  return v13;
}

- (id)_sanitizeItems:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 0xB)
  {
    uint64_t v4 = objc_msgSend(v3, "subarrayWithRange:", 0, 10);

    id v3 = (id)v4;
  }
  v5 = (void *)[v3 copy];

  return v5;
}

- (id)_sanitizeButtons:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 4)
  {
    uint64_t v5 = objc_msgSend(v4, "subarrayWithRange:", 0, 3);

    id v4 = (id)v5;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__CPInformationTemplate__sanitizeButtons___block_invoke;
  v8[3] = &unk_26430ADA8;
  v8[4] = self;
  [v4 enumerateObjectsUsingBlock:v8];
  v6 = (void *)[v4 copy];

  return v6;
}

uint64_t __42__CPInformationTemplate__sanitizeButtons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPInformationTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPInformationTemplate;
  uint64_t v5 = [(CPTemplate *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPInformationTemplateTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_layout = [v4 decodeIntegerForKey:@"kCPInformationTemplateLayoutKey"];
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"kCPInformationTemplateItemsKey"];
    items = v5->_items;
    v5->_items = (NSArray *)v12;

    uint64_t v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"kCPInformationTemplateActionsKey"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPInformationTemplate;
  id v4 = a3;
  [(CPTemplate *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(CPInformationTemplate *)self title];
  [v4 encodeObject:v5 forKey:@"kCPInformationTemplateTitleKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[CPInformationTemplate layout](self, "layout"), @"kCPInformationTemplateLayoutKey");
  uint64_t v6 = [(CPInformationTemplate *)self items];
  [v4 encodeObject:v6 forKey:@"kCPInformationTemplateItemsKey"];

  v7 = [(CPInformationTemplate *)self actions];
  [v4 encodeObject:v7 forKey:@"kCPInformationTemplateActionsKey"];
}

- (void)setTitle:(NSString *)title
{
  id v4 = (NSString *)[(NSString *)title copy];
  uint64_t v5 = self->_title;
  self->_title = v4;

  [(CPTemplate *)self setNeedsUpdate];
}

- (void)setItems:(NSArray *)items
{
  id v4 = [(CPInformationTemplate *)self _sanitizeItems:items];
  uint64_t v5 = self->_items;
  self->_items = v4;

  [(CPTemplate *)self setNeedsUpdate];
}

- (void)setActions:(NSArray *)actions
{
  objc_super v8 = actions;
  if ([(NSArray *)v8 count] < 4)
  {
    uint64_t v5 = v8;
  }
  else
  {
    uint64_t v4 = -[NSArray subarrayWithRange:](v8, "subarrayWithRange:", 0, 3);

    uint64_t v5 = (void *)v4;
  }
  id v9 = v5;
  uint64_t v6 = (NSArray *)[v5 copy];
  v7 = self->_actions;
  self->_actions = v6;

  [(CPTemplate *)self setNeedsUpdate];
}

- (void)performUpdate
{
  v8.receiver = self;
  v8.super_class = (Class)CPInformationTemplate;
  [(CPTemplate *)&v8 performUpdate];
  objc_initWeak(&location, self);
  id v3 = [(CPTemplate *)self templateProviderFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__CPInformationTemplate_performUpdate__block_invoke;
  v5[3] = &unk_26430ADD0;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[v3 addSuccessBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__CPInformationTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 updateWithInformationTemplate:WeakRetained];
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v2 = [*(id *)(a1 + 32) actions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke_23;
  v9[3] = &unk_26430ADF8;
  id v10 = *(id *)(a1 + 40);
  v11 = &v12;
  [v2 enumerateObjectsUsingBlock:v9];

  if (v13[5])
  {
    id v3 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v13[5];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    [(id)v13[5] handlePrimaryAction];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v8.receiver = *(id *)(a1 + 32);
    v8.super_class = (Class)CPInformationTemplate;
    objc_msgSendSuper2(&v8, sel_handleActionForControlIdentifier_, v7);
  }

  _Block_object_dispose(&v12, 8);
}

void __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke_23(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)updateTemplatePropertiesFromTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 items];
  uint64_t v6 = (NSArray *)[v5 copy];
  items = self->_items;
  self->_items = v6;

  id v10 = [v4 actions];

  int v8 = (NSArray *)[v10 copy];
  actions = self->_actions;
  self->_actions = v8;
}

- (CPInformationTemplateLayout)layout
{
  return self->_layout;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end