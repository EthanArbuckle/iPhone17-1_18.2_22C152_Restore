@interface CPTabBarTemplate
+ (BOOL)supportsSecureCoding;
+ (NSInteger)maximumTabCount;
- (CPInterfaceController)interfaceController;
- (CPTabBarTemplate)initWithCoder:(id)a3;
- (CPTabBarTemplate)initWithTemplates:(NSArray *)templates;
- (CPTabBarTemplateProviding)templateProvider;
- (CPTemplate)selectedTemplate;
- (NSArray)templates;
- (id)delegate;
- (id)leadingNavigationBarButtons;
- (id)trailingNavigationBarButtons;
- (unint64_t)indexOfSelectedTab;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)selectTemplate:(CPTemplate *)newTemplate;
- (void)selectTemplateAtIndex:(NSInteger)index;
- (void)setDelegate:(id)delegate;
- (void)setIndexOfSelectedTab:(unint64_t)a3;
- (void)setInterfaceController:(id)a3;
- (void)setLeadingNavigationBarButtons:(id)a3;
- (void)setTemplateProvider:(id)a3;
- (void)setTrailingNavigationBarButtons:(id)a3;
- (void)updateTemplates:(NSArray *)newTemplates;
- (void)validateTemplates:(id)a3;
@end

@implementation CPTabBarTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSInteger)maximumTabCount
{
  if (CPCurrentProcessHasAudioEntitlement()) {
    return 4;
  }
  else {
    return 5;
  }
}

- (CPTabBarTemplate)initWithTemplates:(NSArray *)templates
{
  v5 = templates;
  v9.receiver = self;
  v9.super_class = (Class)CPTabBarTemplate;
  v6 = [(CPTemplate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CPTabBarTemplate *)v6 validateTemplates:v5];
    objc_storeStrong((id *)&v7->_templates, templates);
    v7->_indexOfSelectedTab = 0;
  }

  return v7;
}

- (CPTabBarTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPTabBarTemplate;
  v5 = [(CPTemplate *)&v10 initWithCoder:v4];
  if (v5)
  {
    if (CPWhiteListedTemplates_onceToken != -1) {
      dispatch_once(&CPWhiteListedTemplates_onceToken, &__block_literal_global_8);
    }
    id v6 = (id)CPWhiteListedTemplates_classes;
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kCPTabBarTemplatesKey"];
    templates = v5->_templates;
    v5->_templates = (NSArray *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPTabBarTemplate;
  id v4 = a3;
  [(CPTemplate *)&v6 encodeWithCoder:v4];
  v5 = [(CPTabBarTemplate *)self templates];
  [v4 encodeObject:v5 forKey:@"kCPTabBarTemplatesKey"];
}

- (void)updateTemplates:(NSArray *)newTemplates
{
  id v4 = newTemplates;
  [(CPTabBarTemplate *)self validateTemplates:v4];
  templates = self->_templates;
  self->_templates = v4;
  objc_super v6 = v4;

  uint64_t v7 = [(CPTabBarTemplate *)self interfaceController];
  [v7 updateTabBarTemplate:self];

  unint64_t v8 = [(CPTabBarTemplate *)self indexOfSelectedTab];
  unint64_t v9 = [(NSArray *)v6 count];

  if (v8 > v9)
  {
    [(CPTabBarTemplate *)self setIndexOfSelectedTab:0];
  }
}

- (void)validateTemplates:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [(id)objc_opt_class() maximumTabCount];
  unint64_t v5 = [v3 count];
  objc_super v6 = (uint64_t *)MEMORY[0x263EFF4A0];
  if (v5 > v4)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    unint64_t v9 = NSStringFromSelector(a2);
    objc_super v10 = [NSNumber numberWithUnsignedInteger:v4];
    [v7 raise:v8, @"Too many templates passed to %@. Maximum allowed is %@.", v9, v10 format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    uint64_t v14 = *v6;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
        if (CPTabTemplates_onceToken != -1) {
          dispatch_once(&CPTabTemplates_onceToken, &__block_literal_global_129);
        }
        id v17 = (id)CPTabTemplates_classes;
        id v18 = v16;
        if (([v17 containsObject:object_getClass(v18)] & 1) == 0)
        {
          v19 = (void *)MEMORY[0x263EFF940];
          v20 = NSStringFromSelector(a2);
          [v19 raise:v14, @"Unsupported object %@ passed to %@. Allowed classes: %@", v18, v20, v17, 0 format];
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
}

- (CPTemplate)selectedTemplate
{
  unint64_t v3 = [(CPTabBarTemplate *)self indexOfSelectedTab];
  unint64_t v4 = [(CPTabBarTemplate *)self templates];
  unint64_t v5 = [v4 count];

  if (v3 >= v5)
  {
    uint64_t v7 = 0;
  }
  else
  {
    objc_super v6 = [(CPTabBarTemplate *)self templates];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[CPTabBarTemplate indexOfSelectedTab](self, "indexOfSelectedTab"));
  }

  return (CPTemplate *)v7;
}

- (void)selectTemplate:(CPTemplate *)newTemplate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = newTemplate;
  templates = self->_templates;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__CPTabBarTemplate_selectTemplate___block_invoke;
  v9[3] = &unk_26430A7F8;
  objc_super v6 = v4;
  objc_super v10 = v6;
  uint64_t v7 = [(NSArray *)templates indexOfObjectPassingTest:v9];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_2181A5000, v8, OS_LOG_TYPE_DEFAULT, "Requested template to select in tab bar doesn't exist: %@", buf, 0xCu);
    }
  }
  else
  {
    [(CPTabBarTemplate *)self selectTemplateAtIndex:v7];
  }
}

