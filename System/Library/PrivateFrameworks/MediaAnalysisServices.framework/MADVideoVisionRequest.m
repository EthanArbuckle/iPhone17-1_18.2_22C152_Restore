@interface MADVideoVisionRequest
+ (id)allocWithZone:(_NSZone *)a3;
@end

@implementation MADVideoVisionRequest

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MADVideoVisionRequest;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[MADVideoVisionRequest allocWithZone:]();
    }
    return 0;
  }
}

+ (void)allocWithZone:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Subclassing MADVideoVisionRequest not allowed.", v0, 2u);
}

@end