@interface WKProcessAssertionBackgroundTaskManager
+ (id)shared;
- (BOOL)_hasBackgroundTask;
- (WKProcessAssertionBackgroundTaskManager)init;
- (id).cxx_construct;
- (uint64_t)_handleBackgroundTaskExpiration;
- (uint64_t)_handleBackgroundTaskExpirationOnMainThread;
- (uint64_t)_scheduleReleaseTask;
- (uint64_t)_updateBackgroundTask;
- (uint64_t)setProcessStateMonitorEnabled:(uint64_t)a1;
- (void)_cancelPendingReleaseTask;
- (void)_handleBackgroundTaskExpiration;
- (void)_handleBackgroundTaskExpirationOnMainThread;
- (void)_notifyAssertionsOfImminentSuspension;
- (void)_releaseBackgroundTask;
- (void)_scheduleReleaseTask;
- (void)_updateBackgroundTask;
- (void)addAssertionNeedingBackgroundTask:(void *)a3;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)dealloc;
- (void)removeAssertionNeedingBackgroundTask:(void *)a3;
- (void)setProcessStateMonitorEnabled:(BOOL)a3;
@end

@implementation WKProcessAssertionBackgroundTaskManager

- (void)addAssertionNeedingBackgroundTask:(void *)a3
{
  if (WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(*((atomic_uchar **)a3 + 1)))
  {
    __break(0xC471u);
    JUMPOUT(0x198626AB0);
  }
  char v5 = 0;
  p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_assertionsNeedingBackgroundTask.m_lock, (unsigned __int8 *)&v5, 1u, memory_order_acquire, memory_order_acquire);
  if (v5) {
    MEMORY[0x19972E8D0](&self->_assertionsNeedingBackgroundTask.m_lock);
  }
  v8 = WTF::ThreadSafeWeakPtrControlBlock::weakRef(*((atomic_uchar **)a3 + 1));
  if (!v8) {
    goto LABEL_55;
  }
  p_assertionsNeedingBackgroundTask = &self->_assertionsNeedingBackgroundTask;
  unsigned int m_maxOperationCountWithoutCleanup = self->_assertionsNeedingBackgroundTask.m_maxOperationCountWithoutCleanup;
  unsigned int v11 = self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup + 1;
  self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = v11;
  m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
  if (v11 > m_maxOperationCountWithoutCleanup)
  {
    if (m_tableForLLDB)
    {
      int v13 = *(m_tableForLLDB - 1);
      if (!v13) {
        goto LABEL_28;
      }
      int v14 = 0;
      unsigned int v15 = v13 - 1;
      do
      {
        uint64_t v16 = v15;
        v17 = &m_tableForLLDB[4 * v15];
        if ((unint64_t)(*v17 + 1) >= 2)
        {
          v18 = (char *)&m_tableForLLDB[4 * v15];
          v20 = (atomic_uchar *)*((void *)v18 + 1);
          v19 = (atomic_uchar **)(v18 + 8);
          if (WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v20))
          {
            void *v17 = -1;
            v21 = *v19;
            *v19 = 0;
            if (v21) {
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v21, v7);
            }
            ++v14;
          }
        }
        --v15;
      }
      while (v16);
      m_tableForLLDB = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
      if (v14)
      {
        *(m_tableForLLDB - 4) += v14;
        m_table = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
        p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
        if (p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table) {
          int v23 = *(m_table - 3);
        }
        else {
          int v23 = 0;
        }
        *(m_table - 3) = v23 - v14;
        m_tableForLLDB = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
        if (p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table)
        {
LABEL_23:
          unsigned int v25 = *(m_tableForLLDB - 1);
          if (v25 >= 9 && 6 * *(m_tableForLLDB - 3) < v25)
          {
            WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::shrinkToBestSize((uint64_t *)&self->_assertionsNeedingBackgroundTask);
            m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
            self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
            if (!m_tableForLLDB)
            {
              unsigned int v24 = 0;
              goto LABEL_30;
            }
            goto LABEL_29;
          }
LABEL_28:
          self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
LABEL_29:
          unsigned int v24 = *(m_tableForLLDB - 3);
          int v27 = 0x7FFFFFFF;
          if (v24 >= 0x7FFFFFFF)
          {
LABEL_31:
            self->_assertionsNeedingBackgroundTask.unsigned int m_maxOperationCountWithoutCleanup = 2 * v27;
            goto LABEL_32;
          }
LABEL_30:
          int v27 = v24;
          goto LABEL_31;
        }
      }
      else
      {
        p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
        if (m_tableForLLDB) {
          goto LABEL_23;
        }
      }
    }
    m_tableForLLDB = 0;
    unsigned int v24 = 0;
    self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
    goto LABEL_30;
  }
