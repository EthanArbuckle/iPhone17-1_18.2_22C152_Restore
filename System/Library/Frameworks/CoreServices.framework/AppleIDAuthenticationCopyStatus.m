@interface AppleIDAuthenticationCopyStatus
@end

@implementation AppleIDAuthenticationCopyStatus

intptr_t ___AppleIDAuthenticationCopyStatus_block_invoke(void *a1, char a2, CFTypeRef cf, CFTypeRef a4)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  v6 = (void *)a1[5];
  if (v6)
  {
    if (cf)
    {
      CFRetain(cf);
      v6 = (void *)a1[5];
    }
    void *v6 = cf;
  }
  v8 = (void *)a1[6];
  if (v8)
  {
    if (a4)
    {
      CFRetain(a4);
      v8 = (void *)a1[6];
    }
    void *v8 = a4;
  }
  v9 = a1[7];

  return dispatch_semaphore_signal(v9);
}

@end