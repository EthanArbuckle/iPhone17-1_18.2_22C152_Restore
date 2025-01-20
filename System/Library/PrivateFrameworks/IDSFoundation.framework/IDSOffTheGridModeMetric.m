@interface IDSOffTheGridModeMetric
- (BOOL)currentNetworkConnectionState;
- (BOOL)currentStewieConnectionState;
- (BOOL)previousNetworkConnectionState;
- (BOOL)previousStewieConnectionState;
- (IDSOffTheGridModeMetric)initWithPreviousMode:(id)a3 currentMode:(id)a4 previousPublishStatus:(id)a5 currentPublishStatus:(id)a6 previousStewieConnectionState:(BOOL)a7 currentStewieConnectionState:(BOOL)a8 previousNetworkConnectionState:(BOOL)a9 currentNetworkConnectionState:(BOOL)a10 duration:(id)a11;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)currentMode;
- (NSNumber)currentPublishStatus;
- (NSNumber)duration;
- (NSNumber)previousMode;
- (NSNumber)previousPublishStatus;
- (NSString)name;
@end

@implementation IDSOffTheGridModeMetric

- (IDSOffTheGridModeMetric)initWithPreviousMode:(id)a3 currentMode:(id)a4 previousPublishStatus:(id)a5 currentPublishStatus:(id)a6 previousStewieConnectionState:(BOOL)a7 currentStewieConnectionState:(BOOL)a8 previousNetworkConnectionState:(BOOL)a9 currentNetworkConnectionState:(BOOL)a10 duration:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v25 = a5;
  id v24 = a6;
  id v19 = a11;
  v26.receiver = self;
  v26.super_class = (Class)IDSOffTheGridModeMetric;
  v20 = [(IDSOffTheGridModeMetric *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_previousMode, a3);
    objc_storeStrong((id *)&v21->_currentMode, a4);
    objc_storeStrong((id *)&v21->_previousPublishStatus, a5);
    objc_storeStrong((id *)&v21->_currentPublishStatus, a6);
    v21->_previousStewieConnectionState = a7;
    v21->_currentStewieConnectionState = a8;
    v21->_previousNetworkConnectionState = a9;
    v21->_currentNetworkConnectionState = a10;
    objc_storeStrong((id *)&v21->_duration, a11);
  }

  return v21;
}

- (NSString)name
{
  return (NSString *)@"OffTheGridMode";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = v3;
  previousMode = self->_previousMode;
  if (previousMode) {
    CFDictionarySetValue(v3, @"previousMode", previousMode);
  }
  currentMode = self->_currentMode;
  if (currentMode) {
    CFDictionarySetValue(v6, @"currentMode", currentMode);
  }
  previousPublishStatus = self->_previousPublishStatus;
  if (previousPublishStatus) {
    CFDictionarySetValue(v6, @"previousPublishStatus", previousPublishStatus);
  }
  currentPublishStatus = self->_currentPublishStatus;
  if (currentPublishStatus) {
    CFDictionarySetValue(v6, @"currentPublishStatus", currentPublishStatus);
  }
  v11 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_previousStewieConnectionState, v5);
  if (v11) {
    CFDictionarySetValue(v6, @"previouslyConnected", v11);
  }

  v14 = objc_msgSend_numberWithBool_(NSNumber, v12, self->_currentStewieConnectionState, v13);
  if (v14) {
    CFDictionarySetValue(v6, @"currentlyConnected", v14);
  }

  id v17 = objc_msgSend_numberWithBool_(NSNumber, v15, self->_previousNetworkConnectionState, v16);
  if (v17) {
    CFDictionarySetValue(v6, @"previousNetworkConnectionState", v17);
  }

  v20 = objc_msgSend_numberWithBool_(NSNumber, v18, self->_currentNetworkConnectionState, v19);
  if (v20) {
    CFDictionarySetValue(v6, @"currentNetworkConnectionState", v20);
  }

  duration = self->_duration;
  if (duration) {
    CFDictionarySetValue(v6, @"duration", duration);
  }
  return (NSDictionary *)v6;
}

- (NSNumber)previousMode
{
  return self->_previousMode;
}

- (NSNumber)currentMode
{
  return self->_currentMode;
}

- (NSNumber)previousPublishStatus
{
  return self->_previousPublishStatus;
}

- (NSNumber)currentPublishStatus
{
  return self->_currentPublishStatus;
}

- (BOOL)previousStewieConnectionState
{
  return self->_previousStewieConnectionState;
}

- (BOOL)currentStewieConnectionState
{
  return self->_currentStewieConnectionState;
}

- (BOOL)previousNetworkConnectionState
{
  return self->_previousNetworkConnectionState;
}

- (BOOL)currentNetworkConnectionState
{
  return self->_currentNetworkConnectionState;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_currentPublishStatus, 0);
  objc_storeStrong((id *)&self->_previousPublishStatus, 0);
  objc_storeStrong((id *)&self->_currentMode, 0);
  objc_storeStrong((id *)&self->_previousMode, 0);
}

@end