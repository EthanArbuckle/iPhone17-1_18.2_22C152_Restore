@interface CKUserDefaults
+ (id)CKUserDefaults;
+ (id)suiteName;
+ (void)performAtomicDefaultsOperation:(id)a3;
@end

@implementation CKUserDefaults

+ (void)performAtomicDefaultsOperation:(id)a3
{
  v8 = (void (**)(id, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB279A40);
  v7 = objc_msgSend_CKUserDefaults(a1, v4, v5, v6);
  v8[2](v8, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB279A40);
}

+ (id)CKUserDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B066E48;
  block[3] = &unk_1E545FFA8;
  block[4] = a1;
  if (qword_1EB27A0F8 != -1) {
    dispatch_once(&qword_1EB27A0F8, block);
  }
  v2 = (void *)qword_1EB27A0F0;

  return v2;
}

+ (id)suiteName
{
  return @"com.apple.CloudKit";
}

@end