@interface ComAppleContextkitUtilObjcIterator
- (BOOL)hasNext;
- (ComAppleContextkitUtilObjcIterator)initWithId:(id)a3;
- (id)advanceWithId:(id)a3;
- (id)enumeratorWithId:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation ComAppleContextkitUtilObjcIterator

- (ComAppleContextkitUtilObjcIterator)initWithId:(id)a3
{
  return self;
}

- (id)enumeratorWithId:(id)a3
{
  return [a3 objectEnumerator];
}

- (id)advanceWithId:(id)a3
{
  return [a3 nextObject];
}

- (BOOL)hasNext
{
  return self->object_ != 0;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  id object = self->object_;
  if (!object)
  {
    v4 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v4);
  }
  JreStrongAssign(&self->object_, [self->nsEnumerator_ nextObject]);
  return object;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitUtilObjcIterator;
  [(ComAppleContextkitUtilObjcIterator *)&v3 dealloc];
}

@end