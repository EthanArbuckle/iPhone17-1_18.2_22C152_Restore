@interface AndroidUtilLruCache
+ (const)__metadata;
- (AndroidUtilLruCache)initWithInt:(int)a3;
- (id)createWithId:(id)a3;
- (id)description;
- (id)getWithId:(id)a3;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)snapshot;
- (int)createCount;
- (int)evictionCount;
- (int)hitCount;
- (int)maxSize;
- (int)missCount;
- (int)putCount;
- (int)safeSizeOfWithId:(id)a3 withId:(id)a4;
- (int)size;
- (int)sizeOfWithId:(id)a3 withId:(id)a4;
- (void)dealloc;
- (void)evictAll;
- (void)resizeWithInt:(int)a3;
- (void)trimToSizeWithInt:(int)a3;
@end

@implementation AndroidUtilLruCache

- (AndroidUtilLruCache)initWithInt:(int)a3
{
  return self;
}

- (void)resizeWithInt:(int)a3
{
  if (a3 <= 0)
  {
    v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"maxSize <= 0");
    objc_exception_throw(v5);
  }
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  self->maxSize_ = v3;
  objc_sync_exit(self);
  [(AndroidUtilLruCache *)self trimToSizeWithInt:v3];
}

- (id)getWithId:(id)a3
{
  if (!a3)
  {
    v10 = new_JavaLangNullPointerException_initWithNSString_(@"key == null");
    objc_exception_throw(v10);
  }
  objc_sync_enter(self);
  map = self->map_;
  if (!map) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilLinkedHashMap *)map getWithId:a3];
  if (v6)
  {
    ++self->hitCount_;
    objc_sync_exit(self);
  }
  else
  {
    ++self->missCount_;
    objc_sync_exit(self);
    id v8 = [(AndroidUtilLruCache *)self createWithId:a3];
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(self);
      ++self->createCount_;
      id v6 = [(JavaUtilHashMap *)self->map_ putWithId:a3 withId:v9];
      if (v6)
      {
        [(JavaUtilHashMap *)self->map_ putWithId:a3 withId:v6];
        objc_sync_exit(self);
        [(AndroidUtilLruCache *)self entryRemovedWithBoolean:0 withId:a3 withId:v9 withId:v6];
      }
      else
      {
        self->size_ += sub_10021AC6C(self, (uint64_t)a3, (uint64_t)v9);
        objc_sync_exit(self);
        [(AndroidUtilLruCache *)self trimToSizeWithInt:self->maxSize_];
        return v9;
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4)
  {
    v10 = new_JavaLangNullPointerException_initWithNSString_(@"key == null || value == null");
    objc_exception_throw(v10);
  }
  objc_sync_enter(self);
  ++self->putCount_;
  self->size_ += sub_10021AC6C(self, (uint64_t)a3, (uint64_t)a4);
  map = self->map_;
  if (!map) {
    JreThrowNullPointerException();
  }
  id v8 = [(JavaUtilHashMap *)map putWithId:a3 withId:a4];
  if (v8)
  {
    self->size_ -= sub_10021AC6C(self, (uint64_t)a3, (uint64_t)v8);
    objc_sync_exit(self);
    [(AndroidUtilLruCache *)self entryRemovedWithBoolean:0 withId:a3 withId:v8 withId:a4];
  }
  else
  {
    objc_sync_exit(self);
  }
  [(AndroidUtilLruCache *)self trimToSizeWithInt:self->maxSize_];
  return v8;
}