LABEL_32:
  if (m_tableForLLDB
    || (WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::expand((uint64_t *)&self->_assertionsNeedingBackgroundTask),
        (m_tableForLLDB = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table) != 0))
  {
    int v28 = *(m_tableForLLDB - 2);
  }
  else
  {
    int v28 = 0;
  }
  unint64_t v29 = ((unint64_t)a3 + ~((void)a3 << 32)) ^ (((unint64_t)a3 + ~((void)a3 << 32)) >> 22);
  unint64_t v30 = 9 * ((v29 + ~(v29 << 13)) ^ ((v29 + ~(v29 << 13)) >> 8));
  unint64_t v31 = (v30 ^ (v30 >> 15)) + ~((v30 ^ (v30 >> 15)) << 27);
  unsigned int v32 = v28 & ((v31 >> 31) ^ v31);
  v33 = (char *)&m_tableForLLDB[4 * v32];
  v34 = *(void **)v33;
  if (*(void *)v33)
  {
    v35 = 0;
    int v36 = 1;
    do
    {
      if (v34 == a3)
      {
        WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v8, v7);
        goto LABEL_55;
      }
      if (v34 == (void *)-1) {
        v35 = v33;
      }
      unsigned int v32 = (v32 + v36) & v28;
      v33 = (char *)&m_tableForLLDB[4 * v32];
      v34 = *(void **)v33;
      ++v36;
    }
    while (*(void *)v33);
    if (v35)
    {
      *(void *)v35 = 0;
      *((void *)v35 + 1) = 0;
      --*((_DWORD *)p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table - 4);
      v33 = v35;
    }
  }
  v37 = (atomic_uchar *)*((void *)v33 + 1);
  *(void *)v33 = a3;
  *((void *)v33 + 1) = v8;
  if (v37) {
    WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v37, v7);
  }
  v38 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
  if (p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table) {
    int v39 = *(v38 - 3) + 1;
  }
  else {
    int v39 = 1;
  }
  *(v38 - 3) = v39;
  v40 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
  if (p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table) {
    int v41 = *(v40 - 3);
  }
  else {
    int v41 = 0;
  }
  uint64_t v42 = (*(v40 - 4) + v41);
  unint64_t v43 = *(v40 - 1);
  if (v43 <= 0x400)
  {
    if (3 * v43 > 4 * v42) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  if (v43 <= 2 * v42) {
LABEL_54:
  }
    WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::expand((uint64_t *)&self->_assertionsNeedingBackgroundTask);
LABEL_55:
  int v44 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_m_lock, (unsigned __int8 *)&v44, 0, memory_order_release, memory_order_relaxed);
  if (v44 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)p_m_lock);
  }

  [(WKProcessAssertionBackgroundTaskManager *)self _updateBackgroundTask];
}

- (void)_updateBackgroundTask
{
  *a1 = &unk_1EE9CFFF8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (BOOL)_hasBackgroundTask
{
  return self->_backgroundTask.m_ptr != 0;
}

+ (id)shared
{
  if (_MergedGlobals_82 == 1) {
    return (id)qword_1EB359A68;
  }
  id result = (id)objc_opt_new();
  qword_1EB359A68 = (uint64_t)result;
  _MergedGlobals_82 = 1;
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((unsigned char *)self + 16) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((unsigned char *)self + 40) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (WKProcessAssertionBackgroundTaskManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WKProcessAssertionBackgroundTaskManager;
  v2 = [(WKProcessAssertionBackgroundTaskManager *)&v12 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4F43708];
    uint64_t v5 = [MEMORY[0x1E4F42738] sharedApplication];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke;
    v11[3] = &unk_1E5812CE0;
    v11[4] = v2;
    [v3 addObserverForName:v4 object:v5 queue:0 usingBlock:v11];
    v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F43660];
    uint64_t v8 = [MEMORY[0x1E4F42738] sharedApplication];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke_2;
    v10[3] = &unk_1E5812CE0;
    v10[4] = v2;
    [v6 addObserverForName:v7 object:v8 queue:0 usingBlock:v10];
  }
  return v2;
}

