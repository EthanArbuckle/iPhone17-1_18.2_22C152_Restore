@interface ABCCallbackInvoker
- (void)invoke;
@end

@implementation ABCCallbackInvoker

- (void)invoke
{
  if (ABAddressBookIsCallbackRegistered((uint64_t)self->ab, self->cb, self->context, (const void *)[MEMORY[0x1E4F29060] currentThread]))((void (*)(void *, void, void *))self->cb)(self->ab, 0, self->context); {
  ab = self->ab;
  }
  CFRelease(ab);
}

@end