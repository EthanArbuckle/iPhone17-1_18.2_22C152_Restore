@interface GEOURLManifestListener
@end

@implementation GEOURLManifestListener

void __41___GEOURLManifestListener_sharedListener__block_invoke()
{
  v0 = objc_alloc_init(_GEOURLManifestListener);
  v1 = (void *)qword_1EB2A0300;
  qword_1EB2A0300 = (uint64_t)v0;
}

uint64_t __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke(uint64_t a1)
{
  uint64_t result = GEOConfigGetBOOL(GeoServicesConfig_ShouldUpdateResourceManifestAtLaunch, (uint64_t)off_1E91155E8);
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

void __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = +[GEOResourceManifestManager modernManager];
  [v4 closeServerConnection];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v5 = *(void **)(a1 + 32);
    [v5 _finish:a2 == 0];
  }
}

uint64_t __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) _finish:0];
}

@end