@interface HIDAnalyticsEvent
- (BOOL)isLogged;
- (HIDAnalyticsEvent)initWithAttributes:(id)a3 description:(id)a4;
- (NSDictionary)desc;
- (NSString)name;
- (id)description;
- (id)value;
- (void)activate;
- (void)addField:(id)a3;
- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5;
- (void)cancel;
- (void)setDesc:(id)a3;
- (void)setIntegerValue:(unint64_t)a3 forField:(id)a4;
- (void)setIsLogged:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setStringValue:(id)a3 forField:(id)a4;
- (void)setValue:(id)a3;
@end

@implementation HIDAnalyticsEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

- (HIDAnalyticsEvent)initWithAttributes:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HIDAnalyticsEvent;
  v8 = [(HIDAnalyticsEvent *)&v11 init];
  if (v8)
  {
    if (initWithAttributes_description__once != -1) {
      dispatch_once(&initWithAttributes_description__once, &__block_literal_global);
    }
    [(HIDAnalyticsEvent *)v8 setName:v6];
    [(HIDAnalyticsEvent *)v8 setDesc:v7];
    v9 = v8;
  }

  return v8;
}

- (void)setName:(id)a3
{
}

- (void)setDesc:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)desc
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isLogged
{
  return self->_isLogged;
}

- (id)value
{
  if (self->_isUpdated)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    fields = self->_fields;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __26__HIDAnalyticsEvent_value__block_invoke;
    v9[3] = &unk_2645A3EC8;
    id v10 = v3;
    id v5 = v3;
    [(NSMutableDictionary *)fields enumerateKeysAndObjectsUsingBlock:v9];
    self->_isUpdated = 0;
    self->_isLogged |= [v5 count] == 0;
    if ([v5 count]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v11 = a3;
  if (!self->_fields)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    fields = self->_fields;
    self->_fields = v8;
  }
  id v10 = [[HIDAnalyticsHistogramEventField alloc] initWithAttributes:v11 segments:a4 count:a5];
  [(NSMutableDictionary *)self->_fields setObject:v10 forKeyedSubscript:v11];
}

void __26__HIDAnalyticsEvent_value__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  [v7 setObject:v6 forKeyedSubscript:@"Name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = &unk_26D33D3C8;
  }
  else {
    v8 = &unk_26D33D3E0;
  }
  [v7 setObject:v8 forKeyedSubscript:@"Type"];
  v9 = [v10 value];
  [v7 setObject:v9 forKeyedSubscript:@"Value"];

  [*(id *)(a1 + 32) addObject:v7];
}

- (void)setIntegerValue:(unint64_t)a3 forField:(id)a4
{
  id v6 = [(NSMutableDictionary *)self->_fields objectForKey:a4];
  if (v6)
  {
    [v6 setIntegerValue:a3];
    self->_isUpdated = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(id)__hidAnalyticsReporter dispatchAnalyticsForEvent:self];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)activate
{
}

- (void)cancel
{
}

uint64_t __52__HIDAnalyticsEvent_initWithAttributes_description___block_invoke()
{
  v0 = objc_alloc_init(HIDAnalyticsReporter);
  v1 = (void *)__hidAnalyticsReporter;
  __hidAnalyticsReporter = (uint64_t)v0;

  v2 = (void *)__hidAnalyticsReporter;
  return [v2 start];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HIDAnalyticsEvent *)self desc];
  [v3 setObject:v4 forKeyedSubscript:@"EventDescription"];

  id v5 = [(HIDAnalyticsEvent *)self value];
  [v3 setObject:v5 forKeyedSubscript:@"EventValue"];

  id v6 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:0 error:0];
  id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];

  return v7;
}

- (void)addField:(id)a3
{
  id v7 = a3;
  if (!self->_fields)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    fields = self->_fields;
    self->_fields = v4;
  }
  id v6 = [[HIDAnalyticsEventField alloc] initWithName:v7];
  [(NSMutableDictionary *)self->_fields setObject:v6 forKeyedSubscript:v7];
}

- (void)setStringValue:(id)a3 forField:(id)a4
{
  id v8 = a3;
  id v6 = [(NSMutableDictionary *)self->_fields objectForKey:a4];
  id v7 = v6;
  if (v6)
  {
    [v6 setStringValue:v8];
    self->_isUpdated = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(id)__hidAnalyticsReporter dispatchAnalyticsForEvent:self];
    }
  }
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  fields = self->_fields;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__HIDAnalyticsEvent_setValue___block_invoke;
  v7[3] = &unk_2645A3EC8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)fields enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __30__HIDAnalyticsEvent_setValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setValue:*(void *)(a1 + 32)];
}

- (void)setIsLogged:(BOOL)a3
{
  self->_isLogged = a3;
}

@end