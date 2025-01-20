@interface CARManufacturerIcon
- (BOOL)isPrerendered;
- (CARManufacturerIcon)initWithDictionary:(id)a3;
- (CGSize)pixelSize;
- (NSData)imageData;
- (id)description;
@end

@implementation CARManufacturerIcon

- (CARManufacturerIcon)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CARManufacturerIcon;
  v5 = [(CARManufacturerIcon *)&v18 init];
  if (v5)
  {
    v6 = [v4 valueForKey:@"widthPixels"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v8 = 0.0;
    double v9 = 0.0;
    if (isKindOfClass)
    {
      objc_msgSend(v6, "floatValue", 0.0);
      double v9 = v10;
    }
    v5->_pixelSize.width = v9;
    v11 = [v4 valueForKey:@"heightPixels"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      double v8 = v12;
    }
    v5->_pixelSize.height = v8;
    v13 = [v4 valueForKey:@"imageData"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&v5->_imageData, v14);
    v15 = [v4 valueForKey:@"prerendered"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v16 = [v15 BOOLValue];
    }
    else {
      char v16 = 1;
    }
    v5->_prerendered = v16;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CARManufacturerIcon;
  id v4 = [(CARManufacturerIcon *)&v13 description];
  [(CARManufacturerIcon *)self pixelSize];
  uint64_t v6 = v5;
  [(CARManufacturerIcon *)self pixelSize];
  uint64_t v8 = v7;
  [(CARManufacturerIcon *)self isPrerendered];
  double v9 = NSStringFromBOOL();
  float v10 = [(CARManufacturerIcon *)self imageData];
  v11 = [v3 stringWithFormat:@"%@ <size: %f x %f, prerendered: %@, data length: %lu>", v4, v6, v8, v9, objc_msgSend(v10, "length")];

  return v11;
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (BOOL)isPrerendered
{
  return self->_prerendered;
}

- (void).cxx_destruct
{
}

@end