@interface SRFaceMetricsPacket
+ (id)new;
+ (id)packetWithData:(id)a3;
+ (void)initialize;
@end

@implementation SRFaceMetricsPacket

+ (id)new
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _MergedGlobals_4 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogFaceMetricsPacket");
  }
}

+ (id)packetWithData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([a3 length] == 2348)
  {
    v4 = SRFaceMetricsPacketV0;
LABEL_13:
    uint64_t v5 = [a3 bytes];
    return (id)[(__objc2_class *)v4 packetWithHAFacialMetricsPacket:v5];
  }
  if ([a3 length] == 2352)
  {
    v4 = SRFaceMetricsPacketV1;
    goto LABEL_13;
  }
  if ([a3 length] == 2384)
  {
    v4 = SRFaceMetricsPacketV2;
    goto LABEL_13;
  }
  if ([a3 length] == 368)
  {
    v4 = SRFaceMetricsPacketV3;
    goto LABEL_13;
  }
  if ([a3 length] == 424)
  {
    v4 = SRFaceMetricsPacketV4;
    goto LABEL_13;
  }
  if ([a3 length] == 436)
  {
    v4 = SRFaceMetricsPacketV5;
    goto LABEL_13;
  }
  v7 = _MergedGlobals_4;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_4, OS_LOG_TYPE_FAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [a3 length];
    _os_log_fault_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_FAULT, "Failed to find initializer to create SRFaceMetricsPacket, data length:%lu", (uint8_t *)&v8, 0xCu);
  }
  return 0;
}

@end