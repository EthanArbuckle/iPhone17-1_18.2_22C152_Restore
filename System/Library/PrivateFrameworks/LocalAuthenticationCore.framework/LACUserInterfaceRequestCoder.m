@interface LACUserInterfaceRequestCoder
- (id)_deserialize:(id)a3;
- (id)_encodingKey;
- (id)_serialize:(id)a3;
- (id)decode:(id)a3;
- (id)encode:(id)a3;
@end

@implementation LACUserInterfaceRequestCoder

- (id)encode:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(LACUserInterfaceRequestCoder *)self _encodingKey];
  v6 = [(LACUserInterfaceRequestCoder *)self _serialize:v4];

  if (v6)
  {
    v9 = v5;
    v10[0] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA78];
  }

  return v7;
}

- (id)decode:(id)a3
{
  id v4 = a3;
  v5 = [(LACUserInterfaceRequestCoder *)self _encodingKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = [(LACUserInterfaceRequestCoder *)self _deserialize:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_serialize:(id)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
}

- (id)_deserialize:(id)a3
{
  v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];

  return v5;
}

- (id)_encodingKey
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end