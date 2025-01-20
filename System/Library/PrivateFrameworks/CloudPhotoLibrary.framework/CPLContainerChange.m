@interface CPLContainerChange
+ (BOOL)supportsDeletion;
@end

@implementation CPLContainerChange

+ (BOOL)supportsDeletion
{
  return 1;
}

@end