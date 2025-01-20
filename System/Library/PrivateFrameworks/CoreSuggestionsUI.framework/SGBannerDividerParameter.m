@interface SGBannerDividerParameter
- (SGBannerDividerParameter)initWithPosition:(int)a3 color:(id)a4;
- (id)color;
- (int)position;
@end

@implementation SGBannerDividerParameter

- (void).cxx_destruct
{
}

- (id)color
{
  return self->_color;
}

- (int)position
{
  return self->_position;
}

- (SGBannerDividerParameter)initWithPosition:(int)a3 color:(id)a4
{
  id v6 = a4;
  v7 = [(SGBannerDividerParameter *)self init];
  v8 = v7;
  if (v7)
  {
    v7->_position = a3;
    if (v6)
    {
      v9 = (UIColor *)v6;
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] blackColor];
    }
    color = v8->_color;
    v8->_color = v9;
  }
  return v8;
}

@end