uint64_t __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelPendingReleaseTask];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateBackgroundTask];
}

uint64_t __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hasBackgroundTask];
  if ((result & 1) == 0)
  {
    return WebKit::WebProcessPool::notifyProcessPoolsApplicationIsAboutToSuspend((WebKit::WebProcessPool *)result);
  }
  return result;
}

- (void)dealloc
{
  [(WKProcessAssertionBackgroundTaskManager *)self _releaseBackgroundTask];
  v3.receiver = self;
  v3.super_class = (Class)WKProcessAssertionBackgroundTaskManager;
  [(WKProcessAssertionBackgroundTaskManager *)&v3 dealloc];
}

- (void)removeAssertionNeedingBackgroundTask:(void *)a3
{
  char v5 = 0;
  p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_assertionsNeedingBackgroundTask.m_lock, (unsigned __int8 *)&v5, 1u, memory_order_acquire, memory_order_acquire);
  if (v5) {
    MEMORY[0x19972E8D0](&self->_assertionsNeedingBackgroundTask.m_lock, a2);
  }
  p_assertionsNeedingBackgroundTask = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
  unsigned int m_maxOperationCountWithoutCleanup = self->_assertionsNeedingBackgroundTask.m_maxOperationCountWithoutCleanup;
  unsigned int v9 = self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup + 1;
  self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = v9;
  m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
  if (v9 <= m_maxOperationCountWithoutCleanup) {
    goto LABEL_31;
  }
  if (m_tableForLLDB)
  {
    int v11 = *(m_tableForLLDB - 1);
    if (!v11) {
      goto LABEL_25;
    }
    v46 = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
    int v12 = 0;
    unsigned int v13 = v11 - 1;
    do
    {
      uint64_t v14 = v13;
      unsigned int v15 = &m_tableForLLDB[4 * v13];
      if ((unint64_t)(*v15 + 1) >= 2)
      {
        uint64_t v16 = (char *)&m_tableForLLDB[4 * v13];
        v18 = (atomic_uchar *)*((void *)v16 + 1);
        v17 = (atomic_uchar **)(v16 + 8);
        if (WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v18))
        {
          *unsigned int v15 = -1;
          v19 = *v17;
          void *v17 = 0;
          if (v19) {
            WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v19, (void *)a2);
          }
          ++v12;
        }
      }
      --v13;
    }
    while (v14);
    p_assertionsNeedingBackgroundTask = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
    m_tableForLLDB = (_DWORD *)*v46;
    if (v12)
    {
      *(m_tableForLLDB - 4) += v12;
      uint64_t v20 = *v46;
      if (*v46) {
        int v21 = *(_DWORD *)(v20 - 12);
      }
      else {
        int v21 = 0;
      }
      *(_DWORD *)(v20 - 12) = v21 - v12;
      m_tableForLLDB = (_DWORD *)*v46;
    }
    if (m_tableForLLDB)
    {
      unsigned int v22 = *(m_tableForLLDB - 1);
      if (v22 >= 9 && 6 * *(m_tableForLLDB - 3) < v22)
      {
        WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::shrinkToBestSize(v46);
        m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
        self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
        if (!m_tableForLLDB)
        {
          unsigned int v24 = 0;
          goto LABEL_29;
        }
LABEL_26:
        unsigned int v24 = *(m_tableForLLDB - 3);
        int v25 = 0x7FFFFFFF;
        if (v24 >= 0x7FFFFFFF) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
LABEL_25:
      self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
      goto LABEL_26;
    }
  }
  m_tableForLLDB = 0;
  unsigned int v24 = 0;
  self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
LABEL_29:
  int v25 = v24;
LABEL_30:
  self->_assertionsNeedingBackgroundTask.unsigned int m_maxOperationCountWithoutCleanup = 2 * v25;
