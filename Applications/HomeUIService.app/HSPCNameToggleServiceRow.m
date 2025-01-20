@interface HSPCNameToggleServiceRow
+ (id)_reuseIdentifier;
- (HSPCNameToggleServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setFrozen:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HSPCNameToggleServiceRow

+ (id)_reuseIdentifier
{
  return @"HSPCNameToggleServiceRow";
}

- (HSPCNameToggleServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HSPCNameToggleServiceRow;
  v4 = [(HSPCNameServiceRow *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HSPCRow *)v4 leftView];

    if (v6)
    {
      v7 = [(HSPCRow *)v5 leftView];
      [v7 removeFromSuperview];
    }
    id v8 = objc_alloc((Class)UIImageView);
    v9 = +[UIImage systemImageNamed:@"circle"];
    id v10 = [v8 initWithImage:v9 highlightedImage:0];

    [v10 setUserInteractionEnabled:1];
    v11 = [(HSPCNameToggleServiceRow *)v5 contentView];
    [v11 addSubview:v10];

    [(HSPCRow *)v5 setLeftView:v10];
  }
  return v5;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HSPCNameToggleServiceRow;
  -[HSPCNameToggleServiceRow setSelected:](&v11, "setSelected:");
  objc_opt_class();
  v5 = [(HSPCRow *)self leftView];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v3)
  {
    id v8 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
    [v7 setImage:v8];

    +[UIColor hf_keyColor];
  }
  else
  {
    v9 = +[UIImage systemImageNamed:@"circle"];
    [v7 setImage:v9];

    +[UIColor secondaryLabelColor];
  id v10 = };
  [v7 setTintColor:v10];
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HSPCRow *)self leftView];
  [v4 setHidden:v3];
}

@end