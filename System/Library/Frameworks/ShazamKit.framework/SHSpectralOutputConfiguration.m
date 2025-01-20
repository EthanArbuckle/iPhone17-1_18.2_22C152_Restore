@interface SHSpectralOutputConfiguration
+ (BOOL)validateCallbackFrequency:(int64_t)a3;
+ (BOOL)validateNumberOfBins:(int64_t)a3;
- (SHSpectralOutputConfiguration)init;
- (SHSpectralOutputConfiguration)initWithNumberOfBins:(int64_t)a3 callbackFrequency:(int64_t)a4;
- (int64_t)callbackFrequency;
- (int64_t)numberOfBins;
@end

@implementation SHSpectralOutputConfiguration

- (SHSpectralOutputConfiguration)init
{
  return [(SHSpectralOutputConfiguration *)self initWithNumberOfBins:4 callbackFrequency:8];
}

- (SHSpectralOutputConfiguration)initWithNumberOfBins:(int64_t)a3 callbackFrequency:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SHSpectralOutputConfiguration;
  result = [(SHSpectralOutputConfiguration *)&v7 init];
  if (result)
  {
    result->_numberOfBins = a3;
    result->_callbackFrequency = a4;
  }
  return result;
}

+ (BOOL)validateNumberOfBins:(int64_t)a3
{
  return (unint64_t)(a3 - 1) <= 0x3FF && (a3 & (a3 - 1)) == 0;
}

+ (BOOL)validateCallbackFrequency:(int64_t)a3
{
  return a3 >= 8 && (a3 & (a3 - 1)) == 0;
}

- (int64_t)numberOfBins
{
  return self->_numberOfBins;
}

- (int64_t)callbackFrequency
{
  return self->_callbackFrequency;
}

@end