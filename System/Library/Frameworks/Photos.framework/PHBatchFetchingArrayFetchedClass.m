@interface PHBatchFetchingArrayFetchedClass
- (Class)fetchedObjectClass;
- (Class)fetchedPropertySetClass;
- (PHBatchFetchingArrayFetchedClass)initWithFetchedObjectClass:(Class)a3;
- (PHBatchFetchingArrayFetchedClass)initWithFetchedPropertySetClass:(Class)a3;
- (void)setFetchedObjectClass:(Class)a3;
- (void)setFetchedPropertySetClass:(Class)a3;
@end

@implementation PHBatchFetchingArrayFetchedClass

- (PHBatchFetchingArrayFetchedClass)initWithFetchedPropertySetClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHBatchFetchingArrayFetchedClass;
  v5 = [(PHBatchFetchingArrayFetchedClass *)&v8 init];
  if (v5)
  {
    if (!a3)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, v5, @"PHBatchFetchingArray.m", 68, @"Invalid parameter not satisfying: %@", @"fetchedPropertySetClass" object file lineNumber description];
    }
    objc_storeStrong((id *)&v5->_fetchedPropertySetClass, a3);
  }
  return v5;
}

- (PHBatchFetchingArrayFetchedClass)initWithFetchedObjectClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHBatchFetchingArrayFetchedClass;
  v5 = [(PHBatchFetchingArrayFetchedClass *)&v8 init];
  if (v5)
  {
    if (!a3)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, v5, @"PHBatchFetchingArray.m", 59, @"Invalid parameter not satisfying: %@", @"fetchedObjectClass" object file lineNumber description];
    }
    objc_storeStrong((id *)&v5->_fetchedObjectClass, a3);
  }
  return v5;
}

- (Class)fetchedPropertySetClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedObjectClass, 0);

  objc_storeStrong((id *)&self->_fetchedPropertySetClass, 0);
}

- (void)setFetchedObjectClass:(Class)a3
{
}

- (Class)fetchedObjectClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setFetchedPropertySetClass:(Class)a3
{
}

@end