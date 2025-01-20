@interface CLSManagedBusinessItem
+ (NSString)entityName;
- (int64_t)venueCapacity;
- (void)setVenueCapacity:(int64_t)a3;
@end

@implementation CLSManagedBusinessItem

+ (NSString)entityName
{
  return (NSString *)@"BusinessItem";
}

- (void)setVenueCapacity:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CLSManagedBusinessItem *)self setVenueCapacityAsNumber:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CLSManagedBusinessItem *)self setVenueCapacityAsNumber:v4];
  }
}

- (int64_t)venueCapacity
{
  v2 = [(CLSManagedBusinessItem *)self venueCapacityAsNumber];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

@end