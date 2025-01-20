@interface CLKComplicationTemplateBreathing
+ (id)breathingTemplateWithFamily:(int64_t)a3;
- (CLKComplicationTemplateBreathing)initWithFamily:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compatibleFamily;
- (int64_t)sessionCount;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)setSessionCount:(int64_t)a3;
@end

@implementation CLKComplicationTemplateBreathing

- (CLKComplicationTemplateBreathing)initWithFamily:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateBreathing;
  result = [(CLKComplicationTemplate *)&v5 initPrivate];
  if (result) {
    result->_family = a3;
  }
  return result;
}

+ (id)breathingTemplateWithFamily:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithFamily:a3];

  return v3;
}

- (int64_t)compatibleFamily
{
  return self->_family;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateBreathing;
  id result = [(CLKComplicationTemplate *)&v5 copyWithZone:a3];
  *((void *)result + 9) = self->_family;
  return result;
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, void, char *))a3 + 2))(a3, @"sessionCount", 0, 0, &v3);
}

- (int64_t)sessionCount
{
  return self->_sessionCount;
}

- (void)setSessionCount:(int64_t)a3
{
  self->_sessionCount = a3;
}

@end