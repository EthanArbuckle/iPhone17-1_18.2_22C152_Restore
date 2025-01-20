@interface MCLLabel
- (void)layoutSubviews;
@end

@implementation MCLLabel

- (void)layoutSubviews
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)MCLLabel;
  objc_msgSendSuper2(&v11, (SEL)0x1F6C43698);
  [(MCLLabel *)v13 frame];
  uint64_t v7 = v2;
  uint64_t v8 = v3;
  double v9 = v4;
  uint64_t v10 = v5;
  [(MCLLabel *)v13 setPreferredMaxLayoutWidth:v4];
  v6.receiver = v13;
  v6.super_class = (Class)MCLLabel;
  objc_msgSendSuper2(&v6, (SEL)0x1F6C43698);
}

@end