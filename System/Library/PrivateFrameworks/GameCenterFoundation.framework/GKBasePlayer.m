@interface GKBasePlayer
+ (BOOL)supportsSecureCoding;
- (NSString)displayName;
- (NSString)playerID;
@end

@implementation GKBasePlayer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)playerID
{
  return 0;
}

- (NSString)displayName
{
  return 0;
}

@end