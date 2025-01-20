@interface CNFindMetadataTrackForVideoTrack
@end

@implementation CNFindMetadataTrackForVideoTrack

void ___CNFindMetadataTrackForVideoTrack_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    int v4 = [a2 trackID];
    if (v4 == [*(id *)(a1 + 32) trackID])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  v5 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v5);
}

@end