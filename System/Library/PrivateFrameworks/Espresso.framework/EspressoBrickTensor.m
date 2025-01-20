@interface EspressoBrickTensor
- (EspressoBrickTensor)init;
- (EspressoBrickTensorShape)shape;
- (void)setShape:(id)a3;
@end

@implementation EspressoBrickTensor

- (void).cxx_destruct
{
}

- (void)setShape:(id)a3
{
}

- (EspressoBrickTensorShape)shape
{
  return (EspressoBrickTensorShape *)objc_getProperty(self, a2, 8, 1);
}

- (EspressoBrickTensor)init
{
  v6.receiver = self;
  v6.super_class = (Class)EspressoBrickTensor;
  v2 = [(EspressoBrickTensor *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(EspressoBrickTensor *)v2 setShape:v3];

    v4 = v2;
  }

  return v2;
}

@end