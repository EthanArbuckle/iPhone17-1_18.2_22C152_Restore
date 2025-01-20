@interface MPRadioStationRemotePlaybackQueue
@end

@implementation MPRadioStationRemotePlaybackQueue

uint64_t __97__MPRadioStationRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __97__MPRadioStationRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2;
  v3[3] = &unk_2643C4008;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 setRadioIdentifiersWithBlock:v3];
}

void __97__MPRadioStationRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) stationStringID];
  uint64_t v4 = [v3 length];

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = [v5 stationStringID];
    [v7 setStationStringID:v6];
  }
  else
  {
    if (![v5 stationID]) {
      goto LABEL_6;
    }
    objc_msgSend(v7, "setStationID:", objc_msgSend(*(id *)(a1 + 32), "stationID"));
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_6:
}

@end