LABEL_31:
  if (m_tableForLLDB)
  {
    unsigned int v26 = *(m_tableForLLDB - 2);
    unint64_t v27 = ((unint64_t)a3 + ~((void)a3 << 32)) ^ (((unint64_t)a3 + ~((void)a3 << 32)) >> 22);
    unint64_t v28 = 9 * ((v27 + ~(v27 << 13)) ^ ((v27 + ~(v27 << 13)) >> 8));
    unint64_t v29 = (v28 ^ (v28 >> 15)) + ~((v28 ^ (v28 >> 15)) << 27);
    uint64_t v30 = v26 & ((v29 >> 31) ^ v29);
    unint64_t v31 = *(void **)&m_tableForLLDB[4 * v30];
    if (v31 != a3)
    {
      int v32 = 1;
      while (v31)
      {
        uint64_t v30 = (v30 + v32) & v26;
        unint64_t v31 = *(void **)&m_tableForLLDB[4 * v30];
        ++v32;
        if (v31 == a3) {
          goto LABEL_38;
        }
      }
      uint64_t v30 = *(m_tableForLLDB - 1);
    }
LABEL_38:
    uint64_t v33 = *(m_tableForLLDB - 1);
    if (v30 != v33)
    {
      v34 = &m_tableForLLDB[4 * v30];
      int v36 = (atomic_uchar **)(v34 + 1);
      v35 = (atomic_uchar *)v34[1];
      if (v35)
      {
        WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v35);
        m_tableForLLDB = (_DWORD *)*p_assertionsNeedingBackgroundTask;
        if (!*p_assertionsNeedingBackgroundTask)
        {
          v37 = 0;
LABEL_45:
          if (v37 != v34)
          {
            void *v34 = -1;
            v38 = *v36;
            *int v36 = 0;
            if (v38) {
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v38, (void *)a2);
            }
            ++*(_DWORD *)(*p_assertionsNeedingBackgroundTask - 16);
            uint64_t v39 = *p_assertionsNeedingBackgroundTask;
            if (*p_assertionsNeedingBackgroundTask) {
              int v40 = *(_DWORD *)(v39 - 12) - 1;
            }
            else {
              int v40 = -1;
            }
            *(_DWORD *)(v39 - 12) = v40;
            uint64_t v41 = *p_assertionsNeedingBackgroundTask;
            if (*p_assertionsNeedingBackgroundTask)
            {
              unsigned int v42 = 6 * *(_DWORD *)(v41 - 12);
              unsigned int v43 = *(_DWORD *)(v41 - 4);
              if (v42 < v43 && v43 >= 9) {
                WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::rehash(p_assertionsNeedingBackgroundTask, v43 >> 1);
              }
            }
          }
          goto LABEL_60;
        }
        uint64_t v33 = *(m_tableForLLDB - 1);
      }
      v37 = &m_tableForLLDB[4 * v33];
      if (v37 == v34) {
        goto LABEL_60;
      }
      goto LABEL_45;
    }
  }
LABEL_60:
  int v45 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_m_lock, (unsigned __int8 *)&v45, 0, memory_order_release, memory_order_relaxed);
  if (v45 != 1)
  {
    WTF::Lock::unlockSlow((WTF::Lock *)p_m_lock);
  }
}

