@interface AMSUserNotificationCenter
+ (BOOL)badgeBundleId:(id)a3 badgeId:(id)a4 enabled:(BOOL)a5 error:(id *)a6;
+ (Class)_determineStrategyForBundleId:(id)a3;
+ (id)activeNotificationsWithCenterBundleId:(id)a3;
+ (id)postNotification:(id)a3 bag:(id)a4 centerBundleId:(id)a5;
+ (id)removeNotification:(id)a3 centerBundleId:(id)a4;
+ (id)removeNotificationWithIdentifier:(id)a3 centerBundleId:(id)a4 logKey:(id)a5 scheduledOnly:(BOOL)a6;
- (AMSUserNotificationStrategy)strategy;
@end

@implementation AMSUserNotificationCenter

+ (id)activeNotificationsWithCenterBundleId:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v4), "_activeNotificationsWithCenterBundleId:", v4);

  return v5;
}

+ (BOOL)badgeBundleId:(id)a3 badgeId:(id)a4 enabled:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [a1 _determineStrategyForBundleId:v10];
  if (v10 && v11)
  {
    uint64_t v18 = v12;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__77;
    v36 = __Block_byref_object_dispose__77;
    id v37 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__AMSUserNotificationCenter_badgeBundleId_badgeId_enabled_error___block_invoke;
    v21[3] = &unk_1E55A8640;
    BOOL v27 = a5;
    id v22 = v11;
    v24 = &v32;
    v25 = &v28;
    uint64_t v26 = v18;
    id v23 = v10;
    +[AMSDefaults updateBadgeIdsForBundle:v23 block:v21];
    if (a6) {
      *a6 = (id) v33[5];
    }
    BOOL v19 = *((unsigned char *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else if (a6)
  {
    AMSErrorWithFormat(2, @"Failed To Badge", @"Invalid parameters. center:%@ badgeId:%@", v13, v14, v15, v16, v17, (uint64_t)v10);
    BOOL v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

uint64_t __65__AMSUserNotificationCenter_badgeBundleId_badgeId_enabled_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 72);
  int v5 = [v3 containsObject:*(void *)(a1 + 32)];
  if (v4)
  {
    if (v5)
    {
      v6 = @"Failed to badge";
      v7 = @"Badge id already exists";
LABEL_11:
      uint64_t v19 = AMSError(7, v6, v7, 0);
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      goto LABEL_12;
    }
    uint64_t v13 = *(void **)(a1 + 64);
    uint64_t v14 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v24 = *(id *)(v16 + 40);
    char v17 = [v13 _badgeBundleId:v15 increment:v14 error:&v24];
    objc_storeStrong((id *)(v16 + 40), v24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v17;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [v3 addObject:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  if ((v5 & 1) == 0)
  {
    v6 = @"Failed to unbadge";
    v7 = @"Badge id not found";
    goto LABEL_11;
  }
  v8 = *(void **)(a1 + 64);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  char v12 = [v8 _badgeBundleId:v10 increment:v9 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_12;
  }
  [v3 removeObject:*(void *)(a1 + 32)];
LABEL_9:
  uint64_t v18 = 1;
LABEL_13:

  return v18;
}

+ (id)postNotification:(id)a3 bag:(id)a4 centerBundleId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v8), "_postNotification:bag:centerBundleId:", v10, v9, v8);

  return v11;
}

+ (id)removeNotification:(id)a3 centerBundleId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v6), "_removeNotification:centerBundleId:", v7, v6);

  return v8;
}

+ (id)removeNotificationWithIdentifier:(id)a3 centerBundleId:(id)a4 logKey:(id)a5 scheduledOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v11), "_removeNotificationWithIdentifier:centerBundleId:logKey:scheduledOnly:", v12, v11, v10, v6);

  return v13;
}

+ (Class)_determineStrategyForBundleId:(id)a3
{
  id v3 = (id)[a3 length];
  if (v3) {
    id v3 = (id)objc_opt_class();
  }
  return (Class)v3;
}

- (AMSUserNotificationStrategy)strategy
{
  return self->_strategy;
}

- (void).cxx_destruct
{
}

@end