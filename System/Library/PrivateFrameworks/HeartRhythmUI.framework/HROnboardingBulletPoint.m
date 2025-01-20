@interface HROnboardingBulletPoint
+ (id)bulletPointWithImage:(id)a3 title:(id)a4 body:(id)a5;
- (HROnboardingBulletPoint)initWithImage:(id)a3 title:(id)a4 body:(id)a5;
- (NSString)bulletBodyString;
- (NSString)bulletTitleString;
- (UIImage)bulletImage;
@end

@implementation HROnboardingBulletPoint

- (HROnboardingBulletPoint)initWithImage:(id)a3 title:(id)a4 body:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HROnboardingBulletPoint;
  v12 = [(HROnboardingBulletPoint *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bulletImage, a3);
    objc_storeStrong((id *)&v13->_bulletTitleString, a4);
    objc_storeStrong((id *)&v13->_bulletBodyString, a5);
  }

  return v13;
}

+ (id)bulletPointWithImage:(id)a3 title:(id)a4 body:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HROnboardingBulletPoint alloc] initWithImage:v9 title:v8 body:v7];

  return v10;
}

- (UIImage)bulletImage
{
  return self->_bulletImage;
}

- (NSString)bulletTitleString
{
  return self->_bulletTitleString;
}

- (NSString)bulletBodyString
{
  return self->_bulletBodyString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletBodyString, 0);
  objc_storeStrong((id *)&self->_bulletTitleString, 0);
  objc_storeStrong((id *)&self->_bulletImage, 0);
}

@end