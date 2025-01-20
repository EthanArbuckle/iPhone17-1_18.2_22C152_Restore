@interface GKSpecialPlayerInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isLoaded;
- (id)alias;
- (id)compositeName;
- (id)photos;
- (id)playerID;
@end

@implementation GKSpecialPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)playerID
{
  return 0;
}

- (id)alias
{
  return 0;
}

- (id)photos
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (id)compositeName
{
  return 0;
}

@end