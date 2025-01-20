@interface CPAggregateDictionary
+ (id)sharedAggregateDictionary;
- (BOOL)isEnabled;
- (int)commit;
- (void)addValue:(int64_t)a3 forKey:(id)a4;
- (void)clearDistributionKey:(id)a3;
- (void)clearScalarKey:(id)a3;
- (void)decrementKey:(id)a3;
- (void)incrementKey:(id)a3;
- (void)pushValue:(double)a3 forKey:(id)a4;
- (void)setValue:(double)a3 forDistributionKey:(id)a4;
- (void)setValue:(int64_t)a3 forScalarKey:(id)a4;
- (void)significantTimeChanged;
- (void)subtractValue:(int64_t)a3 forKey:(id)a4;
@end

@implementation CPAggregateDictionary

+ (id)sharedAggregateDictionary
{
  return (id)__aggregateDictionary;
}

- (void)significantTimeChanged
{
}

- (int)commit
{
  return __ADClientCommit();
}

- (void)clearScalarKey:(id)a3
{
}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
}

- (void)incrementKey:(id)a3
{
}

- (void)decrementKey:(id)a3
{
}

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
}

- (void)subtractValue:(int64_t)a3 forKey:(id)a4
{
}

- (void)clearDistributionKey:(id)a3
{
}

- (void)setValue:(double)a3 forDistributionKey:(id)a4
{
}

- (void)pushValue:(double)a3 forKey:(id)a4
{
}

- (BOOL)isEnabled
{
  return 1;
}

@end