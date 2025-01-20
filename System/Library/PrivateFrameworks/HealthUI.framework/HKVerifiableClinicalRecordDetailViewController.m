@interface HKVerifiableClinicalRecordDetailViewController
- (HKVerifiableClinicalRecordDetailDataProvider)dataProvider;
- (HKVerifiableClinicalRecordDetailViewController)initWithSignedRecord:(id)a3 medicalRecords:(id)a4;
- (id)configureSubtitleCellForItem:(id)a3 tableView:(id)a4;
- (id)configureValueCellForItem:(id)a3 tableView:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setUpTableView;
- (void)setDataProvider:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKVerifiableClinicalRecordDetailViewController

- (HKVerifiableClinicalRecordDetailViewController)initWithSignedRecord:(id)a3 medicalRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableClinicalRecordDetailViewController;
  v8 = [(HKTableViewController *)&v12 initWithUsingInsetStyling:1];
  if (v8)
  {
    v9 = [[HKVerifiableClinicalRecordDetailDataProvider alloc] initWithSignedRecord:v6 medicalRecords:v7];
    dataProvider = v8->_dataProvider;
    v8->_dataProvider = v9;
  }
  return v8;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HKVerifiableClinicalRecordDetailViewController;
  [(HKTableViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  [(HKVerifiableClinicalRecordDetailViewController *)self setTitle:v4];

  [(HKVerifiableClinicalRecordDetailViewController *)self setModalInPresentation:1];
  [(HKVerifiableClinicalRecordDetailViewController *)self _setUpTableView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKVerifiableClinicalRecordDetailViewController;
  -[HKVerifiableClinicalRecordDetailViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  objc_super v5 = [(HKVerifiableClinicalRecordDetailViewController *)self navigationController];
  int v6 = [v5 isNavigationBarHidden];

  if (v6)
  {
    id v7 = [(HKVerifiableClinicalRecordDetailViewController *)self navigationController];
    [v7 setNavigationBarHidden:0 animated:v3];
  }
}

- (void)_setUpTableView
{
  double v3 = *MEMORY[0x1E4FB2F28];
  v4 = [(HKVerifiableClinicalRecordDetailViewController *)self tableView];
  [v4 setRowHeight:v3];

  objc_super v5 = [(HKVerifiableClinicalRecordDetailViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"SubtitleCell"];

  id v6 = [(HKVerifiableClinicalRecordDetailViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"ValueCell"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(HKVerifiableClinicalRecordDetailDataProvider *)self->_dataProvider numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(HKVerifiableClinicalRecordDetailDataProvider *)self->_dataProvider numberOfRowsForSection:a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(HKVerifiableClinicalRecordDetailDataProvider *)self->_dataProvider headerForSection:a4];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return [(HKVerifiableClinicalRecordDetailDataProvider *)self->_dataProvider footerForSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  dataProvider = self->_dataProvider;
  id v8 = a4;
  uint64_t v9 = [v8 section];
  uint64_t v10 = [v8 row];

  v11 = [(HKVerifiableClinicalRecordDetailDataProvider *)dataProvider displayItemForSection:v9 row:v10];
  uint64_t v12 = [v11 type];
  if (v12 == 1)
  {
    uint64_t v13 = [(HKVerifiableClinicalRecordDetailViewController *)self configureValueCellForItem:v11 tableView:v6];
    goto LABEL_5;
  }
  if (!v12)
  {
    uint64_t v13 = [(HKVerifiableClinicalRecordDetailViewController *)self configureSubtitleCellForItem:v11 tableView:v6];
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_7;
  }
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v14 = HKErrorTableViewCell(v16);

LABEL_7:
  return v14;
}

- (id)configureSubtitleCellForItem:(id)a3 tableView:(id)a4
{
  id v5 = a3;
  id v6 = [a4 dequeueReusableCellWithIdentifier:@"SubtitleCell"];
  [v6 setSelectionStyle:0];
  id v7 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  id v8 = [v5 titleText];
  [v7 setText:v8];

  uint64_t v9 = [v5 detailText];
  [v7 setSecondaryText:v9];

  objc_msgSend(v7, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  [v7 setTextToSecondaryTextVerticalPadding:5.0];
  uint64_t v10 = [v5 subtitleStyle];

  if (v10 == 1)
  {
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v20 = [v7 textProperties];
    [v20 setColor:v19];

    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    v22 = [v7 textProperties];
    [v22 setFont:v21];

    v23 = [MEMORY[0x1E4FB1618] labelColor];
    v24 = [v7 secondaryTextProperties];
    [v24 setColor:v23];

    v17 = (void *)MEMORY[0x1E4FB08E0];
    v18 = (void *)MEMORY[0x1E4FB28C8];
  }
  else
  {
    if (v10) {
      goto LABEL_6;
    }
    v11 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v12 = [v7 textProperties];
    [v12 setColor:v11];

    uint64_t v13 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:1024];
    v14 = [v7 textProperties];
    [v14 setFont:v13];

    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v16 = [v7 secondaryTextProperties];
    [v16 setColor:v15];

    v17 = (void *)MEMORY[0x1E4FB08E0];
    v18 = (void *)MEMORY[0x1E4FB2950];
  }
  v25 = [v17 preferredFontForTextStyle:*v18];
  v26 = [v7 secondaryTextProperties];
  [v26 setFont:v25];

LABEL_6:
  [v6 setContentConfiguration:v7];

  return v6;
}

- (id)configureValueCellForItem:(id)a3 tableView:(id)a4
{
  id v5 = a3;
  id v6 = [a4 dequeueReusableCellWithIdentifier:@"ValueCell"];
  [v6 setSelectionStyle:0];
  id v7 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  [v7 setTextToSecondaryTextHorizontalPadding:10.0];
  id v8 = [v5 titleText];
  [v7 setText:v8];

  uint64_t v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v10 = [v7 textProperties];
  [v10 setColor:v9];

  uint64_t v11 = *MEMORY[0x1E4FB28C8];
  uint64_t v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v13 = [v7 textProperties];
  [v13 setFont:v12];

  v14 = [v5 detailText];
  [v7 setSecondaryText:v14];

  v15 = [v5 attributedDetailText];

  [v7 setSecondaryAttributedText:v15];
  v16 = [MEMORY[0x1E4FB1618] labelColor];
  v17 = [v7 secondaryTextProperties];
  [v17 setColor:v16];

  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v11];
  v19 = [v7 secondaryTextProperties];
  [v19 setFont:v18];

  [v6 setContentConfiguration:v7];
  return v6;
}

- (HKVerifiableClinicalRecordDetailDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end