@interface IDSUTunTimingEventOutgoing
- (IDSUTunTimingEventOutgoing)initWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 sendTime:(double)a7 bytes:(int64_t)a8;
- (double)timestamp;
- (void)appendToString:(id)a3;
@end

@implementation IDSUTunTimingEventOutgoing

- (IDSUTunTimingEventOutgoing)initWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 sendTime:(double)a7 bytes:(int64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)IDSUTunTimingEventOutgoing;
  result = [(IDSUTunTimingEventOutgoing *)&v15 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_duration = a4;
    result->_processTime = a5;
    result->_compressionTime = a6;
    result->_sendTime = a7;
    result->_bytes = a8;
  }
  return result;
}

- (void)appendToString:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

@end