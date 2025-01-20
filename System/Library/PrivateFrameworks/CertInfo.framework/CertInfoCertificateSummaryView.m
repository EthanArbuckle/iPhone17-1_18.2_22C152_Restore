@interface CertInfoCertificateSummaryView
- (CertInfoCertificateHeaderCell)headerCell;
- (CertInfoCertificateSummaryDescriptionCell)descriptionCell;
- (CertInfoCertificateSummaryView)initWithFrame:(CGRect)a3;
- (NSDate)expirationDate;
- (NSString)purpose;
- (NSString)trustSubtitle;
- (NSString)trustTitle;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cellForReuseIdentifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureCell:(id)a3;
- (void)setDescriptionCell:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHeaderCell:(id)a3;
- (void)setMoreDetailsSelectedBlock:(id)a3;
- (void)setPurpose:(id)a3;
- (void)setTrustSubtitle:(id)a3;
- (void)setTrustTitle:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CertInfoCertificateSummaryView

- (CertInfoCertificateSummaryView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CertInfoCertificateSummaryView;
  v3 = -[CertInfoCertificateSummaryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CertInfoCertificateSummaryView *)v3 bounds];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1CA40]), "initWithFrame:style:", 1, v5, v6, v7, v8);
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v9;

    [(UITableView *)v4->_tableView setAutoresizingMask:18];
    [(UITableView *)v4->_tableView setDelegate:v4];
    [(UITableView *)v4->_tableView setDataSource:v4];
    -[UITableView setSeparatorInset:](v4->_tableView, "setSeparatorInset:", 0.0, 15.0, 0.0, 0.0);
    [(CertInfoCertificateSummaryView *)v4 addSubview:v4->_tableView];
  }
  return v4;
}

- (void)setMoreDetailsSelectedBlock:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4) {
    double v5 = (void *)[v4 copy];
  }
  else {
    double v5 = 0;
  }
  double v6 = (void *)MEMORY[0x21D46E590](v5);
  id moreDetailsSelectedBlock = self->_moreDetailsSelectedBlock;
  self->_id moreDetailsSelectedBlock = v6;

  double v8 = v9;
  if (v9)
  {

    double v8 = v9;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return 3;
  }
}

- (id)_cellForReuseIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"kCertInfoCertificateSummaryHeaderIdentifier"])
  {
    headerCell = self->_headerCell;
    if (!headerCell)
    {
      double v6 = [[CertInfoCertificateHeaderCell alloc] initWithStyle:0 reuseIdentifier:v4];
      [(CertInfoCertificateHeaderCell *)v6 setSelectionStyle:0];
      [(CertInfoCertificateSummaryView *)self setHeaderCell:v6];
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"kCertInfoCertificateSummaryDescriptionIdentifier"])
  {
    headerCell = self->_descriptionCell;
    if (headerCell)
    {
LABEL_6:
      double v6 = headerCell;
      goto LABEL_11;
    }
    double v6 = [[CertInfoCertificateSummaryDescriptionCell alloc] initWithStyle:0 reuseIdentifier:v4];
    [(CertInfoCertificateHeaderCell *)v6 setSelectionStyle:0];
    [(CertInfoCertificateSummaryView *)self setDescriptionCell:v6];
  }
  else if ([v4 isEqualToString:@"kCertInfoCertificateSummaryMoreDetailsIdentifier"])
  {
    double v6 = (CertInfoCertificateHeaderCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:v4];
    double v7 = [(CertInfoCertificateHeaderCell *)v6 textLabel];
    double v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    id v9 = [v8 localizedStringForKey:@"MORE_DETAILS" value:&stru_26C9B5AF8 table:@"CertInfo"];
    [v7 setText:v9];

    [(CertInfoCertificateHeaderCell *)v6 setAccessoryType:1];
  }
  else
  {
    double v6 = 0;
  }
LABEL_11:

  return v6;
}

