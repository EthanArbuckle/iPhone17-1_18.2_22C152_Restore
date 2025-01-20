@interface MKLocationManagerSingleUpdater
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5;
- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5 timeout:(double)a6;
- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5 timeout:(double)a6 maxLocationAge:(double)a7;
- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 handler:(id)a4;
- (double)timeout;
- (id)handler;
- (void)cancel;
- (void)dealloc;
- (void)handleTimeout:(id)a3;
- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setHandler:(id)a3;
- (void)setTimeout:(double)a3;
- (void)start;
@end

@implementation MKLocationManagerSingleUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)start
{
  if (!self->_active)
  {
    objc_storeStrong((id *)&self->_selfReference, self);
    self->_active = 1;
    [(MKLocationManagerSingleUpdater *)self timeout];
    if (v3 > 0.0)
    {
      v4 = (void *)MEMORY[0x1E4F1CB00];
      [(MKLocationManagerSingleUpdater *)self timeout];
      objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_handleTimeout_, 0, 0);
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timeoutTimer = self->_timeoutTimer;
      self->_timeoutTimer = v5;
    }
    locationManager = self->_locationManager;
    double desiredAccuracy = self->_desiredAccuracy;
    [(MKLocationManager *)locationManager _startLocationUpdateWithObserver:self desiredAccuracy:desiredAccuracy];
  }
}

- (double)timeout
{
  return self->_timeout;
}

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 handler:(id)a4
{
  return [(MKLocationManagerSingleUpdater *)self initWithLocationManager:a3 desiredAccuracy:a4 handler:*MEMORY[0x1E4F1E6D8]];
}

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  GEOConfigGetDouble();
  v11 = [(MKLocationManagerSingleUpdater *)self initWithLocationManager:v9 desiredAccuracy:v8 handler:a4 timeout:v10];

  return v11;
}

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5 timeout:(double)a6
{
  return [(MKLocationManagerSingleUpdater *)self initWithLocationManager:a3 desiredAccuracy:a5 handler:a4 timeout:a6 maxLocationAge:-1.0];
}

- (void)dealloc
{
  [(MKLocationManagerSingleUpdater *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MKLocationManagerSingleUpdater;
  [(MKLocationManagerSingleUpdater *)&v3 dealloc];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  uint64_t v4 = [a3 lastLocation];
  v5 = (void *)v4;
  if (v4)
  {
    v11 = (void *)v4;
    if (self->_maxLocationAge <= 0.0) {
      goto LABEL_4;
    }
    v6 = [MEMORY[0x1E4F1C9C8] date];
    v7 = [v11 timestamp];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    v5 = v11;
    if (v9 <= self->_maxLocationAge)
    {
LABEL_4:
      handler = (void (**)(id, void *, void))self->_handler;
      if (handler)
      {
        handler[2](handler, v11, 0);
        [(MKLocationManagerSingleUpdater *)self cancel];
        v5 = v11;
      }
    }
  }
}

- (void)cancel
{
  if (self->_active)
  {
    self->_active = 0;
    [(MKLocationManager *)self->_locationManager stopLocationUpdateWithObserver:self];
    [(MKLocationManagerSingleUpdater *)self setHandler:0];
    [(NSTimer *)self->_timeoutTimer invalidate];
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    selfReference = self->_selfReference;
    self->_selfReference = 0;
  }
}

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5 timeout:(double)a6 maxLocationAge:(double)a7
{
  id v12 = a3;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKLocationManagerSingleUpdater;
  v14 = [(MKLocationManagerSingleUpdater *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(MKLocationManagerSingleUpdater *)v14 setHandler:v13];
    v15->_double desiredAccuracy = a4;
    if (!v12)
    {
      id v12 = +[MKLocationManager sharedLocationManager];
    }
    objc_storeStrong((id *)&v15->_locationManager, v12);
    v15->_timeout = a6;
    v15->_maxLocationAge = a7;
    v16 = v15;
  }

  return v15;
}

- (void)setHandler:(id)a3
{
}

- (void)handleTimeout:(id)a3
{
  if (self->_handler)
  {
    uint64_t v4 = +[MKLocationManager timeoutError];
    (*((void (**)(void))self->_handler + 2))();
  }

  [(MKLocationManagerSingleUpdater *)self cancel];
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  id v6 = a4;
  if ((objc_msgSend(v6, "_mapkit_isCLLocationUnknown") & 1) == 0)
  {
    handler = (void (**)(id, void, id))self->_handler;
    if (handler)
    {
      handler[2](handler, 0, v6);
      [(MKLocationManagerSingleUpdater *)self cancel];
    }
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (id)handler
{
  return self->_handler;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

@end