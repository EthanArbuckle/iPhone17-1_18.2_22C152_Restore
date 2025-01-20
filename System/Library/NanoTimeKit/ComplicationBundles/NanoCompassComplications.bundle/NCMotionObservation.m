@interface NCMotionObservation
+ (id)observationWithInterval:(double)a3 updateHandler:(id)a4 calibrationHandler:(id)a5;
- (NCMotionObservation)initWithInterval:(double)a3 updateHandler:(id)a4 calibrationHandler:(id)a5;
- (double)updateInterval;
- (id)calibrationHandler;
- (id)updateHandler;
@end

@implementation NCMotionObservation

+ (id)observationWithInterval:(double)a3 updateHandler:(id)a4 calibrationHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc((Class)a1);
  updated = objc_msgSend_initWithInterval_updateHandler_calibrationHandler_(v10, v11, (uint64_t)v9, (uint64_t)v8, a3);

  return updated;
}

- (NCMotionObservation)initWithInterval:(double)a3 updateHandler:(id)a4 calibrationHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NCMotionObservation;
  id v10 = [(NCMotionObservation *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_updateInterval = a3;
    uint64_t v12 = MEMORY[0x237E1C4F0](v8);
    id updateHandler = v11->_updateHandler;
    v11->_id updateHandler = (id)v12;

    uint64_t v14 = MEMORY[0x237E1C4F0](v9);
    id calibrationHandler = v11->_calibrationHandler;
    v11->_id calibrationHandler = (id)v14;
  }
  return v11;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (id)calibrationHandler
{
  return self->_calibrationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calibrationHandler, 0);

  objc_storeStrong(&self->_updateHandler, 0);
}

@end