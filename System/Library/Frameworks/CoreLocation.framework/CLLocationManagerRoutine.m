@interface CLLocationManagerRoutine
- (CLInertialDataManagerDelegate)inertialDelegate;
- (CLLocationManagerDelegate)delegate;
- (CLLocationManagerRoutine)init;
- (CLLocationManagerRoutine)initWithQueue:(id)a3;
- (_CLLocationManagerRoutineProxy)locationManagerRoutineProxy;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setInertialDelegate:(id)a3;
- (void)setLocationManagerRoutineProxy:(id)a3;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;
@end

@implementation CLLocationManagerRoutine

- (CLLocationManagerRoutine)init
{
  v3 = dispatch_queue_create((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"_CLLocationManagerRoutineProxy, %p", self), "UTF8String"], 0);
  v4 = [(CLLocationManagerRoutine *)self initWithQueue:v3];
  dispatch_release(v3);
  return v4;
}

- (CLLocationManagerRoutine)initWithQueue:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CLLocationManagerRoutine;
    v4 = [(CLLocationManagerRoutine *)&v6 init];
    if (v4) {
      v4->_locationManagerRoutineProxy = [[_CLLocationManagerRoutineProxy alloc] initWithQueue:a3 locationManagerRoutine:v4];
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManagerRoutine.m", 219, @"Invalid parameter not satisfying: %@", @"queue");
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationManagerRoutine;
  [(CLLocationManagerRoutine *)&v3 dealloc];
}

- (void)startUpdatingLocation
{
  v4 = [(CLLocationManagerRoutine *)self locationManagerRoutineProxy][8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1906F63B4;
  v5[3] = &unk_1E5696F38;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

- (void)stopUpdatingLocation
{
  objc_super v3 = [(CLLocationManagerRoutine *)self locationManagerRoutineProxy][8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1906F64C8;
  block[3] = &unk_1E5696BF0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setDelegate:(id)a3
{
  v5 = [(CLLocationManagerRoutine *)self locationManagerRoutineProxy][8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1906F659C;
  v6[3] = &unk_1E5696EE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (CLLocationManagerDelegate)delegate
{
  v2 = [(CLLocationManagerRoutine *)self locationManagerRoutineProxy];

  return (CLLocationManagerDelegate *)[(_CLLocationManagerRoutineProxy *)v2 delegate];
}

- (void)setInertialDelegate:(id)a3
{
  v5 = [(CLLocationManagerRoutine *)self locationManagerRoutineProxy][8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1906F6684;
  v6[3] = &unk_1E5696EE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (CLInertialDataManagerDelegate)inertialDelegate
{
  v2 = [(CLLocationManagerRoutine *)self locationManagerRoutineProxy];

  return (CLInertialDataManagerDelegate *)[(_CLLocationManagerRoutineProxy *)v2 inertialDelegate];
}

- (_CLLocationManagerRoutineProxy)locationManagerRoutineProxy
{
  return self->_locationManagerRoutineProxy;
}

- (void)setLocationManagerRoutineProxy:(id)a3
{
}

@end