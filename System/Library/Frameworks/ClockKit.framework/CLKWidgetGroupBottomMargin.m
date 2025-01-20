@interface CLKWidgetGroupBottomMargin
@end

@implementation CLKWidgetGroupBottomMargin

void ___CLKWidgetGroupBottomMargin_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CCDBF08;
  v5[1] = &unk_26CCDBF20;
  v6[0] = &unk_26CCDC428;
  v6[1] = &unk_26CCDC3F8;
  v5[2] = &unk_26CCDBF38;
  v5[3] = &unk_26CCDBF50;
  v6[2] = &unk_26CCDC438;
  v6[3] = &unk_26CCDC438;
  v5[4] = &unk_26CCDBF68;
  v5[5] = &unk_26CCDBF80;
  v6[4] = &unk_26CCDC428;
  v6[5] = &unk_26CCDC448;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  [v2 scaledValue:v3 withOverrides:6.0];
  _CLKWidgetGroupBottomMargin__widgeGroupBottomMargin = v4;
}

@end