- (void)_notifyAssertionsOfImminentSuspension
{
  char v3 = 0;
  int v45 = 0;
  uint64_t v46 = 0;
  p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_assertionsNeedingBackgroundTask.m_lock, (unsigned __int8 *)&v3, 1u, memory_order_acquire, memory_order_acquire);
  if (v3) {
    MEMORY[0x19972E8D0](&self->_assertionsNeedingBackgroundTask.m_lock, a2);
  }
  p_assertionsNeedingBackgroundTask = &self->_assertionsNeedingBackgroundTask;
  v47 = 0;
  uint64_t v48 = 0;
  m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB && (uint64_t v7 = *(m_tableForLLDB - 3), v7))
  {
    if (v7 >> 29)
    {
      __break(0xC471u);
      return;
    }
    uint64_t v8 = (WTF *)WTF::fastMalloc((WTF *)(8 * v7));
    LODWORD(v48) = v7;
    v47 = v8;
    m_table = (char *)p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
    v10 = (const char *)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin(p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table);
    SEL v11 = v10;
    SEL v12 = a2;
    if (m_table)
    {
      unsigned int v13 = &m_table[16 * *((unsigned int *)m_table - 1)];
      if (v13 == v10) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!v10)
      {
LABEL_28:
        int v14 = 0;
LABEL_29:
        v47 = 0;
        LODWORD(v48) = 0;
        WTF::fastFree(v8, (void *)a2);
        goto LABEL_30;
      }
      unsigned int v13 = 0;
    }
    int v14 = 0;
    LODWORD(v15) = 0;
    do
    {
      WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::LibWebRTCCodecsProxy>(&v50, *((atomic_uchar **)v11 + 1), *(void *)v11);
      if (v50)
      {
        uint64_t v49 = v50;
        if (v15 == v48)
        {
          uint64_t v16 = (uint64_t *)WTF::Vector<WTF::Ref<WebCore::ApplePayError,WTF::RawPtrTraits<WebCore::ApplePayError>,WTF::DefaultRefDerefTraits<WebCore::ApplePayError>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v47, v15 + 1, (unint64_t)&v49);
          uint64_t v15 = HIDWORD(v48);
          uint64_t v8 = v47;
          uint64_t v17 = *v16;
          *uint64_t v16 = 0;
          *((void *)v8 + v15) = v17;
        }
        else
        {
          uint64_t v49 = 0;
          *((void *)v8 + v15) = v50;
        }
        LODWORD(v15) = v15 + 1;
        HIDWORD(v48) = v15;
        uint64_t v18 = v49;
        uint64_t v49 = 0;
        if (v18) {
          WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::ProcessAssertion,(WTF::DestructionThread)0>(*(atomic_uchar **)(v18 + 8), (void *)a2);
        }
      }
      else
      {
        int v14 = 1;
      }
      while (1)
      {
        v11 += 16;
        if (v11 == v12) {
          break;
        }
        if ((unint64_t)(*(void *)v11 + 1) > 1) {
          goto LABEL_24;
        }
      }
      SEL v11 = v12;
LABEL_24:
      ;
    }
    while (v11 != v13);
    if (v48 <= v15) {
      goto LABEL_30;
    }
    if (!v15)
    {
      if (!v8) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    LODWORD(v48) = v15;
    v47 = (WTF *)WTF::fastRealloc(v8, (void *)(8 * v15));
  }
  else
  {
    int v14 = 0;
  }
LABEL_30:
  v19 = v45;
  if (HIDWORD(v46))
  {
    uint64_t v20 = 8 * HIDWORD(v46);
    int v21 = v45;
    do
    {
      uint64_t v22 = *(void *)v21;
      *(void *)int v21 = 0;
      if (v22) {
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::ProcessAssertion,(WTF::DestructionThread)0>(*(atomic_uchar **)(v22 + 8), (void *)a2);
      }
      int v21 = (WTF *)((char *)v21 + 8);
      v20 -= 8;
    }
    while (v20);
  }
  if (v19)
  {
    int v45 = 0;
    LODWORD(v46) = 0;
    WTF::fastFree(v19, (void *)a2);
  }
  int v45 = v47;
  uint64_t v23 = v48;
  v47 = 0;
  uint64_t v48 = 0;
  uint64_t v46 = v23;
  WTF::Vector<WTF::Ref<WebKit::ProcessAndUIAssertion,WTF::RawPtrTraits<WebKit::ProcessAndUIAssertion>,WTF::DefaultRefDerefTraits<WebKit::ProcessAndUIAssertion>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v47, (void *)a2);
  int v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
  if (!v14) {
    goto LABEL_61;
  }
  if (!v25) {
    goto LABEL_60;
  }
  int v26 = *(v25 - 1);
  if (!v26)
  {
LABEL_59:
    self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
    goto LABEL_62;
  }
  int v27 = 0;
  unsigned int v28 = v26 - 1;
  do
  {
    uint64_t v29 = v28;
    uint64_t v30 = &v25[4 * v28];
    if ((unint64_t)(*v30 + 1) >= 2)
    {
      unint64_t v31 = (char *)&v25[4 * v28];
      uint64_t v33 = (atomic_uchar *)*((void *)v31 + 1);
      int v32 = (atomic_uchar **)(v31 + 8);
      if (WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v33))
      {
        *uint64_t v30 = -1;
        v34 = *v32;
        *int v32 = 0;
        if (v34) {
          WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v34, v24);
        }
        ++v27;
      }
    }
    --v28;
  }
  while (v29);
  int v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
  if (v27)
  {
    *(v25 - 4) += v27;
    v35 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
    if (p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table) {
      int v36 = *(v35 - 3);
    }
    else {
      int v36 = 0;
    }
    *(v35 - 3) = v36 - v27;
    int v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
  }
  if (!v25)
  {
LABEL_60:
    unsigned int v39 = 0;
    self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
    goto LABEL_65;
  }
  unsigned int v37 = *(v25 - 1);
  if (v37 < 9 || 6 * *(v25 - 3) >= v37) {
    goto LABEL_59;
  }
  WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::shrinkToBestSize((uint64_t *)&self->_assertionsNeedingBackgroundTask);
  int v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
