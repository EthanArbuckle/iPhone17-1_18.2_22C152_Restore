@interface VN5xRo0q9Wz9Io02mmbtoLsConfiguration
- (VN5xRo0q9Wz9Io02mmbtoLsConfiguration)initWithRequestClass:(Class)a3;
- (VN6Ac6Cyl5O5oK19HboyMBR)inputSignatureprint;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageSignatureHashType;
- (unint64_t)imageSignatureprintType;
- (void)setImageSignatureHashType:(unint64_t)a3;
- (void)setImageSignatureprintType:(unint64_t)a3;
- (void)setInputSignatureprint:(id)a3;
@end

@implementation VN5xRo0q9Wz9Io02mmbtoLsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSignatureprint, 0);

  objc_storeStrong((id *)&self->inputSignatureprint, 0);
}

- (void)setImageSignatureHashType:(unint64_t)a3
{
  self->_imageSignatureHashType = a3;
}

- (unint64_t)imageSignatureHashType
{
  return self->_imageSignatureHashType;
}

- (void)setInputSignatureprint:(id)a3
{
}

- (VN6Ac6Cyl5O5oK19HboyMBR)inputSignatureprint
{
  return self->_inputSignatureprint;
}

- (void)setImageSignatureprintType:(unint64_t)a3
{
  self->_imageSignatureprintType = a3;
}

- (unint64_t)imageSignatureprintType
{
  return self->_imageSignatureprintType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VN5xRo0q9Wz9Io02mmbtoLsConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v8 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setImageSignatureprintType:self->_imageSignatureprintType];
    [v5 setImageSignatureHashType:self->_imageSignatureHashType];
    v6 = (void *)[(VN6Ac6Cyl5O5oK19HboyMBR *)self->_inputSignatureprint copy];
    [v5 setInputSignatureprint:v6];
  }
  return v5;
}

- (VN5xRo0q9Wz9Io02mmbtoLsConfiguration)initWithRequestClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VN5xRo0q9Wz9Io02mmbtoLsConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v8 initWithRequestClass:a3];
  id v4 = v3;
  if (v3)
  {
    inputSignatureprint = v3->_inputSignatureprint;
    v3->_inputSignatureprint = 0;

    v4->_imageSignatureprintType = 0;
    v4->_imageSignatureHashType = 0;
    v6 = v4;
  }

  return v4;
}

@end