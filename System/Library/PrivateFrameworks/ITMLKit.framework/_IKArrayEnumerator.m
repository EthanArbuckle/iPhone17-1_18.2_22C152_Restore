@interface _IKArrayEnumerator
- (_IKArrayEnumerator)initWithArray:(id)a3;
- (id)nextObject;
@end

@implementation _IKArrayEnumerator

- (_IKArrayEnumerator)initWithArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_IKArrayEnumerator;
  v6 = [(_IKArrayEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_array, a3);
  }

  return v7;
}

- (id)nextObject
{
  int64_t currentIndex = self->_currentIndex;
  if (currentIndex >= [(IKArray *)self->_array count])
  {
    id v5 = 0;
  }
  else
  {
    array = self->_array;
    ++self->_currentIndex;
    id v5 = -[IKArray objectAtIndex:](array, "objectAtIndex:");
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end