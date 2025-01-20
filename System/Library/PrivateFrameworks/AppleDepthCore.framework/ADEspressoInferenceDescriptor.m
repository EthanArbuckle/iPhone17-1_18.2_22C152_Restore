@interface ADEspressoInferenceDescriptor
- (ADEspressoInferenceDescriptor)initWithUrl:(id)a3 layoutNames:(id)a4;
- (NSURL)networkURL;
- (id)configurationNameForLayout:(unint64_t)a3;
@end

@implementation ADEspressoInferenceDescriptor

- (NSURL)networkURL
{
  return self->_networkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkURL, 0);

  objc_storeStrong((id *)&self->_layoutNames, 0);
}

- (ADEspressoInferenceDescriptor)initWithUrl:(id)a3 layoutNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADEspressoInferenceDescriptor;
  v9 = [(ADEspressoInferenceDescriptor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_networkURL, a3);
    objc_storeStrong((id *)&v10->_layoutNames, a4);
  }

  return v10;
}

- (id)configurationNameForLayout:(unint64_t)a3
{
  layoutNames = self->_layoutNames;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)layoutNames objectForKeyedSubscript:v4];

  return v5;
}

@end