@interface HUSplitAccountHeaderTableView
- (ACAccount)mediaAccount;
- (HMHome)home;
- (HUMediaAccountDelegate)splitAccountDelegate;
- (HUSplitAccountHeaderTableView)initWithFrame:(CGRect)a3 mediaAccount:(id)a4 home:(id)a5 delegate:(id)a6;
- (double)_buttonTitleTextHeight;
- (double)_descriptionHeight;
- (double)_maxTitleAndDescriptionCellHeightForWidth:(double)a3;
- (double)_titleHeight;
- (double)tableViewHeightForWidth:(double)a3;
- (id)_buttonTitleTextFont;
- (id)_descriptionFont;
- (id)_titleFont;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setHome:(id)a3;
- (void)setMediaAccount:(id)a3;
- (void)setSplitAccountDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HUSplitAccountHeaderTableView

- (HUSplitAccountHeaderTableView)initWithFrame:(CGRect)a3 mediaAccount:(id)a4 home:(id)a5 delegate:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HUSplitAccountHeaderTableView;
  v17 = -[HUSplitAccountHeaderTableView initWithFrame:style:](&v25, sel_initWithFrame_style_, 2, x, y, width, height);
  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [(HUSplitAccountHeaderTableView *)v17 registerClass:v18 forCellReuseIdentifier:v20];

    uint64_t v21 = objc_opt_class();
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [(HUSplitAccountHeaderTableView *)v17 registerClass:v21 forCellReuseIdentifier:v23];

    objc_storeStrong((id *)&v17->_mediaAccount, a4);
    objc_storeStrong((id *)&v17->_home, a5);
    objc_storeWeak((id *)&v17->_splitAccountDelegate, v16);
    [(HUSplitAccountHeaderTableView *)v17 setDataSource:v17];
    [(HUSplitAccountHeaderTableView *)v17 setDelegate:v17];
    [(HUSplitAccountHeaderTableView *)v17 setScrollEnabled:0];
    [(HUSplitAccountHeaderTableView *)v17 reloadData];
  }

  return v17;
}

- (id)_titleFont
{
  return (id)[MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438A0] traits:32770];
}

- (id)_descriptionFont
{
  return (id)[MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F43890] traits:0x8000];
}

- (double)_descriptionHeight
{
  v2 = [(HUSplitAccountHeaderTableView *)self _descriptionFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (double)_titleHeight
{
  v2 = [(HUSplitAccountHeaderTableView *)self _titleFont];
  [v2 _scaledValueForValue:32.0];
  double v4 = v3;

  return v4;
}

- (id)_buttonTitleTextFont
{
  return (id)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
}

- (double)_buttonTitleTextHeight
{
  v2 = [(HUSplitAccountHeaderTableView *)self _buttonTitleTextFont];
  [v2 _scaledValueForValue:28.0];
  double v4 = v3;

  return v4;
}

- (double)_maxTitleAndDescriptionCellHeightForWidth:(double)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v5 = _HULocalizedStringWithDefaultValue(@"HUSplitAccount_Title", @"HUSplitAccount_Title", 1);
  uint64_t v37 = *MEMORY[0x1E4F42508];
  uint64_t v6 = v37;
  v7 = [(HUSplitAccountHeaderTableView *)self _titleFont];
  v38[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a3, 3.40282347e38);
  double v10 = v9;

  v11 = [(HUSplitAccountHeaderTableView *)self _titleFont];
  [v11 lineHeight];
  double v13 = v12;

  [(HUSplitAccountHeaderTableView *)self _titleHeight];
  double v15 = v14;
  id v16 = [(HUSplitAccountHeaderTableView *)self mediaAccount];
  v17 = [v16 username];
  v24 = HULocalizedStringWithFormat(@"HUSplitAccount_Description", @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v17);

  uint64_t v35 = v6;
  objc_super v25 = [(HUSplitAccountHeaderTableView *)self _descriptionFont];
  v36 = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 1, v26, 0, a3, 3.40282347e38);
  double v28 = v27;

  v29 = [(HUSplitAccountHeaderTableView *)self _descriptionFont];
  [v29 lineHeight];
  double v31 = v30;

  [(HUSplitAccountHeaderTableView *)self _descriptionHeight];
  double v33 = v32;

  return v15 * (double)(unint64_t)ceil(v10 / v13)
       + 10.0
       + 4.0
       + v33 * (double)(unint64_t)ceil(v28 / v31)
       + 10.0;
}

- (double)tableViewHeightForWidth:(double)a3
{
  [(HUSplitAccountHeaderTableView *)self _buttonTitleTextHeight];
  double v6 = v5 * 3.0 + 20.0 + 20.0;
  [(HUSplitAccountHeaderTableView *)self _maxTitleAndDescriptionCellHeightForWidth:a3];
  return v7 + 2.0 + v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 row])
  {
    v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    double v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

    uint64_t v11 = [v6 row];
    if (v11 != 1) {
      goto LABEL_6;
    }
    double v12 = [(HUSplitAccountHeaderTableView *)self mediaAccount];
    double v13 = [v12 username];
    uint64_t v20 = HULocalizedStringWithFormat(@"HUSplitAccount_UseMediaAccount_Button_Title", @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);

    uint64_t v21 = [v10 textLabel];
    [v21 setText:v20];
  }
  else
  {
    uint64_t v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    double v10 = [v7 dequeueReusableCellWithIdentifier:v23 forIndexPath:v6];

    v24 = _HULocalizedStringWithDefaultValue(@"HUSplitAccount_Title", @"HUSplitAccount_Title", 1);
    [v10 setTitleText:v24];

    objc_super v25 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438A0] traits:32770];
    [v10 setTitleFont:v25];

    [v10 setMaxNumberOfTitleLines:0];
    v26 = [(HUSplitAccountHeaderTableView *)self mediaAccount];
    double v27 = [v26 username];
    uint64_t v20 = HULocalizedStringWithFormat(@"HUSplitAccount_Description", @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);

    [v10 setDescriptionText:v20];
    v34 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F43890] traits:0x8000];
    [v10 setDescriptionFont:v34];

    [v10 setMaxNumberOfDescriptionLines:0];
    [v10 setHideIcon:1];
    [v10 setSelectionStyle:0];
  }

LABEL_6:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v6 row] == 1)
  {
    id v7 = [(HUSplitAccountHeaderTableView *)self splitAccountDelegate];
    v8 = [(HUSplitAccountHeaderTableView *)self mediaAccount];
    double v9 = [(HUSplitAccountHeaderTableView *)self home];
    [v7 setAMSiTunesAccount:v8 forHome:v9];
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (ACAccount)mediaAccount
{
  return self->_mediaAccount;
}

- (void)setMediaAccount:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HUMediaAccountDelegate)splitAccountDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitAccountDelegate);

  return (HUMediaAccountDelegate *)WeakRetained;
}

- (void)setSplitAccountDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_splitAccountDelegate);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_mediaAccount, 0);
}

@end