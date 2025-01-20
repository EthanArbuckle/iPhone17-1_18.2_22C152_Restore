@interface FFSubscription
+ (id)decodeFromDictionary:(id)a3;
+ (id)mergeSubscriptions:(id)a3;
- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5;
- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5;
- (FFSubscription)init;
- (id)encodeToDictionary;
- (id)initPrivate;
- (id)nameOfClass;
@end

@implementation FFSubscription

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  abort();
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  abort();
}

+ (id)mergeSubscriptions:(id)a3
{
  id v3 = a3;
  abort();
}

- (id)encodeToDictionary
{
}

+ (id)decodeFromDictionary:(id)a3
{
  id v3 = a3;
  abort();
}

- (id)nameOfClass
{
}

- (FFSubscription)init
{
}

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)FFSubscription;
  return [(FFSubscription *)&v3 init];
}

@end