@interface NSUserDefaults
- (BOOL)ShowWeekNumbers;
- (void)setShowWeekNumbers:(BOOL)a3;
@end

@implementation NSUserDefaults

- (void)setShowWeekNumbers:(BOOL)a3
{
}

- (BOOL)ShowWeekNumbers
{
  return [(NSUserDefaults *)self BOOLForKey:@"ShowWeekNumbers"];
}

@end