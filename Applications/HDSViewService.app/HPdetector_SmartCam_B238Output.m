@interface HPdetector_SmartCam_B238Output
- (HPdetector_SmartCam_B238Output)initWithHomePodDetected:(id)a3;
- (MLMultiArray)HomePodDetected;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setHomePodDetected:(id)a3;
@end

@implementation HPdetector_SmartCam_B238Output

- (HPdetector_SmartCam_B238Output)initWithHomePodDetected:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPdetector_SmartCam_B238Output;
  v6 = [(HPdetector_SmartCam_B238Output *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_HomePodDetected, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000DF0E8];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"HomePodDetected"])
  {
    v4 = [(HPdetector_SmartCam_B238Output *)self HomePodDetected];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)HomePodDetected
{
  return self->_HomePodDetected;
}

- (void)setHomePodDetected:(id)a3
{
}

- (void).cxx_destruct
{
}

@end