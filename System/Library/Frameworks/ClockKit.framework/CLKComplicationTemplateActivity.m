@interface CLKComplicationTemplateActivity
+ (id)activityTemplateWithFamily:(int64_t)a3;
- (BOOL)dotsAreHidden;
- (CLKComplicationTemplateActivity)initWithFamily:(int64_t)a3;
- (double)exercisePercentComplete;
- (double)movePercentComplete;
- (double)standPercentComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateBOOLKeysWithBlock:(id)a3;
- (void)_enumerateFloatKeysWithBlock:(id)a3;
- (void)setExercisePercentComplete:(double)a3;
- (void)setHideDots:(BOOL)a3;
- (void)setMovePercentComplete:(double)a3;
- (void)setStandPercentComplete:(double)a3;
@end

@implementation CLKComplicationTemplateActivity

- (CLKComplicationTemplateActivity)initWithFamily:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateActivity;
  result = [(CLKComplicationTemplate *)&v5 initPrivate];
  if (result) {
    result->_family = a3;
  }
  return result;
}

+ (id)activityTemplateWithFamily:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithFamily:a3];

  return v3;
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, uint64_t, void, char *))a3;
  char v4 = 0;
  v3[2](v3, @"movePercentComplete", 1, 0, &v4);
  if (!v4)
  {
    v3[2](v3, @"exercisePercentComplete", 1, 0, &v4);
    if (!v4) {
      v3[2](v3, @"standPercentComplete", 1, 0, &v4);
    }
  }
}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, char *))a3 + 2))(a3, @"hideDots", 1, &v3);
}

- (int64_t)compatibleFamily
{
  return self->_family;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateActivity;
  id result = [(CLKComplicationTemplate *)&v5 copyWithZone:a3];
  *((void *)result + 9) = self->_family;
  *((void *)result + 11) = *(void *)&self->_movePercentComplete;
  *((void *)result + 12) = *(void *)&self->_exercisePercentComplete;
  *((void *)result + 13) = *(void *)&self->_standPercentComplete;
  *((unsigned char *)result + 80) = self->_hideDots;
  return result;
}

- (double)movePercentComplete
{
  return self->_movePercentComplete;
}

- (void)setMovePercentComplete:(double)a3
{
  self->_movePercentComplete = a3;
}

- (double)exercisePercentComplete
{
  return self->_exercisePercentComplete;
}

- (void)setExercisePercentComplete:(double)a3
{
  self->_exercisePercentComplete = a3;
}

- (double)standPercentComplete
{
  return self->_standPercentComplete;
}

- (void)setStandPercentComplete:(double)a3
{
  self->_standPercentComplete = a3;
}

- (BOOL)dotsAreHidden
{
  return self->_hideDots;
}

- (void)setHideDots:(BOOL)a3
{
  self->_hideDots = a3;
}

@end