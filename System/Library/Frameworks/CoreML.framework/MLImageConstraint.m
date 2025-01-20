@interface MLImageConstraint
+ (BOOL)supportsSecureCoding;
+ (MLImageConstraint)constraintWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5;
+ (MLImageConstraint)constraintWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5 sizeConstraint:(id)a6;
+ (id)stringForImagePixelType:(unint64_t)a3;
+ (id)stringForPixelFormatType:(unsigned int)a3;
+ (unint64_t)imagePixelTypeFromOSType:(unsigned int)a3;
- (BOOL)allowsPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)isAllowedValue:(id)a3 error:(id *)a4;
- (MLImageConstraint)initWithCoder:(id)a3;
- (MLImageConstraint)initWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5 sizeConstraint:(id)a6;
- (MLImageSizeConstraint)sizeConstraint;
- (NSInteger)pixelsHigh;
- (NSInteger)pixelsWide;
- (OSType)pixelFormatType;
- (id)_stringForAllowedOSTypes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)pixelType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLImageConstraint

- (void).cxx_destruct
{
}

- (unint64_t)pixelType
{
  return self->_pixelType;
}

- (MLImageSizeConstraint)sizeConstraint
{
  return self->_sizeConstraint;
}

- (NSInteger)pixelsWide
{
  return self->_pixelsWide;
}

- (NSInteger)pixelsHigh
{
  return self->_pixelsHigh;
}

- (MLImageConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MLImageConstraint;
  v5 = [(MLImageConstraint *)&v10 init];
  if (v5)
  {
    v5->_pixelsWide = [v4 decodeIntegerForKey:@"pixelsWide"];
    v5->_pixelsHigh = [v4 decodeIntegerForKey:@"pixelsHigh"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelType"];
    v5->_pixelType = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sizeConstraint"];
    sizeConstraint = v5->_sizeConstraint;
    v5->_sizeConstraint = (MLImageSizeConstraint *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageConstraint pixelsWide](self, "pixelsWide"), @"pixelsWide");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageConstraint pixelsHigh](self, "pixelsHigh"), @"pixelsHigh");
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLImageConstraint pixelType](self, "pixelType"));
  [v4 encodeObject:v5 forKey:@"pixelType"];

  id v6 = [(MLImageConstraint *)self sizeConstraint];
  [v4 encodeObject:v6 forKey:@"sizeConstraint"];
}

- (id)description
{
  v3 = NSString;
  if ([(MLImageConstraint *)self pixelType] == 10) {
    id v4 = @"Grayscale";
  }
  else {
    id v4 = @"Color";
  }
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[MLImageConstraint pixelsWide](self, "pixelsWide"));
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[MLImageConstraint pixelsHigh](self, "pixelsHigh"));
  uint64_t v7 = [v3 stringWithFormat:@"%@, %@ x %@", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[MLImageConstraint allocWithZone:a3];
  int64_t pixelsHigh = self->_pixelsHigh;
  int64_t pixelsWide = self->_pixelsWide;
  sizeConstraint = self->_sizeConstraint;
  unint64_t pixelType = self->_pixelType;

  return [(MLImageConstraint *)v4 initWithPixelsWide:pixelsWide pixelsHigh:pixelsHigh pixelType:pixelType sizeConstraint:sizeConstraint];
}

- (BOOL)allowsPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v8 = PixelFormatType;
  unint64_t pixelType = self->_pixelType;
  if (pixelType == 10)
  {
    int v10 = 1278226488;
  }
  else if (pixelType == 40)
  {
    int v10 = 1278226536;
  }
  else
  {
    if (PixelFormatType == 32) {
      goto LABEL_8;
    }
    int v10 = 1111970369;
  }
  if (PixelFormatType != v10)
  {
    if (a4)
    {
      v15 = [(MLImageConstraint *)self _stringForAllowedOSTypes];
      v16 = [(id)objc_opt_class() stringForPixelFormatType:v8];
      *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Image is not expected type %@, instead is %@", v15, v16];
    }
    return 0;
  }
LABEL_8:
  if (self->_sizeConstraint)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    v12 = [[MLImageSize alloc] initWithPixelsWide:Width pixelsHigh:CVPixelBufferGetHeight(a3)];
    BOOL v13 = [(MLImageSizeConstraint *)self->_sizeConstraint isAllowedImageSize:v12 error:a4];

    return v13;
  }
  if (a4)
  {
    *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Image constraint doesn't have size constraint"];
  }
  return 0;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 isUndefined] & 1) != 0 || !objc_msgSend(v6, "imageBufferValue"))
  {
    if (a4)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"Image constraint can not accept missing values."];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = -[MLImageConstraint allowsPixelBuffer:error:](self, "allowsPixelBuffer:error:", [v6 imageBufferValue], a4);
  }

  return v7;
}

