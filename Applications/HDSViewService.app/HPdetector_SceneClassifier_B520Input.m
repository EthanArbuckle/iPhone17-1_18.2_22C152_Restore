@interface HPdetector_SceneClassifier_B520Input
- (HPdetector_SceneClassifier_B520Input)initWithImageDescriptors:(id)a3;
- (MLMultiArray)imageDescriptors;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setImageDescriptors:(id)a3;
@end

@implementation HPdetector_SceneClassifier_B520Input

- (HPdetector_SceneClassifier_B520Input)initWithImageDescriptors:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPdetector_SceneClassifier_B520Input;
  v6 = [(HPdetector_SceneClassifier_B520Input *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imageDescriptors, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000DF100];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"imageDescriptors"])
  {
    v4 = [(HPdetector_SceneClassifier_B520Input *)self imageDescriptors];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)imageDescriptors
{
  return self->_imageDescriptors;
}

- (void)setImageDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end