uint64_t __35__CPTabBarTemplate_selectTemplate___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 identifier];
  unint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)selectTemplateAtIndex:(NSInteger)index
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(CPTabBarTemplate *)self indexOfSelectedTab] == index)
  {
    uint64_t v5 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = [NSNumber numberWithInteger:index];
      int v11 = 138412290;
      uint64_t v12 = v6;
      uint64_t v7 = "Requested to select tab bar index %@, but it's already selected.";
LABEL_10:
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    unint64_t v8 = [(NSArray *)self->_templates count];
    uint64_t v5 = CarPlayFrameworkGeneralLogging();
    BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v8 <= index)
    {
      if (v9)
      {
        objc_super v6 = [NSNumber numberWithInteger:index];
        int v11 = 138412290;
        uint64_t v12 = v6;
        uint64_t v7 = "Requested template index in tab bar doesn't exist: %@";
        goto LABEL_10;
      }
    }
    else
    {
      if (v9)
      {
        objc_super v10 = [NSNumber numberWithInteger:index];
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Selecting tab bar template at index %@", (uint8_t *)&v11, 0xCu);
      }
      uint64_t v5 = [(CPTabBarTemplate *)self interfaceController];
      [v5 selectTabBarTemplateIndex:index];
    }
  }
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPTabBarTemplate *)self templates];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke;
  v12[3] = &unk_26430A7F8;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v12];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CPTabBarTemplate handleActionForControlIdentifier:]((uint64_t)v6, v8);
    }
  }
  else
  {
    [(CPTabBarTemplate *)self setIndexOfSelectedTab:v7];
    BOOL v9 = [(CPTabBarTemplate *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke_12;
      block[3] = &unk_264309F10;
      block[4] = self;
      block[5] = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke_12(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [v2 templates];
  uint64_t v4 = [v3 objectAtIndexedSubscript:*(void *)(a1 + 40)];
  [v5 tabBarTemplate:v2 didSelectTemplate:v4];
}

- (id)leadingNavigationBarButtons
{
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
}

- (id)trailingNavigationBarButtons
{
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSArray)templates
{
  return self->_templates;
}

- (unint64_t)indexOfSelectedTab
{
  return self->_indexOfSelectedTab;
}

- (void)setIndexOfSelectedTab:(unint64_t)a3
{
  self->_indexOfSelectedTab = a3;
}

- (CPTabBarTemplateProviding)templateProvider
{
  return self->_templateProvider;
}

- (void)setTemplateProvider:(id)a3
{
}

- (CPInterfaceController)interfaceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interfaceController);

  return (CPInterfaceController *)WeakRetained;
}

- (void)setInterfaceController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interfaceController);
  objc_storeStrong((id *)&self->_templateProvider, 0);
  objc_storeStrong((id *)&self->_templates, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handleActionForControlIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2181A5000, a2, OS_LOG_TYPE_ERROR, "Failed to identify a local template for identifier %@", (uint8_t *)&v2, 0xCu);
}

@end