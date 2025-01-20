@interface HRAccountTableViewCell
+ (NSString)reuseIdentifier;
- (HRAccountTableViewCell)initWithCoder:(id)a3;
- (HRAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureIgnoreActionWithAccount:(id)a3 dataProvider:(id)a4;
- (void)configureWithAccount:(id)a3 dataProvider:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HRAccountTableViewCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HRAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1C254F470();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (HRAccountTableViewCell *)sub_1C23DDA00(v4, v5);
}

- (HRAccountTableViewCell)initWithCoder:(id)a3
{
  return (HRAccountTableViewCell *)sub_1C23DCF64(a3);
}

- (void)configureWithAccount:(id)a3 dataProvider:(id)a4
{
}

- (void)configureIgnoreActionWithAccount:(id)a3 dataProvider:(id)a4
{
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountTableViewCell();
  v2 = (char *)v3.receiver;
  [(HRAccountTableViewCell *)&v3 prepareForReuse];
  objc_msgSend(*(id *)&v2[OBJC_IVAR___HRAccountTableViewCell_brandView], sel_setBrandable_dataProvider_, 0, 0, v3.receiver, v3.super_class);
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for AccountTableViewCell();
  v2 = (char *)v16.receiver;
  [(HRAccountTableViewCell *)&v16 layoutSubviews];
  objc_super v3 = *(void **)&v2[OBJC_IVAR___HRAccountTableViewCell_brandView];
  id v4 = objc_msgSend(v3, sel_brandTitleLabel, v16.receiver, v16.super_class);
  objc_msgSend(v4, sel_bounds);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_msgSend(v3, sel_brandTitleLabel);
  objc_msgSend(v2, sel_convertRect_fromCoordinateSpace_, v13, v6, v8, v10, v12);
  double v15 = v14;

  objc_msgSend(v2, sel_setSeparatorInset_, 0.0, v15, 0.0, 0.0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTableViewCell_brandView));
}

@end