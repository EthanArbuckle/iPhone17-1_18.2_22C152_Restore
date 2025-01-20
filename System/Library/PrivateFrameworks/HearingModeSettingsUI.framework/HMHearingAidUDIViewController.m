@interface HMHearingAidUDIViewController
- (id)specifiers;
- (void)viewDidLoad;
@end

@implementation HMHearingAidUDIViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HMHearingAidUDIViewController;
  [(HMHearingAidUDIViewController *)&v2 viewDidLoad];
}

- (id)specifiers
{
  v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v3 addObject:v6];

  uint64_t v7 = (int)*MEMORY[0x263F5FDB8];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)v3;
  id v9 = v3;

  id v10 = *(id *)((char *)&self->super.super.super.super.super.isa + v7);
  return v10;
}

@end