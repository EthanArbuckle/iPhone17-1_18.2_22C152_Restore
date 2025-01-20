@interface CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum
+ (id)new;
- (CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum)init;
- (void)appendEnumValue:(unsigned int)a3;
- (void)appendRawEnumValue:(unsigned int)a3;
@end

@implementation CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum

- (void)appendEnumValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 addObject:v4];
}

- (void)appendRawEnumValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 addObject:v4];
}

- (CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum;
  return (CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum *)[(CCRepeatedFieldValue *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum;
  return objc_msgSendSuper2(&v3, sel__new);
}

@end