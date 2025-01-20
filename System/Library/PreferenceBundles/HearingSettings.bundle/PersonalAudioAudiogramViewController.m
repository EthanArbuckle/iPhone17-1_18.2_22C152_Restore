@interface PersonalAudioAudiogramViewController
- (NSArray)audiograms;
- (NSIndexPath)selectedIndexPath;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (OBLinkTrayButton)linkButton;
- (OBTrayButton)nextButton;
- (PersonalAudioAudiogramViewController)initWithAudiograms:(id)a3 andDelegate:(id)a4;
- (PersonalAudioAudiogramViewControllerDelegate)delegate;
- (PersonalAudioLinkControl)healthLink;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)numberOfAudiograms;
- (void)addAudiogramTapped;
- (void)audiogramIngestionDidSaveAudiogram:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)setAudiograms:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHealthLink:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)showAudiogramsInHealth:(id)a3;
- (void)skipButtonTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTableViewHeight;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PersonalAudioAudiogramViewController

- (PersonalAudioAudiogramViewController)initWithAudiograms:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = paLocString();
  v9 = paLocString();
  v13.receiver = self;
  v13.super_class = (Class)PersonalAudioAudiogramViewController;
  v10 = [(PersonalAudioAudiogramViewController *)&v13 initWithTitle:v8 detailText:v9 icon:0];

  if (v10)
  {
    [(PersonalAudioAudiogramViewController *)v10 setAudiograms:v6];
    [(PersonalAudioAudiogramViewController *)v10 setDelegate:v7];
    if ([v6 count])
    {
      v11 = +[NSIndexPath indexPathForRow:0 inSection:0];
      [(PersonalAudioAudiogramViewController *)v10 setSelectedIndexPath:v11];
    }
  }

  return v10;
}

