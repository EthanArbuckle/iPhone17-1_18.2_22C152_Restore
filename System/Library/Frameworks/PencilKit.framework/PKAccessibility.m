@interface PKAccessibility
+ (id)sharedInstance;
- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5;
@end

@implementation PKAccessibility

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PKAccessibility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB3C5FF0 != -1) {
    dispatch_once(&qword_1EB3C5FF0, block);
  }
  v2 = (void *)_MergedGlobals_139;

  return v2;
}

void __33__PKAccessibility_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_139;
  _MergedGlobals_139 = v0;
}

- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5
{
}

@end