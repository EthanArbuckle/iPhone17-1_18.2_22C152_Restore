@interface _GEOThrottledTicket
+ (id)ticket:(id)a3 withHandler:(id)a4;
- (GEOMapServiceThrottlableTicket)ticket;
- (double)safeTime;
- (id)submissionHandler;
- (unsigned)qos;
- (void)setQos:(unsigned int)a3;
- (void)setSafeTime:(double)a3;
- (void)setSubmissionHandler:(id)a3;
- (void)setTicket:(id)a3;
@end

@implementation _GEOThrottledTicket

+ (id)ticket:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v8)
  {
    [v8 setTicket:v6];
    [v9 setSubmissionHandler:v7];
    [v9 setQos:qos_class_self()];
    [v9 setSafeTime:0.0];
  }

  return v9;
}

- (GEOMapServiceThrottlableTicket)ticket
{
  return self->ticket;
}

- (void)setTicket:(id)a3
{
}

- (id)submissionHandler
{
  return self->submissionHandler;
}

- (void)setSubmissionHandler:(id)a3
{
}

- (unsigned)qos
{
  return self->qos;
}

- (void)setQos:(unsigned int)a3
{
  self->qos = a3;
}

- (double)safeTime
{
  return self->safeTime;
}

- (void)setSafeTime:(double)a3
{
  self->safeTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->submissionHandler, 0);

  objc_storeStrong((id *)&self->ticket, 0);
}

@end