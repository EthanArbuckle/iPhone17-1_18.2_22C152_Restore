@interface OrgApacheLuceneIndexMergeRateLimiter
- (BOOL)getAbort;
- (OrgApacheLuceneIndexMergeRateLimiter)initWithOrgApacheLuceneIndexMergePolicy_OneMerge:(id)a3;
- (double)getMBPerSec;
- (id)maybePauseWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (int64_t)getMinPauseCheckBytes;
- (int64_t)getTotalBytesWritten;
- (int64_t)getTotalPausedNS;
- (int64_t)getTotalStoppedNS;
- (int64_t)pauseWithLong:(int64_t)a3;
- (void)checkAbort;
- (void)dealloc;
- (void)setAbort;
- (void)setMBPerSecWithDouble:(double)a3;
@end

@implementation OrgApacheLuceneIndexMergeRateLimiter

- (OrgApacheLuceneIndexMergeRateLimiter)initWithOrgApacheLuceneIndexMergePolicy_OneMerge:(id)a3
{
  return self;
}

- (void)setMBPerSecWithDouble:(double)a3
{
  objc_sync_enter(self);
  if (a3 < 0.0)
  {
    CFStringRef v16 = JreStrcat("$D", v5, v6, v7, v8, v9, v10, v11, @"mbPerSec must be positive; got: ");
    v17 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v16);
    objc_exception_throw(v17);
  }
  self->mbPerSec_ = a3;
  double v12 = a3 * 0.025 * 1024.0;
  unint64_t v13 = vcvtd_n_s64_f64(v12, 0xAuLL);
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 * 1024.0 < 0.0) {
    unint64_t v14 = 0x8000000000000000;
  }
  if (v13 == 0x8000000000000000) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v13;
  }
  self->minPauseCheckBytes_ = JavaLangMath_minWithLong_withLong_(0x100000, v15);
  [(OrgApacheLuceneIndexMergeRateLimiter *)self notify];
  objc_sync_exit(self);
}

- (double)getMBPerSec
{
  objc_sync_enter(self);
  double mbPerSec = self->mbPerSec_;
  objc_sync_exit(self);
  return mbPerSec;
}

- (int64_t)getTotalBytesWritten
{
  return atomic_load((unint64_t *)&self->totalBytesWritten_);
}

- (int64_t)pauseWithLong:(int64_t)a3
{
  unint64_t v5 = atomic_load((unint64_t *)&self->totalBytesWritten_);
  atomic_store(v5 + a3, (unint64_t *)&self->totalBytesWritten_);
  uint64_t v6 = JavaLangSystem_nanoTime();
  int64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = sub_1000D2324((uint64_t)self, a3, v6);
    if ((atomic_load_explicit(OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v8 == OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum_values_) {
      break;
    }
    uint64_t v9 = JavaLangSystem_nanoTime();
    if ((atomic_load_explicit(OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v8 == qword_100563808) {
      uint64_t v10 = &OBJC_IVAR___OrgApacheLuceneIndexMergeRateLimiter_totalStoppedNS_;
    }
    else {
      uint64_t v10 = &OBJC_IVAR___OrgApacheLuceneIndexMergeRateLimiter_totalPausedNS_;
    }
    *(Class *)((char *)&self->super.super.isa + *v10) = (Class)(*(char **)((char *)&self->super.super.isa + *v10)
                                                              + v9
                                                              - v6);
    v7 += v9 - v6;
    uint64_t v6 = v9;
  }
  self->lastNS_ = v6;
  return v7;
}

- (int64_t)getTotalStoppedNS
{
  objc_sync_enter(self);
  int64_t totalStoppedNS = self->totalStoppedNS_;
  objc_sync_exit(self);
  return totalStoppedNS;
}

- (int64_t)getTotalPausedNS
{
  objc_sync_enter(self);
  int64_t totalPausedNS = self->totalPausedNS_;
  objc_sync_exit(self);
  return totalPausedNS;
}

- (id)maybePauseWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return (id)sub_1000D2324((uint64_t)self, a3, a4);
}

- (void)checkAbort
{
  objc_sync_enter(self);
  if (self->abort_)
  {
    merge = self->merge_;
    if (merge)
    {
      [(OrgApacheLuceneIndexMergePolicy_OneMerge *)merge segString];
      CFStringRef v11 = JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, @"merge is aborted: ");
      double v12 = new_OrgApacheLuceneIndexMergePolicy_MergeAbortedException_initWithNSString_((uint64_t)v11);
      objc_exception_throw(v12);
    }
    JreThrowNullPointerException();
  }
  objc_sync_exit(self);
}

- (void)setAbort
{
  objc_sync_enter(self);
  self->abort_ = 1;
  [(OrgApacheLuceneIndexMergeRateLimiter *)self notify];
  objc_sync_exit(self);
}

- (BOOL)getAbort
{
  objc_sync_enter(self);
  BOOL abort = self->abort_;
  objc_sync_exit(self);
  return abort;
}

- (int64_t)getMinPauseCheckBytes
{
  return self->minPauseCheckBytes_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMergeRateLimiter;
  [(OrgApacheLuceneIndexMergeRateLimiter *)&v3 dealloc];
}

@end