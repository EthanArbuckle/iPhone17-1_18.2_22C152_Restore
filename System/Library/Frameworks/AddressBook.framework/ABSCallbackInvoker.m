@interface ABSCallbackInvoker
+ (void)invokeOnThread:(id)a3 callback:(void *)a4 withAddressBook:(void *)a5 context:(void *)a6;
- (void)invoke;
@end

@implementation ABSCallbackInvoker

+ (void)invokeOnThread:(id)a3 callback:(void *)a4 withAddressBook:(void *)a5 context:(void *)a6
{
  id v9 = a3;
  v12 = objc_alloc_init(ABSCallbackInvoker);
  id v10 = [MEMORY[0x263F08B88] currentThread];
  BOOL v11 = v10 == v9;

  CFRetain(a5);
  v12->addressBook = a5;
  v12->callback = a4;
  v12->context = a6;
  [(ABSCallbackInvoker *)v12 performSelector:sel_invoke onThread:v9 withObject:0 waitUntilDone:v11];
}

- (void)invoke
{
  id v5 = [self->addressBook changeCallbacks];
  callback = self->callback;
  v4 = [MEMORY[0x263F08B88] currentThread];
  LODWORD(callback) = [v5 hasExternalCallback:callback onThread:v4 withContext:self->context];

  if (callback) {
    ((void (*)(void *, void, void *))self->callback)(self->addressBook, 0, self->context);
  }
  CFRelease(self->addressBook);
}

@end