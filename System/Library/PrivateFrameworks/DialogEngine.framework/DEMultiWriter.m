@interface DEMultiWriter
- (DEMultiWriter)init;
- (DEMultiWriter)initWithWriters:(id)a3;
- (NSArray)writers;
- (NSMutableData)data;
- (void)close;
- (void)setData:(id)a3;
- (void)setWriters:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation DEMultiWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writers, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setWriters:(id)a3
{
}

- (NSArray)writers
{
  return self->_writers;
}

- (void)setData:(id)a3
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)writeData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_writers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "writeData:", v4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)close
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = self->_writers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "close", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (DEMultiWriter)init
{
  return [(DEMultiWriter *)self initWithWriters:0];
}

- (DEMultiWriter)initWithWriters:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DEMultiWriter;
  long long v6 = [(DEMultiWriter *)&v10 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_writers, a3);
    long long v8 = v7;
  }

  return v7;
}

@end