- (void)_configureCell:(id)a3
{
  id v17 = a3;
  id v4 = [v17 reuseIdentifier];
  if ([v4 isEqualToString:@"kCertInfoCertificateSummaryHeaderIdentifier"])
  {
    id v5 = v17;
    double v6 = [(CertInfoCertificateSummaryView *)self trustTitle];
    [v5 setTrustTitle:v6];

    double v7 = [(CertInfoCertificateSummaryView *)self trustSubtitle];
    [v5 setTrustSubtitle:v7];

    id v8 = [(CertInfoCertificateSummaryView *)self expirationDate];
    [v8 timeIntervalSinceNow];
    [v5 setExpired:v9 < 0.0];
  }
  else
  {
    if (![v4 isEqualToString:@"kCertInfoCertificateSummaryDescriptionIdentifier"]) {
      goto LABEL_12;
    }
    id v8 = v17;
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v10 = [(CertInfoCertificateSummaryView *)self purpose];
    if (v10)
    {
      v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
      objc_super v12 = [v11 localizedStringForKey:@"DESCRIPTION" value:&stru_26C9B5AF8 table:@"CertInfo"];
      [v5 addObject:v12];

      [v5 addObject:v10];
    }
    v13 = [(CertInfoCertificateSummaryView *)self expirationDate];

    if (v13)
    {
      v14 = [MEMORY[0x263F08790] localizedStringFromDate:v13 dateStyle:2 timeStyle:2];
      if (v14)
      {
        v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
        v16 = [v15 localizedStringForKey:@"EXPIRES" value:&stru_26C9B5AF8 table:@"CertInfo"];
        [v5 addObject:v16];

        [v5 addObject:v14];
      }
    }
    [v8 setLabelsAndValues:v5];
  }
LABEL_12:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    id v8 = 0;
  }
  else
  {
    if ((unint64_t)[v7 row] > 2) {
      double v9 = 0;
    }
    else {
      double v9 = *sOrderedCellIdentifiers[[v7 row]];
    }
    id v10 = v9;
    id v8 = [v6 dequeueReusableCellWithIdentifier:v10];
    if (!v8)
    {
      id v8 = [(CertInfoCertificateSummaryView *)self _cellForReuseIdentifier:v10];
    }
    [(CertInfoCertificateSummaryView *)self _configureCell:v8];
  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  if ((unint64_t)[v8 row] > 2) {
    id v5 = 0;
  }
  else {
    id v5 = *sOrderedCellIdentifiers[[v8 row]];
  }
  id v6 = v5;
  if ([v6 isEqualToString:@"kCertInfoCertificateSummaryMoreDetailsIdentifier"])
  {
    id moreDetailsSelectedBlock = (void (**)(void))self->_moreDetailsSelectedBlock;
    if (moreDetailsSelectedBlock) {
      moreDetailsSelectedBlock[2]();
    }
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 rowHeight];
  double v8 = v7;
  if ((unint64_t)[v6 row] > 2) {
    double v9 = 0;
  }
  else {
    double v9 = *sOrderedCellIdentifiers[[v6 row]];
  }
  id v10 = v9;
  if ([v10 isEqualToString:@"kCertInfoCertificateSummaryHeaderIdentifier"])
  {
    uint64_t v11 = 456;
  }
  else
  {
    if (![v10 isEqualToString:@"kCertInfoCertificateSummaryDescriptionIdentifier"]) {
      goto LABEL_11;
    }
    uint64_t v11 = 464;
  }
  objc_super v12 = (void **)((char *)&self->super.super.super.isa + v11);
  v13 = *(Class *)((char *)&self->super.super.super.isa + v11);
  if (!v13)
  {
    v14 = [(CertInfoCertificateSummaryView *)self _cellForReuseIdentifier:v10];
    [(CertInfoCertificateSummaryView *)self _configureCell:v14];

    v13 = *v12;
  }
  [v13 rowHeight];
  double v8 = v15;
LABEL_11:

  return v8;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSString)trustTitle
{
  return self->_trustTitle;
}

- (void)setTrustTitle:(id)a3
{
}

- (NSString)trustSubtitle
{
  return self->_trustSubtitle;
}

- (void)setTrustSubtitle:(id)a3
{
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (CertInfoCertificateHeaderCell)headerCell
{
  return self->_headerCell;
}

- (void)setHeaderCell:(id)a3
{
}

- (CertInfoCertificateSummaryDescriptionCell)descriptionCell
{
  return self->_descriptionCell;
}

- (void)setDescriptionCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionCell, 0);
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong(&self->_moreDetailsSelectedBlock, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_trustSubtitle, 0);
  objc_storeStrong((id *)&self->_trustTitle, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end