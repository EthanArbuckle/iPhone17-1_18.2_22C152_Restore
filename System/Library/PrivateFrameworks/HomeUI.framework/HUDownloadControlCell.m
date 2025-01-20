@interface HUDownloadControlCell
- (HFItem)item;
- (HUDownloadControl)downloadControl;
- (HUDownloadControlCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)description;
- (void)layoutSubviews;
- (void)setDownloadControl:(id)a3;
- (void)setItem:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUDownloadControlCell

- (HUDownloadControlCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HUDownloadControlCell;
  v4 = [(HUDownloadControlCell *)&v9 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(HUDownloadControl);
    [(HUDownloadControlCell *)v4 setDownloadControl:v5];

    v6 = [(HUDownloadControlCell *)v4 downloadControl];
    objc_msgSend(v6, "setControlStatus:animated:", 1, 0x3FF0000000000000, 0);

    v7 = [(HUDownloadControlCell *)v4 downloadControl];
    [(HUDownloadControlCell *)v4 setAccessoryView:v7];
  }
  return v4;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HUDownloadControlCell *)self item];
  id v38 = [v5 latestResults];

  v6 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v7 = [(HUDownloadControlCell *)self textLabel];
  [v7 setText:v6];

  v8 = [MEMORY[0x1E4F428B8] labelColor];
  objc_super v9 = [(HUDownloadControlCell *)self textLabel];
  [v9 setTextColor:v8];

  v10 = [(HUDownloadControlCell *)self textLabel];
  [v10 setNumberOfLines:0];

  uint64_t v11 = *MEMORY[0x1E4F68980];
  v12 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  if (v12)
  {
    v13 = [v38 objectForKeyedSubscript:v11];
    v14 = [(HUDownloadControlCell *)self detailTextLabel];
    [v14 setText:v13];

    v15 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v16 = [(HUDownloadControlCell *)self detailTextLabel];
    [v16 setTextColor:v15];

    v17 = [(HUDownloadControlCell *)self detailTextLabel];
    [v17 setNumberOfLines:0];
  }
  else
  {
    v17 = [(HUDownloadControlCell *)self detailTextLabel];
    [v17 setText:0];
  }

  v18 = [(HUDownloadControlCell *)self downloadControl];
  v19 = [v18 titleForControlStatusType:1];

  v20 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
  if (([v19 isEqualToString:v20] & 1) == 0)
  {
    v21 = [(HUDownloadControlCell *)self downloadControl];
    [v21 setTitle:v20 forControlStatusType:1];

    v22 = [(HUDownloadControlCell *)self downloadControl];
    [v22 sizeToFit];
  }
  v23 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
  int v24 = [v23 BOOLValue];

  if (v24)
  {
    v25 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68C60]];
    v26 = v25;
    if (v25)
    {
      [v25 floatValue];
      double v28 = v27;
      uint64_t v29 = 4;
    }
    else
    {
      double v28 = 1.0;
      uint64_t v29 = 3;
    }
  }
  else
  {
    double v28 = 1.0;
    uint64_t v29 = 1;
  }
  v30 = [(HUDownloadControlCell *)self downloadControl];
  objc_msgSend(v30, "setControlStatus:animated:", v29, *(void *)&v28, v3);

  BOOL v31 = v29 == 1;
  v32 = [(HUDownloadControlCell *)self downloadControl];
  [v32 setEnabled:v31];

  v33 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  LODWORD(v32) = [v33 BOOLValue];

  if (v32)
  {
    v34 = [(HUDownloadControlCell *)self downloadControl];
    [v34 setEnabled:0];
  }
  v35 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68958]];
  uint64_t v36 = [v35 BOOLValue];
  v37 = [(HUDownloadControlCell *)self downloadControl];
  [v37 setHidden:v36];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HUDownloadControlCell;
  [(HUDownloadControlCell *)&v14 layoutSubviews];
  BOOL v3 = [(HUDownloadControlCell *)self downloadControl];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  v10 = [(HUDownloadControlCell *)self downloadControl];
  [v10 intrinsicContentSize];
  double v12 = v11;

  v13 = [(HUDownloadControlCell *)self downloadControl];
  objc_msgSend(v13, "setFrame:", v5, v7, v12, v9);
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  double v4 = [(HUDownloadControlCell *)self textLabel];
  double v5 = [v4 text];
  [v3 appendString:v5 withName:@"text"];

  double v6 = [v3 build];

  return (NSString *)v6;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUDownloadControl)downloadControl
{
  return self->_downloadControl;
}

- (void)setDownloadControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadControl, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end