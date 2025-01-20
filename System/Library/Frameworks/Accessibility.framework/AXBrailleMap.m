@interface AXBrailleMap
+ (BOOL)supportsSecureCoding;
+ (id)connectedBrailleMap;
- (AXBrailleMap)initWithCoder:(id)a3;
- (CGSize)dimensions;
- (float)heightAtPoint:(CGPoint)point;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)presentedImage;
- (void)encodeWithCoder:(id)a3;
- (void)presentImage:(CGImageRef)image;
- (void)setDimensions:(CGSize)a3;
- (void)setHeight:(float)status atPoint:(CGPoint)point;
@end

@implementation AXBrailleMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AXBrailleMap allocWithZone:a3] init];
  uint64_t v5 = [(NSMutableDictionary *)self->_values copy];
  values = v4->_values;
  v4->_values = (NSMutableDictionary *)v5;

  uint64_t v7 = [(CIImage *)self->_presentedImage copy];
  presentedImage = v4->_presentedImage;
  v4->_presentedImage = (CIImage *)v7;

  return v4;
}

+ (id)connectedBrailleMap
{
  v2 = [(id)_AXSVoiceOverTouchActive2DBrailleDisplays() lastObject];
  if (v2)
  {
    v3 = objc_opt_new();
    NSSize v4 = NSSizeFromString(v2);
    objc_msgSend(v3, "setDimensions:", v4.width, v4.height);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setHeight:(float)status atPoint:(CGPoint)point
{
  double y = point.y;
  double x = point.x;
  values = self->_values;
  if (!values)
  {
    v9 = (NSMutableDictionary *)objc_opt_new();
    v10 = self->_values;
    self->_values = v9;

    values = self->_values;
  }
  *(float *)&double v11 = status;
  id v15 = [NSNumber numberWithFloat:v11];
  v12 = NSNumber;
  [(AXBrailleMap *)self dimensions];
  v14 = [v12 numberWithDouble:x + y * v13];
  [(NSMutableDictionary *)values setObject:v15 forKey:v14];
}

- (void)presentImage:(CGImageRef)image
{
  if (image)
  {
    self->_presentedImage = (CIImage *)[objc_alloc((Class)getCIImageClass()) initWithCGImage:image];
    MEMORY[0x270F9A758]();
  }
  else
  {
    v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXBrailleMap presentImage:](v3);
    }
  }
}

- (id)presentedImage
{
  return self->_presentedImage;
}

- (float)heightAtPoint:(CGPoint)point
{
  CGFloat y = point.y;
  double x = point.x;
  values = self->_values;
  v6 = NSNumber;
  [(AXBrailleMap *)self dimensions];
  v8 = [v6 numberWithDouble:x + y * v7];
  v9 = [(NSMutableDictionary *)values objectForKey:v8];
  [v9 floatValue];
  LODWORD(y) = v10;

  return *(float *)&y;
}

- (void)encodeWithCoder:(id)a3
{
  values = self->_values;
  id v5 = a3;
  [v5 encodeObject:values forKey:@"values"];
  [v5 encodeObject:self->_presentedImage forKey:@"presentedImage"];
  objc_msgSend(MEMORY[0x263F08D40], "valueWithSize:", self->_dimensions.width, self->_dimensions.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"dimensions"];
}

- (AXBrailleMap)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (AXBrailleMap *)objc_opt_new();
  id v6 = (void *)MEMORY[0x263EFFA08];
  v23[0] = objc_opt_class();
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"dimensions"];
  [v9 sizeValue];
  -[AXBrailleMap setDimensions:](v5, "setDimensions:");

  int v10 = (void *)MEMORY[0x263EFFA08];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v12 = [v10 setWithArray:v11];
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"values"];
  values = v5->_values;
  v5->_values = (NSMutableDictionary *)v13;

  id v15 = (void *)MEMORY[0x263EFFA08];
  id CIImageClass = getCIImageClass();
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&CIImageClass count:1];
  v17 = [v15 setWithArray:v16];
  uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"presentedImage"];

  presentedImage = v5->_presentedImage;
  v5->_presentedImage = (CIImage *)v18;

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(AXBrailleMap *)self dimensions];
  id v5 = NSStringFromSize(v9);
  id v6 = [v3 stringWithFormat:@"%@[%p]: Dimensions: %@", v4, self, v5];

  return v6;
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDimensions:(CGSize)a3
{
  self->_dimensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedImage, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

- (void)presentImage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213B3D000, log, OS_LOG_TYPE_ERROR, "Nil image passed into presentImage:", v1, 2u);
}

@end