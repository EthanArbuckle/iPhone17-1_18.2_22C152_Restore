@interface FontFamiliesSearchCell
+ (id)currentSearchStringMatcher;
+ (int64_t)cellStyle;
+ (void)setSearchStringMatcher:(id)a3;
- (FontFamiliesSearchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)highlight:(id)a3 withMatcher:(id)a4;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateTitlesForSearchPattern:(id)a3;
@end

@implementation FontFamiliesSearchCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (void)setSearchStringMatcher:(id)a3
{
}

+ (id)currentSearchStringMatcher
{
  return (id)qword_24818;
}

- (FontFamiliesSearchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FontFamiliesSearchCell;
  v9 = [(FontFamiliesSearchCell *)&v17 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 userInfo];
    v11 = [v10 objectForKey:@"family"];

    v12 = [v11 familyName];
    v13 = [(FontFamiliesSearchCell *)v9 textLabel];
    [v13 setText:v12];

    if ([v11 isProcessing])
    {
      [(FontFamiliesSearchCell *)v9 setActivityAccessoryView];
    }
    else if ([v11 isDownloadable])
    {
      sub_692C(v9, v11);
    }
    v14 = [v11 providerLocalizedName];
    v15 = [(FontFamiliesSearchCell *)v9 detailTextLabel];
    [v15 setText:v14];
  }
  return v9;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FontFamiliesSearchCell;
  [(FontFamiliesSearchCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(FontFamiliesSearchCell *)self updateTitlesForSearchPattern:qword_24818];
}

- (void)highlight:(id)a3 withMatcher:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = a4;
    v7 = [v5 string];
    id v8 = +[UIColor tableCellGrayTextColor];
    objc_msgSend(v5, "addAttribute:value:range:", NSForegroundColorAttributeName, v8, 0, objc_msgSend(v7, "length"));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6CBC;
    v9[3] = &unk_1C880;
    id v10 = v5;
    [v6 enumerateRangesMatchingPattern:v7 matchingType:0 withBlock:v9];
  }
}

- (void)updateTitlesForSearchPattern:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(FontFamiliesSearchCell *)self layoutManager];
    id v6 = [v5 defaultTextLabelFontForCell:self];

    id v7 = objc_alloc((Class)NSMutableAttributedString);
    id v8 = [(FontFamiliesSearchCell *)self textLabel];
    uint64_t v9 = [v8 text];
    id v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = &stru_1CDF0;
    }
    NSAttributedStringKey v29 = NSFontAttributeName;
    v30 = v6;
    v12 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v13 = [v7 initWithString:v11 attributes:v12];

    [(FontFamiliesSearchCell *)self highlight:v13 withMatcher:v4];
    v14 = [(FontFamiliesSearchCell *)self textLabel];
    [v14 setAttributedText:v13];

    v15 = [(FontFamiliesSearchCell *)self layoutManager];
    v16 = [v15 defaultDetailTextLabelFontForCell:self];

    id v17 = objc_alloc((Class)NSMutableAttributedString);
    v18 = [(FontFamiliesSearchCell *)self detailTextLabel];
    uint64_t v19 = [v18 text];
    v20 = (void *)v19;
    if (v19) {
      CFStringRef v21 = (const __CFString *)v19;
    }
    else {
      CFStringRef v21 = &stru_1CDF0;
    }
    NSAttributedStringKey v27 = NSFontAttributeName;
    v28 = v16;
    v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v23 = [v17 initWithString:v21 attributes:v22];

    [(FontFamiliesSearchCell *)self highlight:v23 withMatcher:v4];
    v24 = [(FontFamiliesSearchCell *)self detailTextLabel];
    [v24 setAttributedText:v23];
  }
  else
  {
    v25 = [(FontFamiliesSearchCell *)self textLabel];
    [v25 setAttributedText:0];

    v26 = [(FontFamiliesSearchCell *)self detailTextLabel];
    [v26 setAttributedText:0];
  }
}

@end