@interface MDLMaterialPropertyConnection
- (MDLMaterialProperty)input;
- (MDLMaterialProperty)output;
- (MDLMaterialPropertyConnection)initWithOutput:(MDLMaterialProperty *)output input:(MDLMaterialProperty *)input;
- (NSString)name;
- (void)setName:(id)a3;
@end

@implementation MDLMaterialPropertyConnection

- (MDLMaterialPropertyConnection)initWithOutput:(MDLMaterialProperty *)output input:(MDLMaterialProperty *)input
{
  v6 = output;
  v7 = input;
  v12.receiver = self;
  v12.super_class = (Class)MDLMaterialPropertyConnection;
  v8 = [(MDLMaterialPropertyConnection *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_input, v7);
    objc_storeWeak((id *)&v9->_output, v6);
    v10 = v9;
  }

  return v9;
}

- (MDLMaterialProperty)input
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_input);

  return (MDLMaterialProperty *)WeakRetained;
}

- (MDLMaterialProperty)output
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_output);

  return (MDLMaterialProperty *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_output);

  objc_destroyWeak((id *)&self->_input);
}

@end