- (void)trimToSizeWithInt:(int)a3
{
  for (i = self; ; self = i)
  {
    objc_sync_enter(self);
    if (i->size_ < 0) {
      goto LABEL_17;
    }
    map = i->map_;
    if (!map) {
      JreThrowNullPointerException();
    }
    unsigned int v6 = [(JavaUtilHashMap *)map isEmpty];
    int size = i->size_;
    unsigned int v8 = size ? v6 : 0;
    if (v8 == 1)
    {
LABEL_17:
      id v14 = objc_msgSend(-[AndroidUtilLruCache getClass](i, "getClass"), "getName");
      CFStringRef v22 = JreStrcat("$$", v15, v16, v17, v18, v19, v20, v21, v14);
      v23 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v22);
      objc_exception_throw(v23);
    }
    if (size <= a3) {
      break;
    }
    v9 = i->map_;
    if (!v9) {
      JreThrowNullPointerException();
    }
    id v10 = [(JavaUtilLinkedHashMap *)v9 eldest];
    v11 = v10;
    if (!v10) {
      break;
    }
    id v12 = [v10 getKey];
    id v13 = [v11 getValue];
    [(JavaUtilHashMap *)i->map_ removeWithId:v12];
    i->size_ -= sub_10021AC6C(i, (uint64_t)v12, (uint64_t)v13);
    ++i->evictionCount_;
    objc_sync_exit(i);
    [(AndroidUtilLruCache *)i entryRemovedWithBoolean:1 withId:v12 withId:v13 withId:0];
  }
  objc_sync_exit(i);
}

- (id)removeWithId:(id)a3
{
  if (!a3)
  {
    unsigned int v8 = new_JavaLangNullPointerException_initWithNSString_(@"key == null");
    objc_exception_throw(v8);
  }
  objc_sync_enter(self);
  map = self->map_;
  if (!map) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilHashMap *)map removeWithId:a3];
  if (v6)
  {
    self->size_ -= sub_10021AC6C(self, (uint64_t)a3, (uint64_t)v6);
    objc_sync_exit(self);
    [(AndroidUtilLruCache *)self entryRemovedWithBoolean:0 withId:a3 withId:v6 withId:0];
  }
  else
  {
    objc_sync_exit(self);
  }
  return v6;
}

- (id)createWithId:(id)a3
{
  return 0;
}

- (int)safeSizeOfWithId:(id)a3 withId:(id)a4
{
  return sub_10021AC6C(self, (uint64_t)a3, (uint64_t)a4);
}

- (int)sizeOfWithId:(id)a3 withId:(id)a4
{
  return 1;
}

- (void)evictAll
{
}

- (int)size
{
  objc_sync_enter(self);
  int size = self->size_;
  objc_sync_exit(self);
  return size;
}

- (int)maxSize
{
  objc_sync_enter(self);
  int maxSize = self->maxSize_;
  objc_sync_exit(self);
  return maxSize;
}

- (int)hitCount
{
  objc_sync_enter(self);
  int hitCount = self->hitCount_;
  objc_sync_exit(self);
  return hitCount;
}

- (int)missCount
{
  objc_sync_enter(self);
  int missCount = self->missCount_;
  objc_sync_exit(self);
  return missCount;
}

- (int)createCount
{
  objc_sync_enter(self);
  int createCount = self->createCount_;
  objc_sync_exit(self);
  return createCount;
}

- (int)putCount
{
  objc_sync_enter(self);
  int putCount = self->putCount_;
  objc_sync_exit(self);
  return putCount;
}

- (int)evictionCount
{
  objc_sync_enter(self);
  int evictionCount = self->evictionCount_;
  objc_sync_exit(self);
  return evictionCount;
}

- (id)snapshot
{
  objc_sync_enter(self);
  uint64_t v3 = new_JavaUtilLinkedHashMap_initWithJavaUtilMap_(self->map_);
  objc_sync_exit(self);
  return v3;
}

- (id)description
{
  objc_sync_enter(self);
  int v3 = 100 * self->hitCount_ / (self->missCount_ + self->hitCount_);
  v7[0] = JavaLangInteger_valueOfWithInt_(self->maxSize_);
  v7[1] = JavaLangInteger_valueOfWithInt_(self->hitCount_);
  v7[2] = JavaLangInteger_valueOfWithInt_(self->missCount_);
  v7[3] = JavaLangInteger_valueOfWithInt_(v3);
  v4 = +[IOSObjectArray arrayWithObjects:v7 count:4 type:NSObject_class_()];
  id v5 = NSString_formatWithNSString_withNSObjectArray_(@"LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", (uint64_t)v4);
  objc_sync_exit(self);
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AndroidUtilLruCache;
  [(AndroidUtilLruCache *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044B2B8;
}

@end