@interface HMBProcessingResult
- (HMBProcessingOptions)options;
- (HMBProcessingResult)initWithOptions:(id)a3 actions:(id)a4 mirrorOutputResult:(id)a5;
- (NAFuture)mirrorOutputResult;
- (NSArray)actions;
@end

@implementation HMBProcessingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorOutputResult, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (NAFuture)mirrorOutputResult
{
  return self->_mirrorOutputResult;
}

- (NSArray)actions
{
  return self->_actions;
}

- (HMBProcessingOptions)options
{
  return self->_options;
}

- (HMBProcessingResult)initWithOptions:(id)a3 actions:(id)a4 mirrorOutputResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMBProcessingResult;
  v12 = [(HMBProcessingResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a3);
    objc_storeStrong((id *)&v13->_actions, a4);
    objc_storeStrong((id *)&v13->_mirrorOutputResult, a5);
  }

  return v13;
}

@end