@interface CertInfoCertificateListController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CertInfoCertificateListController)initWithTrustDescription:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CertInfoCertificateListController

- (CertInfoCertificateListController)initWithTrustDescription:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CertInfoCertificateListController;
  v6 = [(CertInfoCertificateListController *)&v11 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_description, a3);
    v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    v9 = [v8 localizedStringForKey:@"CERTIFICATES" value:&stru_26C9B5AF8 table:@"CertInfo"];
    [(CertInfoCertificateListController *)v7 setTitle:v9];
  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(CertInfoTrustDescription *)self->_description certificateCount];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 69.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"CertInfoCertificateListControllerTableCell"];
  if (!v7)
  {
    v7 = [[CertInfoCertificateListTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"CertInfoCertificateListControllerTableCell"];
    [(CertInfoCertificateListTableViewCell *)v7 setAccessoryType:1];
  }
  -[CertInfoCertificateListTableViewCell updateWithTrustDescription:certificateIndex:](v7, "updateWithTrustDescription:certificateIndex:", self->_description, [v6 section]);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[CertInfoTrustDescription certificatePropertiesAtIndex:](self->_description, "certificatePropertiesAtIndex:", objc_msgSend(a4, "section", a3));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [[CertInfoCertificateDetailsController alloc] initWithCertificateProperties:v7];
  id v6 = [(CertInfoCertificateListController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end