@interface AAFAnalyticsReporter
+ (id)analyticsReporterWithTransport:(id)a3;
- (AAFAnalyticsReporter)initWithTransport:(id)a3;
- (AAFAnalyticsTransport)transport;
- (void)_sendEvent:(id)a3;
- (void)sendEvent:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation AAFAnalyticsReporter

- (AAFAnalyticsReporter)initWithTransport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAFAnalyticsReporter;
  v6 = [(AAFAnalyticsReporter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transport, a3);
  }

  return v7;
}

+ (id)analyticsReporterWithTransport:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithTransport:v4];

  return v5;
}

- (void)sendEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 completeEvent];
  id v5 = _AAFLogSystemAnalytics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 debugDescription];
    objc_super v9 = [(AAFAnalyticsTransport *)self->_transport debugDescription];
    int v10 = 138413058;
    v11 = v6;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1DD937000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Sending event: [%@] with transport: [%@]", (uint8_t *)&v10, 0x2Au);
  }
  [(AAFAnalyticsReporter *)self _sendEvent:v4];
}

- (void)_sendEvent:(id)a3
{
}

- (AAFAnalyticsTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end