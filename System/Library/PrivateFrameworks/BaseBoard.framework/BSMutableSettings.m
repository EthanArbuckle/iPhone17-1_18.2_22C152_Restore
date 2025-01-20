@interface BSMutableSettings
- (BOOL)_isMutable;
- (void)applySettings:(id)a3;
- (void)setFlag:(int64_t)a3 forSetting:(unint64_t)a4;
- (void)setObject:(id)a3 forSetting:(unint64_t)a4;
@end

@implementation BSMutableSettings

- (BOOL)_isMutable
{
  return 1;
}

- (void)setObject:(id)a3 forSetting:(unint64_t)a4
{
}

- (void)setFlag:(int64_t)a3 forSetting:(unint64_t)a4
{
}

- (void)applySettings:(id)a3
{
}

@end