@interface AVMetricHLSPlaylistRequestEvent
+ (BOOL)supportsSecureCoding;
- (AVMetricHLSPlaylistRequestEvent)initWithCoder:(id)a3;
- (AVMetricHLSPlaylistRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 url:(id)a6 isMultivariantPlaylist:(BOOL)a7 mediaType:(id)a8 mediaResourceRequestEvent:(id)a9;
- (AVMetricMediaResourceRequestEvent)mediaResourceRequestEvent;
- (BOOL)isMultivariantPlaylist;
- (NSString)mediaType;
- (NSURL)url;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricHLSPlaylistRequestEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricHLSPlaylistRequestEvent:%p %@ isMultivariantPlaylist:%d mediaType:%@ mediaResourceRequestEvent:%@>", self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_isMultivariantPlaylist, self->_mediaType, -[AVMetricMediaResourceRequestEvent debugDescription](self->_mediaResourceRequestEvent, "debugDescription")];
}

- (AVMetricHLSPlaylistRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 url:(id)a6 isMultivariantPlaylist:(BOOL)a7 mediaType:(id)a8 mediaResourceRequestEvent:(id)a9
{
  v14.receiver = self;
  v14.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  v11 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v14, sel_initWithDate_mediaTime_sessionID_, a3, &v13, a5, a6);
  if (v11)
  {
    v11->_mediaResourceRequestEvent = (AVMetricMediaResourceRequestEvent *)a9;
    v11->_isMultivariantPlaylist = a7;
    v11->_mediaType = (NSString *)a8;
  }
  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isMultivariantPlaylist
{
  return self->_isMultivariantPlaylist;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (AVMetricMediaResourceRequestEvent)mediaResourceRequestEvent
{
  return self->_mediaResourceRequestEvent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeBool:self->_isMultivariantPlaylist forKey:@"isMultivariantPlaylist"];
  [a3 encodeObject:self->_mediaType forKey:@"mediaType"];
}

- (AVMetricHLSPlaylistRequestEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_isMultivariantPlaylist = [a3 decodeBoolForKey:@"isMultivariantPlaylist"];
    v4->_mediaType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
  }
  return v4;
}

@end