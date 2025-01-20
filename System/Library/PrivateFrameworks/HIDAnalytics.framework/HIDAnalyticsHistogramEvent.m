@interface HIDAnalyticsHistogramEvent
- (HIDAnalyticsHistogramEvent)initWithAttributes:(id)a3 description:(id)a4;
- (id)value;
- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5;
- (void)setIntegerValue:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation HIDAnalyticsHistogramEvent

- (HIDAnalyticsHistogramEvent)initWithAttributes:(id)a3 description:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HIDAnalyticsHistogramEvent;
  v4 = [(HIDAnalyticsEvent *)&v8 initWithAttributes:a3 description:a4];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v8 = a3;
  v9 = [[HIDAnalyticsHistogramEventField alloc] initWithAttributes:v8 segments:a4 count:a5];

  field = self->_field;
  self->_field = v9;
}

- (id)value
{
  if (self->_isUpdated)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = [(HIDAnalyticsHistogramEventField *)self->_field fieldName];
    [v4 setObject:v5 forKeyedSubscript:@"Name"];

    [v4 setObject:&unk_26D33D398 forKeyedSubscript:@"Type"];
    v6 = [(HIDAnalyticsHistogramEventField *)self->_field value];
    [v4 setObject:v6 forKeyedSubscript:@"Value"];

    [v3 addObject:v4];
    self->_isUpdated = 0;
    if ([v3 count]) {
      v7 = v3;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)setIntegerValue:(unint64_t)a3
{
  self->_isUpdated = 1;
}

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

@end