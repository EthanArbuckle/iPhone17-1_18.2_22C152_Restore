@interface CNWrappedDictionary
- (CNWrappedDictionary)initWithDictionary:(id)a3;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
@end

@implementation CNWrappedDictionary

- (CNWrappedDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNWrappedDictionary;
  v5 = [(CNWrappedDictionary *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    underlyingDictionary = v5->_underlyingDictionary;
    v5->_underlyingDictionary = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_underlyingDictionary count];
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_underlyingDictionary objectForKey:a3];
}

- (id)keyEnumerator
{
  return [(NSDictionary *)self->_underlyingDictionary keyEnumerator];
}

- (void).cxx_destruct
{
}

@end