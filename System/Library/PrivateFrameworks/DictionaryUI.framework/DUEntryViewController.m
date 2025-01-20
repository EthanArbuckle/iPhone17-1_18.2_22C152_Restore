@interface DUEntryViewController
+ (id)entryViewControllerWithDefinitionValue:(id)a3;
- (DUDefinitionValue)definitionValue;
- (DUEntryViewController)initWithDefinitionValue:(id)a3;
- (void)setDefinitionValue:(id)a3;
- (void)viewDidLoad;
@end

@implementation DUEntryViewController

+ (id)entryViewControllerWithDefinitionValue:(id)a3
{
  id v3 = a3;
  v4 = [[DUEntryViewController alloc] initWithDefinitionValue:v3];

  return v4;
}

- (DUEntryViewController)initWithDefinitionValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DUEntryViewController;
  v5 = [(DUEntryViewController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(DUEntryViewController *)v5 setDefinitionValue:v4];
    v7 = [v4 term];
    [(DUEntryViewController *)v6 setTitle:v7];
  }
  return v6;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)DUEntryViewController;
  [(DUEntryViewController *)&v13 viewDidLoad];
  id v3 = [(DUEntryViewController *)self view];
  [v3 setAutoresizingMask:18];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263F1FAC0]), "initWithSource:forMainFrameOnly:", @"a { pointer-events:none !important; }",
                 0);
  v5 = objc_opt_new();
  [v5 _addUserStyleSheet:v4];
  v6 = objc_opt_new();
  [v6 setUserContentController:v5];
  id v7 = objc_alloc(MEMORY[0x263F1FA58]);
  [v3 bounds];
  v8 = objc_msgSend(v7, "initWithFrame:configuration:", v6);
  [v8 setOpaque:0];
  objc_super v9 = [MEMORY[0x263F1C550] clearColor];
  [v8 setBackgroundColor:v9];

  [v8 setAutoresizingMask:18];
  v10 = [(DUEntryViewController *)self definitionValue];
  v11 = [v10 longDefinition];
  id v12 = (id)[v8 loadHTMLString:v11 baseURL:0];

  [v3 addSubview:v8];
}

- (DUDefinitionValue)definitionValue
{
  return (DUDefinitionValue *)objc_getProperty(self, a2, 976, 1);
}

- (void)setDefinitionValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end