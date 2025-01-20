@interface INMediaUserContext
+ (BOOL)supportsSecureCoding;
+ (id)_sharedFormatter;
+ (int64_t)_type;
- (INMediaUserContext)init;
- (INMediaUserContext)initWithCoder:(id)a3;
- (INMediaUserContextSubscriptionStatus)subscriptionStatus;
- (NSNumber)numberOfLibraryItems;
- (id)safeLibraryItems;
- (void)encodeWithCoder:(id)a3;
- (void)setNumberOfLibraryItems:(NSNumber *)numberOfLibraryItems;
- (void)setSubscriptionStatus:(INMediaUserContextSubscriptionStatus)subscriptionStatus;
@end

@implementation INMediaUserContext

- (void).cxx_destruct
{
}

- (void)setNumberOfLibraryItems:(NSNumber *)numberOfLibraryItems
{
}

- (NSNumber)numberOfLibraryItems
{
  return self->_numberOfLibraryItems;
}

- (void)setSubscriptionStatus:(INMediaUserContextSubscriptionStatus)subscriptionStatus
{
  self->_subscriptionStatus = subscriptionStatus;
}

- (INMediaUserContextSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (id)safeLibraryItems
{
  v3 = [(INMediaUserContext *)self numberOfLibraryItems];

  if (v3)
  {
    v4 = +[INMediaUserContext _sharedFormatter];
    v5 = [v4 stringFromNumber:self->_numberOfLibraryItems];

    v6 = +[INMediaUserContext _sharedFormatter];
    v7 = [v6 numberFromString:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (INMediaUserContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INMediaUserContext;
  v5 = [(INUserContext *)&v9 _init];
  if (v5)
  {
    v5->_subscriptionStatus = (int)[v4 decodeIntForKey:@"SubscriptionStatus"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NumberOfLibraryItems"];
    numberOfLibraryItems = v5->_numberOfLibraryItems;
    v5->_numberOfLibraryItems = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t subscriptionStatus = self->_subscriptionStatus;
  id v5 = a3;
  [v5 encodeInteger:subscriptionStatus forKey:@"SubscriptionStatus"];
  id v6 = [(INMediaUserContext *)self safeLibraryItems];
  [v5 encodeObject:v6 forKey:@"NumberOfLibraryItems"];
}

- (INMediaUserContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)INMediaUserContext;
  return (INMediaUserContext *)[(INUserContext *)&v3 _init];
}

+ (id)_sharedFormatter
{
  if (_sharedFormatter_onceToken != -1) {
    dispatch_once(&_sharedFormatter_onceToken, &__block_literal_global_7384);
  }
  v2 = (void *)_sharedFormatter_sharedFormatter;

  return v2;
}

uint64_t __38__INMediaUserContext__sharedFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_sharedFormatter_sharedFormatter;
  _sharedFormatter_sharedFormatter = (uint64_t)v0;

  [(id)_sharedFormatter_sharedFormatter setUsesSignificantDigits:1];
  [(id)_sharedFormatter_sharedFormatter setMaximumSignificantDigits:2];
  [(id)_sharedFormatter_sharedFormatter setMaximumFractionDigits:0];
  v2 = (void *)_sharedFormatter_sharedFormatter;

  return [v2 setGeneratesDecimalNumbers:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_type
{
  return 1;
}

@end