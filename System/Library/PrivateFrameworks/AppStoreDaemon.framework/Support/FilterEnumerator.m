@interface FilterEnumerator
- (id)nextObject;
@end

@implementation FilterEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (id)nextObject
{
  v3 = 0;
  do
  {
    v4 = v3;
    v3 = [(NSEnumerator *)self->_enumerator nextObject];
  }
  while (v3 && ![(NSPredicate *)self->_predicate evaluateWithObject:v3]);
  return v3;
}

@end