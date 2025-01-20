@interface HUTitleControlCell
- (HUControlView)controlView;
- (HUTitleControlCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)controlTitle;
- (id)allControlViews;
- (void)prepareForReuse;
- (void)setControlTitle:(id)a3;
- (void)setControlView:(id)a3;
@end

@implementation HUTitleControlCell

- (HUTitleControlCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUTitleControlCell;
  v4 = [(HUTitleControlCell *)&v7 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(HUTitleControlCell *)v4 setSelectionStyle:0];
  }
  return v5;
}

- (id)allControlViews
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUTitleControlCell *)self controlView];
  v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (HUControlView)controlView
{
  v2 = [(HUTitleControlCell *)self accessoryView];
  v3 = &unk_1F1A09EF8;
  id v4 = v2;
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:v3]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    objc_super v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v10 = NSStringFromProtocol((Protocol *)v3);
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v10 file lineNumber description];
  }
  objc_super v7 = 0;
LABEL_8:

  return (HUControlView *)v7;
}

- (void)setControlView:(id)a3
{
  id v4 = a3;
  [v4 sizeToFit];
  [(HUTitleControlCell *)self setAccessoryView:v4];
}

- (NSString)controlTitle
{
  v2 = [(HUTitleControlCell *)self textLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setControlTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTitleControlCell *)self textLabel];
  [v5 setText:v4];
}

- (void)prepareForReuse
{
  [(HUTitleControlCell *)self setControlView:0];
  [(HUTitleControlCell *)self setControlTitle:0];
  v3.receiver = self;
  v3.super_class = (Class)HUTitleControlCell;
  [(HUTitleControlCell *)&v3 prepareForReuse];
}

@end