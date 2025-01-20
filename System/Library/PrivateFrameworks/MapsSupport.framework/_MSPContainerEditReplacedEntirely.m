@interface _MSPContainerEditReplacedEntirely
+ (id)sharedInstance;
- (NSString)description;
@end

@implementation _MSPContainerEditReplacedEntirely

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___MSPContainerEditReplacedEntirely_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1E9EE9288 != -1) {
    dispatch_once(&qword_1E9EE9288, block);
  }
  v2 = (void *)_MergedGlobals_1;

  return v2;
}

- (NSString)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)_MSPContainerEditReplacedEntirely;
  v3 = [(_MSPContainerEditReplacedEntirely *)&v6 description];
  v4 = [v2 stringWithFormat:@"%@ { CONTAINER'S CONTENTS REPLACED ENTIRELY }", v3];

  return (NSString *)v4;
}

@end