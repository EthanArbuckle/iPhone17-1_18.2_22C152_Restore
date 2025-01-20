@interface CAFlipBookFrame
@end

@implementation CAFlipBookFrame

id __64__CAFlipBookFrame_BacklightServicesHost__bls_shortLoggingString__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendPointer:*(void *)(a1 + 40) withName:0];
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "frameId"), @"id");
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 40), "bls_specifier");
  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    v7 = objc_msgSend(v6, "bls_specifier");
    v8 = objc_msgSend(v7, "bls_shortLoggingString");
    [v4 appendString:v8 withName:0];
  }
  else
  {
    [v6 presentationTime];
    v7 = BLSShortLoggingStringForMachTime();
    [v4 appendString:v7 withName:0];
  }

  v9 = *(void **)(a1 + 32);
  v10 = [MEMORY[0x263F29A70] sharedFormatter];
  v11 = objc_msgSend(v10, "stringFromByteCount:", objc_msgSend(*(id *)(a1 + 40), "memoryUsage"));
  id v12 = (id)[v9 appendObject:v11 withName:0];

  [*(id *)(a1 + 40) apl];
  id v14 = (id)[*(id *)(a1 + 32) appendFloat:@"apl" withName:3 decimalPrecision:v13];
  [*(id *)(a1 + 40) aplDimming];
  v15 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) aplDimming];
  id v17 = (id)[v15 appendFloat:@"%" withName:3 decimalPrecision:v16];
  v18 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) rawSurfaceFrame];
  id v19 = (id)objc_msgSend(v18, "appendRect:withName:", 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isInverted"), @"inverted", 1);
}

@end