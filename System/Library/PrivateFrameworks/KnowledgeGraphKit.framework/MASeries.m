@interface MASeries
- (BOOL)isEqual:(id)a3;
- (MAFloatVector)vector;
- (MAIndexCache)indexCache;
- (MASeries)initWithName:(id)a3 indexCache:(id)a4 vector:(id)a5;
- (MASeries)initWithName:(id)a3 labels:(id)a4 vector:(id)a5;
- (NSArray)labels;
- (NSString)name;
- (float)valueAtIndex:(int64_t)a3;
- (id)description;
- (id)valueByLabels;
- (id)valueForLabel:(id)a3;
- (unint64_t)hash;
@end

@implementation MASeries

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_indexCache, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (MAFloatVector)vector
{
  return self->_vector;
}

- (MAIndexCache)indexCache
{
  return self->_indexCache;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MASeries *)self name];
  v5 = [(MASeries *)self labels];
  v6 = [(MASeries *)self vector];
  v7 = [v3 stringWithFormat:@"%@\n%@\n%@\n", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(MAIndexCache *)self->_indexCache hash] ^ v3;
  return v4 ^ [(MAFloatVector *)self->_vector hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MASeries *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      name = self->_name;
      if (name)
      {
        v8 = [(MASeries *)v5 name];
        int v9 = [(NSString *)name isEqual:v8];

        if (!v9) {
          goto LABEL_10;
        }
      }
      indexCache = self->_indexCache;
      if (indexCache
        && ([(MASeries *)v6 indexCache],
            v11 = objc_claimAutoreleasedReturnValue(),
            BOOL v12 = [(MAIndexCache *)indexCache isEqual:v11],
            v11,
            !v12))
      {
LABEL_10:
        char v15 = 0;
      }
      else
      {
        vector = self->_vector;
        v14 = [(MASeries *)v6 vector];
        char v15 = [(MAFloatVector *)vector isEqual:v14];
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (id)valueByLabels
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = (void *)[MEMORY[0x1E4F1CA60] init];
  unint64_t v4 = (void *)[v3 alloc];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(MASeries *)self labels];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [(MASeries *)self valueForLabel:v10];
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)valueForLabel:(id)a3
{
  id v4 = a3;
  v5 = self->_indexCache;
  uint64_t v6 = v5;
  if (v5 && (uint64_t v7 = [(MAIndexCache *)v5 indexOfLabel:v4], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    int v9 = NSNumber;
    [(MASeries *)self valueAtIndex:v7];
    uint64_t v8 = objc_msgSend(v9, "numberWithFloat:");
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (float)valueAtIndex:(int64_t)a3
{
  [(MAFloatVector *)self->_vector floatAtIndex:a3];
  return result;
}

- (NSArray)labels
{
  return [(MAIndexCache *)self->_indexCache labels];
}

- (MASeries)initWithName:(id)a3 labels:(id)a4 vector:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    id v10 = a4;
    a4 = [[MAIndexCache alloc] initWithLabels:v10];
  }
  v11 = [(MASeries *)self initWithName:v8 indexCache:a4 vector:v9];

  return v11;
}

- (MASeries)initWithName:(id)a3 indexCache:(id)a4 vector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9
    && ([v9 labels],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        uint64_t v13 = [v10 count],
        v11,
        v12 != v13))
  {
    v19 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MASeries;
    long long v14 = [(MASeries *)&v21 init];
    if (v14)
    {
      uint64_t v15 = [v8 copy];
      name = v14->_name;
      v14->_name = (NSString *)v15;

      uint64_t v17 = [v10 copy];
      vector = v14->_vector;
      v14->_vector = (MAFloatVector *)v17;

      objc_storeStrong((id *)&v14->_indexCache, a4);
    }
    self = v14;
    v19 = self;
  }

  return v19;
}

@end