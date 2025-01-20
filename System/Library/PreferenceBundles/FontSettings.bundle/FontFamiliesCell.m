@interface FontFamiliesCell
- (FontFamiliesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation FontFamiliesCell

- (FontFamiliesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FontFamiliesCell;
  v9 = [(FontFamiliesCell *)&v15 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 userInfo];
    v11 = [v10 objectForKey:@"family"];

    v12 = [v11 familyName];
    v13 = [(FontFamiliesCell *)v9 textLabel];
    [v13 setText:v12];

    if ([v11 isProcessing])
    {
      [(FontFamiliesCell *)v9 setActivityAccessoryView];
    }
    else if ([v11 isDownloadable])
    {
      sub_692C(v9, v11);
    }
  }
  return v9;
}

@end