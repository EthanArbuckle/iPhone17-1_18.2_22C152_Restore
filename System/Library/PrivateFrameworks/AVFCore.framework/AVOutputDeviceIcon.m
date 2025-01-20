@interface AVOutputDeviceIcon
- (AVOutputDeviceIcon)initWithDict:(id)a3;
- (BOOL)isPrerendered;
- (NSData)imageData;
- (NSValue)pixelSize;
- (void)dealloc;
@end

@implementation AVOutputDeviceIcon

- (AVOutputDeviceIcon)initWithDict:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)AVOutputDeviceIcon;
  v4 = [(AVOutputDeviceIcon *)&v17 init];
  if (v4)
  {
    v5 = (void *)[a3 valueForKey:@"widthPixels"];
    objc_opt_class();
    double v6 = 0.0;
    double v7 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      [v5 floatValue];
      double v7 = v8;
    }
    v9 = (void *)[a3 valueForKey:@"heightPixels"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      double v6 = v10;
    }
    v4->_pixelSize = (NSValue *)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", v7, v6);
    v11 = (void *)[a3 valueForKey:@"imageData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    v4->_imageData = v12;
    v13 = (void *)[a3 valueForKey:@"prerendered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v14 = [v13 BOOLValue];
    }
    else {
      char v14 = 1;
    }
    v4->_prerendered = v14;
    v15 = v4;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceIcon;
  [(AVOutputDeviceIcon *)&v3 dealloc];
}

- (NSValue)pixelSize
{
  return self->_pixelSize;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (BOOL)isPrerendered
{
  return self->_prerendered;
}

@end