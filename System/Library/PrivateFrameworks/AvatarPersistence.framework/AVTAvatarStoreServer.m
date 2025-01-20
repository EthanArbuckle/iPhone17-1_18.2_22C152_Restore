@interface AVTAvatarStoreServer
+ (id)defaultServer;
+ (id)defaultServerWithImageHandlingDelegate:(id)a3;
@end

@implementation AVTAvatarStoreServer

+ (id)defaultServer
{
  return (id)[a1 defaultServerWithImageHandlingDelegate:0];
}

+ (id)defaultServerWithImageHandlingDelegate:(id)a3
{
  id v3 = a3;
  v4 = [AVTCoreDataStoreServer alloc];
  v5 = +[AVTCoreEnvironment defaultEnvironment];
  v6 = [(AVTCoreDataStoreServer *)v4 initWithEnvironment:v5 imageHandlingDelegate:v3];

  return v6;
}

@end