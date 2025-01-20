@interface GKUnknownPlayerInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnknownPlayer;
- (id)playerID;
@end

@implementation GKUnknownPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)playerID
{
  return @"UnknownID";
}

- (BOOL)isUnknownPlayer
{
  return 1;
}

@end