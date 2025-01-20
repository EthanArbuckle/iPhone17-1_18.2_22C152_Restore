@interface AVExternalDeviceIcon
- (AVExternalDeviceIcon)initWithDictionary:(id)a3;
- (BOOL)isPrerendered;
- (CGSize)pixelSize;
- (NSData)imageData;
- (void)dealloc;
@end

@implementation AVExternalDeviceIcon

- (AVExternalDeviceIcon)initWithDictionary:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AVExternalDeviceIcon;
  v4 = [(AVExternalDeviceIcon *)&v18 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVExternalDeviceIconInternal);
    v4->_externalDeviceIcon = v5;
    if (v5)
    {
      v6 = (void *)[a3 valueForKey:@"widthPixels"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      double v8 = 0.0;
      double v9 = 0.0;
      if (isKindOfClass)
      {
        objc_msgSend(v6, "floatValue", 0.0);
        double v9 = v10;
      }
      v4->_externalDeviceIcon->_size.width = v9;
      v11 = (void *)[a3 valueForKey:@"heightPixels"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 floatValue];
        double v8 = v12;
      }
      v4->_externalDeviceIcon->_size.height = v8;
      v13 = (void *)[a3 valueForKey:@"imageData"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      v4->_externalDeviceIcon->_data = v14;
      v15 = (void *)[a3 valueForKey:@"prerendered"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v16 = [v15 BOOLValue];
      }
      else {
        char v16 = 1;
      }
      v4->_externalDeviceIcon->_prerendered = v16;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  externalDeviceIcon = self->_externalDeviceIcon;
  if (externalDeviceIcon)
  {

    CFRelease(self->_externalDeviceIcon);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVExternalDeviceIcon;
  [(AVExternalDeviceIcon *)&v4 dealloc];
}

- (CGSize)pixelSize
{
  externalDeviceIcon = self->_externalDeviceIcon;
  double width = externalDeviceIcon->_size.width;
  double height = externalDeviceIcon->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSData)imageData
{
  return self->_externalDeviceIcon->_data;
}

- (BOOL)isPrerendered
{
  return self->_externalDeviceIcon->_prerendered;
}

@end