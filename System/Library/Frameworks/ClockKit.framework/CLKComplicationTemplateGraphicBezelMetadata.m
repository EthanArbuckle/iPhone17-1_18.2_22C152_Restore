@interface CLKComplicationTemplateGraphicBezelMetadata
+ (id)templateWithMetadata:(id)a3;
- (BOOL)isCompatibleWithFamily:(int64_t)a3;
- (CLKComplicationTemplateGraphicBezelMetadata)initWithMetadata:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicBezelMetadata

- (CLKComplicationTemplateGraphicBezelMetadata)initWithMetadata:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicBezelMetadata;
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

- (BOOL)isCompatibleWithFamily:(int64_t)a3
{
  return a3 == 9;
}

@end