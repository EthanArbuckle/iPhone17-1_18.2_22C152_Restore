@interface CFXCounterRotationLayer
- (double)zRotation;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)setZRotation:(double)a3;
@end

@implementation CFXCounterRotationLayer

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"transform"])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    v9 = [v8 fromValue];
    v10 = v9;
    if (v9)
    {
      [v9 CATransform3DValue];
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
    }

    double v11 = atan2(*((long double *)&v14 + 1), *(long double *)&v14);
    [v8 setKeyPath:@"transform.rotation.z"];
    v12 = [NSNumber numberWithDouble:v11];
    [v8 setFromValue:v12];

    [v8 setToValue:&unk_26E801908];
  }
  v13.receiver = self;
  v13.super_class = (Class)CFXCounterRotationLayer;
  [(CFXCounterRotationLayer *)&v13 addAnimation:v6 forKey:v7];
}

- (double)zRotation
{
  return self->_zRotation;
}

- (void)setZRotation:(double)a3
{
  self->_zRotation = a3;
}

@end