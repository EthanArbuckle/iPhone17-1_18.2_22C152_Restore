@interface AUInternalSettingsDetailsController
- (NSString)description;
- (id)specifiers;
- (void)setDescription:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation AUInternalSettingsDetailsController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AUInternalSettingsDetailsController;
  [(AUInternalSettingsDetailsController *)&v3 viewDidLoad];
  [(AUInternalSettingsDetailsController *)self setTitle:@"Details"];
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v7 setCellType:4];
    [v7 setName:v2->description];
    [v6 addObject:v7];
    v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
    [(AUInternalSettingsDetailsController *)v2 setSpecifiers:v8];

    id v5 = *(id *)((char *)&v2->super.super.super.super.super.isa + v3);
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = [v5 textLabel];
  [v6 setNumberOfLines:0];

  v7 = [v5 textLabel];
  [v7 setLineBreakMode:0];

  id v8 = [v5 textLabel];

  [v8 setContentMode:0];
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end