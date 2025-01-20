@interface DSDictionaryTableCell
+ (int64_t)cellStyle;
- (DSDictionaryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (DSDownloadProgressButton)downloadButton;
- (DUDefinitionDictionary)definitionDictionary;
- (id)subtitle;
- (id)title;
- (void)handleDownloadButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)reloadData;
- (void)reloadDataWithAssetOperationState:(id)a3;
- (void)setDefinitionDictionary:(id)a3;
- (void)setDownloadButton:(id)a3;
- (void)updateLabels;
@end

@implementation DSDictionaryTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (DSDictionaryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DSDictionaryTableCell;
  v9 = [(DSDictionaryTableCell *)&v21 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:PSValueKey];
    [(DSDictionaryTableCell *)v9 setDefinitionDictionary:v10];

    v11 = [[DSDownloadProgressButton alloc] initWithStyle:1];
    [(DSDictionaryTableCell *)v9 setDownloadButton:v11];
    [(DSDownloadProgressButton *)v11 setProgressType:3];
    v12 = [(DSDictionaryTableCell *)v9 contentView];
    [v12 bounds];
    double MaxX = CGRectGetMaxX(v22);
    [(DSDownloadProgressButton *)v11 frame];
    double v14 = MaxX - CGRectGetWidth(v23) + -20.0;
    v15 = [(DSDictionaryTableCell *)v9 contentView];
    [v15 bounds];
    CGFloat v16 = CGRectGetHeight(v24) * 0.5;
    [(DSDownloadProgressButton *)v11 frame];
    CGFloat v17 = v16 - CGRectGetHeight(v25) * 0.5;
    [(DSDownloadProgressButton *)v11 frame];
    double Width = CGRectGetWidth(v26);
    [(DSDownloadProgressButton *)v11 frame];
    -[DSDownloadProgressButton setFrame:](v11, "setFrame:", v14, v17, Width, CGRectGetHeight(v27));

    v19 = +[UIColor systemBlueColor];
    [(DSDownloadProgressButton *)v11 setTintColor:v19];

    [(DSDownloadProgressButton *)v11 addTarget:v9 action:"handleDownloadButtonPressed:" forEvents:64];
    -[DSDictionaryTableCell setSeparatorInset:](v9, "setSeparatorInset:", 0.0, 44.0, 0.0, 0.0);
    [(DSDictionaryTableCell *)v9 updateLabels];
    [(DSDictionaryTableCell *)v9 reloadData];
  }
  return v9;
}

- (void)handleDownloadButtonPressed:(id)a3
{
  id v3 = [(DSDictionaryTableCell *)self specifier];
  [v3 performButtonAction];
}

- (void)updateLabels
{
  id v3 = [(DSDictionaryTableCell *)self title];
  v4 = [(DSDictionaryTableCell *)self textLabel];
  [v4 setText:v3];

  id v6 = [(DSDictionaryTableCell *)self subtitle];
  v5 = [(DSDictionaryTableCell *)self detailTextLabel];
  [v5 setText:v6];
}

- (id)title
{
  id v3 = [(DSDictionaryTableCell *)self definitionDictionary];
  if ([v3 isAppleDictionary])
  {

LABEL_4:
    id v6 = [(DSDictionaryTableCell *)self definitionDictionary];
    uint64_t v7 = [v6 localizedDictionaryName];
    goto LABEL_6;
  }
  v4 = [(DSDictionaryTableCell *)self definitionDictionary];
  unsigned int v5 = [v4 isTTYDictionary];

  if (v5) {
    goto LABEL_4;
  }
  id v6 = [(DSDictionaryTableCell *)self definitionDictionary];
  uint64_t v7 = [v6 localizedLanguageName];
LABEL_6:
  id v8 = (void *)v7;

  return v8;
}

- (id)subtitle
{
  id v3 = [(DSDictionaryTableCell *)self definitionDictionary];
  if ([v3 isAppleDictionary])
  {
    v4 = 0;
  }
  else
  {
    unsigned int v5 = [(DSDictionaryTableCell *)self definitionDictionary];
    unsigned __int8 v6 = [v5 isTTYDictionary];

    if (v6)
    {
      v4 = 0;
      goto LABEL_7;
    }
    id v3 = [(DSDictionaryTableCell *)self definitionDictionary];
    v4 = [v3 localizedDictionaryName];
  }

LABEL_7:

  return v4;
}

- (void)reloadData
{
}

- (void)reloadDataWithAssetOperationState:(id)a3
{
  id v4 = a3;
  id v19 = [(DSDictionaryTableCell *)self downloadButton];
  unsigned int v5 = [(DSDictionaryTableCell *)self definitionDictionary];
  unsigned __int8 v6 = [v4 objectForKeyedSubscript:@"MAProgressNotification"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"completed"];

  unsigned int v8 = [v7 BOOLValue];
  v9 = [v5 rawAsset];
  v10 = (int *)[v9 state];
  uint64_t v11 = [v5 activated] ^ 1;
  v12 = [(DSDictionaryTableCell *)self imageView];
  [v12 setHidden:v11];

  if (v8)
  {
    [v19 setProgressType:4];
LABEL_7:
    [(DSDictionaryTableCell *)self setAccessoryView:0];
    double v13 = 0.0;
LABEL_8:
    double v14 = v19;
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  if (v10 != &dword_4) {
    goto LABEL_7;
  }
  [v19 setProgressType:3];
  [(DSDictionaryTableCell *)self setAccessoryView:v19];
  if (!v6)
  {
    [v5 progress];
    double v13 = v16;
    goto LABEL_8;
  }
  if ([v6 isStalled])
  {
    [v19 setProgressType:2];
    goto LABEL_10;
  }
  float v17 = (float)(uint64_t)[v6 totalWritten];
  double v18 = (float)(v17 / (float)(uint64_t)[v6 totalExpected]);
  [v19 setProgressType:3];
  double v14 = v19;
  double v13 = v18;
  uint64_t v15 = 1;
LABEL_9:
  [v14 setProgress:v15 animated:v13];
LABEL_10:
}

- (void)layoutSubviews
{
  id v3 = [(DSDictionaryTableCell *)self _checkmarkImage:0];
  id v4 = [(DSDictionaryTableCell *)self imageView];
  [v4 setImage:v3];

  unsigned int v5 = [(DSDictionaryTableCell *)self _checkmarkImage:1];
  unsigned __int8 v6 = [(DSDictionaryTableCell *)self imageView];
  [v6 setHighlightedImage:v5];

  uint64_t v7 = [(DSDictionaryTableCell *)self imageView];
  [v7 sizeToFit];

  v8.receiver = self;
  v8.super_class = (Class)DSDictionaryTableCell;
  [(DSDictionaryTableCell *)&v8 layoutSubviews];
}

- (DUDefinitionDictionary)definitionDictionary
{
  return self->_definitionDictionary;
}

- (void)setDefinitionDictionary:(id)a3
{
}

- (DSDownloadProgressButton)downloadButton
{
  return self->_downloadButton;
}

- (void)setDownloadButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadButton, 0);

  objc_storeStrong((id *)&self->_definitionDictionary, 0);
}

@end