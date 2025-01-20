@interface _PKFakeFixInfo
+ (id)disableInfoWithInteractionValue:(unint64_t)a3;
- (unint64_t)interactionValue;
@end

@implementation _PKFakeFixInfo

+ (id)disableInfoWithInteractionValue:(unint64_t)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = a3;

  return v4;
}

- (unint64_t)interactionValue
{
  return self->_interactionValue;
}

@end