@interface CLBBTimeFreqTransferCallbackAssertion
+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 withCallbackQueue:(id)a5 andBlock:(id)a6;
+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 withCallbackQueue:(id)a5 andBlock:(id)a6;
- (CLBBTimeFreqTransferCallbackAssertion)initWithRegistrationMessageName:(const char *)a3 messageDictionary:(id)a4 dispatchQueue:(id)a5 codeBlock:(id)a6;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CLBBTimeFreqTransferCallbackAssertion

- (CLBBTimeFreqTransferCallbackAssertion)initWithRegistrationMessageName:(const char *)a3 messageDictionary:(id)a4 dispatchQueue:(id)a5 codeBlock:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CLBBTimeFreqTransferCallbackAssertion;
  if ([(CLBBTimeFreqTransferCallbackAssertion *)&v7 init]) {
    operator new();
  }
  return 0;
}

- (void)invalidate
{
  fInternal = self->fInternal;
  if (fInternal) {
    sub_1907142A8((uint64_t)fInternal);
  }
}

- (void)dealloc
{
  fInternal = self->fInternal;
  if (fInternal)
  {
    sub_1907142A8((uint64_t)self->fInternal);
    MEMORY[0x192FCEAD0](fInternal, 0xA0C40114AFA65);
  }
  self->fInternal = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLBBTimeFreqTransferCallbackAssertion;
  [(CLBBTimeFreqTransferCallbackAssertion *)&v4 dealloc];
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 withCallbackQueue:(id)a5 andBlock:(id)a6
{
  id v9 = (id)[a3 copy];
  id v10 = (id)[a4 copy];

  return sub_1907AF414((uint64_t)v9, (uint64_t)&stru_1EE006720, (uint64_t)v10, (uint64_t)a5, (uint64_t)a6);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 withCallbackQueue:(id)a5 andBlock:(id)a6
{
  id v9 = (id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "copy");
  id v10 = (id)[a4 copy];

  return sub_1907AF414((uint64_t)&stru_1EE006720, (uint64_t)v9, (uint64_t)v10, (uint64_t)a5, (uint64_t)a6);
}

@end