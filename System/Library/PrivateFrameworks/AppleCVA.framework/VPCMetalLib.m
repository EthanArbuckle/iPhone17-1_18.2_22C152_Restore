@interface VPCMetalLib
+ (id)metalLibraryWithDevice:(id)a3 error:(id *)a4;
@end

@implementation VPCMetalLib

+ (id)metalLibraryWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:@"cvaviewpointcorrection" withExtension:@"metallib"];

  if (!v7)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EA6437C8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EA6437C8))
    {
      qword_1EA6437C0 = (uint64_t)os_log_create("com.apple.AppleCVA", "ViewpointCorrection");
      __cxa_guard_release(&qword_1EA6437C8);
    }
    v12 = (id)qword_1EA6437C0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = @"Could not find metal library";
      _os_log_debug_impl(&dword_1D0DBD000, v12, OS_LOG_TYPE_DEBUG, "Check failed: %@", buf, 0xCu);
    }

    if (!a4)
    {
      v11 = 0;
      goto LABEL_18;
    }
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [(__CFString *)v9 setValue:@"Could not find metal library" forKey:*MEMORY[0x1E4F28568]];
    v13 = (void *)MEMORY[0x1E4F28C58];
    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v10 bundleIdentifier];
    *a4 = [v13 errorWithDomain:v14 code:0 userInfo:v9];

    goto LABEL_16;
  }
  id v17 = 0;
  v8 = (void *)[v5 newLibraryWithURL:v7 error:&v17];
  v9 = (__CFString *)v17;
  if (!v8)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EA6437C8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EA6437C8))
    {
      qword_1EA6437C0 = (uint64_t)os_log_create("com.apple.AppleCVA", "ViewpointCorrection");
      __cxa_guard_release(&qword_1EA6437C8);
    }
    v15 = (id)qword_1EA6437C0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_debug_impl(&dword_1D0DBD000, v15, OS_LOG_TYPE_DEBUG, "Forwarding NSError: %@", buf, 0xCu);
    }

    if (a4)
    {
      v9 = v9;
      id v10 = 0;
      v11 = 0;
      *a4 = v9;
      goto LABEL_17;
    }
    id v10 = 0;
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  id v10 = v8;
  v11 = v10;
LABEL_17:

LABEL_18:
  return v11;
}

@end