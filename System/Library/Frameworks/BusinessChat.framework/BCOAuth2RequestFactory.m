@interface BCOAuth2RequestFactory
+ (id)makeRequestObjectWithDictionary:(id)a3 version:(int64_t)a4;
@end

@implementation BCOAuth2RequestFactory

+ (id)makeRequestObjectWithDictionary:(id)a3 version:(int64_t)a4
{
  id v5 = a3;
  v6 = off_264851BD0;
  if (a4 <= 1) {
    v6 = off_264851BA0;
  }
  v7 = (void *)[objc_alloc(*v6) _initWithDictionary:v5];

  return v7;
}

@end