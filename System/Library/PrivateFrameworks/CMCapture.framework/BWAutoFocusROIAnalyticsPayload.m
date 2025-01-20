@interface BWAutoFocusROIAnalyticsPayload
- (BWAutoFocusROIAnalyticsPayload)init;
- (NSDictionary)focusRegion;
- (NSString)clientApplicationID;
- (NSString)portType;
- (float)subjectDistance;
- (id)eventDictionary;
- (id)eventName;
- (int)focusRegionType;
- (int)luxLevel;
- (void)dealloc;
- (void)reset;
- (void)setClientApplicationID:(id)a3;
- (void)setFocusRegion:(id)a3;
- (void)setFocusRegionType:(int)a3;
- (void)setLuxLevel:(int)a3;
- (void)setPortType:(id)a3;
- (void)setSubjectDistance:(float)a3;
@end

@implementation BWAutoFocusROIAnalyticsPayload

- (BWAutoFocusROIAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWAutoFocusROIAnalyticsPayload;
  v2 = [(BWAutoFocusROIAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWAutoFocusROIAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAutoFocusROIAnalyticsPayload;
  [(BWAutoFocusROIAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_portType = 0;
  self->_focusRegion = 0;

  self->_clientApplicationID = 0;
  *(void *)&self->_focusRegionType = 0x7FFFFFFF00000000;
  self->_subjectDistance = 3.4028e38;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.AutoFocusROI";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  portType = self->_portType;
  if (portType) {
    [v3 setObject:portType forKeyedSubscript:@"portType"];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_focusRegionType), @"focusRegionType");
  focusRegion = self->_focusRegion;
  if (focusRegion)
  {
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v15.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v15.size = v7;
    if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)focusRegion, &v15)
      && !CGRectIsNull(v15)
      && !CGRectIsEmpty(v15))
    {
      LODWORD(v8) = vcvtd_n_u64_f64(v15.origin.x, 4uLL);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8), @"focusRegionX");
      LODWORD(v9) = vcvtd_n_u64_f64(v15.origin.y, 4uLL);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9), @"focusRegionY");
      float v10 = v15.size.width * 16.0;
      LODWORD(v11) = vcvtps_u32_f32(v10);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11), @"focusRegionWidth");
      float v12 = v15.size.height * 16.0;
      LODWORD(v13) = vcvtps_u32_f32(v12);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13), @"focusRegionHeight");
    }
  }
  if (self->_luxLevel != 0x7FFFFFFF) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"luxLevel");
  }
  if (self->_subjectDistance != 3.4028e38) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"subjectDistance");
  }
  if (self->_clientApplicationID) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:")), @"clientIDType");
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

- (int)focusRegionType
{
  return self->_focusRegionType;
}

- (void)setFocusRegionType:(int)a3
{
  self->_focusRegionType = a3;
}

- (NSDictionary)focusRegion
{
  return self->_focusRegion;
}

- (void)setFocusRegion:(id)a3
{
}

- (int)luxLevel
{
  return self->_luxLevel;
}

- (void)setLuxLevel:(int)a3
{
  self->_luxLevel = a3;
}

- (float)subjectDistance
{
  return self->_subjectDistance;
}

- (void)setSubjectDistance:(float)a3
{
  self->_subjectDistance = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

@end