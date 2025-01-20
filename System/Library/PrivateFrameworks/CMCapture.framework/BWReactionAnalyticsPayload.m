@interface BWReactionAnalyticsPayload
- (BOOL)uiTriggeredReaction;
- (BWReactionAnalyticsPayload)init;
- (NSString)clientApplicationID;
- (NSString)reactionType;
- (id)eventDictionary;
- (id)eventName;
- (int)continuityCameraClientDeviceClass;
- (void)dealloc;
- (void)reset;
- (void)setClientApplicationID:(id)a3;
- (void)setContinuityCameraClientDeviceClass:(int)a3;
- (void)setReactionType:(id)a3;
- (void)setUiTriggeredReaction:(BOOL)a3;
@end

@implementation BWReactionAnalyticsPayload

- (BWReactionAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWReactionAnalyticsPayload;
  v2 = [(BWReactionAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWReactionAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWReactionAnalyticsPayload;
  [(BWReactionAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_reactionType = 0;
  self->_uiTriggeredReaction = 0;

  self->_clientApplicationID = 0;
  self->_continuityCameraClientDeviceClass = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.Reaction";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_reactionType forKeyedSubscript:@"reactionType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_uiTriggeredReaction), @"uiTriggeredReaction");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  [v3 setObject:self->_clientApplicationID forKeyedSubscript:@"clientApplicationID"];
  int continuityCameraClientDeviceClass = self->_continuityCameraClientDeviceClass;
  objc_super v5 = @"AppleTV";
  if (continuityCameraClientDeviceClass != 4) {
    objc_super v5 = 0;
  }
  if (continuityCameraClientDeviceClass == 100) {
    v6 = @"Mac";
  }
  else {
    v6 = v5;
  }
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"continuityCameraClientDeviceClass"];
  }
  return v3;
}

- (NSString)reactionType
{
  return self->_reactionType;
}

- (void)setReactionType:(id)a3
{
}

- (BOOL)uiTriggeredReaction
{
  return self->_uiTriggeredReaction;
}

- (void)setUiTriggeredReaction:(BOOL)a3
{
  self->_uiTriggeredReaction = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_int continuityCameraClientDeviceClass = a3;
}

@end