@interface CIPhotoEffect3DNoir
- (int)_defaultVersion;
- (int)_maxVersion;
- (void)setDefaults;
@end

@implementation CIPhotoEffect3DNoir

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

- (void)setDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)CIPhotoEffect3DNoir;
  [(CIPhotoEffect3D *)&v3 setDefaults];
  -[CIPhotoEffect3DNoir setValue:forKey:](self, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIPhotoEffect3DNoir _defaultVersion](self, "_defaultVersion")), @"__inputVersion");
  [(CIPhotoEffect3D *)self setInputGrainAmount:&unk_1EE4A96C0];
}

- (int)_maxVersion
{
  return 1;
}

@end