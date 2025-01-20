@interface OrgApacheLuceneIndexIndexReader
- (BOOL)hasDeletions;
- (BOOL)isEqual:(id)a3;
- (BOOL)tryIncRef;
- (OrgApacheLuceneIndexIndexReader)init;
- (id)documentWithInt:(int)a3;
- (id)documentWithInt:(int)a3 withJavaUtilSet:(id)a4;
- (id)ensureOpen;
- (id)getTermVectorWithInt:(int)a3 withNSString:(id)a4;
- (id)leaves;
- (int)getRefCount;
- (int)numDeletedDocs;
- (unint64_t)hash;
- (void)addReaderClosedListenerWithOrgApacheLuceneIndexIndexReader_ReaderClosedListener:(id)a3;
- (void)close;
- (void)dealloc;
- (void)incRef;
- (void)notifyReaderClosedListenersWithJavaLangThrowable:(id)a3;
- (void)registerParentReaderWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (void)removeReaderClosedListenerWithOrgApacheLuceneIndexIndexReader_ReaderClosedListener:(id)a3;
@end

@implementation OrgApacheLuceneIndexIndexReader

- (OrgApacheLuceneIndexIndexReader)init
{
  return self;
}

- (void)addReaderClosedListenerWithOrgApacheLuceneIndexIndexReader_ReaderClosedListener:(id)a3
{
  -[OrgApacheLuceneIndexIndexReader ensureOpen]_0((uint64_t)self);
  readerClosedListeners = self->readerClosedListeners_;
  if (!readerClosedListeners) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)readerClosedListeners addWithId:a3];
}

- (id)ensureOpen
{
  v2 = *(void **)(a1 + 16);
  if (!v2) {
    JreThrowNullPointerException();
  }
  id result = [v2 get];
  if ((int)result <= 0)
  {
    CFStringRef v4 = @"this IndexReader is closed";
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 9))
  {
    CFStringRef v4 = @"this IndexReader cannot be used anymore as one of its child readers was closed";
LABEL_8:
    v5 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_((uint64_t)v4);
    objc_exception_throw(v5);
  }
  return result;
}

- (void)removeReaderClosedListenerWithOrgApacheLuceneIndexIndexReader_ReaderClosedListener:(id)a3
{
  -[OrgApacheLuceneIndexIndexReader ensureOpen]_0((uint64_t)self);
  readerClosedListeners = self->readerClosedListeners_;
  if (!readerClosedListeners) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)readerClosedListeners removeWithId:a3];
}

- (void)registerParentReaderWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  -[OrgApacheLuceneIndexIndexReader ensureOpen]_0((uint64_t)self);
  parentReaders = self->parentReaders_;
  if (!parentReaders) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)parentReaders addWithId:a3];
}

- (void)notifyReaderClosedListenersWithJavaLangThrowable:(id)a3
{
}

- (int)getRefCount
{
  refCount = self->refCount_;
  if (!refCount) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicInteger *)refCount get];
}

- (void)incRef
{
  if (!-[OrgApacheLuceneIndexIndexReader tryIncRef]_0((uint64_t)self))
  {
    -[OrgApacheLuceneIndexIndexReader ensureOpen]_0((uint64_t)self);
  }
}

- (BOOL)tryIncRef
{
  do
  {
    v2 = *(void **)(a1 + 16);
    if (!v2) {
      JreThrowNullPointerException();
    }
    id v3 = [v2 get];
  }
  while ((int)v3 >= 1
       && ![*(id *)(a1 + 16) compareAndSetWithInt:v3 withInt:(v3 + 1)]);
  return (int)v3 > 0;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  return (int)JavaLangSystem_identityHashCodeWithId_((uint64_t)self);
}

- (id)getTermVectorWithInt:(int)a3 withNSString:(id)a4
{
  id result = [(OrgApacheLuceneIndexIndexReader *)self getTermVectorsWithInt:*(void *)&a3];
  if (result)
  {
    return [result termsWithNSString:a4];
  }
  return result;
}

- (int)numDeletedDocs
{
  unsigned int v3 = [(OrgApacheLuceneIndexIndexReader *)self maxDoc];
  return v3 - [(OrgApacheLuceneIndexIndexReader *)self numDocs];
}

- (id)documentWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = new_OrgApacheLuceneDocumentDocumentStoredFieldVisitor_init();
  [(OrgApacheLuceneIndexIndexReader *)self documentWithInt:v3 withOrgApacheLuceneIndexStoredFieldVisitor:v5];
  return [(OrgApacheLuceneDocumentDocumentStoredFieldVisitor *)v5 getDocument];
}

- (id)documentWithInt:(int)a3 withJavaUtilSet:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = new_OrgApacheLuceneDocumentDocumentStoredFieldVisitor_initWithJavaUtilSet_(a4);
  [(OrgApacheLuceneIndexIndexReader *)self documentWithInt:v4 withOrgApacheLuceneIndexStoredFieldVisitor:v6];
  return [(OrgApacheLuceneDocumentDocumentStoredFieldVisitor *)v6 getDocument];
}

- (BOOL)hasDeletions
{
  unsigned int v3 = [(OrgApacheLuceneIndexIndexReader *)self maxDoc];
  return (int)(v3 - [(OrgApacheLuceneIndexIndexReader *)self numDocs]) > 0;
}

- (void)close
{
  objc_sync_enter(self);
  if (!self->closed_)
  {
    sub_100108D90((uint64_t)self);
    self->closed_ = 1;
  }
  objc_sync_exit(self);
}

- (id)leaves
{
  id v2 = [(OrgApacheLuceneIndexIndexReader *)self getContext];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 leaves];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexIndexReader;
  [(OrgApacheLuceneIndexIndexReader *)&v3 dealloc];
}

@end