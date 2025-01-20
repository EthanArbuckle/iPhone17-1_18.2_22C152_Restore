@interface DESPFLEncryptor
+ (BOOL)privatizationSupported;
- (BOOL)pluginShouldAddNoiseAndEncryptResult;
- (DESPFLEncryptor)init;
- (DESPFLEncryptor)initWithRecipe:(id)a3;
- (DESPFLEncryptor)initWithRecipeUserInfo:(id)a3;
- (NSString)privatizationIdentifier;
- (double)weight;
- (id)encryptAndPrivatizeDataWithRecipe:(id)a3 numbers:(float *)a4 count:(unint64_t)a5 inPlace:(BOOL)a6 error:(id *)a7;
- (id)encryptedAndPrivatizedDataWithPublicKey:(id)a3 inPlaceNumbers:(float *)a4 count:(unint64_t)a5 error:(id *)a6;
- (id)encryptedAndPrivatizedDataWithPublicKey:(id)a3 numbers:(const float *)a4 count:(unint64_t)a5 error:(id *)a6;
- (id)encryptedDataWithPublicKey:(id)a3 data:(id)a4 error:(id *)a5;
- (id)encryptedDataWithPublicKey:(id)a3 dataFloatNumbers:(const float *)a4 count:(unint64_t)a5 error:(id *)a6;
- (id)encryptedDataWithPublicKey:(id)a3 dataNumbers:(const double *)a4 count:(unint64_t)a5 error:(id *)a6;
- (id)encryptedDataWithPublicKey:(id)a3 inPlaceDataFloatNumbers:(float *)a4 count:(unint64_t)a5 error:(id *)a6;
- (id)encryptedDataWithPublicKey:(id)a3 inPlaceDataNumbers:(double *)a4 count:(unint64_t)a5 error:(id *)a6;
- (int64_t)version;
- (void)setPrivatizationIdentifier:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)setWeight:(double)a3;
@end

@implementation DESPFLEncryptor

- (DESPFLEncryptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)DESPFLEncryptor;
  result = [(DESPFLEncryptor *)&v3 init];
  if (result)
  {
    result->_version = 2;
    result->_weight = 1.0;
  }
  return result;
}

- (DESPFLEncryptor)initWithRecipeUserInfo:(id)a3
{
  return [(DESPFLEncryptor *)self initWithRecipeUserInfo:a3 writeToSubmissionLogs:1];
}

- (DESPFLEncryptor)initWithRecipe:(id)a3
{
  v4 = [a3 recipeUserInfo];
  v5 = [(DESPFLEncryptor *)self initWithRecipeUserInfo:v4 writeToSubmissionLogs:1];

  return v5;
}

- (BOOL)pluginShouldAddNoiseAndEncryptResult
{
  id v2 = DESLogAndReturnSunsetError();
  return 0;
}

+ (BOOL)privatizationSupported
{
  return 0;
}

- (id)encryptedAndPrivatizedDataWithPublicKey:(id)a3 numbers:(const float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  return 0;
}

- (id)encryptedAndPrivatizedDataWithPublicKey:(id)a3 inPlaceNumbers:(float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  return 0;
}

- (id)encryptAndPrivatizeDataWithRecipe:(id)a3 numbers:(float *)a4 count:(unint64_t)a5 inPlace:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 dataNumbers:(const double *)a4 count:(unint64_t)a5 error:(id *)a6
{
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 dataFloatNumbers:(const float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 inPlaceDataNumbers:(double *)a4 count:(unint64_t)a5 error:(id *)a6
{
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 inPlaceDataFloatNumbers:(float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 data:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)privatizationIdentifier
{
  return self->_privatizationIdentifier;
}

- (void)setPrivatizationIdentifier:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
}

@end