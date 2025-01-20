@interface CPGridTemplate
+ (BOOL)supportsSecureCoding;
- (CPGridTemplate)initWithCoder:(id)a3;
- (CPGridTemplate)initWithTitle:(NSString *)title gridButtons:(NSArray *)gridButtons;
- (NSArray)gridButtons;
- (NSString)title;
- (id)_prepareButtons:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)performUpdate;
- (void)updateGridButtons:(NSArray *)gridButtons;
- (void)updateTitle:(NSString *)title;
@end

@implementation CPGridTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPGridTemplate)initWithTitle:(NSString *)title gridButtons:(NSArray *)gridButtons
{
  v6 = title;
  v7 = gridButtons;
  v14.receiver = self;
  v14.super_class = (Class)CPGridTemplate;
  v8 = [(CPTemplate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    v10 = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [(CPGridTemplate *)v8 _prepareButtons:v7];
    v12 = v8->_gridButtons;
    v8->_gridButtons = (NSArray *)v11;
  }
  return v8;
}

- (CPGridTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPGridTemplate;
  v5 = [(CPTemplate *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCPGridTemplateButtonsKey"];
    gridButtons = v5->_gridButtons;
    v5->_gridButtons = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPGridItemTemplateTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPGridTemplate;
  id v4 = a3;
  [(CPTemplate *)&v7 encodeWithCoder:v4];
  v5 = [(CPGridTemplate *)self gridButtons];
  [v4 encodeObject:v5 forKey:@"kCPGridTemplateButtonsKey"];

  v6 = [(CPGridTemplate *)self title];
  [v4 encodeObject:v6 forKey:@"kCPGridItemTemplateTitleKey"];
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  v2 = [*(id *)(a1 + 32) gridButtons];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke_11;
  v9[3] = &unk_26430A848;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = &v12;
  [v2 enumerateObjectsUsingBlock:v9];

  if (v13[5])
  {
    v3 = CarPlayFrameworkGeneralLogging();
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
    v8.super_class = (Class)CPGridTemplate;
    objc_msgSendSuper2(&v8, sel_handleActionForControlIdentifier_, v7);
  }

  _Block_object_dispose(&v12, 8);
}

void __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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

- (id)_prepareButtons:(id)a3
{
  id v5 = a3;
  if ((unint64_t)[v5 count] >= 9)
  {
    uint64_t v6 = objc_msgSend(v5, "subarrayWithRange:", 0, 8);

    id v5 = (id)v6;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__CPGridTemplate__prepareButtons___block_invoke;
  v8[3] = &unk_26430A870;
  v8[4] = self;
  v8[5] = a2;
  [v5 enumerateObjectsUsingBlock:v8];

  return v5;
}

void __34__CPGridTemplate__prepareButtons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = *(const char **)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithObject:v4];
  id v11 = v6;
  if (([v7 containsObject:object_getClass(v11)] & 1) == 0)
  {
    int v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    id v10 = NSStringFromSelector(v5);
    [v8 raise:v9, @"Unsupported object %@ passed to %@. Allowed classes: %@", v11, v10, v7, 0 format];
  }
  [v11 setDelegate:*(void *)(a1 + 32)];
}

- (void)updateGridButtons:(NSArray *)gridButtons
{
  id obj = [(CPGridTemplate *)self _prepareButtons:gridButtons];
  uint64_t v4 = [(CPGridTemplate *)self gridButtons];
  char v5 = [v4 isEqualToArray:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gridButtons, obj);
    [(CPTemplate *)self setNeedsUpdate];
  }
}

- (void)updateTitle:(NSString *)title
{
  uint64_t v7 = title;
  char v5 = [(CPGridTemplate *)self title];
  char v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, title);
    [(CPTemplate *)self setNeedsUpdate];
  }
}

- (void)performUpdate
{
  v8.receiver = self;
  v8.super_class = (Class)CPGridTemplate;
  [(CPTemplate *)&v8 performUpdate];
  objc_initWeak(&location, self);
  id v3 = [(CPTemplate *)self templateProviderFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__CPGridTemplate_performUpdate__block_invoke;
  v5[3] = &unk_26430A898;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[v3 addSuccessBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__CPGridTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 reloadTemplate:WeakRetained];
}

- (NSArray)gridButtons
{
  return self->_gridButtons;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_gridButtons, 0);
}

@end