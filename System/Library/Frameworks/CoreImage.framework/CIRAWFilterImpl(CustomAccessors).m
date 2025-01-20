@interface CIRAWFilterImpl(CustomAccessors)
- (void)inputImage;
@end

@implementation CIRAWFilterImpl(CustomAccessors)

- (void)inputImage
{
  __assert_rtn("-[CIRAWFilterImpl(CustomAccessors) inputImage]", "CIRAWFilterImpl.m", 1784, "_inputImage != nil");
}

- (void)setInputDecoderVersion:()CustomAccessors .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 376);
  int v4 = 136446722;
  v5 = "-[CIRAWFilterImpl(CustomAccessors) setInputDecoderVersion:]";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s The file does not support version %{public}@. The version %{public}@ will be used instead.", (uint8_t *)&v4, 0x20u);
}

- (void)setInputDecoderVersion:()CustomAccessors .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  v2 = "-[CIRAWFilterImpl(CustomAccessors) setInputDecoderVersion:]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s Invalid argument type", (uint8_t *)&v1, 0xCu);
}

@end