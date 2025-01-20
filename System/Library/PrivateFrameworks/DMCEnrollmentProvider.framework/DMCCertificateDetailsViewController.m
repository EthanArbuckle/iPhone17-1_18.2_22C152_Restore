@interface DMCCertificateDetailsViewController
- (DMCCertificateDetailsViewController)init;
- (DMCCertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3;
- (DMCCertificateDetailsViewController)initWithCertificateProperties:(id)a3;
- (DMCCertificateDetailsViewController)initWithStyle:(int64_t)a3;
- (DMCCertificateDetailsViewController)initWithTrust:(__SecTrust *)a3;
- (NSArray)keyValueSectionTitles;
- (NSArray)keyValueSections;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)certificateTrust;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setup;
- (void)setCertificateTrust:(id)a3;
- (void)setKeyValueSectionTitles:(id)a3;
- (void)setKeyValueSections:(id)a3;
@end

@implementation DMCCertificateDetailsViewController

- (DMCCertificateDetailsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)DMCCertificateDetailsViewController;
  v2 = [(DMCProfileTableViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DMCCertificateDetailsViewController *)v2 _setup];
  }
  return v3;
}

- (DMCCertificateDetailsViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMCCertificateDetailsViewController;
  v3 = [(DMCProfileTableViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(DMCCertificateDetailsViewController *)v3 _setup];
  }
  return v4;
}

- (DMCCertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DMCCertificateDetailsViewController;
  v4 = [(DMCProfileTableViewController *)&v10 initWithStyle:2];
  if (v4)
  {
    objc_super v5 = [[DMCCertificateProperties alloc] initWithCertificate:a3];
    objc_super v6 = [(DMCCertificateProperties *)v5 sections];
    if ([v6 count])
    {
      objc_storeStrong((id *)&v4->_keyValueSections, v6);
      uint64_t v7 = [(DMCCertificateProperties *)v5 sectionTitles];
      keyValueSectionTitles = v4->_keyValueSectionTitles;
      v4->_keyValueSectionTitles = (NSArray *)v7;
    }
    [(DMCCertificateDetailsViewController *)v4 _setup];
  }
  return v4;
}

- (DMCCertificateDetailsViewController)initWithCertificateProperties:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMCCertificateDetailsViewController;
  objc_super v5 = [(DMCProfileTableViewController *)&v11 initWithStyle:2];
  if (v5)
  {
    objc_super v6 = [[DMCCertificateProperties alloc] initWithCertificateProperties:v4];
    uint64_t v7 = [(DMCCertificateProperties *)v6 sections];
    if ([v7 count])
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      uint64_t v8 = [(DMCCertificateProperties *)v6 sectionTitles];
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;
    }
    [(DMCCertificateDetailsViewController *)v5 _setup];
  }
  return v5;
}

- (DMCCertificateDetailsViewController)initWithTrust:(__SecTrust *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DMCCertificateDetailsViewController;
  id v4 = [(DMCProfileTableViewController *)&v11 initWithStyle:2];
  objc_super v5 = v4;
  if (v4)
  {
    objc_storeStrong(&v4->_certificateTrust, a3);
    objc_super v6 = [[DMCCertificateProperties alloc] initWithTrust:a3];
    uint64_t v7 = [(DMCCertificateProperties *)v6 sections];
    if ([v7 count])
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      uint64_t v8 = [(DMCCertificateProperties *)v6 sectionTitles];
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;
    }
    [(DMCCertificateDetailsViewController *)v5 _setup];
  }
  return v5;
}

- (void)_setup
{
  v7.receiver = self;
  v7.super_class = (Class)DMCCertificateDetailsViewController;
  [(DMCProfileTableViewController *)&v7 updateExtendedLayoutIncludesOpaqueBars];
  v3 = [(DMCCertificateDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CertificateDetailsCell"];

  id v4 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_DETAILS");
  objc_super v5 = [(DMCCertificateDetailsViewController *)self navigationItem];
  [v5 setTitle:v4];

  v6.receiver = self;
  v6.super_class = (Class)DMCCertificateDetailsViewController;
  [(DMCProfileTableViewController *)&v6 reloadTableOnContentSizeCategoryChange];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(DMCCertificateDetailsViewController *)self keyValueSections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v6 = [(DMCCertificateDetailsViewController *)self keyValueSections];
  unint64_t v7 = [v6 count];

  if (v7 <= a4) {
    return 0;
  }
  uint64_t v8 = [(DMCCertificateDetailsViewController *)self keyValueSections];
  v9 = [v8 objectAtIndex:a4];

  int64_t v10 = (uint64_t)(double)((unint64_t)[v9 count] >> 1);
  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  objc_super v6 = [(DMCCertificateDetailsViewController *)self keyValueSectionTitles];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    v9 = 0;
  }
  else
  {
    uint64_t v8 = [(DMCCertificateDetailsViewController *)self keyValueSectionTitles];
    v9 = [v8 objectAtIndex:a4];
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DMCCertificateDetailsViewController *)self keyValueSections];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

  int64_t v10 = objc_msgSend(v9, "objectAtIndex:", 2 * objc_msgSend(v6, "row"));
  objc_super v11 = objc_msgSend(v9, "objectAtIndex:", (2 * objc_msgSend(v6, "row")) | 1);
  v12 = [v7 dequeueReusableCellWithIdentifier:@"CertificateDetailsCell" forIndexPath:v6];

  [v12 setDetail:v10 value:v11];
  return v12;
}

- (id)certificateTrust
{
  return self->_certificateTrust;
}

- (void)setCertificateTrust:(id)a3
{
}

- (NSArray)keyValueSections
{
  return self->_keyValueSections;
}

- (void)setKeyValueSections:(id)a3
{
}

- (NSArray)keyValueSectionTitles
{
  return self->_keyValueSectionTitles;
}

- (void)setKeyValueSectionTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueSectionTitles, 0);
  objc_storeStrong((id *)&self->_keyValueSections, 0);
  objc_storeStrong(&self->_certificateTrust, 0);
}

@end