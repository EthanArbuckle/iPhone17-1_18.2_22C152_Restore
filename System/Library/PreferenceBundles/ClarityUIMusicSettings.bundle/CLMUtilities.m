@interface CLMUtilities
+ (id)playlistEntryForSpecifier:(id)a3;
@end

@implementation CLMUtilities

+ (id)playlistEntryForSpecifier:(id)a3
{
  return _[a3 propertyForKey:@"playlistEntry"];
}

@end