@interface CacheDeleteListener
+ (id)daemonListenerWithExportedObject:(id)a3;
+ (id)daemonPublicListenerWithExportedObject:(id)a3;
@end

@implementation CacheDeleteListener

+ (id)daemonListenerWithExportedObject:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CacheDeleteListener) initWithName:@"com.apple.cache_delete" listener:0 protocol:&OBJC_PROTOCOL___CacheDeleteClientProtocol exportedObj:v3 isExtension:0];

  return v4;
}

+ (id)daemonPublicListenerWithExportedObject:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CacheDeleteListener) initWithName:@"com.apple.cache_delete.public" listener:0 protocol:&OBJC_PROTOCOL___CacheDeletePublicClientProtocol exportedObj:v3 isExtension:0];

  return v4;
}

@end