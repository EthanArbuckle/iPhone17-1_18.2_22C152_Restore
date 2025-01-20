@interface VOTImageExplorerCustomContentValue
- (NSString)type;
- (NSString)value;
- (VOTImageExplorerCustomContentValue)initWithFeatureValue:(id)a3 featureType:(id)a4;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation VOTImageExplorerCustomContentValue

- (VOTImageExplorerCustomContentValue)initWithFeatureValue:(id)a3 featureType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOTImageExplorerCustomContentValue;
  v8 = [(VOTImageExplorerCustomContentValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(VOTImageExplorerCustomContentValue *)v8 setValue:v6];
    [(VOTImageExplorerCustomContentValue *)v9 setType:v7];
  }

  return v9;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end