@interface LACUIPackagedViewStateAnimationOptions
- (LACUIPackagedViewStateAnimationOptions)init;
- (LACUIPackagedViewStateAnimationOptions)initWithMaxDuration:(id)a3;
- (NSNumber)maxDuration;
- (id)description;
- (void)setMaxDuration:(id)a3;
@end

@implementation LACUIPackagedViewStateAnimationOptions

- (LACUIPackagedViewStateAnimationOptions)init
{
  return [(LACUIPackagedViewStateAnimationOptions *)self initWithMaxDuration:&unk_270439BC8];
}

- (LACUIPackagedViewStateAnimationOptions)initWithMaxDuration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIPackagedViewStateAnimationOptions;
  v6 = [(LACUIPackagedViewStateAnimationOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_maxDuration, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(LACUIPackagedViewStateAnimationOptions *)self maxDuration];
  [v5 floatValue];
  v7 = [v3 stringWithFormat:@"<%@; %p; maxDuration:%.2f>", v4, self, v6];

  return v7;
}

- (NSNumber)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end