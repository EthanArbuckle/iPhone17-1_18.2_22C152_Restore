@interface _HDBackgroundRunningAssertion
- (void)setBksAssertion:(uint64_t)a1;
@end

@implementation _HDBackgroundRunningAssertion

- (void)setBksAssertion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreLocationAssertion, 0);
  objc_storeStrong((id *)&self->_bksAssertion, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end