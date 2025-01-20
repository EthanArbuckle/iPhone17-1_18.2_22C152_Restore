@interface CAFlipBookFrame(BacklightServicesHost)
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (uint64_t)bls_uuid;
@end

@implementation CAFlipBookFrame(BacklightServicesHost)

- (uint64_t)bls_uuid
{
  return 0;
}

- (id)bls_loggingString
{
  v2 = [MEMORY[0x263F29C40] builderWithObject:a1];
  [a1 presentationTime];
  v3 = BLSLoggingStringForMachTime();
  [v2 appendString:v3 withName:@"presentationTime"];

  id v4 = (id)objc_msgSend(v2, "appendUInt64:withName:", objc_msgSend(a1, "frameId"), @"frameId");
  v5 = objc_msgSend(a1, "bls_specifier");
  v6 = objc_msgSend(v5, "bls_loggingString");
  id v7 = (id)[v2 appendObject:v6 withName:@"specifier"];

  v8 = [MEMORY[0x263F29A70] sharedFormatter];
  v9 = objc_msgSend(v8, "stringFromByteCount:", objc_msgSend(a1, "memoryUsage"));
  id v10 = (id)[v2 appendObject:v9 withName:@"memoryUsage"];

  [a1 apl];
  id v12 = (id)[v2 appendFloat:@"apl" withName:3 decimalPrecision:v11];
  [a1 aplDimming];
  id v14 = (id)[v2 appendFloat:@"dimming" withName:3 decimalPrecision:v13];
  [a1 rawSurfaceFrame];
  id v15 = (id)objc_msgSend(v2, "appendRect:withName:", @"rawSurfaceFrame");
  id v16 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isInverted"), @"inverted", 1);
  v17 = [v2 build];

  return v17;
}

- (id)bls_shortLoggingString
{
  v2 = objc_opt_new();
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __64__CAFlipBookFrame_BacklightServicesHost__bls_shortLoggingString__block_invoke;
  v9 = &unk_2645322D0;
  id v10 = v2;
  uint64_t v11 = a1;
  id v3 = v2;
  [v3 appendProem:0 block:&v6];
  id v4 = objc_msgSend(v3, "description", v6, v7, v8, v9);

  return v4;
}

@end