- (void)viewDidLoad
{
  v62.receiver = self;
  v62.super_class = (Class)PersonalAudioAudiogramViewController;
  [(PersonalAudioAudiogramViewController *)&v62 viewDidLoad];
  v3 = +[OBBoldTrayButton boldButton];
  nextButton = self->_nextButton;
  self->_nextButton = v3;

  v5 = [(PersonalAudioAudiogramViewController *)self buttonTray];
  [v5 addButton:self->_nextButton];

  id v6 = +[OBLinkTrayButton linkButton];
  linkButton = self->_linkButton;
  self->_linkButton = v6;

  v8 = self->_linkButton;
  v9 = paLocString();
  [(OBLinkTrayButton *)v8 setTitle:v9 forState:0];

  [(OBLinkTrayButton *)self->_linkButton addTarget:self action:"skipButtonTapped:" forControlEvents:64];
  v10 = [(PersonalAudioAudiogramViewController *)self buttonTray];
  [v10 addButton:self->_linkButton];

  v11 = paLocString();
  v12 = +[PersonalAudioLinkControl linkWithTitle:v11];
  healthLink = self->_healthLink;
  self->_healthLink = v12;

  [(PersonalAudioLinkControl *)self->_healthLink setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PersonalAudioLinkControl *)self->_healthLink addTarget:self action:"showAudiogramsInHealth:" forControlEvents:64];
  v14 = [(PersonalAudioAudiogramViewController *)self contentView];
  [v14 addSubview:self->_healthLink];

  v15 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v15;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setScrollEnabled:0];
  v17 = self->_tableView;
  v18 = +[UIColor systemBackgroundColor];
  [(UITableView *)v17 setBackgroundColor:v18];

  [(UITableView *)self->_tableView setSeparatorStyle:1];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"PAAudiogramHeaderReuseID"];
  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [(PersonalAudioAudiogramViewController *)self contentView];
  [v19 addSubview:self->_tableView];

  v60 = [(PersonalAudioLinkControl *)self->_healthLink topAnchor];
  v61 = [(PersonalAudioAudiogramViewController *)self contentView];
  v59 = [v61 topAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v63[0] = v58;
  v56 = [(PersonalAudioLinkControl *)self->_healthLink leadingAnchor];
  v57 = [(PersonalAudioAudiogramViewController *)self contentView];
  v55 = [v57 leadingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v63[1] = v54;
  v52 = [(PersonalAudioLinkControl *)self->_healthLink trailingAnchor];
  v53 = [(PersonalAudioAudiogramViewController *)self contentView];
  v51 = [v53 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v63[2] = v50;
  v49 = [(UITableView *)self->_tableView topAnchor];
  v48 = [(PersonalAudioLinkControl *)self->_healthLink bottomAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v63[3] = v47;
  v45 = [(UITableView *)self->_tableView leadingAnchor];
  v46 = [(PersonalAudioAudiogramViewController *)self view];
  v44 = [v46 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v63[4] = v43;
  v20 = [(UITableView *)self->_tableView trailingAnchor];
  v21 = [(PersonalAudioAudiogramViewController *)self view];
  v22 = [v21 trailingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v63[5] = v23;
  v24 = [(UITableView *)self->_tableView bottomAnchor];
  v25 = [(PersonalAudioAudiogramViewController *)self contentView];
  v26 = [v25 bottomAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  v63[6] = v27;
  v28 = +[NSArray arrayWithObjects:v63 count:7];
  +[NSLayoutConstraint activateConstraints:v28];

  [(PersonalAudioAudiogramViewController *)self updateTableViewHeight];
  v29 = [(PersonalAudioAudiogramViewController *)self audiograms];
  id v30 = [v29 count];

  v31 = [(PersonalAudioAudiogramViewController *)self headerView];
  paLocString();
  if (v30) {
    v32 = {;
  }
    [v31 setTitle:v32];

    v33 = [(PersonalAudioAudiogramViewController *)self headerView];
    v34 = paLocString();
    [v33 setDetailText:v34];

    v35 = self->_nextButton;
    v36 = paLocString();
    [(OBTrayButton *)v35 setTitle:v36 forState:0];
    v37 = &selRef_nextButtonTapped_;
  }
  else {
    v38 = {;
  }
    [v31 setTitle:v38];

    v39 = [(PersonalAudioAudiogramViewController *)self headerView];
    v40 = paLocString();
    [v39 setDetailText:v40];

    v41 = self->_nextButton;
    v36 = paLocString();
    [(OBTrayButton *)v41 setTitle:v36 forState:0];
    v37 = &selRef_addAudiogramTapped;
  }

  [(OBTrayButton *)self->_nextButton addTarget:self action:*v37 forControlEvents:64];
  v42 = [(PersonalAudioAudiogramViewController *)self scrollView];
  [v42 _addScrollViewScrollObserver:self];
}

- (void)viewDidLayoutSubviews
{
  [(PersonalAudioAudiogramViewController *)self updateTableViewHeight];
  v3.receiver = self;
  v3.super_class = (Class)PersonalAudioAudiogramViewController;
  [(PersonalAudioAudiogramViewController *)&v3 viewDidLayoutSubviews];
}

- (void)updateTableViewHeight
{
  [(UITableView *)self->_tableView contentSize];
  double v4 = v3;
  tableViewHeightConstraint = self->_tableViewHeightConstraint;
  if (tableViewHeightConstraint || (tableView = self->_tableView) == 0)
  {
    [(NSLayoutConstraint *)tableViewHeightConstraint constant];
    if (v4 != v6)
    {
      id v11 = [(PersonalAudioAudiogramViewController *)self tableViewHeightConstraint];
      [v11 setConstant:v4];
    }
  }
  else
  {
    v8 = +[NSLayoutConstraint constraintWithItem:tableView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v3];
    v9 = self->_tableViewHeightConstraint;
    self->_tableViewHeightConstraint = v8;

    v10 = self->_tableViewHeightConstraint;
    [(NSLayoutConstraint *)v10 setActive:1];
  }
}

- (void)nextButtonTapped:(id)a3
{
  double v4 = [(PersonalAudioAudiogramViewController *)self audiograms];
  v5 = (char *)[v4 count];
  double v6 = [(PersonalAudioAudiogramViewController *)self selectedIndexPath];
  id v7 = &v5[~(unint64_t)[v6 row]];

  v8 = [(PersonalAudioAudiogramViewController *)self audiograms];
  id v10 = [v8 objectAtIndex:v7];

  v9 = [(PersonalAudioAudiogramViewController *)self delegate];
  [v9 didSelectAudiogram:v10];
}

- (void)skipButtonTapped:(id)a3
{
  id v3 = [(PersonalAudioAudiogramViewController *)self delegate];
  [v3 didSelectAudiogram:0];
}

- (void)showAudiogramsInHealth:(id)a3
{
  id v4 = +[NSURL URLWithString:@"x-apple-health://SampleType/HKDataTypeIdentifierAudiogram"];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)addAudiogramTapped
{
  id v3 = [objc_alloc((Class)AIAudiogramEnrollmentViewController) initWithDelegate:self];
  [v3 setAnalyticsClient:1];
  [(PersonalAudioAudiogramViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (unint64_t)numberOfAudiograms
{
  v2 = [(PersonalAudioAudiogramViewController *)self audiograms];
  id v3 = [v2 count];

  if ((unint64_t)v3 >= 3) {
    return 3;
  }
  else {
    return (unint64_t)v3;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(PersonalAudioAudiogramViewController *)self audiograms];
  int64_t v4 = [v3 count] != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = [(PersonalAudioAudiogramViewController *)self numberOfAudiograms];
  return v4 + _os_feature_enabled_impl();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  unint64_t v9 = [(PersonalAudioAudiogramViewController *)self numberOfAudiograms];
  if ((unint64_t)[v6 row] >= v9)
  {
    id v10 = [v7 dequeueReusableCellWithIdentifier:@"PAAddAudiogramCellReuseID"];

    if (v10) {
      goto LABEL_10;
    }
    id v10 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"PAAddAudiogramCellReuseID"];
    v24 = [v10 textLabel];
    v25 = paLocString();
    [v24 setText:v25];

    v26 = [v10 textLabel];
    v27 = +[UIColor systemBlueColor];
    [v26 setTextColor:v27];

    v28 = [v10 imageView];
    v29 = [v10 _checkmarkImage:0];
    [v28 setImage:v29];

    v20 = [v10 imageView];
    [v20 setHidden:1];
  }
  else
  {
    id v10 = [v7 dequeueReusableCellWithIdentifier:@"PAAudiogramCellReuseID"];

    if (!v10)
    {
      id v10 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"PAAudiogramCellReuseID"];
      id v11 = [v10 imageView];
      [v11 setContentMode:1];

      v12 = [v10 imageView];
      objc_super v13 = [v10 _checkmarkImage:0];
      [v12 setImage:v13];

      v14 = [v10 imageView];
      id v15 = [(PersonalAudioAudiogramViewController *)self selectedIndexPath];
      [v14 setHidden:v15 != v6];
    }
    v16 = [(PersonalAudioAudiogramViewController *)self audiograms];
    v17 = (char *)[v16 count];
    v18 = &v17[~(unint64_t)[v6 row]];

    v19 = [(PersonalAudioAudiogramViewController *)self audiograms];
    v20 = [v19 objectAtIndex:v18];

    v21 = [v20 startDate];
    if (!v21)
    {
      v21 = +[NSDate date];
    }
    v22 = [v10 textLabel];
    v23 = +[NSDateFormatter localizedStringFromDate:v21 dateStyle:3 timeStyle:0];
    [v22 setText:v23];
  }
LABEL_10:

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)paLocString();
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  unint64_t v4 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"PAAudiogramHeaderReuseID", a4);
  v5 = [v4 contentView];
  id v6 = +[UIColor systemBackgroundColor];
  [v5 setBackgroundColor:v6];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  id v8 = [v7 row];
  if (v8 >= (id)[(PersonalAudioAudiogramViewController *)self numberOfAudiograms])
  {
    [(PersonalAudioAudiogramViewController *)self addAudiogramTapped];
  }
  else
  {
    id v9 = [(PersonalAudioAudiogramViewController *)self selectedIndexPath];

    if (v9 != v7)
    {
      id v10 = [(PersonalAudioAudiogramViewController *)self selectedIndexPath];
      [(PersonalAudioAudiogramViewController *)self setSelectedIndexPath:v7];
      v12[0] = v10;
      v12[1] = v7;
      id v11 = +[NSArray arrayWithObjects:v12 count:2];
      [v6 reloadRowsAtIndexPaths:v11 withRowAnimation:100];
    }
  }
}

- (void)audiogramIngestionDidSaveAudiogram:(id)a3
{
  id v4 = a3;
  id v5 = [(PersonalAudioAudiogramViewController *)self delegate];
  [v5 didSelectAudiogram:v4];
}

- (PersonalAudioAudiogramViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSArray)audiograms
{
  return self->_audiograms;
}

- (void)setAudiograms:(id)a3
{
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (OBTrayButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (PersonalAudioLinkControl)healthLink
{
  return self->_healthLink;
}

- (void)setHealthLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthLink, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_audiograms, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end