@interface NSFileCoordinator(BRAdditions)
+ (void)br_boostFilePresenter:()BRAdditions;
@end

@implementation NSFileCoordinator(BRAdditions)

+ (void)br_boostFilePresenter:()BRAdditions
{
  id v3 = a3;
  if (BRIsFPFSEnabled(v3, v4))
  {
    v5 = [v3 presentedItemURL];
    objc_msgSend(v5, "_br_itemServiceSyncProxy");
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke;
    v17[3] = &unk_1E59AD448;
    v7 = &v18;
    id v18 = v3;
    [v6 boostFilePresenter:v17];
  }
  else
  {
    v8 = +[BRDaemonConnection defaultConnection];
    v9 = (void *)[v8 newLegacySyncProxy];

    v10 = [v3 presentedItemURL];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke_1;
    v15 = &unk_1E59AD448;
    v7 = &v16;
    v16 = v9;
    id v6 = v9;
    [v6 boostFilePresenterAtURL:v10 reply:&v12];

    id v11 = (id)objc_msgSend(v6, "result", v12, v13, v14, v15);
  }
}

@end