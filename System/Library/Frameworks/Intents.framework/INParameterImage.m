@interface INParameterImage
- (INImage)image;
- (INParameter)parameter;
- (INParameterImage)initWithParameter:(id)a3 image:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation INParameterImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_parameter, 0);
}

- (INImage)image
{
  return self->_image;
}

- (INParameter)parameter
{
  return self->_parameter;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [INParameterImage alloc];
  id v6 = [(INParameter *)self->_parameter copyWithZone:a3];
  id v7 = [(INImage *)self->_image copyWithZone:a3];
  v8 = [(INParameterImage *)v5 initWithParameter:v6 image:v7];

  return v8;
}

- (INParameterImage)initWithParameter:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INParameterImage;
  v8 = [(INParameterImage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    parameter = v8->_parameter;
    v8->_parameter = (INParameter *)v9;

    uint64_t v11 = [v7 copy];
    image = v8->_image;
    v8->_image = (INImage *)v11;
  }
  return v8;
}

@end