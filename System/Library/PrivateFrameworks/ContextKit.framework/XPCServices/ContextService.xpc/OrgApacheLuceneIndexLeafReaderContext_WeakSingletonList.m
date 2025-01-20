@interface OrgApacheLuceneIndexLeafReaderContext_WeakSingletonList
- (BOOL)containsWithId:(id)a3;
- (OrgApacheLuceneIndexLeafReaderContext_WeakSingletonList)initWithId:(id)a3;
- (id)getWithInt:(int)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
@end

@implementation OrgApacheLuceneIndexLeafReaderContext_WeakSingletonList

- (OrgApacheLuceneIndexLeafReaderContext_WeakSingletonList)initWithId:(id)a3
{
  return self;
}

- (BOOL)containsWithId:(id)a3
{
  p_element = &self->element_;
  if (!objc_loadWeak(&self->element_)) {
    return a3 == 0;
  }
  id Weak = objc_loadWeak(p_element);
  return [Weak isEqual:a3];
}

- (id)getWithInt:(int)a3
{
  if (a3)
  {
    v5 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v5);
  }
  p_element = &self->element_;
  return objc_loadWeak(p_element);
}

- (int)size
{
  return 1;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexLeafReaderContext_WeakSingletonList;
  [(OrgApacheLuceneIndexLeafReaderContext_WeakSingletonList *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

- (void).cxx_destruct
{
}

@end