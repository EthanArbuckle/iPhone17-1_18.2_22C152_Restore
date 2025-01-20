@interface ISCompositor(Rendering)
@end

@implementation ISCompositor(Rendering)

- (void)scaledImageFromContent:()Rendering size:scale:needsScaled:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AE771000, log, OS_LOG_TYPE_DEBUG, "Using linear scaling", v1, 2u);
}

@end