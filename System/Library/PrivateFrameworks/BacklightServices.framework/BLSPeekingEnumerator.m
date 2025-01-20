@interface BLSPeekingEnumerator
+ (id)peekingEnumeratorWithEnumerator:(id)a3;
- (id)initWithEnumerator:(id *)a1;
- (id)nextObject;
- (id)peekNextObject;
@end

@implementation BLSPeekingEnumerator

+ (id)peekingEnumeratorWithEnumerator:(id)a3
{
  id v3 = a3;
  v4 = -[BLSPeekingEnumerator initWithEnumerator:]((id *)[BLSPeekingEnumerator alloc], v3);

  return v4;
}

- (id)initWithEnumerator:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BLSPeekingEnumerator;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)nextObject
{
  id v3 = self->_peekedObject;
  if (v3)
  {
    id v4 = v3;
    id peekedObject = self->_peekedObject;
    self->_id peekedObject = 0;
  }
  else
  {
    id v4 = [(NSEnumerator *)self->_enumerator nextObject];
  }

  return v4;
}

- (id)peekNextObject
{
  p_id peekedObject = &self->_peekedObject;
  id v4 = self->_peekedObject;
  if (!v4)
  {
    id v4 = [(NSEnumerator *)self->_enumerator nextObject];
    objc_storeStrong(p_peekedObject, v4);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_peekedObject, 0);

  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end