@interface CameraKitHubClassTerminate
@end

@implementation CameraKitHubClassTerminate

uint64_t ____CameraKitHubClassTerminate_block_invoke(uint64_t a1)
{
  MEMORY[0x223CA5E80](*(unsigned int *)(a1 + 48));
  io_object_t v2 = IOIteratorNext(*(_DWORD *)(a1 + 48));
  if (v2)
  {
    io_object_t v3 = v2;
    do
    {
      if ([*(id *)(a1 + 32) ioUSB20CameraKitHubService] == v3) {
        __CameraKitHubClassReset(*(void *)(a1 + 40));
      }
      IOObjectRelease(v3);
      io_object_t v3 = IOIteratorNext(*(_DWORD *)(a1 + 48));
    }
    while (v3);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 48);
  return IOObjectRelease(v4);
}

uint64_t ____CameraKitHubClassTerminate_block_invoke_2(uint64_t a1)
{
  MEMORY[0x223CA5E80](*(unsigned int *)(a1 + 48));
  io_object_t v2 = IOIteratorNext(*(_DWORD *)(a1 + 48));
  if (v2)
  {
    io_object_t v3 = v2;
    do
    {
      if ([*(id *)(a1 + 32) ioUSB30CameraKitHubService] == v3) {
        __CameraKitHubClassReset(*(void *)(a1 + 40));
      }
      IOObjectRelease(v3);
      io_object_t v3 = IOIteratorNext(*(_DWORD *)(a1 + 48));
    }
    while (v3);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 48);
  return IOObjectRelease(v4);
}

@end