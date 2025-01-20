@interface INIntentKeyParameter
- (INCodableAttribute)codableAttribute;
- (INImage)image;
- (INIntentKeyParameter)initWithCodableAttribute:(id)a3 value:(id)a4 image:(id)a5;
- (id)value;
@end

@implementation INIntentKeyParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_codableAttribute, 0);
}

- (INImage)image
{
  return self->_image;
}

- (id)value
{
  return self->_value;
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (INIntentKeyParameter)initWithCodableAttribute:(id)a3 value:(id)a4 image:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)INIntentKeyParameter;
  v12 = [(INIntentKeyParameter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_codableAttribute, a3);
    objc_storeStrong(&v13->_value, a4);
    objc_storeStrong((id *)&v13->_image, a5);
  }

  return v13;
}

@end