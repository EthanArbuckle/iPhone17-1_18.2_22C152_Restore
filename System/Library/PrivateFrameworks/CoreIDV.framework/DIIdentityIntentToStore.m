@interface DIIdentityIntentToStore
+ (DIIdentityIntentToStore)mayStoreIntent;
+ (DIIdentityIntentToStore)willNotStoreIntent;
+ (id)mayStoreIntentForDays:(int64_t)a3;
- (DIIdentityIntentToStore)initWithIdentifier:(id)a3;
- (NSString)identifier;
@end

@implementation DIIdentityIntentToStore

- (DIIdentityIntentToStore)initWithIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)DIIdentityIntentToStore;
  v5 = [(DIIdentityIntentToStore *)&v8 init];
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

+ (DIIdentityIntentToStore)willNotStoreIntent
{
  v2 = [DIIdentityIntentToStore alloc];
  v3 = +[IdentityIntentToStoreRawValueKeys willNotStore];
  v4 = [(DIIdentityIntentToStore *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityIntentToStore)mayStoreIntent
{
  v2 = [DIIdentityIntentToStore alloc];
  v3 = +[IdentityIntentToStoreRawValueKeys mayStore];
  v4 = [(DIIdentityIntentToStore *)v2 initWithIdentifier:v3];

  return v4;
}

+ (id)mayStoreIntentForDays:(int64_t)a3
{
  v4 = [DIIdentityIntentToStore alloc];
  v5 = +[IdentityIntentToStoreRawValueKeys mayStoreForDays:a3];
  v6 = [(DIIdentityIntentToStore *)v4 initWithIdentifier:v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end