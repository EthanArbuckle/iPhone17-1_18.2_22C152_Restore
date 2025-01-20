@interface JavaUtilCollections_SingletonList
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilCollections_SingletonList)initWithId:(id)a3;
- (id)getWithInt:(int)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilCollections_SingletonList

- (JavaUtilCollections_SingletonList)initWithId:(id)a3
{
  return self;
}

- (BOOL)containsWithId:(id)a3
{
  id element = self->element_;
  if (element) {
    LOBYTE(v4) = [element isEqual:a3];
  }
  else {
    return a3 == 0;
  }
  return v4;
}

- (id)getWithInt:(int)a3
{
  if (a3)
  {
    uint64_t v4 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v4);
  }
  return self->element_;
}

- (int)size
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SingletonList;
  [(JavaUtilCollections_SingletonList *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100426CB0;
}

@end