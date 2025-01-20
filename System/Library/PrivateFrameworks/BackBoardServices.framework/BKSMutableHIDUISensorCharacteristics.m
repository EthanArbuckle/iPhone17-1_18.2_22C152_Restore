@interface BKSMutableHIDUISensorCharacteristics
+ (id)new;
- (BKSMutableHIDUISensorCharacteristics)init;
- (void)setHasDiscreteProximitySensor:(BOOL)a3;
- (void)setSuggestedSystemApertureGracePeriodForScreenOff:(int64_t)a3;
@end

@implementation BKSMutableHIDUISensorCharacteristics

- (void)setSuggestedSystemApertureGracePeriodForScreenOff:(int64_t)a3
{
  self->super._suggestedSystemApertureGracePeriodForScreenOff = a3;
}

- (void)setHasDiscreteProximitySensor:(BOOL)a3
{
  self->super._hasDiscreteProximitySensor = a3;
}

- (BKSMutableHIDUISensorCharacteristics)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSMutableHIDUISensorCharacteristics;
  return (BKSMutableHIDUISensorCharacteristics *)[(BKSHIDUISensorCharacteristics *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___BKSMutableHIDUISensorCharacteristics;
  return (id)objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "_init");
}

@end