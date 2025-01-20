@interface MADVideoCoreMLRequest
+ (id)allocWithZone:(_NSZone *)a3;
@end

@implementation MADVideoCoreMLRequest

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___MADVideoCoreMLRequest;
    return objc_msgSendSuper2(&v14, sel_allocWithZone_, a3);
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v5) {
      +[MADVideoCoreMLRequest allocWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 0;
  }
}

+ (void)allocWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end