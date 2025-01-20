@interface CertificateDetailsViewController
- (CertificateDetailsViewController)init;
- (CertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3;
- (CertificateDetailsViewController)initWithCertificateProperties:(id)a3;
- (CertificateDetailsViewController)initWithStyle:(int64_t)a3;
- (CertificateDetailsViewController)initWithTrust:(__SecTrust *)a3;
- (NSArray)keyValueSectionTitles;
- (NSArray)keyValueSections;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)certificateTrust;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setup;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)preferredContentSizeChanged:(id)a3;
- (void)setCertificateProperties:(id)a3;
- (void)setCertificateTrust:(id)a3;
- (void)setKeyValueSectionTitles:(id)a3;
- (void)setKeyValueSections:(id)a3;
- (void)viewDidLoad;
@end

@implementation CertificateDetailsViewController

- (CertificateDetailsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CertificateDetailsViewController;
  v2 = [(CertificateDetailsViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CertificateDetailsViewController *)v2 _setup];
  }
  return v3;
}

- (CertificateDetailsViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CertificateDetailsViewController;
  v3 = [(CertificateDetailsViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(CertificateDetailsViewController *)v3 _setup];
  }
  return v4;
}

- (CertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CertificateDetailsViewController;
  v4 = [(CertificateDetailsViewController *)&v10 initWithStyle:1];
  if (v4)
  {
    objc_super v5 = [[CertUICertificatePropertiesInfo alloc] initWithCertificate:a3];
    objc_super v6 = [(CertUICertificatePropertiesInfo *)v5 sections];
    if ([v6 count])
    {
      objc_storeStrong((id *)&v4->_keyValueSections, v6);
      uint64_t v7 = [(CertUICertificatePropertiesInfo *)v5 sectionTitles];
      keyValueSectionTitles = v4->_keyValueSectionTitles;
      v4->_keyValueSectionTitles = (NSArray *)v7;
    }
    [(CertificateDetailsViewController *)v4 _setup];
  }
  return v4;
}

- (CertificateDetailsViewController)initWithCertificateProperties:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CertificateDetailsViewController;
  objc_super v5 = [(CertificateDetailsViewController *)&v11 initWithStyle:1];
  if (v5)
  {
    objc_super v6 = [[CertUICertificatePropertiesInfo alloc] initWithCertificateProperties:v4];
    uint64_t v7 = [(CertUICertificatePropertiesInfo *)v6 sections];
    if ([v7 count])
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      uint64_t v8 = [(CertUICertificatePropertiesInfo *)v6 sectionTitles];
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;
    }
    [(CertificateDetailsViewController *)v5 _setup];
  }
  return v5;
}

- (CertificateDetailsViewController)initWithTrust:(__SecTrust *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CertificateDetailsViewController;
  id v4 = [(CertificateDetailsViewController *)&v11 initWithStyle:1];
  objc_super v5 = v4;
  if (v4)
  {
    objc_storeStrong(&v4->_certificateTrust, a3);
    objc_super v6 = [[CertUICertificatePropertiesInfo alloc] initWithTrust:a3];
    uint64_t v7 = [(CertUICertificatePropertiesInfo *)v6 sections];
    if ([v7 count])
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      uint64_t v8 = [(CertUICertificatePropertiesInfo *)v6 sectionTitles];
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;
    }
    [(CertificateDetailsViewController *)v5 _setup];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CertificateDetailsViewController;
  [(CertificateDetailsViewController *)&v4 dealloc];
}

- (void)_setup
{
  v3 = [(CertificateDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CertificateDetailsKeyDataCell"];

  objc_super v4 = [(CertificateDetailsViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"CertificateDetailsKeyValueCell"];

  objc_super v5 = [(CertificateDetailsViewController *)self tableView];
  [v5 setCellLayoutMarginsFollowReadableWidth:0];

  objc_super v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
  uint64_t v7 = [v6 localizedStringForKey:@"DETAILS" value:&stru_26C9B5AF8 table:@"CertInfo"];
  uint64_t v8 = [(CertificateDetailsViewController *)self navigationItem];
  [v8 setTitle:v7];

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_preferredContentSizeChanged_ name:*MEMORY[0x263F1D158] object:0];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CertificateDetailsViewController;
  [(CertificateDetailsViewController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)CertificateDetailsViewController;
  [(CertificateDetailsViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setCertificateProperties:(id)a3
{
  id v9 = [a3 firstObject];
  objc_super v4 = [[CertUICertificatePropertiesInfo alloc] initWithSendableCertificateProperties:v9];
  objc_super v5 = [(CertUICertificatePropertiesInfo *)v4 sections];
  if ([v5 count])
  {
    objc_storeStrong((id *)&self->_keyValueSections, v5);
    objc_super v6 = [(CertUICertificatePropertiesInfo *)v4 sectionTitles];
    keyValueSectionTitles = self->_keyValueSectionTitles;
    self->_keyValueSectionTitles = v6;
  }
  uint64_t v8 = [(CertificateDetailsViewController *)self tableView];
  [v8 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(CertificateDetailsViewController *)self keyValueSections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v6 = [(CertificateDetailsViewController *)self keyValueSections];
  unint64_t v7 = [v6 count];

  if (v7 <= a4) {
    return 0;
  }
  uint64_t v8 = [(CertificateDetailsViewController *)self keyValueSections];
  id v9 = [v8 objectAtIndex:a4];

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
  objc_super v6 = [(CertificateDetailsViewController *)self keyValueSectionTitles];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = [(CertificateDetailsViewController *)self keyValueSectionTitles];
    id v9 = [v8 objectAtIndex:a4];
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CertificateDetailsViewController *)self keyValueSections];
  id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section"));

  int64_t v10 = objc_msgSend(v9, "objectAtIndex:", 2 * objc_msgSend(v7, "row"));
  objc_super v11 = objc_msgSend(v9, "objectAtIndex:", (2 * objc_msgSend(v7, "row")) | 1);
  objc_opt_class();
  v12 = @"CertificateDetailsKeyDataCell";
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v12 = @"CertificateDetailsKeyValueCell";
    }
  }
  v13 = [v6 dequeueReusableCellWithIdentifier:v12 forIndexPath:v7];
  [v13 setValue:v11 forKey:v10];

  return v13;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id v3 = [(CertificateDetailsViewController *)self tableView];
  [v3 reloadData];
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