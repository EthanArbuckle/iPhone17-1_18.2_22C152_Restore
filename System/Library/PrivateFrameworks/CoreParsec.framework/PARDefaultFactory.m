@interface PARDefaultFactory
- (id)createResultObject;
@end

@implementation PARDefaultFactory

- (id)createResultObject
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);

  return v2;
}

@end