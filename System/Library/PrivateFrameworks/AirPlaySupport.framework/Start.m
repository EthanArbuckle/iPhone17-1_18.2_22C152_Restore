@interface Start
@end

@implementation Start

void __dataSource_Start_block_invoke(uint64_t a1)
{
  if (gLogCategory_APSPSGDataSource <= 50
    && (gLogCategory_APSPSGDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);

  dataSource_updateDevicePSGInfos(v2, 1);
}

void __dataSource_Start_block_invoke_2(uint64_t a1)
{
}

@end