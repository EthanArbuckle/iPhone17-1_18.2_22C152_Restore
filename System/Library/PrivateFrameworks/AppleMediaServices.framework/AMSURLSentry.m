@interface AMSURLSentry
- (AMSURLSentry)init;
- (AMSURLSentry)initWithBag:(id)a3;
- (void)isTrustedURL:(NSURL *)a3 completionHandler:(id)a4;
@end

@implementation AMSURLSentry

- (void)isTrustedURL:(NSURL *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_18D677FD0((uint64_t)&unk_1E91BBCE0, (uint64_t)v7);
}

- (AMSURLSentry)initWithBag:(id)a3
{
  return (AMSURLSentry *)URLSentry.init(bag:)(a3);
}

- (void).cxx_destruct
{
}

- (AMSURLSentry)init
{
}

@end