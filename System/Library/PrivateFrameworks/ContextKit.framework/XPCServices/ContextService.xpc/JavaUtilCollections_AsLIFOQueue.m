@interface JavaUtilCollections_AsLIFOQueue
+ (const)__metadata;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)offerWithId:(id)a3;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilCollections_AsLIFOQueue)initWithJavaUtilDeque:(id)a3;
- (NSString)description;
- (id)element;
- (id)iterator;
- (id)peek;
- (id)poll;
- (id)remove;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaUtilCollections_AsLIFOQueue

- (JavaUtilCollections_AsLIFOQueue)initWithJavaUtilDeque:(id)a3
{
  return self;
}

- (id)iterator
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q iterator];
}

- (int)size
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q size];
}

- (BOOL)offerWithId:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q offerFirstWithId:a3];
}

- (id)peek
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q peekFirst];
}

- (id)poll
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q pollFirst];
}

- (BOOL)addWithId:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  [(JavaUtilDeque *)q pushWithId:a3];
  return 1;
}

- (void)clear
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  [(JavaUtilDeque *)q clear];
}

- (id)element
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q getFirst];
}

- (id)remove
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q pop];
}

- (BOOL)containsWithId:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q containsWithId:a3];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q containsAllWithJavaUtilCollection:a3];
}

- (BOOL)isEmpty
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q isEmpty];
}

- (BOOL)removeWithId:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q removeWithId:a3];
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q removeAllWithJavaUtilCollection:a3];
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q retainAllWithJavaUtilCollection:a3];
}

- (id)toArray
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q toArray];
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilDeque *)q toArrayWithNSObjectArray:a3];
}

- (NSString)description
{
  q = self->q_;
  if (!q) {
    JreThrowNullPointerException();
  }
  return (NSString *)[(JavaUtilDeque *)q description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_AsLIFOQueue;
  [(JavaUtilCollections_AsLIFOQueue *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042AB38;
}

@end