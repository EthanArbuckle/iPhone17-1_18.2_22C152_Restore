@interface ARQATracer
@end

@implementation ARQATracer

void __51__ARQATracer_ARKitAdditions___startScreenRecording__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = _ARLogGeneral_1();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not start screen recording", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __50__ARQATracer_ARKitAdditions___stopScreenRecording__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = _ARLogGeneral_1();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not stop screen recording", (uint8_t *)&v7, 0x16u);
    }
  }
}

@end