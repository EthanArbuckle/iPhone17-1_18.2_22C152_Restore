@interface HMMTRDuration
- (HMMTRDuration)initWithName:(id)a3 duration:(id)a4;
- (NSNumber)duration;
- (NSString)name;
@end

@implementation HMMTRDuration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (HMMTRDuration)initWithName:(id)a3 duration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRDuration;
  v9 = [(HMMTRDuration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_duration, a4);
  }

  return v10;
}

@end