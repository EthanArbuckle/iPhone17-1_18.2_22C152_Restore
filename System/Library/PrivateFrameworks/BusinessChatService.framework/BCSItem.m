@interface BCSItem
- (BCSItem)init;
- (BOOL)isExpired;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSDate)expirationDate;
- (NSObject)itemIdentifier;
- (int64_t)truncatedHash;
- (int64_t)type;
- (void)setExpirationDate:(id)a3;
@end

@implementation BCSItem

- (BCSItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)BCSItem;
  v2 = [(BCSItem *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF910] distantPast];
    [(BCSItem *)v2 setExpirationDate:v3];
  }
  return v2;
}

- (BOOL)isExpired
{
  v2 = [(BCSItem *)self expirationDate];
  v3 = [MEMORY[0x263EFF910] date];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (NSObject)itemIdentifier
{
  return 0;
}

- (int64_t)truncatedHash
{
  return 0;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  return 0;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end