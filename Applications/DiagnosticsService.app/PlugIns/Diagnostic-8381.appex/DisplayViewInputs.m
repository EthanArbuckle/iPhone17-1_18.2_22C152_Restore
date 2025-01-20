@interface DisplayViewInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)imageFileNames;
- (void)setImageFileNames:(id)a3;
@end

@implementation DisplayViewInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  v5 = +[NSSet setWithObject:objc_opt_class()];
  v6 = [v4 dk_arrayFromRequiredKey:@"testImages" types:v5 maxLength:256 failed:&v8];

  [(DisplayViewInputs *)self setImageFileNames:v6];
  return v8 == 0;
}

- (NSArray)imageFileNames
{
  return self->_imageFileNames;
}

- (void)setImageFileNames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end