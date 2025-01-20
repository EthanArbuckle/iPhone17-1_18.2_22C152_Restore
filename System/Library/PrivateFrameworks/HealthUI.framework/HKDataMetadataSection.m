@interface HKDataMetadataSection
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionFooter;
- (id)sectionFooterViewInTableView:(id)a3;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
@end

@implementation HKDataMetadataSection

- (id)sectionFooterViewInTableView:(id)a3
{
  return 0;
}

- (id)sectionTitle
{
  return 0;
}

- (id)sectionFooter
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  return 0;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  return v4;
}

@end