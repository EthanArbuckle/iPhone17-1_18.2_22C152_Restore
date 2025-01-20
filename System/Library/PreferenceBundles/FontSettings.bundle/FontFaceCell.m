@interface FontFaceCell
- (FontFaceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation FontFaceCell

- (FontFaceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FontFaceCell;
  v9 = [(FontFaceCell *)&v13 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 name];
    v11 = [(FontFaceCell *)v9 textLabel];
    [v11 setText:v10];
  }
  return v9;
}

@end