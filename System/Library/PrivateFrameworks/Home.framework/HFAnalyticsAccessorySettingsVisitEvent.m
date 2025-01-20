@interface HFAnalyticsAccessorySettingsVisitEvent
- (BOOL)isHomePod;
- (BOOL)isMediaAccessory;
- (HFAnalyticsAccessorySettingsVisitEvent)initWithData:(id)a3;
- (HFItem)sourceItem;
- (id)payload;
- (void)setIsHomePod:(BOOL)a3;
- (void)setIsMediaAccessory:(BOOL)a3;
- (void)setSourceItem:(id)a3;
@end

@implementation HFAnalyticsAccessorySettingsVisitEvent

- (HFAnalyticsAccessorySettingsVisitEvent)initWithData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFAnalyticsAccessorySettingsVisitEvent;
  v5 = [(HFAnalyticsEvent *)&v12 initWithEventType:33];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"accessorySettingsSourceItem"];

    if (!v6) {
      NSLog(&cfstr_MissingSourceI.isa);
    }
    objc_opt_class();
    v7 = [v4 objectForKeyedSubscript:@"accessorySettingsSourceItem"];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      if ([v9 isHomePod]) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = [v9 isHomePodMediaSystem];
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(HFAnalyticsAccessorySettingsVisitEvent *)v5 setIsHomePod:v10];
    [(HFAnalyticsAccessorySettingsVisitEvent *)v5 setIsMediaAccessory:v9 != 0];
  }
  return v5;
}

- (id)payload
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"accessorySettingsForHomePod";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAccessorySettingsVisitEvent isHomePod](self, "isHomePod"));
  v8[0] = v3;
  v7[1] = @"accessorySettingsForMediaAccessory";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAccessorySettingsVisitEvent isMediaAccessory](self, "isMediaAccessory"));
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (BOOL)isHomePod
{
  return self->_isHomePod;
}

- (void)setIsHomePod:(BOOL)a3
{
  self->_isHomePod = a3;
}

- (BOOL)isMediaAccessory
{
  return self->_isMediaAccessory;
}

- (void)setIsMediaAccessory:(BOOL)a3
{
  self->_isMediaAccessory = a3;
}

- (void).cxx_destruct
{
}

@end