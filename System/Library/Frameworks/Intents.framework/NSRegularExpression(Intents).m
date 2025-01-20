@interface NSRegularExpression(Intents)
+ (id)_intents_sharedFormatRegularExpression;
+ (id)_intents_sharedFunctionRegularExpression;
+ (id)_intents_sharedOldFormatRegularExpression;
+ (id)_intents_sharedStringsDictFormatRegularExpression;
@end

@implementation NSRegularExpression(Intents)

+ (id)_intents_sharedStringsDictFormatRegularExpression
{
  if (_intents_sharedStringsDictFormatRegularExpression_onceToken != -1) {
    dispatch_once(&_intents_sharedStringsDictFormatRegularExpression_onceToken, &__block_literal_global_13_98694);
  }
  v0 = (void *)_intents_sharedStringsDictFormatRegularExpression_regularExpression;

  return v0;
}

+ (id)_intents_sharedOldFormatRegularExpression
{
  if (_intents_sharedOldFormatRegularExpression_onceToken != -1) {
    dispatch_once(&_intents_sharedOldFormatRegularExpression_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)_intents_sharedOldFormatRegularExpression_regularExpression;

  return v0;
}

+ (id)_intents_sharedFunctionRegularExpression
{
  if (_intents_sharedFunctionRegularExpression_onceToken != -1) {
    dispatch_once(&_intents_sharedFunctionRegularExpression_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)_intents_sharedFunctionRegularExpression_regularExpression;

  return v0;
}

+ (id)_intents_sharedFormatRegularExpression
{
  if (_intents_sharedFormatRegularExpression_onceToken != -1) {
    dispatch_once(&_intents_sharedFormatRegularExpression_onceToken, &__block_literal_global_98705);
  }
  v0 = (void *)_intents_sharedFormatRegularExpression_regularExpression;

  return v0;
}

@end