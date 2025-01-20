@interface JavaUtilHashSet
+ (const)__metadata;
+ (void)initialize;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilHashSet)init;
- (JavaUtilHashSet)initWithInt:(int)a3;
- (JavaUtilHashSet)initWithInt:(int)a3 withFloat:(float)a4;
- (JavaUtilHashSet)initWithJavaUtilCollection:(id)a3;
- (JavaUtilHashSet)initWithJavaUtilHashMap:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createBackingMapWithInt:(int)a3 withFloat:(float)a4;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilHashSet

- (JavaUtilHashSet)init
{
  return self;
}

- (JavaUtilHashSet)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilHashSet)initWithInt:(int)a3 withFloat:(float)a4
{
  return self;
}

- (JavaUtilHashSet)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (JavaUtilHashSet)initWithJavaUtilHashMap:(id)a3
{
  return self;
}

- (BOOL)addWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)backingMap putWithId:a3 withId:qword_1005607B8] == 0;
}

- (void)clear
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  [(JavaUtilHashMap *)backingMap clear];
}

- (id)clone
{
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashSet;
  v3 = [(JavaUtilHashSet *)&v7 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  backingMap = self->backingMap_;
  if (!backingMap) {
LABEL_8:
  }
    JreThrowNullPointerException();
  id v5 = [(JavaUtilHashMap *)backingMap clone];
  objc_opt_class();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_7:
  }
    JreThrowClassCastException();
  JreStrongAssign(v3 + 1, v5);
  return v3;
}

- (BOOL)containsWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)backingMap containsKeyWithId:a3];
}

- (BOOL)isEmpty
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)backingMap isEmpty];
}

- (id)iterator
{
  backingMap = self->backingMap_;
  if (!backingMap || (id v3 = [(JavaUtilHashMap *)backingMap keySet]) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 iterator];
}

- (BOOL)removeWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)backingMap removeWithId:a3] != 0;
}

- (int)size
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)backingMap size];
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3
    || ([a3 defaultWriteObject], (backingMap = self->backingMap_) == 0)
    || (table = backingMap->table_) == 0)
  {
    JreThrowNullPointerException();
  }
  [a3 writeIntWithInt:table->super.size_];
  LODWORD(v7) = 0.75;
  [a3 writeFloatWithFloat:v7];
  objc_msgSend(a3, "writeIntWithInt:", -[JavaUtilHashSet size](self, "size"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v8 = [(JavaUtilHashSet *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(self);
        }
        [a3 writeObjectWithId:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      unint64_t v9 = [(JavaUtilHashSet *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    goto LABEL_7;
  }
  [a3 defaultReadObject];
  id v5 = [a3 readInt];
  [a3 readFloat];
  p_backingMap = (id *)&self->backingMap_;
  JreStrongAssign((id *)&self->backingMap_, -[JavaUtilHashSet createBackingMapWithInt:withFloat:](self, "createBackingMapWithInt:withFloat:", v5));
  unsigned int v7 = [a3 readInt];
  if ((int)(v7 - 1) >= 0)
  {
    unsigned int v8 = v7;
    while (1)
    {
      id v9 = [a3 readObject];
      if (!*p_backingMap) {
        break;
      }
      [*p_backingMap putWithId:v9 withId:self];
      if ((int)--v8 <= 0) {
        return;
      }
    }
LABEL_7:
    JreThrowNullPointerException();
  }
}

- (id)createBackingMapWithInt:(int)a3 withFloat:(float)a4
{
  v4 = new_JavaUtilHashMap_initWithInt_withFloat_(*(uint64_t *)&a3, a4);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashSet;
  [(JavaUtilHashSet *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v9 = (id)a3->var3[4];
  if (!v9)
  {
    id v9 = [(JavaUtilHashMap *)self->backingMap_ keySet];
    a3->var3[4] = (unint64_t)v9;
  }
  return (unint64_t)[v9 countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilHashSet *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_1005607B8, objc_alloc((Class)NSObject));
    atomic_store(1u, (unsigned __int8 *)&JavaUtilHashSet__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F6900;
}

@end