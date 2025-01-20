@interface HMFMessageBinding
- (HMFMessageBinding)initWithName:(id)a3 policies:(id)a4 selector:(SEL)a5;
- (NSArray)policies;
- (NSString)name;
- (SEL)selector;
@end

@implementation HMFMessageBinding

- (HMFMessageBinding)initWithName:(id)a3 policies:(id)a4 selector:(SEL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMFMessageBinding;
  v11 = [(HMFMessageBinding *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_selector = a5;
    objc_storeStrong((id *)&v12->_policies, a4);
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)policies
{
  return self->_policies;
}

- (SEL)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end