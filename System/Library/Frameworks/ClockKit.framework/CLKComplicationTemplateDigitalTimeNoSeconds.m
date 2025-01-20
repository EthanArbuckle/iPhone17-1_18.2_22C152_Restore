@interface CLKComplicationTemplateDigitalTimeNoSeconds
+ (id)templateWithMetadata:(id)a3;
- (CLKComplicationTemplateDigitalTimeNoSeconds)initWithMetadata:(id)a3;
- (int64_t)compatibleFamily;
@end

@implementation CLKComplicationTemplateDigitalTimeNoSeconds

- (CLKComplicationTemplateDigitalTimeNoSeconds)initWithMetadata:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateDigitalTimeNoSeconds;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplate *)v5 setMetadata:v4];
  }

  return v6;
}

+ (id)templateWithMetadata:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMetadata:v4];

  return v5;
}

- (int64_t)compatibleFamily
{
  return 106;
}

@end