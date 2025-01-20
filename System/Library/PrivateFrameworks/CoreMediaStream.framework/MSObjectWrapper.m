@interface MSObjectWrapper
+ (id)objectsFromWrappers:(id)a3;
+ (id)objectsFromWrappers:(id)a3 equalToObject:(id)a4;
+ (id)wrapperWithObject:(id)a3 size:(int64_t)a4;
+ (int64_t)indexOfObject:(id)a3 inWrapperArray:(id)a4;
- (MSObjectWrapper)initWithObject:(id)a3 size:(int64_t)a4;
- (NSCoding)object;
- (int)errorCount;
- (int64_t)size;
- (int64_t)uniqueID;
- (void)setErrorCount:(int)a3;
- (void)setSize:(int64_t)a3;
- (void)setUniqueID:(int64_t)a3;
@end

@implementation MSObjectWrapper

- (void).cxx_destruct
{
}

- (void)setErrorCount:(int)a3
{
  self->_errorCount = a3;
}

- (int)errorCount
{
  return self->_errorCount;
}

- (NSCoding)object
{
  return (NSCoding *)self->_object;
}

- (void)setUniqueID:(int64_t)a3
{
  self->_uniqueID = a3;
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (MSObjectWrapper)initWithObject:(id)a3 size:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSObjectWrapper;
  v8 = [(MSObjectWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_object, a3);
    v9->_size = a4;
  }

  return v9;
}

+ (id)objectsFromWrappers:(id)a3 equalToObject:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "object", (void)v17);
        if ([v14 isEqual:v6])
        {
          v15 = [v13 object];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)objectsFromWrappers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "object", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (int64_t)indexOfObject:(id)a3 inWrapperArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    int64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [v6 objectAtIndex:v7];
      uint64_t v9 = [v8 object];
      char v10 = [v9 isEqual:v5];

      if (v10) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v7 = -1;
  }

  return v7;
}

+ (id)wrapperWithObject:(id)a3 size:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = (void *)[objc_alloc((Class)a1) initWithObject:v6 size:a4];

  return v7;
}

@end