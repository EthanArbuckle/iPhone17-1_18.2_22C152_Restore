@interface CCUICAPackageDescription
+ (id)descriptionForPackageNamed:(id)a3 inBundle:(id)a4;
- (BOOL)flipsForRightToLeftLayoutDirection;
- (BOOL)honorsUIViewAnimationState;
- (CCUICAPackageDescription)initWithPackageName:(id)a3 inBundle:(id)a4;
- (NSDictionary)stateUpdateHandlers;
- (NSURL)packageURL;
- (void)setFlipsForRightToLeftLayoutDirection:(BOOL)a3;
- (void)setHonorsUIViewAnimationState:(BOOL)a3;
- (void)setStateUpdateHandlers:(id)a3;
@end

@implementation CCUICAPackageDescription

- (CCUICAPackageDescription)initWithPackageName:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCUICAPackageDescription;
  v8 = [(CCUICAPackageDescription *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 URLForResource:v6 withExtension:@"ca"];
    packageURL = v8->_packageURL;
    v8->_packageURL = (NSURL *)v9;

    v8->_honorsUIViewAnimationState = 1;
  }

  return v8;
}

+ (id)descriptionForPackageNamed:(id)a3 inBundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPackageName:v7 inBundle:v6];

  return v8;
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return self->_flipsForRightToLeftLayoutDirection;
}

- (void)setFlipsForRightToLeftLayoutDirection:(BOOL)a3
{
  self->_flipsForRightToLeftLayoutDirection = a3;
}

- (BOOL)honorsUIViewAnimationState
{
  return self->_honorsUIViewAnimationState;
}

- (void)setHonorsUIViewAnimationState:(BOOL)a3
{
  self->_honorsUIViewAnimationState = a3;
}

- (NSDictionary)stateUpdateHandlers
{
  return self->_stateUpdateHandlers;
}

- (void)setStateUpdateHandlers:(id)a3
{
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_stateUpdateHandlers, 0);
}

@end