@interface AMSUnitTests
+ (BOOL)isRunningUnitTests;
+ (id)_encryptionKeys;
+ (id)encryptionKeyForDataProtectionClass:(unint64_t)a3;
+ (void)_sync:(id)a3;
+ (void)setEncryptionKey:(id)a3 forDataProtectionClass:(unint64_t)a4;
@end

@implementation AMSUnitTests

+ (BOOL)isRunningUnitTests
{
  Class v2 = NSClassFromString(&cfstr_Xctestprobe.isa);
  if (v2)
  {
    SEL v3 = NSSelectorFromString(&cfstr_Istesting.isa);
    v4 = [(objc_class *)v2 methodSignatureForSelector:v3];
    v5 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v4];
    [v5 setSelector:v3];
    [v5 invokeWithTarget:v2];
    char v7 = 0;
    [v5 getReturnValue:&v7];
    if (v7)
    {
      Class v2 = NSClassFromString(&cfstr_Amstestutils.isa);
      LOBYTE(v2) = ((unint64_t)v2 | (unint64_t)NSClassFromString(&cfstr_Amsuitestutils.isa)) != 0;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

+ (id)encryptionKeyForDataProtectionClass:(unint64_t)a3
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AMSUnitTests_encryptionKeyForDataProtectionClass___block_invoke;
  v5[3] = &unk_1E55A73A0;
  v5[4] = &v6;
  v5[5] = a1;
  v5[6] = a3;
  [a1 _sync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__AMSUnitTests_encryptionKeyForDataProtectionClass___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 40) _encryptionKeys];
  Class v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)setEncryptionKey:(id)a3 forDataProtectionClass:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__AMSUnitTests_setEncryptionKey_forDataProtectionClass___block_invoke;
  v8[3] = &unk_1E55A73C8;
  id v10 = a1;
  unint64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  [a1 _sync:v8];
}

void __56__AMSUnitTests_setEncryptionKey_forDataProtectionClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _encryptionKeys];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

+ (id)_encryptionKeys
{
  if (_MergedGlobals_149 != -1) {
    dispatch_once(&_MergedGlobals_149, &__block_literal_global_131);
  }
  uint64_t v2 = (void *)qword_1EB38DFF8;
  return v2;
}

uint64_t __31__AMSUnitTests__encryptionKeys__block_invoke()
{
  qword_1EB38DFF8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

+ (void)_sync:(id)a3
{
  uint64_t v3 = qword_1EB38E000;
  id v4 = (void (**)(void))a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB38E000, &__block_literal_global_14_0);
  }
  id v5 = (id)qword_1EB38E008;
  [v5 lock];
  v4[2](v4);

  [v5 unlock];
}

uint64_t __22__AMSUnitTests__sync___block_invoke()
{
  qword_1EB38E008 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
  return MEMORY[0x1F41817F8]();
}

@end