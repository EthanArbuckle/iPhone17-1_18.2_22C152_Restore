@interface OrgApacheLuceneUtilWeakIdentityMap
+ (id)newConcurrentHashMapWithBoolean:(BOOL)a3;
+ (id)newHashMapWithBoolean:(BOOL)a3;
+ (void)initialize;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)isEmpty;
- (OrgApacheLuceneUtilWeakIdentityMap)initWithJavaUtilMap:(id)a3 withBoolean:(BOOL)a4;
- (id)getWithId:(id)a3;
- (id)keyIterator;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)valueIterator;
- (int)size;
- (void)clear;
- (void)dealloc;
- (void)reap;
@end

@implementation OrgApacheLuceneUtilWeakIdentityMap

+ (id)newHashMapWithBoolean:(BOOL)a3
{
  return OrgApacheLuceneUtilWeakIdentityMap_newHashMapWithBoolean_(a3);
}

+ (id)newConcurrentHashMapWithBoolean:(BOOL)a3
{
  return OrgApacheLuceneUtilWeakIdentityMap_newConcurrentHashMapWithBoolean_(a3);
}

- (OrgApacheLuceneUtilWeakIdentityMap)initWithJavaUtilMap:(id)a3 withBoolean:(BOOL)a4
{
  p_queue = &self->queue_;
  v8 = new_JavaLangRefReferenceQueue_init();
  JreStrongAssignAndConsume((id *)p_queue, v8);
  JreStrongAssign((id *)&self->backingStore_, a3);
  self->reapOnRead_ = a4;
  return self;
}

- (void)clear
{
  backingStore = self->backingStore_;
  if (!backingStore) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)backingStore clear];
  [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
}

- (BOOL)containsKeyWithId:(id)a3
{
  if (self->reapOnRead_) {
    [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
  }
  backingStore = self->backingStore_;
  if (!backingStore) {
    JreThrowNullPointerException();
  }
  v6 = [OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference alloc];
  sub_10007CC60((uint64_t)v6, (uint64_t)a3, 0);
  v7 = v6;
  return [(JavaUtilMap *)backingStore containsKeyWithId:v7];
}

- (id)getWithId:(id)a3
{
  if (self->reapOnRead_) {
    [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
  }
  backingStore = self->backingStore_;
  if (!backingStore) {
    JreThrowNullPointerException();
  }
  v6 = [OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference alloc];
  sub_10007CC60((uint64_t)v6, (uint64_t)a3, 0);
  v7 = v6;
  return [(JavaUtilMap *)backingStore getWithId:v7];
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
  backingStore = self->backingStore_;
  if (!backingStore) {
    JreThrowNullPointerException();
  }
  queue = self->queue_;
  v9 = [OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference alloc];
  sub_10007CC60((uint64_t)v9, (uint64_t)a3, (uint64_t)queue);
  v10 = v9;
  return [(JavaUtilMap *)backingStore putWithId:v10 withId:a4];
}

- (BOOL)isEmpty
{
  return [(OrgApacheLuceneUtilWeakIdentityMap *)self size] == 0;
}

- (id)removeWithId:(id)a3
{
  [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
  backingStore = self->backingStore_;
  if (!backingStore) {
    JreThrowNullPointerException();
  }
  v6 = [OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference alloc];
  sub_10007CC60((uint64_t)v6, (uint64_t)a3, 0);
  v7 = v6;
  return [(JavaUtilMap *)backingStore removeWithId:v7];
}

- (int)size
{
  backingStore = self->backingStore_;
  if (!backingStore) {
    JreThrowNullPointerException();
  }
  if ([(JavaUtilMap *)backingStore isEmpty]) {
    return 0;
  }
  if (self->reapOnRead_) {
    [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
  }
  v5 = self->backingStore_;
  return [(JavaUtilMap *)v5 size];
}

- (id)keyIterator
{
  [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
  backingStore = self->backingStore_;
  if (!backingStore || (id v4 = [(JavaUtilMap *)backingStore keySet]) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = [v4 iterator];
  v6 = [OrgApacheLuceneUtilWeakIdentityMap__1 alloc];
  JreStrongAssign((id *)&v6->val$iterator_, v5);
  JreStrongAssign(&v6->next_, 0);
  v6->nextIsSet_ = 0;
  return v6;
}

- (id)valueIterator
{
  if (self->reapOnRead_) {
    [(OrgApacheLuceneUtilWeakIdentityMap *)self reap];
  }
  backingStore = self->backingStore_;
  if (!backingStore || (id v4 = [(JavaUtilMap *)backingStore values]) == 0) {
    JreThrowNullPointerException();
  }
  return [v4 iterator];
}

- (void)reap
{
  queue = self->queue_;
  if (!queue) {
LABEL_5:
  }
    JreThrowNullPointerException();
  while (1)
  {
    id v4 = [(JavaLangRefReferenceQueue *)queue poll];
    if (!v4) {
      break;
    }
    id v5 = v4;
    backingStore = self->backingStore_;
    if (backingStore)
    {
      [(JavaUtilMap *)backingStore removeWithId:v5];
      queue = self->queue_;
      if (queue) {
        continue;
      }
    }
    goto LABEL_5;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilWeakIdentityMap;
  [(OrgApacheLuceneUtilWeakIdentityMap *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilWeakIdentityMap_NULL__, objc_alloc((Class)NSObject));
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilWeakIdentityMap__initialized);
  }
}

@end