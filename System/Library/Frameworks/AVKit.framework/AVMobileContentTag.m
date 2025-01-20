@interface AVMobileContentTag
+ (id)_liveContentTagWithTintColor:(id)a3 withTextColor:(id)a4;
+ (id)adContentTag;
+ (id)adContentTagWithTintColor:(id)a3;
+ (id)liveContentTag;
+ (id)liveEdgeContentTag;
- (NSString)title;
- (UIColor)labelTextColor;
- (UIColor)tintColor;
- (UIEdgeInsets)layoutMargins;
- (float)normalizedCornerRadius;
- (id)_initInternal;
- (unint64_t)placement;
@end

@implementation AVMobileContentTag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)placement
{
  return self->_placement;
}

- (float)normalizedCornerRadius
{
  return self->_normalizedCornerRadius;
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSString)title
{
  return self->_title;
}

- (id)_initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileContentTag;
  return [(AVMobileContentTag *)&v3 init];
}

+ (id)_liveContentTagWithTintColor:(id)a3 withTextColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[AVMobileContentTag alloc] _initInternal];
  uint64_t v8 = AVLocalizedString(@"LIVE");
  v9 = (void *)v7[2];
  v7[2] = v8;

  v10 = (void *)v7[3];
  v7[3] = v5;
  id v11 = v5;

  v12 = (void *)v7[4];
  v7[4] = v6;

  v7[5] = 0;
  *((_DWORD *)v7 + 2) = 1056964608;
  *((_OWORD *)v7 + 3) = xmmword_1B0721240;
  *((_OWORD *)v7 + 4) = xmmword_1B0721240;

  return v7;
}

+ (id)liveEdgeContentTag
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4FB1618], "avkit_liveContentAccessoryViewColor");
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  id v5 = [a1 _liveContentTagWithTintColor:v3 withTextColor:v4];

  return v5;
}

+ (id)liveContentTag
{
  objc_super v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.37109375 green:0.37109375 blue:0.37109375 alpha:1.0];
  v4 = [MEMORY[0x1E4FB1618] lightGrayColor];
  id v5 = [a1 _liveContentTagWithTintColor:v3 withTextColor:v4];

  return v5;
}

+ (id)adContentTagWithTintColor:(id)a3
{
  id v3 = a3;
  v4 = [[AVMobileContentTag alloc] _initInternal];
  uint64_t v5 = AVLocalizedString(@"Ad");
  id v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = (void *)v4[3];
  v4[3] = v3;
  id v8 = v3;

  uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
  v10 = (void *)v4[4];
  v4[4] = v9;

  v4[5] = 1;
  *((_DWORD *)v4 + 2) = 1048576000;
  *((_OWORD *)v4 + 3) = xmmword_1B0721250;
  *((_OWORD *)v4 + 4) = xmmword_1B0721250;

  return v4;
}

+ (id)adContentTag
{
  id v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.44140625 green:0.734375 blue:0.91796875 alpha:1.0];
  v4 = [a1 adContentTagWithTintColor:v3];

  return v4;
}

@end