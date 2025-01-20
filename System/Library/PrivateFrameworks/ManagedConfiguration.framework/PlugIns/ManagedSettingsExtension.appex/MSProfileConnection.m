@interface MSProfileConnection
+ (MSProfileConnectable)sharedConnection;
@end

@implementation MSProfileConnection

+ (MSProfileConnectable)sharedConnection
{
  return (MSProfileConnectable *)+[MCProfileConnection sharedConnection];
}

@end