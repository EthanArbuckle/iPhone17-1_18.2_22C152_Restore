@interface BBDismissalItem
- (BBDismissalItem)initWithFeeds:(unint64_t)a3;
- (BOOL)hasExpired;
- (NSDate)expiration;
- (id)description;
- (unint64_t)feeds;
- (void)addFeeds:(unint64_t)a3;
@end

@implementation BBDismissalItem

- (BBDismissalItem)initWithFeeds:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BBDismissalItem;
  v3 = [(BBDismissalItem *)&v7 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:120.0];
    expiration = v3->_expiration;
    v3->_expiration = (NSDate *)v4;
  }
  return v3;
}

- (void)addFeeds:(unint64_t)a3
{
  self->_feeds |= a3;
}

- (BOOL)hasExpired
{
  v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [(BBDismissalItem *)self expiration];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 >= 0.0;

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; feeds:%lu; expiration:%@>",
               objc_opt_class(),
               self,
               self->_feeds,
               self->_expiration);
}

- (unint64_t)feeds
{
  return self->_feeds;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void).cxx_destruct
{
}

@end