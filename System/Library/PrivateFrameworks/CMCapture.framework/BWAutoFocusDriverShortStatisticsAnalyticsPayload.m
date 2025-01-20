@interface BWAutoFocusDriverShortStatisticsAnalyticsPayload
- (BWAutoFocusDriverShortStatisticsAnalyticsPayload)init;
- (NSDictionary)afDriverShortStatistics;
- (NSString)portType;
- (id)eventDictionary;
- (id)eventName;
- (void)dealloc;
- (void)reset;
- (void)setAfDriverShortStatistics:(id)a3;
- (void)setPortType:(id)a3;
@end

@implementation BWAutoFocusDriverShortStatisticsAnalyticsPayload

- (BWAutoFocusDriverShortStatisticsAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWAutoFocusDriverShortStatisticsAnalyticsPayload;
  v2 = [(BWAutoFocusDriverShortStatisticsAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWAutoFocusDriverShortStatisticsAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAutoFocusDriverShortStatisticsAnalyticsPayload;
  [(BWAutoFocusDriverShortStatisticsAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_portType = 0;
  self->_afDriverShortStatistics = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.AutoFocusDriverShortStatistics";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  portType = self->_portType;
  if (portType) {
    [v3 setObject:portType forKeyedSubscript:@"portType"];
  }
  afDriverShortStatistics = self->_afDriverShortStatistics;
  if (afDriverShortStatistics)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E4F53650]), @"numberOfDetectedShorts");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E4F53648]), @"maxShortLength");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E4F53640]), @"maxAcceleration");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E4F53658]), @"shortRecoveryStatus");
  }
  return v4;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (NSDictionary)afDriverShortStatistics
{
  return self->_afDriverShortStatistics;
}

- (void)setAfDriverShortStatistics:(id)a3
{
}

@end