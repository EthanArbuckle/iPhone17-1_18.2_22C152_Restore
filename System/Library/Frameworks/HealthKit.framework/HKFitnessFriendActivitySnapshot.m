@interface HKFitnessFriendActivitySnapshot
@end

@implementation HKFitnessFriendActivitySnapshot

void __145___HKFitnessFriendActivitySnapshot__fitnessFriendActivitySnapshotWithFriendUUID_sourceUUID_startDate_endDate_snapshotIndex_snapshotUploadedDate___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 13, *(id *)(a1 + 32));
  v4 = a2;
  objc_storeStrong(v4 + 16, *(id *)(a1 + 40));
  v4[15] = *(id *)(a1 + 56);
  objc_storeStrong(v4 + 14, *(id *)(a1 + 48));
  v4[30] = (id)1;
}

void __113___HKFitnessFriendActivitySnapshot__fitnessFriendActivitySnapshotWithSnapshotIndex_startDate_endDate_sourceUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 120) = *(void *)(a1 + 40);
  objc_storeStrong((id *)(a2 + 112), *(id *)(a1 + 32));
  v3 = (id)a2;
  v3[30] = 1;
}

@end