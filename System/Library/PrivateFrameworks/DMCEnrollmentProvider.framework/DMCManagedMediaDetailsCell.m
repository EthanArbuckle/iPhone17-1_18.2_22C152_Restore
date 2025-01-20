@interface DMCManagedMediaDetailsCell
+ (id)localizedManagedAppRestrictionsTitle;
- (void)setManagedApp:(id)a3;
- (void)setManagedBook:(id)a3;
@end

@implementation DMCManagedMediaDetailsCell

- (void)setManagedBook:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_BOOK_RESTRICTIONS");
  v8[0] = v5;
  v6 = [v4 managedBookConfigurationInfo];

  v8[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [(DMCItemSummaryCell *)self createViewWithDescriptors:v7];
}

- (void)setManagedApp:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[DMCManagedMediaDetailsCell localizedManagedAppRestrictionsTitle];
  v8[0] = v5;
  v6 = [v4 managedAppConfigurationInfo];

  v8[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [(DMCItemSummaryCell *)self createViewWithDescriptors:v7];
}

+ (id)localizedManagedAppRestrictionsTitle
{
  return DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_RESTRICTIONS");
}

@end