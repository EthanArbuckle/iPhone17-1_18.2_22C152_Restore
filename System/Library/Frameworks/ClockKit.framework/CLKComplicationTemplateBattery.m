@interface CLKComplicationTemplateBattery
+ (id)templateWithFamily:(int64_t)a3 textProvider:(id)a4 level:(double)a5 charging:(BOOL)a6;
- (BOOL)charging;
- (CLKComplicationTemplateBattery)initWithFamily:(int64_t)a3 textProvider:(id)a4 level:(double)a5 charging:(BOOL)a6;
- (CLKTextProvider)textProvider;
- (double)level;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateBOOLKeysWithBlock:(id)a3;
- (void)_enumerateFloatKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setCharging:(BOOL)a3;
- (void)setLevel:(double)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateBattery

- (CLKComplicationTemplateBattery)initWithFamily:(int64_t)a3 textProvider:(id)a4 level:(double)a5 charging:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateBattery;
  v11 = [(CLKComplicationTemplate *)&v14 initPrivate];
  v12 = v11;
  if (v11)
  {
    v11->_family = a3;
    [(CLKComplicationTemplateBattery *)v11 setTextProvider:v10];
    [(CLKComplicationTemplateBattery *)v12 setLevel:a5];
    [(CLKComplicationTemplateBattery *)v12 setCharging:v6];
  }

  return v12;
}

+ (id)templateWithFamily:(int64_t)a3 textProvider:(id)a4 level:(double)a5 charging:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  v11 = (void *)[objc_alloc((Class)a1) initWithFamily:a3 textProvider:v10 level:v6 charging:a5];

  return v11;
}

- (int64_t)compatibleFamily
{
  return self->_family;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationTemplateBattery;
  id v4 = [(CLKComplicationTemplate *)&v6 copyWithZone:a3];
  *((void *)v4 + 9) = self->_family;
  *((void *)v4 + 12) = *(void *)&self->_level;
  *((unsigned char *)v4 + 80) = self->_charging;
  objc_storeStrong((id *)v4 + 11, self->_textProvider);
  return v4;
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void, char *))a3 + 2))(a3, @"level", 1, 0, &v3);
}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, char *))a3 + 2))(a3, @"charging", 1, &v3);
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, void, char *))a3 + 2))(a3, @"textProvider", 0, 0, &v3);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (double)level
{
  return self->_level;
}

- (void)setLevel:(double)a3
{
  self->_level = a3;
}

- (BOOL)charging
{
  return self->_charging;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (void).cxx_destruct
{
}

@end