- (id)_stringForAllowedOSTypes
{
  unint64_t pixelType = self->_pixelType;
  v3 = @"32BGRA or 32ARGB";
  if (pixelType == 40) {
    v3 = @"OneComponent16Half";
  }
  if (pixelType == 10) {
    return @"OneComponent8";
  }
  else {
    return v3;
  }
}

- (OSType)pixelFormatType
{
  unint64_t pixelType = self->_pixelType;
  if (pixelType == 40) {
    OSType v3 = 1278226536;
  }
  else {
    OSType v3 = 1111970369;
  }
  if (pixelType == 10) {
    return 1278226488;
  }
  else {
    return v3;
  }
}

- (MLImageConstraint)initWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5 sizeConstraint:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MLImageConstraint;
  v12 = [(MLImageConstraint *)&v15 init];
  BOOL v13 = v12;
  if (v12)
  {
    v12->_int64_t pixelsHigh = a4;
    v12->_int64_t pixelsWide = a3;
    v12->_unint64_t pixelType = a5;
    objc_storeStrong((id *)&v12->_sizeConstraint, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)imagePixelTypeFromOSType:(unsigned int)a3
{
  if ((int)a3 > 1278226487)
  {
    if (a3 != 1278226488)
    {
      if (a3 == 1278226536) {
        return 40;
      }
      return 0;
    }
    return 10;
  }
  else
  {
    if (a3 != 32)
    {
      if (a3 == 1111970369) {
        return 30;
      }
      return 0;
    }
    return 20;
  }
}

+ (id)stringForImagePixelType:(unint64_t)a3
{
  OSType v3 = @"Unknown";
  id v4 = @"RGB8";
  v5 = @"BGR8";
  id v6 = @"Gray16Half";
  if (a3 != 40) {
    id v6 = @"Unknown";
  }
  if (a3 != 30) {
    v5 = v6;
  }
  if (a3 != 20) {
    id v4 = v5;
  }
  if (a3 == 10) {
    OSType v3 = @"Gray8";
  }
  if (!a3) {
    OSType v3 = @"Invalid";
  }
  if ((uint64_t)a3 <= 19) {
    return v3;
  }
  else {
    return v4;
  }
}

+ (id)stringForPixelFormatType:(unsigned int)a3
{
  if ((int)a3 <= 1111970368)
  {
    if ((int)a3 > 842285638)
    {
      if (a3 == 842285639)
      {
        OSType v3 = @"24BGRA";
        goto LABEL_23;
      }
      if (a3 == 875704438)
      {
        OSType v3 = @"420v";
        goto LABEL_23;
      }
    }
    else
    {
      if (a3 == 24)
      {
        OSType v3 = @"24RGB";
        goto LABEL_23;
      }
      if (a3 == 32)
      {
        OSType v3 = @"32ARGB";
        goto LABEL_23;
      }
    }
  }
  else if ((int)a3 <= 1278226535)
  {
    if (a3 == 1111970369)
    {
      OSType v3 = @"32BGRA";
      goto LABEL_23;
    }
    if (a3 == 1278226488)
    {
      OSType v3 = @"OneComponent8";
      goto LABEL_23;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x4C303068u:
        OSType v3 = @"OneComponent16Half";
        goto LABEL_23;
      case 0x52474241u:
        OSType v3 = @"32RGBA";
        goto LABEL_23;
      case 0x62363461u:
        OSType v3 = @"64ARGB";
        goto LABEL_23;
    }
  }
  id v4 = NSString;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  OSType v3 = [v4 stringWithFormat:@"Unsupported (%@)", v5];

LABEL_23:

  return v3;
}

+ (MLImageConstraint)constraintWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v9 = [[MLImageSize alloc] initWithPixelsWide:a3 pixelsHigh:a4];
  int v10 = [MLImageSizeConstraint alloc];
  v15[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v12 = [(MLImageSizeConstraint *)v10 initWithEnumeratedImageSizes:v11];
  BOOL v13 = [a1 constraintWithPixelsWide:a3 pixelsHigh:a4 pixelType:a5 sizeConstraint:v12];

  return (MLImageConstraint *)v13;
}

+ (MLImageConstraint)constraintWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5 sizeConstraint:(id)a6
{
  id v10 = a6;
  id v11 = (void *)[objc_alloc((Class)a1) initWithPixelsWide:a3 pixelsHigh:a4 pixelType:a5 sizeConstraint:v10];

  return (MLImageConstraint *)v11;
}

@end