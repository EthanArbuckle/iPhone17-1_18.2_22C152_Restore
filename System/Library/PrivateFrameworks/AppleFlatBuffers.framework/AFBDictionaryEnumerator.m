@interface AFBDictionaryEnumerator
- (AFBDictionaryEnumerator)initWithDictionary:(id)a3;
- (id)nextObject;
@end

@implementation AFBDictionaryEnumerator

- (AFBDictionaryEnumerator)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBDictionaryEnumerator;
  v6 = [(AFBDictionaryEnumerator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dict, a3);
    v7->_index = 0;
  }

  return v7;
}

- (id)nextObject
{
  unint64_t index = self->_index;
  if (index >= [(AFBDictionary *)self->_dict count])
  {
    id v5 = 0;
  }
  else
  {
    dict = self->_dict;
    ++self->_index;
    id v5 = -[AFBDictionary keyAtIndex:](dict);
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end