@interface POPodcastCollection
+ (Class)SAMPClass;
+ (id)uriScheme;
@end

@implementation POPodcastCollection

+ (Class)SAMPClass
{
  return (Class)objc_opt_class();
}

+ (id)uriScheme
{
  return @"x-sampcollection-podcast";
}

@end