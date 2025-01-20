@interface CMViewObstructedStateEvent
- (BOOL)shouldSuppress;
- (CMViewObstructedStateEvent)initWithShouldSupress:(BOOL)a3 currentState:(unsigned __int8)a4 orientation:(id)a5 motionType:(id)a6 lux:(float)a7 pocketProbability:(float)a8 meanProbabilitiesFloatArray:(id)a9;
- (NSArray)meanProbabilities;
- (NSString)motionType;
- (NSString)orientation;
- (float)lux;
- (float)pocketProbability;
- (id)description;
- (unsigned)currentState;
- (void)dealloc;
- (void)setCurrentState:(unsigned __int8)a3;
- (void)setLux:(float)a3;
- (void)setMeanProbabilities:(id)a3;
- (void)setMotionType:(id)a3;
- (void)setOrientation:(id)a3;
- (void)setPocketProbability:(float)a3;
- (void)setShouldSuppress:(BOOL)a3;
@end

@implementation CMViewObstructedStateEvent

- (CMViewObstructedStateEvent)initWithShouldSupress:(BOOL)a3 currentState:(unsigned __int8)a4 orientation:(id)a5 motionType:(id)a6 lux:(float)a7 pocketProbability:(float)a8 meanProbabilitiesFloatArray:(id)a9
{
  uint64_t v14 = a4;
  BOOL v15 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CMViewObstructedStateEvent;
  v16 = [(CMViewObstructedStateEvent *)&v30 init];
  v18 = v16;
  if (v16)
  {
    objc_msgSend_setShouldSuppress_(v16, v17, v15);
    objc_msgSend_setCurrentState_(v18, v19, v14);
    objc_msgSend_setOrientation_(v18, v20, (uint64_t)a5);
    objc_msgSend_setMotionType_(v18, v21, (uint64_t)a6);
    *(float *)&double v22 = a7;
    objc_msgSend_setLux_(v18, v23, v24, v22);
    *(float *)&double v25 = a8;
    objc_msgSend_setPocketProbability_(v18, v26, v27, v25);
    objc_msgSend_setMeanProbabilities_(v18, v28, (uint64_t)a9);
  }
  return v18;
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"[");
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  meanProbabilities = self->_meanProbabilities;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(meanProbabilities, v5, (uint64_t)&v22, v26, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(meanProbabilities);
        }
        objc_msgSend_floatValue(*(void **)(*((void *)&v22 + 1) + 8 * i), v7, v8);
        v3 = objc_msgSend_stringByAppendingFormat_(v3, v13, @"%f,", v12);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(meanProbabilities, v7, (uint64_t)&v22, v26, 16);
    }
    while (v9);
  }
  uint64_t v14 = objc_msgSend_length(v3, v7, v8);
  uint64_t v16 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v3, v15, v14 - 1, 1, @"]");
  v17 = NSString;
  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  return (id)objc_msgSend_stringWithFormat_(v17, v20, @"%@ shouldSuppress=%u,CurrentState=%u,Orientation=%@,MotionType=%@,Lux=%f,PocketProbability=%f,MeanProbabilities=%@", v19, self->_shouldSuppress, self->_currentState, self->_orientation, self->_motionType, self->_lux, self->_pocketProbability, v16);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMViewObstructedStateEvent;
  [(CMViewObstructedStateEvent *)&v3 dealloc];
}

- (BOOL)shouldSuppress
{
  return self->_shouldSuppress;
}

- (void)setShouldSuppress:(BOOL)a3
{
  self->_shouldSuppress = a3;
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unsigned __int8)a3
{
  self->_currentState = a3;
}

- (NSString)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(id)a3
{
}

- (NSString)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(id)a3
{
}

- (float)lux
{
  return self->_lux;
}

- (void)setLux:(float)a3
{
  self->_lux = a3;
}

- (float)pocketProbability
{
  return self->_pocketProbability;
}

- (void)setPocketProbability:(float)a3
{
  self->_pocketProbability = a3;
}

- (NSArray)meanProbabilities
{
  return self->_meanProbabilities;
}

- (void)setMeanProbabilities:(id)a3
{
}

@end