@interface CKContextImageSource
+ (BOOL)supportsSecureCoding;
+ (id)imageSourceForUIImage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKContextImageSource)initWithCoder:(id)a3;
- (CKContextImageSource)initWithIOSurface:(id)a3;
- (CKContextImageSource)initWithIOSurface:(id)a3 cameraIntrinsics:(id)a4;
- (IOSurface)ioSurface;
- (NSData)cameraIntrinsics;
- (int64_t)profile;
- (unint64_t)hash;
- (unsigned)orientation;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraIntrinsics:(id)a3;
- (void)setIoSurface:(id)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setProfile:(int64_t)a3;
@end

@implementation CKContextImageSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)imageSourceForUIImage:(id)a3
{
  v3 = +[CKContextExtractionUtil _renderImageToSurfaceWithImage:a3];
  if (v3) {
    v4 = [[CKContextImageSource alloc] initWithIOSurface:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (CKContextImageSource)initWithIOSurface:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKContextImageSource;
  v5 = [(CKContextImageSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CKContextImageSource *)v5 setIoSurface:v4];
  }

  return v6;
}

- (CKContextImageSource)initWithIOSurface:(id)a3 cameraIntrinsics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKContextImageSource;
  objc_super v8 = [(CKContextImageSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CKContextImageSource *)v8 setIoSurface:v6];
    [(CKContextImageSource *)v9 setCameraIntrinsics:v7];
  }

  return v9;
}

- (CKContextImageSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKContextImageSource;
  v5 = [(CKContextImageSource *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orientation"];
    -[CKContextImageSource setOrientation:](v5, "setOrientation:", [v6 unsignedIntValue]);
    -[CKContextImageSource setProfile:](v5, "setProfile:", (int)[v4 decodeIntForKey:@"profile"]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cameraIntrinsics"];
    [(CKContextImageSource *)v5 setCameraIntrinsics:v7];

    Class v8 = NSClassFromString(&cfstr_Iosurface.isa);
    if (v8)
    {
      v9 = [v4 decodeObjectOfClass:v8 forKey:@"iosurface"];
      [(CKContextImageSource *)v5 setIoSurface:v9];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t orientation = self->_orientation;
  id v7 = a3;
  id v6 = [v4 numberWithUnsignedInt:orientation];
  [v7 encodeObject:v6 forKey:@"orientation"];

  [v7 encodeInteger:self->_profile forKey:@"profile"];
  [v7 encodeObject:self->_ioSurface forKey:@"iosurface"];
  [v7 encodeObject:self->_cameraIntrinsics forKey:@"iosurface"];
}

- (unint64_t)hash
{
  v2 = [(CKContextImageSource *)self ioSurface];
  unint64_t v3 = 31 * [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKContextImageSource *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = v4;
      unint64_t v8 = [(CKContextImageSource *)self hash];
      if (v8 == [(CKContextImageSource *)v7 hash]
        && (unsigned int v9 = [(CKContextImageSource *)self orientation],
            v9 == [(CKContextImageSource *)v7 orientation])
        && (int64_t v10 = [(CKContextImageSource *)self profile], v10 == [(CKContextImageSource *)v7 profile]))
      {
        objc_super v11 = [(CKContextImageSource *)self cameraIntrinsics];
        v12 = [(CKContextImageSource *)v7 cameraIntrinsics];
        char v6 = [v11 isEqual:v12];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)setIoSurface:(id)a3
{
}

- (NSData)cameraIntrinsics
{
  return self->_cameraIntrinsics;
}

- (void)setCameraIntrinsics:(id)a3
{
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_uint64_t orientation = a3;
}

- (int64_t)profile
{
  return self->_profile;
}

- (void)setProfile:(int64_t)a3
{
  self->_profile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraIntrinsics, 0);

  objc_storeStrong((id *)&self->_ioSurface, 0);
}

@end