LABEL_61:
  self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
  if (v25)
  {
LABEL_62:
    unsigned int v39 = *(v25 - 3);
    int v40 = 0x7FFFFFFF;
    if (v39 >= 0x7FFFFFFF) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  unsigned int v39 = 0;
LABEL_65:
  int v40 = v39;
LABEL_66:
  self->_assertionsNeedingBackgroundTask.unsigned int m_maxOperationCountWithoutCleanup = 2 * v40;
  int v41 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_assertionsNeedingBackgroundTask.m_lock, (unsigned __int8 *)&v41, 0, memory_order_release, memory_order_relaxed);
  if (v41 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)p_m_lock);
  }
  if (HIDWORD(v46))
  {
    unsigned int v42 = v45;
    uint64_t v43 = 8 * HIDWORD(v46);
    do
    {
      uint64_t v44 = *(void *)(*(void *)v42 + 176);
      if (v44) {
        (*(void (**)(uint64_t))(*(void *)v44 + 16))(v44);
      }
      unsigned int v42 = (WTF *)((char *)v42 + 8);
      v43 -= 8;
    }
    while (v43);
  }
  WTF::Vector<WTF::Ref<WebKit::ProcessAndUIAssertion,WTF::RawPtrTraits<WebKit::ProcessAndUIAssertion>,WTF::DefaultRefDerefTraits<WebKit::ProcessAndUIAssertion>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v45, v24);
}

- (void)_scheduleReleaseTask
{
  *a1 = &unk_1EE9CFFD0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (void)_cancelPendingReleaseTask
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id pendingTaskReleaseTask = self->_pendingTaskReleaseTask;
  if (pendingTaskReleaseTask)
  {
    uint64_t v4 = qword_1EB358348;
    if (os_log_type_enabled((os_log_t)qword_1EB358348, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      v6 = self;
      _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKProcessAssertionBackgroundTaskManager: _cancelPendingReleaseTask because the application is foreground again", (uint8_t *)&v5, 0xCu);
      id pendingTaskReleaseTask = self->_pendingTaskReleaseTask;
    }
    dispatch_block_cancel(pendingTaskReleaseTask);
    self->_id pendingTaskReleaseTask = 0;
  }
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = qword_1EB358348;
  if (os_log_type_enabled((os_log_t)qword_1EB358348, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = a4;
    _os_log_error_impl(&dword_1985F2000, v6, OS_LOG_TYPE_ERROR, "WKProcessAssertionBackgroundTaskManager: FinishTaskInterruptable assertion was invalidated, error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)&self->_backgroundTaskWasInvalidated);
}

- (void)_handleBackgroundTaskExpiration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F963E8], "currentProcess"), "activeLimitations"), "runTime");
  uint64_t v4 = v3;
  int v5 = qword_1EB358348;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_1EB358348, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    int v7 = (WTF::RunLoop *)WTF::RunLoop::main((WTF::RunLoop *)v6);
    LODWORD(v10) = 67109376;
    HIDWORD(v10) = WTF::RunLoop::isCurrent(v7);
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "WKProcessAssertionBackgroundTaskManager: Background task expired while holding WebKit ProcessAssertion (isMainThread=%d, remainingTime=%g).", (uint8_t *)&v10, 0x12u);
  }
  id v8 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v8 = &unk_1EE9D0020;
  v8[1] = self;
  v10 = v8;
  WTF::callOnMainRunLoopAndWait();
  uint64_t v9 = v10;
  v10 = 0;
  if (v9) {
    (*(void (**)(void *))(*v9 + 8))(v9);
  }
}

