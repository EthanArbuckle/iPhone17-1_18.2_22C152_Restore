@interface CNPhotoPickerListCollectionViewCell
+ (id)cellIdentifier;
- (CNPhotoPickerListCollectionViewCell)initWithFrame:(CGRect)a3;
- (CNPhotoPickerListCollectionViewCellDelegate)selectionDelegate;
- (UIEdgeInsets)contentInset;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)reloadData;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateConstraints;
@end

@implementation CNPhotoPickerListCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_selectionDelegate, 0);
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (CNPhotoPickerListCollectionViewCellDelegate)selectionDelegate
{
  return self->_selectionDelegate;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v5];
  v7 = [v6 defaultContentConfiguration];
  uint64_t v8 = [v5 row];

  if (v8 == 2)
  {
    v9 = CNContactsUIBundle();
    v10 = v9;
    v11 = @"PHOTO_EDIT_LIST_MONOGRAM";
  }
  else if (v8 == 1)
  {
    v9 = CNContactsUIBundle();
    v10 = v9;
    v11 = @"PHOTO_EDIT_LIST_EMOJI";
  }
  else
  {
    if (v8) {
      goto LABEL_8;
    }
    v9 = CNContactsUIBundle();
    v10 = v9;
    v11 = @"PHOTO_EDIT_LIST_LIBRARY";
  }
  v12 = [v9 localizedStringForKey:v11 value:&stru_1ED8AC728 table:@"Localized"];
  [v7 setText:v12];

LABEL_8:
  v13 = +[CNPhotoPickerListDataSource symbolImageNameForAddItemType:v8];
  v14 = [MEMORY[0x1E4FB1818] _systemImageNamed:v13];
  [v7 setImage:v14];

  [v7 setImageToTextPadding:16.0];
  v15 = [v7 imageProperties];
  v16 = [MEMORY[0x1E4FB1618] whiteColor];
  [v15 setTintColor:v16];

  [v6 setContentConfiguration:v7];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  v7 = [(CNPhotoPickerListCollectionViewCell *)self selectionDelegate];
  [v7 didSelectItemFromListCollectionViewCell:v6];

  [v8 deselectRowAtIndexPath:v6 animated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[CNPhotoPickerListDataSource getAddItemsSectionHeight];
  return v4 / 3.0;
}

- (void)updateConstraints
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)CNPhotoPickerListCollectionViewCell;
  [(CNPhotoPickerListCollectionViewCell *)&v23 updateConstraints];
  v22 = [(CNPhotoPickerListCollectionViewCell *)self tableView];
  v21 = [v22 topAnchor];
  v20 = [(CNPhotoPickerListCollectionViewCell *)self topAnchor];
  [(CNPhotoPickerListCollectionViewCell *)self contentInset];
  v19 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20);
  v24[0] = v19;
  v18 = [(CNPhotoPickerListCollectionViewCell *)self tableView];
  v17 = [v18 leadingAnchor];
  v16 = [(CNPhotoPickerListCollectionViewCell *)self leadingAnchor];
  [(CNPhotoPickerListCollectionViewCell *)self contentInset];
  v15 = [v17 constraintEqualToAnchor:v16 constant:v3];
  v24[1] = v15;
  double v4 = [(CNPhotoPickerListCollectionViewCell *)self tableView];
  id v5 = [v4 bottomAnchor];
  id v6 = [(CNPhotoPickerListCollectionViewCell *)self bottomAnchor];
  [(CNPhotoPickerListCollectionViewCell *)self contentInset];
  id v8 = [v5 constraintEqualToAnchor:v6 constant:-v7];
  v24[2] = v8;
  v9 = [(CNPhotoPickerListCollectionViewCell *)self tableView];
  v10 = [v9 trailingAnchor];
  v11 = [(CNPhotoPickerListCollectionViewCell *)self trailingAnchor];
  [(CNPhotoPickerListCollectionViewCell *)self contentInset];
  v13 = [v10 constraintEqualToAnchor:v11 constant:-v12];
  v24[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  [(CNPhotoPickerListCollectionViewCell *)self addConstraints:v14];
}

- (CNPhotoPickerListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerListCollectionViewCell;
  double v3 = -[CNPhotoPickerListCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1D00]);
    [(CNPhotoPickerListCollectionViewCell *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:style:", 2);
    tableView = v3->_tableView;
    v3->_tableView = (UITableView *)v5;

    [(UITableView *)v3->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)v3->_tableView setScrollEnabled:0];
    [(UITableView *)v3->_tableView setDelegate:v3];
    [(UITableView *)v3->_tableView setDataSource:v3];
    [(UITableView *)v3->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
    double v7 = [(CNPhotoPickerListCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_tableView];
  }
  return v3;
}

- (void)reloadData
{
  id v2 = [(CNPhotoPickerListCollectionViewCell *)self tableView];
  [v2 reloadData];
}

+ (id)cellIdentifier
{
  return @"CNPhotoPickerListCellIdentifier";
}

@end