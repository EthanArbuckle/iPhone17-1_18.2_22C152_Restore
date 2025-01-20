@interface AVPlayer(RE)
- (double)videoTrackNaturalSize;
- (id)addEndpoint:()RE;
- (void)removeEndpoint:()RE;
@end

@implementation AVPlayer(RE)

- (id)addEndpoint:()RE
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    re::internal::assertLog((re::internal *)4, v4, "assertion failure: '%s' (%s:line %i) ", "endpoint", "-[AVPlayer(RE) addEndpoint:]", 84);
    _os_crash();
    __break(1u);
  }
  CFAllocatorGetDefault();
  v6 = (re *)FigVideoTargetCreateWithVideoReceiverEndpointID();
  int v7 = (int)v6;
  if (v6)
  {
    v8 = *re::assetTypesLogObjects(v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v7;
      _os_log_error_impl(&dword_233120000, v8, OS_LOG_TYPE_ERROR, "Failed to create video target from endpoint (error: %d)", buf, 8u);
    }
  }
  else
  {
    [a1 addVideoTarget:0];
  }

  return 0;
}

- (void)removeEndpoint:()RE
{
  id v4 = a3;
  if (v4) {
    [a1 removeVideoTarget:v4];
  }
}

- (double)videoTrackNaturalSize
{
  v1 = [a1 currentItem];
  v2 = [v1 asset];
  v3 = [v2 tracksWithMediaType:*MEMORY[0x263EF9D48]];

  double v4 = 0.0;
  if (v3 && [v3 count])
  {
    id v5 = [v3 objectAtIndexedSubscript:0];
    [v5 naturalSize];
    double v4 = v6;
  }
  return v4;
}

@end