@interface CPContactTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)control:(id)a3 setEnabled:(BOOL)a4;
- (BOOL)control:(id)a3 setSelected:(BOOL)a4;
- (CPContact)contact;
- (CPContactTemplate)initWithCoder:(id)a3;
- (CPContactTemplate)initWithContact:(CPContact *)contact;
- (id)entity;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)performUpdate;
- (void)setContact:(CPContact *)contact;
@end

@implementation CPContactTemplate

- (CPContactTemplate)initWithContact:(CPContact *)contact
{
  v5 = contact;
  v9.receiver = self;
  v9.super_class = (Class)CPContactTemplate;
  v6 = [(CPTemplate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, contact);
    [(CPContact *)v7->_contact setAssociatedTemplate:v7];
  }

  return v7;
}

- (id)entity
{
  v2 = [(CPContactTemplate *)self contact];
  v3 = [v2 contactEntity];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPContactTemplate;
  v5 = [(CPTemplate *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPEntity"];
    contact = v5->_contact;
    v5->_contact = (CPContact *)v6;

    [(CPContact *)v5->_contact setAssociatedTemplate:v5];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPContactTemplate;
  id v4 = a3;
  [(CPTemplate *)&v6 encodeWithCoder:v4];
  v5 = [(CPContactTemplate *)self contact];
  [v4 encodeObject:v5 forKey:@"CPEntity"];
}

- (void)setContact:(CPContact *)contact
{
  p_contact = &self->_contact;
  objc_super v6 = contact;
  if (!-[CPContact isEqual:](*p_contact, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_contact, contact);
    [(CPContact *)*p_contact setAssociatedTemplate:self];
    [(CPTemplate *)self setNeedsUpdate];
  }
}

- (void)performUpdate
{
  v8.receiver = self;
  v8.super_class = (Class)CPContactTemplate;
  [(CPTemplate *)&v8 performUpdate];
  objc_initWeak(&location, self);
  v3 = [(CPTemplate *)self templateProviderFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__CPContactTemplate_performUpdate__block_invoke;
  v5[3] = &unk_26430AE70;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[v3 addSuccessBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __34__CPContactTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 updateEntityTemplate:WeakRetained withProxyDelegate:WeakRetained];
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CPContactTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __54__CPContactTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) entity];
  id v3 = [v2 objectForIdentifier:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = v3;
    id v5 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    [v4 handlePrimaryAction];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)CPContactTemplate;
    objc_msgSendSuper2(&v9, sel_handleActionForControlIdentifier_, v8);
  }
}

- (BOOL)control:(id)a3 setEnabled:(BOOL)a4
{
  return 1;
}

- (BOOL)control:(id)a3 setSelected:(BOOL)a4
{
  return 1;
}

- (CPContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
}

@end