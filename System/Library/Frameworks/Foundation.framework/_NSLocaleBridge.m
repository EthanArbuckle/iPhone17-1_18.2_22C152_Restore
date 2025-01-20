@interface _NSLocaleBridge
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)_prefForKey:(id)a3;
- (id)localizedStringForCurrencySymbol:(id)a3;
@end

@implementation _NSLocaleBridge

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)_prefForKey:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_NSLocaleBridge;
  return [(_NSLocaleBridge *)&v4 _prefForKey:a3];
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  return 0;
}

@end