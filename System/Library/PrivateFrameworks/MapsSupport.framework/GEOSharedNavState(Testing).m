@interface GEOSharedNavState(Testing)
+ (id)_msp_blockedTestTripIdentifiers;
+ (id)_msp_testTrip;
+ (id)_msp_testTripClosedTripInPast;
+ (id)_msp_testTripForIdentifier:()Testing;
+ (id)_msp_testTripSky;
+ (id)_msp_testTripWithMultipleStops;
+ (id)_msp_testTripWithMultipleStopsMiddleOfTrip;
+ (id)_msp_testTripsByIdentifier;
+ (id)preciseChicago;
+ (id)preciseSanFrancisco;
+ (uint64_t)_msp_blockTestTripWithIdentifier:()Testing;
+ (uint64_t)_msp_isTestTripBlockedWithIdentifier:()Testing;
+ (void)_msp_registerTestTrip:()Testing;
@end

@implementation GEOSharedNavState(Testing)

+ (id)_msp_testTrip
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__GEOSharedNavState_Testing___msp_testTrip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F44A0 != -1) {
    dispatch_once(&qword_1EB7F44A0, block);
  }
  v1 = (void *)_MergedGlobals_36;

  return v1;
}

+ (id)_msp_testTripWithMultipleStops
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__GEOSharedNavState_Testing___msp_testTripWithMultipleStops__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F44B0 != -1) {
    dispatch_once(&qword_1EB7F44B0, block);
  }
  v1 = (void *)qword_1EB7F44A8;

  return v1;
}

+ (id)_msp_testTripWithMultipleStopsMiddleOfTrip
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GEOSharedNavState_Testing___msp_testTripWithMultipleStopsMiddleOfTrip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F44C0 != -1) {
    dispatch_once(&qword_1EB7F44C0, block);
  }
  v1 = (void *)qword_1EB7F44B8;

  return v1;
}

+ (id)_msp_testTripSky
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__GEOSharedNavState_Testing___msp_testTripSky__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F44D0 != -1) {
    dispatch_once(&qword_1EB7F44D0, block);
  }
  v1 = (void *)qword_1EB7F44C8;

  return v1;
}

+ (id)_msp_testTripClosedTripInPast
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__GEOSharedNavState_Testing___msp_testTripClosedTripInPast__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F44E0 != -1) {
    dispatch_once(&qword_1EB7F44E0, block);
  }
  v1 = (void *)qword_1EB7F44D8;

  return v1;
}

+ (void)_msp_registerTestTrip:()Testing
{
  id v4 = a3;
  objc_msgSend(a1, "_msp_testTripsByIdentifier");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v4 groupIdentifier];
  [v6 setObject:v4 forKey:v5];
}

+ (id)_msp_testTripForIdentifier:()Testing
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_msp_testTripsByIdentifier");
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (uint64_t)_msp_blockTestTripWithIdentifier:()Testing
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_msp_testTripsByIdentifier");
  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 containsObject:v4];

  if (v7)
  {
    v8 = objc_msgSend(a1, "_msp_blockedTestTripIdentifiers");
    [v8 addObject:v4];
  }
  return v7;
}

+ (uint64_t)_msp_isTestTripBlockedWithIdentifier:()Testing
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_msp_blockedTestTripIdentifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)_msp_testTripsByIdentifier
{
  if (qword_1EB7F44F0 != -1) {
    dispatch_once(&qword_1EB7F44F0, &__block_literal_global_2);
  }
  v0 = (void *)qword_1EB7F44E8;

  return v0;
}

+ (id)_msp_blockedTestTripIdentifiers
{
  if (qword_1EB7F4500 != -1) {
    dispatch_once(&qword_1EB7F4500, &__block_literal_global_14);
  }
  v0 = (void *)qword_1EB7F44F8;

  return v0;
}

+ (id)preciseSanFrancisco
{
  id v0 = objc_alloc(MEMORY[0x1E4F64828]);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"GC0iI1VuaXRlZCBTdGF0ZXMgTWludCBvZiBTYW4gRnJhbmNpc2NvMtwCWiNVbml0ZWQgU3RhdGVzIE1pbnQgb2YgU2FuIEZyYW5jaXNjb1oOMTU1IEhlcm1hbm4gU3RaHVNhbiBGcmFuY2lzY28sIENBICA5NDEwMi02MTMwWg1Vbml0ZWQgU3RhdGVzevYBCg1Vbml0ZWQgU3RhdGVzEgJVUxoKQ2FsaWZvcm5pYSICQ0EqDVNhbiBGcmFuY2lzY28yDVNhbiBGcmFuY2lzY286BTk0MTAyQgpOb3J0aCBQYXJrUgpIZXJtYW5uIFN0WgMxNTViDjE1NSBIZXJtYW5uIFN0agQ2MTMwciNVbml0ZWQgU3RhdGVzIE1pbnQgb2YgU2FuIEZyYW5jaXNjb4oBDVNhbiBGcmFuY2lzY2+KAQhCYXkgQXJlYYoBDEhheWVzIFZhbGxleYoBD0R1Ym9jZSBUcmlhbmdsZYoBCk5vcnRoIFBhcmuiAQo5NDEwMi02MTMwShIJAxDSrp3iQkARZK2h1F6bXsBYAGISCTbpONCh4kJAEbt3Pwxfm17AcMI7" options:1];
  v2 = (void *)[v0 initWithData:v1];

  return v2;
}

+ (id)preciseChicago
{
  id v0 = objc_alloc(MEMORY[0x1E4F64828]);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"GC0iDFdpbGxpcyBUb3dlciokKZSwoIRn8ERAMfH7kujA6FXAOeL+85mL8ERAQYw0t/ap6FXAMuQBWgxXaWxsaXMgVG93ZXJaDzIzMyBTIFdhY2tlciBEcloXQ2hpY2FnbywgSUwgIDYwNjA2LTYzMDZaDVVuaXRlZCBTdGF0ZXN6mgEKDVVuaXRlZCBTdGF0ZXMSAlVTGghJbGxpbm9pcyICSUwqBENvb2syB0NoaWNhZ286BTYwNjA2QghUaGUgTG9vcFILUyBXYWNrZXIgRHJaAzIzM2IPMjMzIFMgV2Fja2VyIERyagQ2MzA2cgxXaWxsaXMgVG93ZXKKAQdDaGljYWdvigEIVGhlIExvb3CiAQo2MDYwNi02MzA2ShIJIRqCiHnwREARgBL69LPoVcBYBGISCTJrzmZ68ERAEfH7kujA6FXAcMI7" options:1];
  v2 = (void *)[v0 initWithData:v1];

  return v2;
}

@end