- (void)_handleBackgroundTaskExpirationOnMainThread
{
  *a1 = &unk_1EE9D0048;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (void)_releaseBackgroundTask
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(WKProcessAssertionBackgroundTaskManager *)self _hasBackgroundTask])
  {
    uint64_t v3 = qword_1EB358348;
    if (os_log_type_enabled((os_log_t)qword_1EB358348, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = self;
      _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "%p - WKProcessAssertionBackgroundTaskManager: endBackgroundTask", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v4 = (WebKit::WebProcessPool *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F963E8], "currentProcess"), "activeLimitations"), "runTime");
    if (v5 != *MEMORY[0x1E4F964B8])
    {
      WebKit::WebProcessPool::notifyProcessPoolsApplicationIsAboutToSuspend(v4);
      value = self->m_processStateMonitor.__ptr_.__value_;
      if (value) {
        WebKit::ProcessStateMonitor::processWillBeSuspendedImmediately((uint64_t)value);
      }
    }
    [self->_backgroundTask.m_ptr removeObserver:self];
    [self->_backgroundTask.m_ptr invalidate];
    m_ptr = self->_backgroundTask.m_ptr;
    self->_backgroundTask.m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
}

- (void)setProcessStateMonitorEnabled:(BOOL)a3
{
  p_m_processStateMonitor = &self->m_processStateMonitor;
  if (a3)
  {
    if (p_m_processStateMonitor->__ptr_.__value_) {
      return;
    }
    uint64_t v6 = WTF::fastMalloc((WTF *)0x40);
    int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9CFBD0;
    int v8 = v7;
    WebKit::ProcessStateMonitor::ProcessStateMonitor(v6, (uint64_t *)&v8);
    if (v8) {
      (*(void (**)(void *))(*v8 + 8))(v8);
    }
    uint64_t v4 = (id **)p_m_processStateMonitor;
    double v5 = (id *)v6;
  }
  else
  {
    uint64_t v4 = (id **)&self->m_processStateMonitor;
    double v5 = 0;
  }

  std::unique_ptr<WebKit::ProcessStateMonitor>::reset[abi:sn180100](v4, v5);
}

- (void).cxx_destruct
{
  std::unique_ptr<WebKit::ProcessStateMonitor>::reset[abi:sn180100]((id **)&self->m_processStateMonitor, 0);
  m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v5 = *(m_tableForLLDB - 1);
    if (v5)
    {
      uint64_t v6 = (atomic_uchar **)(m_tableForLLDB + 2);
      do
      {
        if (*(v6 - 1) != (atomic_uchar *)-1)
        {
          int v7 = *v6;
          NSObject *v6 = 0;
          if (v7) {
            WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v7, v3);
          }
        }
        v6 += 2;
        --v5;
      }
      while (v5);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), v3);
  }
  m_ptr = self->_backgroundTask.m_ptr;
  self->_backgroundTask.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (uint64_t)setProcessStateMonitorEnabled:(uint64_t)a1
{
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v7);
  if (v8)
  {
    uint64_t v4 = v7;
    uint64_t v5 = 8 * v8;
    do
    {
      WebKit::WebProcessPool::setProcessesShouldSuspend(*v4++, a2);
      v5 -= 8;
    }
    while (v5);
  }
  return WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v7, v3);
}

- (uint64_t)_scheduleReleaseTask
{
  *(void *)(*(void *)(a1 + 8) + 48) = 0;
  return [*(id *)(a1 + 8) _releaseBackgroundTask];
}

- (uint64_t)_updateBackgroundTask
{
  uint64_t result = WTF::ThreadSafeWeakHashSet<WebKit::ProcessAndUIAssertion>::isEmptyIgnoringNullReferences(*(void *)(a1 + 8) + 24);
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 8);
    return [v3 _releaseBackgroundTask];
  }
  return result;
}

- (uint64_t)_handleBackgroundTaskExpiration
{
  return [*(id *)(a1 + 8) _handleBackgroundTaskExpirationOnMainThread];
}

- (uint64_t)_handleBackgroundTaskExpirationOnMainThread
{
  return [*(id *)(a1 + 8) _updateBackgroundTask];
}

@end