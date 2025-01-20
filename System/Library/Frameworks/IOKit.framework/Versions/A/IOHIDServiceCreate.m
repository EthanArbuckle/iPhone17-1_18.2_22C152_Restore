@interface IOHIDServiceCreate
@end

@implementation IOHIDServiceCreate

uint64_t ___IOHIDServiceCreate_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  memset(&v2, 0, sizeof(v2));
  if (hid_pthread_attr_init(&v2, 63, 2)) {
    ___IOHIDServiceCreate_block_invoke_cold_2();
  }
  if (pthread_create(&__serviceRunLoop, &v2, (void *(__cdecl *)(void *))__IOHIDServiceRunLoopCompatibilityThread, 0)) {
    ___IOHIDServiceCreate_block_invoke_cold_1();
  }
  pthread_attr_destroy(&v2);
  pthread_mutex_lock(&stru_1E9133710);
  while (!qword_1E9133700)
    pthread_cond_wait(&stru_1E9133750, &stru_1E9133710);
  return pthread_mutex_unlock(&stru_1E9133710);
}

void ___IOHIDServiceCreate_block_invoke_cold_1()
{
}

void ___IOHIDServiceCreate_block_invoke_cold_2()
{
}

@end