@interface IsCompositorProcess
@end

@implementation IsCompositorProcess

void __IsCompositorProcess_block_invoke(id a1)
{
  IsCompositorProcess_isCompositorProcess = (qword_2501C8 & 0x80) != 0;
  if ((qword_2501C8 & 0x80) == 0)
  {
    v1 = getprogname();
    if (v1)
    {
      if (!strcmp(v1, "backboardd")) {
        IsCompositorProcess_isCompositorProcess = 1;
      }
    }
  }
}

@end