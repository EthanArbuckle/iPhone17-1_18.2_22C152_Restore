@interface GEOAbstractTicket
- (BOOL)isCancelled;
- (GEOAbstractTicket)init;
- (GEOAbstractTicket)initWithTraits:(id)a3;
- (GEOMapServiceTraits)traits;
- (id)description;
- (unint64_t)cachePolicy;
- (void)cancel;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setThrottlerToken:(id)a3;
@end

@implementation GEOAbstractTicket

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlerToken, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (GEOAbstractTicket)initWithTraits:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAbstractTicket;
  v6 = [(GEOAbstractTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_traits, a3);
  }

  return v7;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL cancelled = 1;
  objc_sync_exit(obj);
}

- (GEOAbstractTicket)init
{
  result = (GEOAbstractTicket *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAbstractTicket;
  v4 = [(GEOAbstractTicket *)&v8 description];
  id v5 = [(GEOMapServiceTraits *)self->_traits formattedText];
  v6 = [v3 stringWithFormat:@"%@ traits: %@ ", v4, v5];

  return v6;
}

- (void)setThrottlerToken:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

@end