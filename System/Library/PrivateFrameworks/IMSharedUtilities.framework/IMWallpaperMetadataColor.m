@interface IMWallpaperMetadataColor
+ (BOOL)supportsSecureCoding;
- (IMWallpaperMetadataColor)initWithCoder:(id)a3;
- (IMWallpaperMetadataColor)initWithDictionaryRepresentation:(id)a3;
- (IMWallpaperMetadataColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMWallpaperMetadataColor

- (IMWallpaperMetadataColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)IMWallpaperMetadataColor;
  v10 = [(IMWallpaperMetadataColor *)&v14 init];
  if (v10)
  {
    v11 = [[IMWallpaperMetadataColor_Impl alloc] initWithRed:a3 green:a4 blue:a5 alpha:a6];
    swiftImpl = v10->swiftImpl;
    v10->swiftImpl = v11;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
}

- (IMWallpaperMetadataColor)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadataColor;
  v5 = [(IMWallpaperMetadataColor *)&v9 init];
  if (v5)
  {
    v6 = [[IMWallpaperMetadataColor_Impl alloc] initWithDictionaryRepresentation:v4];
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;
  }
  return v5;
}

- (IMWallpaperMetadataColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadataColor;
  v5 = [(IMWallpaperMetadataColor *)&v9 init];
  if (v5)
  {
    v6 = [[IMWallpaperMetadataColor_Impl alloc] initWithCoder:v4];
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  return [(IMWallpaperMetadataColor_Impl *)self->swiftImpl dictionaryRepresentation];
}

- (void).cxx_destruct
{
}

@end