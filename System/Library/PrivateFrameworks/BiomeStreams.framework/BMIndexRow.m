@interface BMIndexRow
- (BMIndexRow)initWithIndexFields:(id)a3 storeBookmark:(id)a4;
- (BMStoreBookmark)storeBookmark;
- (BOOL)isEqual:(id)a3;
- (NSArray)indexFields;
- (id)description;
- (unint64_t)hash;
@end

@implementation BMIndexRow

- (BMIndexRow)initWithIndexFields:(id)a3 storeBookmark:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMIndexRow;
  v9 = [(BMIndexRow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexFields, a3);
    objc_storeStrong((id *)&v10->_storeBookmark, a4);
  }

  return v10;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p> indexFields: %@, storeBookmark: %@", objc_opt_class(), self, self->_indexFields, self->_storeBookmark];

  return v2;
}

- (unint64_t)hash
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(BMStoreBookmark *)self->_storeBookmark hash];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_indexFields;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 ^= objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "hash", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BMIndexRow *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      indexFields = self->_indexFields;
      uint64_t v7 = [(BMIndexRow *)v5 indexFields];
      if ([(NSArray *)indexFields isEqual:v7])
      {
        storeBookmark = self->_storeBookmark;
        v9 = [(BMIndexRow *)v5 storeBookmark];
        char v10 = [(BMStoreBookmark *)storeBookmark isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (NSArray)indexFields
{
  return self->_indexFields;
}

- (BMStoreBookmark)storeBookmark
{
  return self->_storeBookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeBookmark, 0);

  objc_storeStrong((id *)&self->_indexFields, 0);
}

@end