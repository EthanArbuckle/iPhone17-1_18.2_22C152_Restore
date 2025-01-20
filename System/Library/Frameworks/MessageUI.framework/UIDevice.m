@interface UIDevice
@end

@implementation UIDevice

void __31__UIDevice_MessageUI__mf_isPad__block_invoke()
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  unint64_t v1 = [v0 userInterfaceIdiom];

  BOOL v3 = v1 > 3 || (v1 & 0xF) == 1;
  mf_isPad_isPad = v3;
}

@end