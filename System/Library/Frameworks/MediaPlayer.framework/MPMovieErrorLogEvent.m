@interface MPMovieErrorLogEvent
- (NSDate)date;
- (NSInteger)errorStatusCode;
- (NSString)URI;
- (NSString)errorComment;
- (NSString)errorDomain;
- (NSString)playbackSessionID;
- (NSString)serverAddress;
- (id)_initWithAVItemErrorLogEvent:(id)a3;
@end

@implementation MPMovieErrorLogEvent

- (void).cxx_destruct
{
}

- (NSString)errorComment
{
  return [(AVPlayerItemErrorLogEvent *)self->_event errorComment];
}

- (NSString)errorDomain
{
  return [(AVPlayerItemErrorLogEvent *)self->_event errorDomain];
}

- (NSInteger)errorStatusCode
{
  return [(AVPlayerItemErrorLogEvent *)self->_event errorStatusCode];
}

- (NSString)playbackSessionID
{
  return [(AVPlayerItemErrorLogEvent *)self->_event playbackSessionID];
}

- (NSString)serverAddress
{
  return [(AVPlayerItemErrorLogEvent *)self->_event serverAddress];
}

- (NSString)URI
{
  return [(AVPlayerItemErrorLogEvent *)self->_event URI];
}

- (NSDate)date
{
  return [(AVPlayerItemErrorLogEvent *)self->_event date];
}

- (id)_initWithAVItemErrorLogEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMovieErrorLogEvent;
  v6 = [(MPMovieErrorLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

@end