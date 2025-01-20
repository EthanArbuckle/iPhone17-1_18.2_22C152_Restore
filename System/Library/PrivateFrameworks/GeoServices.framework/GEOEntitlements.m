@interface GEOEntitlements
+ (BOOL)currentProcessIsEntitled:(id)a3;
+ (id)currentProcessEntitlement:(id)a3;
@end

@implementation GEOEntitlements

+ (id)currentProcessEntitlement:(id)a3
{
  v3 = (__CFString *)a3;
  memset(&task_info_out, 0, sizeof(task_info_out));
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)&task_info_out, &task_info_outCnt)) {
    goto LABEL_2;
  }
  audit_token_t cf = task_info_out;
  v6 = SecTaskCreateWithAuditToken(0, &cf);
  if (!v6) {
    goto LABEL_2;
  }
  v7 = v6;
  *(void *)cf.val = 0;
  v4 = (void *)SecTaskCopyValueForEntitlement(v6, v3, (CFErrorRef *)&cf);
  CFRelease(v7);
  v8 = *(const void **)cf.val;
  if (*(void *)cf.val)
  {
    if (v4)
    {
      CFRelease(v4);
      v8 = *(const void **)cf.val;
    }
    CFRelease(v8);
    goto LABEL_2;
  }
  if (!v4) {
LABEL_2:
  }
    v4 = 0;

  return v4;
}

+ (BOOL)currentProcessIsEntitled:(id)a3
{
  v3 = [a1 currentProcessEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end