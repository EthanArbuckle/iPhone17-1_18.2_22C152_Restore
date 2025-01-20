@interface OrgApacheLuceneIndexSegmentCoreReaders
- (OrgApacheLuceneIndexSegmentCoreReaders)initWithOrgApacheLuceneIndexSegmentReader:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6;
- (int)getRefCount;
- (void)addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3;
- (void)dealloc;
- (void)decRef;
- (void)incRef;
- (void)notifyCoreClosedListenersWithJavaLangThrowable:(id)a3;
- (void)removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3;
@end

@implementation OrgApacheLuceneIndexSegmentCoreReaders

- (OrgApacheLuceneIndexSegmentCoreReaders)initWithOrgApacheLuceneIndexSegmentReader:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6
{
  return self;
}

- (int)getRefCount
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicInteger *)ref get];
}

- (void)incRef
{
  do
  {
    ref = self->ref_;
    if (!ref) {
      JreThrowNullPointerException();
    }
    id v4 = (id)[(JavaUtilConcurrentAtomicAtomicInteger *)ref get];
    if ((int)v4 < 1)
    {
      v5 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_(@"SegmentCoreReaders is already closed");
      objc_exception_throw(v5);
    }
  }
  while (![(JavaUtilConcurrentAtomicAtomicInteger *)self->ref_ compareAndSetWithInt:v4 withInt:(v4 + 1)]);
}

- (void)decRef
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  if (![(JavaUtilConcurrentAtomicAtomicInteger *)ref decrementAndGet])
  {
    int8x16_t v6 = vextq_s8(*(int8x16_t *)&self->fieldsReaderLocal_, *(int8x16_t *)&self->fieldsReaderLocal_, 8uLL);
    normsProducer = self->normsProducer_;
    fields = self->fields_;
    int8x16_t v8 = vextq_s8(*(int8x16_t *)&self->fieldsReaderOrig_, *(int8x16_t *)&self->fieldsReaderOrig_, 8uLL);
    cfsReader = self->cfsReader_;
    v10 = normsProducer;
    v5 = +[IOSObjectArray arrayWithObjects:&v6 count:7 type:JavaIoCloseable_class_()];
    OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v5);
    sub_100043494((uint64_t)self, 0);
  }
}

- (void)notifyCoreClosedListenersWithJavaLangThrowable:(id)a3
{
}

- (void)addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3
{
  coreClosedListeners = self->coreClosedListeners_;
  if (!coreClosedListeners) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)coreClosedListeners addWithId:a3];
}

- (void)removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3
{
  coreClosedListeners = self->coreClosedListeners_;
  if (!coreClosedListeners) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)coreClosedListeners removeWithId:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentCoreReaders;
  [(OrgApacheLuceneIndexSegmentCoreReaders *)&v3 dealloc];
}

@end