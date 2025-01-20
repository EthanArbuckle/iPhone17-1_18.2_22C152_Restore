@interface TSDeviceInfoCell
- (TSDeviceInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation TSDeviceInfoCell

- (TSDeviceInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TSDeviceInfoCell;
  v4 = [(TSDeviceInfoCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(TSDeviceInfoCell *)v4 contentView];
    v7 = +[UIColor systemBackgroundColor];
    [v6 setBackgroundColor:v7];

    v8 = [(TSDeviceInfoCell *)v5 contentView];
    v9 = [(TSDeviceInfoCell *)v5 imageView];
    [v8 addSubview:v9];
  }
  return v5;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TSDeviceInfoCell;
  [(TSDeviceInfoCell *)&v8 layoutSubviews];
  v3 = [(TSDeviceInfoCell *)self imageView];
  v4 = [(TSDeviceInfoCell *)self contentView];
  [v4 bounds];
  double v6 = v5 * 0.5;
  v7 = [(TSDeviceInfoCell *)self imageView];
  [v7 center];
  [v3 setCenter:v6];
}

@end