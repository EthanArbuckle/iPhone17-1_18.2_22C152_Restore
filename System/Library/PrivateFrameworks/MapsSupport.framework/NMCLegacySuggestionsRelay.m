@interface NMCLegacySuggestionsRelay
+ (id)sharedRelay;
- (NMCLegacySuggestionsRelay)init;
- (void)connection:(id)a3 didChangeDeviceNearby:(BOOL)a4;
- (void)dealloc;
@end

@implementation NMCLegacySuggestionsRelay

+ (id)sharedRelay
{
  if (qword_10009B7B8 != -1) {
    dispatch_once(&qword_10009B7B8, &stru_100081FC8);
  }
  v2 = (void *)qword_10009B7B0;

  return v2;
}

- (NMCLegacySuggestionsRelay)init
{
  v9.receiver = self;
  v9.super_class = (Class)NMCLegacySuggestionsRelay;
  v2 = [(NMCLegacySuggestionsRelay *)&v9 init];
  if (v2)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Starting up", v8, 2u);
    }

    v4 = +[NMCGizmoConnection sharedInstance];
    uint64_t v5 = [v4 addMessageObserverForType:55 callback:&stru_100082008];
    id requestObserver = v2->_requestObserver;
    v2->_id requestObserver = (id)v5;

    [v4 addConnectionObserver:v2];
    -[NMCLegacySuggestionsRelay connection:didChangeDeviceNearby:](v2, "connection:didChangeDeviceNearby:", v4, [v4 isNearbyAndUsable]);
  }
  return v2;
}

- (void)connection:(id)a3 didChangeDeviceNearby:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = @"not ";
    if (v4) {
      CFStringRef v6 = &stru_100083E20;
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Device changed nearbyness: %@nearby. But ignoring it.", (uint8_t *)&v7, 0xCu);
  }
}

- (void)dealloc
{
  id requestObserver = self->_requestObserver;
  if (requestObserver)
  {
    BOOL v4 = +[NMCGizmoConnection sharedInstance];
    [v4 removeMessageObserver:self->_requestObserver forType:55];

    id requestObserver = self->_requestObserver;
  }
  self->_id requestObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)NMCLegacySuggestionsRelay;
  [(NMCLegacySuggestionsRelay *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

@end