@interface GKAnonymousPlayerInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isAnonymousPlayer;
- (BOOL)isEqual:(id)a3;
- (id)alias;
- (id)playerID;
@end

@implementation GKAnonymousPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)playerID
{
  return @"AnonymousID";
}

- (id)alias
{
  return +[GCFLocalizedStrings ANONYMOUS_PLAYER_NICKNAME];
}

- (BOOL)isAnonymousPlayer
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

@end