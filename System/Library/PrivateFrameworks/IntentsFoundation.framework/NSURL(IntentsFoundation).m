@interface NSURL(IntentsFoundation)
- (uint64_t)if_isContainedByDirectoryAtURL:()IntentsFoundation;
@end

@implementation NSURL(IntentsFoundation)

- (uint64_t)if_isContainedByDirectoryAtURL:()IntentsFoundation
{
  if (!a3) {
    return 0;
  }
  uint64_t v9 = 0;
  v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  v6 = [v4 defaultManager];
  unsigned int v7 = [v6 getRelationship:&v9 ofDirectoryAtURL:v5 toItemAtURL:a1 error:0];

  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

@end