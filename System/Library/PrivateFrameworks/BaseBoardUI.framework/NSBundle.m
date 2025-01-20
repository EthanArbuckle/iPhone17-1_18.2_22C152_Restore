@interface NSBundle
+ (id)bs_baseBoardUIBundle;
@end

@implementation NSBundle

+ (id)bs_baseBoardUIBundle
{
  self;
  if (qword_1EB3A3978 != -1) {
    dispatch_once(&qword_1EB3A3978, &__block_literal_global_5);
  }
  v0 = (void *)_MergedGlobals_12;

  return v0;
}

uint64_t __45__NSBundle_BaseBoardUI__bs_baseBoardUIBundle__block_invoke()
{
  _MergedGlobals_12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

@end