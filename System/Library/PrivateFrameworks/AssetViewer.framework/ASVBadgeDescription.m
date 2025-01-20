@interface ASVBadgeDescription
+ (id)descriptionForSize:(CGSize)a3;
- (ASVBadgeDescription)initWithSizeClass:(unint64_t)a3;
- (CGPoint)badgeOffset;
- (CGSize)badgeSize;
- (UIImage)badgeImage;
- (double)shadowSize;
- (unint64_t)badgeSizeClass;
@end

@implementation ASVBadgeDescription

+ (id)descriptionForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [ASVBadgeDescription alloc];
  if (width >= height) {
    double v6 = height;
  }
  else {
    double v6 = width;
  }
  v7 = [(ASVBadgeDescription *)v5 initWithSizeClass:v6 >= 280.0];
  return v7;
}

- (ASVBadgeDescription)initWithSizeClass:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ASVBadgeDescription;
  v4 = [(ASVBadgeDescription *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_badgeSizeClass = a3;
    if (a3 == 1)
    {
      v13 = (void *)MEMORY[0x1E4FB1818];
      v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AssetViewer"];
      uint64_t v14 = [v13 imageNamed:@"Badge-Large" inBundle:v7];
      badgeImage = v5->_badgeImage;
      v5->_badgeImage = (UIImage *)v14;
      double v12 = 20.0;
      double v10 = 16.0;
      uint64_t v11 = 0x4051800000000000;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        v15 = v5;
        goto LABEL_8;
      }
      double v6 = (void *)MEMORY[0x1E4FB1818];
      v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AssetViewer"];
      uint64_t v8 = [v6 imageNamed:@"Badge-Small" inBundle:v7];
      badgeImage = v5->_badgeImage;
      v5->_badgeImage = (UIImage *)v8;
      double v10 = 8.0;
      uint64_t v11 = 0x4041800000000000;
      double v12 = 8.0;
    }

    v5->_shadowSize = v10;
    *(void *)&v5->_badgeSize.double width = v11;
    *(void *)&v5->_badgeSize.double height = v11;
    v5->_badgeOffset.x = v12;
    v5->_badgeOffset.y = v12;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (CGSize)badgeSize
{
  objc_copyStruct(v4, &self->_badgeSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)shadowSize
{
  return self->_shadowSize;
}

- (CGPoint)badgeOffset
{
  objc_copyStruct(v4, &self->_badgeOffset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (unint64_t)badgeSizeClass
{
  return self->_badgeSizeClass;
}

- (UIImage)badgeImage
{
  return (UIImage *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end