@interface PHASEMetaParameter
+ (PHASEMetaParameter)new;
- (BOOL)registeredGlobally;
- (MetaParameterValueProtocol)delegate;
- (NSString)identifier;
- (NSString)uid;
- (PHASEMetaParameter)init;
- (PHASEMetaParameter)initWithUID:(id)a3 delegate:(id)a4;
- (id)value;
- (void)setDelegate:(id)a3;
- (void)setLocalValueOnly:(id)a3;
- (void)setRegisteredGlobally:(BOOL)a3;
- (void)setValue:(id)value;
@end

@implementation PHASEMetaParameter

- (PHASEMetaParameter)init
{
  return 0;
}

+ (PHASEMetaParameter)new
{
  return 0;
}

- (PHASEMetaParameter)initWithUID:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHASEMetaParameter;
  v9 = [(PHASEMetaParameter *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_registeredGlobally = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (void)setValue:(id)value
{
  id v21 = value;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = self;
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(a2);
      [v21 doubleValue];
      double v11 = v10;
      [(PHASEMetaParameter *)v6 minimum];
      double v13 = v12;
      [(PHASEMetaParameter *)v6 maximum];
      double v15 = PHASEGetPropertyBounded<double>(v8, v9, v11, v13, v14);

      uint64_t v16 = [NSNumber numberWithDouble:v15];
      id v17 = v6->_value;
      v6->_value = (id)v16;

      id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
      [WeakRetained setMetaParameter:v6->_identifier value:v15 withTimeInterval:0.0];

LABEL_7:
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong(&self->_value, value);
      v6 = (PHASEMetaParameter *)objc_loadWeakRetained((id *)&self->_delegate);
      [(PHASEMetaParameter *)v6 setMetaParameter:self->_identifier value:self->_value];
      goto LABEL_7;
    }
  }
  v19 = (void *)MEMORY[0x263EFF940];
  uint64_t v20 = objc_opt_class();
  [v19 raise:@"API Misuse", @"Cannot set on object of type %@ to metaparameter of type %@", v20, objc_opt_class() format];
LABEL_9:
}

- (void)setLocalValueOnly:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)value
{
  return self->_value;
}

- (BOOL)registeredGlobally
{
  return self->_registeredGlobally;
}

- (void)setRegisteredGlobally:(BOOL)a3
{
  self->_registeredGlobally = a3;
}

- (MetaParameterValueProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MetaParameterValueProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end