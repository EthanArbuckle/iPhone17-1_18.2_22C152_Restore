@interface ATXContextStoreWriter
- (ATXContextStoreWriter)initWithContext:(id)a3 keyPath:(id)a4;
- (BOOL)setWithObject:(id)a3;
@end

@implementation ATXContextStoreWriter

- (ATXContextStoreWriter)initWithContext:(id)a3 keyPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXContextStoreWriter;
  v9 = [(ATXContextStoreWriter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_keyPath, a4);
  }

  return v10;
}

- (BOOL)setWithObject:(id)a3
{
  return [(_CDClientContext *)self->_context setObject:a3 forKeyedSubscript:self->_keyPath];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end