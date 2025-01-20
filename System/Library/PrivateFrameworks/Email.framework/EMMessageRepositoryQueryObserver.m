@interface EMMessageRepositoryQueryObserver
@end

@implementation EMMessageRepositoryQueryObserver

void __83___EMMessageRepositoryQueryObserver__performQueryWithRemoteConnection_forRecovery___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  id v4 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "addCancelable:");
}

void __65___EMMessageRepositoryQueryObserver_recoverWithRemoteConnection___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 16);
    uint64_t v4 = *(void *)&v3[18]._os_unfair_lock_opaque;
    LOBYTE(v3[20]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v3 + 16);
    if (v4)
    {
      v5 = +[EMMessageRepository log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)&v3[26]._os_unfair_lock_opaque;
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)&v3[4]._os_unfair_lock_opaque;
        int v13 = 134218754;
        v14 = v3;
        __int16 v15 = 2114;
        uint64_t v16 = v6;
        __int16 v17 = 2048;
        uint64_t v18 = v7;
        __int16 v19 = 2048;
        uint64_t v20 = v8;
        _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ attempting recovery %ld for query<%p>", (uint8_t *)&v13, 0x2Au);
      }

      [(os_unfair_lock_s *)v3 _performQueryWithRemoteConnection:*(void *)(a1 + 32) forRecovery:1];
    }
    else
    {
      v9 = +[EMMessageRepository log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)&v3[26]._os_unfair_lock_opaque;
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v12 = *(void *)&v3[4]._os_unfair_lock_opaque;
        int v13 = 134218754;
        v14 = v3;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ skipping recovery %ld for query<%p> since it has already recovered", (uint8_t *)&v13, 0x2Au);
      }
    }
  }
}

uint64_t __85___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observer:*(void *)(a1 + 40) matchedChangesForObjectIDs:a2];
}

uint64_t __84___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observer:*(void *)(a1 + 40) matchedChangesForObjectIDs:a2];
}

@end