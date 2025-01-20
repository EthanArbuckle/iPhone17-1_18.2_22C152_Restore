@interface NSObject(BannerKitInternalAdditions)
- (void)_uniquelyIdentifyPresentable;
- (void)ensurePresentableIsUniquelyIdentifiable;
@end

@implementation NSObject(BannerKitInternalAdditions)

- (void)_uniquelyIdentifyPresentable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSObject+BannerKit.m", 37, @"Attempt to uniquely identify object that isn't a presentable: %@", a1 object file lineNumber description];
  }
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = [v4 uniquePresentableIdentifier];
  if (v5)
  {
    v6 = (id)BNLogPresentable;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = BNEffectivePresentableDescription(v4);
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "Asked to uniquely identify presentable that already has a unique identifier: presentable: %{public}@; uniqueID: %{public}@",
        buf,
        0x16u);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F29128]);
  objc_setAssociatedObject(v4, "com.apple.BannerKit.presentableUniqueIdentifier", v8, (void *)3);

  objc_sync_exit(v4);
}

- (void)ensurePresentableIsUniquelyIdentifiable
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"NSObject+BannerKit.m", 48, @"Attempt to uniquely identify object that isn't a presentable: %@", a1 object file lineNumber description];
  }
  id obj = a1;
  objc_sync_enter(obj);
  id v4 = [obj uniquePresentableIdentifier];
  if (!v4)
  {
LABEL_6:
    [obj _uniquelyIdentifyPresentable];
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    int v5 = [obj providesTemplateContent];

    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

LABEL_8:
  objc_sync_exit(obj);
}

@end