@interface CKNanoCommSafetySendContext
+ (id)contextKey;
- (CKComposition)composition;
@end

@implementation CKNanoCommSafetySendContext

+ (id)contextKey
{
  return @"CKCommSafetyContextKeyNanoSend";
}

- (CKComposition)composition
{
  return self->_composition;
}

- (void).cxx_destruct
{
}

@end