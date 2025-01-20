@interface GTMTLTelemetryService
- (GTMTLTelemetryService)initWithGuestApp:(GTMTLGuestAppClient *)a3;
- (id)query:(id)a3;
- (id)update:(id)a3;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)notifyStatistics:(id)a3;
@end

@implementation GTMTLTelemetryService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)notifyStatistics:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  observers = self->_observers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __42__GTMTLTelemetryService_notifyStatistics___block_invoke;
  v8[3] = &unk_221AA0;
  id v9 = v4;
  id v7 = v4;
  [(GTObservableService *)observers notifyAll:v8];
  pthread_mutex_unlock(p_lock);
}

id __42__GTMTLTelemetryService_notifyStatistics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notifyStatistics:*(void *)(a1 + 32)];
}

- (id)update:(id)a3
{
  id v3 = a3;
  id v29 = [v3 requestID];
  id v4 = objc_alloc((Class)NSMutableArray);
  v5 = [v3 requests];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = [v3 requests];
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    uint64_t v31 = GTTelemetryErrorDomain;
    do
    {
      v10 = objc_msgSend(v3, "requests", v29);
      v11 = [v10 objectAtIndexedSubscript:v9];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        id v13 = [v12 requestID];
        v14 = [v12 configuration];
        [v14 reportFrequencyInSeconds];
        GT_TELEMETRY_ENV = v15;

        if (*(float *)&GT_TELEMETRY_ENV != INFINITY) {
          dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, (unint64_t)(float)(*(float *)&GT_TELEMETRY_ENV * 1000000000.0), 0);
        }
        id v16 = objc_alloc_init((Class)GTTelemetryResponse);
        [v16 setRequestID:v13];
        id v33 = 0;
        v17 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanTrue requiringSecureCoding:1 error:&v33];
        id v18 = v33;
        [v16 setData:v17];

        [v16 setError:v18];
        [v6 setObject:v16 atIndexedSubscript:v9];
      }
      else
      {
        id v12 = objc_alloc_init((Class)GTTelemetryResponse);
        objc_msgSend(v12, "setRequestID:", objc_msgSend(v11, "requestID"));
        NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
        CFStringRef v35 = @"unknown request";
        v19 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v20 = +[NSError errorWithDomain:v31 code:1 userInfo:v19];
        [v12 setError:v20];

        [v6 setObject:v12 atIndexedSubscript:v9];
      }

      ++v9;
      v21 = [v3 requests];
      id v22 = [v21 count];
    }
    while ((unint64_t)v22 > v9);
  }
  v23 = objc_opt_new();
  id v24 = [v6 copy];
  id v32 = 0;
  v25 = +[NSKeyedArchiver archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v32];
  id v26 = v32;
  [v23 setData:v25];

  [v23 setError:v26];
  [v23 setRequestID:v29];
  v27 = [v3 completionHandler];
  ((void (**)(void, void *))v27)[2](v27, v23);

  return 0;
}

- (id)query:(id)a3
{
  id v3 = a3;
  id v31 = [v3 requestID];
  id v4 = objc_alloc((Class)NSMutableArray);
  v5 = [v3 requests];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = [v3 requests];
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    uint64_t v32 = GTTelemetryErrorDomain;
    do
    {
      v10 = [v3 requests];
      v11 = [v10 objectAtIndexedSubscript:v9];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v11 requestID];
        GTMTLGuestAppClient_getTelemetry((uint64_t)v12, v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = objc_alloc_init((Class)GTTelemetryResponse);
        [v15 setRequestID:v12];
        CFStringRef v35 = 0;
        id v16 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v35];
        v17 = v35;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v14 = objc_alloc_init((Class)GTTelemetryResponse);
          objc_msgSend(v14, "setRequestID:", objc_msgSend(v11, "requestID"));
          NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
          CFStringRef v37 = @"unknown request";
          v21 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          id v22 = +[NSError errorWithDomain:v32 code:1 userInfo:v21];
          [v14 setError:v22];

          [v6 setObject:v14 atIndexedSubscript:v9];
          goto LABEL_9;
        }
        id v18 = [v11 requestID];
        id v14 = (id)objc_opt_new();
        LODWORD(v19) = GT_TELEMETRY_ENV;
        [v14 setReportFrequencyInSeconds:v19];
        id v15 = objc_alloc_init((Class)GTTelemetryResponse);
        [v15 setRequestID:v18];
        NSErrorUserInfoKey v34 = 0;
        id v16 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v34];
        v17 = v34;
      }
      id v20 = v17;
      [v15 setData:v16];

      [v15 setError:v20];
      [v6 setObject:v15 atIndexedSubscript:v9];

LABEL_9:
      ++v9;
      v23 = [v3 requests];
      id v24 = [v23 count];
    }
    while ((unint64_t)v24 > v9);
  }
  v25 = objc_opt_new();
  id v26 = [v6 copy];
  id v33 = 0;
  v27 = +[NSKeyedArchiver archivedDataWithRootObject:v26 requiringSecureCoding:1 error:&v33];
  id v28 = v33;
  [v25 setData:v27];

  [v25 setError:v28];
  [v25 setRequestID:v31];
  id v29 = [v3 completionHandler];
  ((void (**)(void, void *))v29)[2](v29, v25);

  return 0;
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  pthread_mutex_lock(&self->_lock);
  if ([(GTObservableService *)self->_observers count])
  {
    [(GTObservableService *)self->_observers deregisterObserversForConnection:v7 path:v6];
    if (![(GTObservableService *)self->_observers count]) {
      dispatch_suspend((dispatch_object_t)self->_timer);
    }
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)deregisterObserver:(unint64_t)a3
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(GTObservableService *)self->_observers deregisterObserver:a3];
  if (![(GTObservableService *)self->_observers count]) {
    dispatch_suspend((dispatch_object_t)self->_timer);
  }

  pthread_mutex_unlock(p_lock);
}

- (unint64_t)registerObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  id v6 = [(GTObservableService *)self->_observers registerObserver:v5];

  if ([(GTObservableService *)self->_observers count] == (char *)&def_CFBEC + 1) {
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  pthread_mutex_unlock(p_lock);
  return (unint64_t)v6;
}

- (GTMTLTelemetryService)initWithGuestApp:(GTMTLGuestAppClient *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GTMTLTelemetryService;
  id v3 = [(GTMTLTelemetryService *)&v16 init];
  if (v3)
  {
    os_log_t v4 = os_log_create("com.apple.gputools.transport", "TelemetryService");
    id v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    id v6 = *((void *)v3 + 1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v15 = 0;
      _os_log_debug_impl(&def_CFBEC, v6, OS_LOG_TYPE_DEBUG, "Create Telemetry Service", v15, 2u);
    }
    pthread_mutex_init((pthread_mutex_t *)(v3 + 24), 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.app.gputools.telemetry", 0);
    id v8 = (void *)*((void *)v3 + 11);
    *((void *)v3 + 11) = v7;

    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v3 + 11));
    v10 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v9;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v3 + 12), &__block_literal_global_125);
    if (*(float *)&GT_TELEMETRY_ENV == INFINITY) {
      uint64_t v11 = 5000000;
    }
    else {
      uint64_t v11 = (unint64_t)(float)(*(float *)&GT_TELEMETRY_ENV * 1000000000.0);
    }
    dispatch_source_set_timer(*((dispatch_source_t *)v3 + 12), 0, v11, 0);
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v12;
  }
  return (GTMTLTelemetryService *)v3;
}

@end