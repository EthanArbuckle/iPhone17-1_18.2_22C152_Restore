@interface DMCMDMDetailsSpecifierProvider
- (id)_specifierForMDMProfile;
- (id)specifiers;
- (void)_specifierForMDMProfileWasTapped:(id)a3;
@end

@implementation DMCMDMDetailsSpecifierProvider

- (id)specifiers
{
  v13[2] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)DMCMDMDetailsSpecifierProvider;
  v3 = [(DMCSpecifierProvider *)&v12 specifiers];

  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)DMCMDMDetailsSpecifierProvider;
    uint64_t v4 = [(DMCSpecifierProvider *)&v11 specifiers];
LABEL_3:
    v5 = (void *)v4;
    goto LABEL_6;
  }
  v6 = [(DMCSpecifierProvider *)self rmAccount];

  if (!v6)
  {
    uint64_t v4 = [(DMCSpecifierProvider *)self cachedSpecifiers:MEMORY[0x263EFFA68]];
    goto LABEL_3;
  }
  v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:*MEMORY[0x263F52EC0]];
  v13[0] = v7;
  v8 = [(DMCMDMDetailsSpecifierProvider *)self _specifierForMDMProfile];
  v13[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v5 = [(DMCSpecifierProvider *)self cachedSpecifiers:v9];

LABEL_6:
  return v5;
}

- (id)_specifierForMDMProfile
{
  v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = DMCLocalizedString();
  v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  v6 = +[DMCIconFactory gearIcon];
  [v5 setProperty:v6 forKey:*MEMORY[0x263F60140]];

  [v5 setIdentifier:*MEMORY[0x263F52EB8]];
  [v5 setControllerLoadAction:sel__specifierForMDMProfileWasTapped_];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  return v5;
}

- (void)_specifierForMDMProfileWasTapped:(id)a3
{
  v6 = [[DMCProfileViewController alloc] initWithMDMProfileForRMAccount];
  uint64_t v4 = DMCLocalizedString();
  [(DMCProfileViewController *)v6 setTitle:v4];

  v5 = [(DMCSpecifierProvider *)self delegate];
  [v5 specifierProvider:self showViewController:v6];
}

@end