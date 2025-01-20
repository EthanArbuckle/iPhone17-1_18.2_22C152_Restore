@interface HMHearingAidManufacturerAddressViewController
- (id)getManufactureAddress;
- (id)specifiers;
- (void)viewDidLoad;
@end

@implementation HMHearingAidManufacturerAddressViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HMHearingAidManufacturerAddressViewController;
  [(HMHearingAidManufacturerAddressViewController *)&v2 viewDidLoad];
}

- (id)specifiers
{
  v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = [(HMHearingAidManufacturerAddressViewController *)self getManufactureAddress];
  v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v3 addObject:v6];
  uint64_t v7 = (int)*MEMORY[0x263F5FDB8];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)v3;
  id v9 = v3;

  id v10 = *(id *)((char *)&self->super.super.super.super.super.isa + v7);
  return v10;
}

- (id)getManufactureAddress
{
  objc_super v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"Apple Inc.\nOne Apple Park Way\nCupertino, CA 95014, United States", &stru_2702152D0, 0 value table];

  return v3;
}

@end