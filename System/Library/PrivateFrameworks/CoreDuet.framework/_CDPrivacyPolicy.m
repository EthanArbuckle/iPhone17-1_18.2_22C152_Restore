@interface _CDPrivacyPolicy
+ (id)sharedPrivacyPolicy;
- (BOOL)canPersistOnStorage;
- (_CDPrivacyPolicy)init;
- (_CDPrivacyPolicy)initWithTemporalPrecision:(double)a3 canPersistOnStorage:(BOOL)a4;
- (double)temporalPrecision;
- (id)description;
@end

@implementation _CDPrivacyPolicy

- (double)temporalPrecision
{
  return self->temporalPrecision;
}

- (BOOL)canPersistOnStorage
{
  return self->canPersistOnStorage;
}

- (_CDPrivacyPolicy)initWithTemporalPrecision:(double)a3 canPersistOnStorage:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_CDPrivacyPolicy;
  result = [(_CDPrivacyPolicy *)&v7 init];
  if (result)
  {
    result->temporalPrecision = a3;
    result->canPersistOnStorage = a4;
  }
  return result;
}

+ (id)sharedPrivacyPolicy
{
  if (sharedPrivacyPolicy_onceToken != -1) {
    dispatch_once(&sharedPrivacyPolicy_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedPrivacyPolicy__sharedPrivacyPolicy;
  return v2;
}

- (_CDPrivacyPolicy)init
{
  return [(_CDPrivacyPolicy *)self initWithTemporalPrecision:0 canPersistOnStorage:64.0];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: { temporalPrecision=%f, canPersistOnStorage=%d }", v5, *(void *)&self->temporalPrecision, self->canPersistOnStorage];

  return v6;
}

@end