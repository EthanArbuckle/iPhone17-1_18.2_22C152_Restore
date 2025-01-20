@interface _LTRateLimiter
- (BOOL)allowedForRequests:(unint64_t)a3;
- (_LTRateLimiter)initWithMaximumPageLoadRequest:(unint64_t)a3 maximumDynamicContentRequests:(int64_t)a4;
- (unint64_t)maximumDynamicContentRequests;
- (unint64_t)maximumPageLoadRequests;
- (void)markPageLoaded;
- (void)setMaximumDynamicContentRequests:(unint64_t)a3;
- (void)setMaximumPageLoadRequests:(unint64_t)a3;
@end

@implementation _LTRateLimiter

- (_LTRateLimiter)initWithMaximumPageLoadRequest:(unint64_t)a3 maximumDynamicContentRequests:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_LTRateLimiter;
  v6 = [(_LTRateLimiter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_maximumPageLoadRequests = a3;
    v6->_maximumDynamicContentRequests = a4;
    v6->_pageLoaded = 0;
    v6->_count = 0;
    v8 = v6;
  }

  return v7;
}

- (BOOL)allowedForRequests:(unint64_t)a3
{
  uint64_t v3 = 32;
  if (!self->_pageLoaded) {
    uint64_t v3 = 24;
  }
  unint64_t v4 = *(unint64_t *)((char *)&self->super.isa + v3);
  unint64_t v5 = self->_count + a3;
  self->_count = v5;
  return v5 < v4;
}

- (void)markPageLoaded
{
  self->_pageLoaded = 1;
  self->_count = 0;
}

- (unint64_t)maximumPageLoadRequests
{
  return self->_maximumPageLoadRequests;
}

- (void)setMaximumPageLoadRequests:(unint64_t)a3
{
  self->_maximumPageLoadRequests = a3;
}

- (unint64_t)maximumDynamicContentRequests
{
  return self->_maximumDynamicContentRequests;
}

- (void)setMaximumDynamicContentRequests:(unint64_t)a3
{
  self->_maximumDynamicContentRequests = a3;
}

@end