@interface JavaUtilCollections_CopiesList
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilCollections_CopiesList)initWithInt:(int)a3 withId:(id)a4;
- (id)getWithInt:(int)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilCollections_CopiesList

- (JavaUtilCollections_CopiesList)initWithInt:(int)a3 withId:(id)a4
{
  return self;
}

- (BOOL)containsWithId:(id)a3
{
  v3 = *(void **)&self->n_;
  if (v3) {
    LOBYTE(v4) = [v3 isEqual:a3];
  }
  else {
    return a3 == 0;
  }
  return v4;
}

- (int)size
{
  return *(&self->super.modCount_ + 1);
}

- (id)getWithInt:(int)a3
{
  if (a3 < 0 || *(&self->super.modCount_ + 1) <= a3)
  {
    uint64_t v4 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v4);
  }
  return *(id *)&self->n_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CopiesList;
  [(JavaUtilCollections_CopiesList *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100425F58;
}

@end