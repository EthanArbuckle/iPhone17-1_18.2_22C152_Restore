@interface BMStreamVirtualTable
- (BMSQLSchema)schema;
- (BMStreamBase)stream;
- (BMStreamVirtualTable)initWithSchema:(id)a3 publisherBlock:(id)a4;
- (BMStreamVirtualTable)initWithSchema:(id)a3 publisherBlockWithOptions:(id)a4 acceptPublisherOptions:(BOOL)a5;
- (BMStreamVirtualTable)initWithStream:(id)a3;
- (BMStreamVirtualTable)initWithStream:(id)a3 useCase:(id)a4;
- (BOOL)acceptPublisherOptions;
- (id)description;
- (id)publisherBlock;
@end

@implementation BMStreamVirtualTable

- (BMStreamVirtualTable)initWithStream:(id)a3
{
  return [(BMStreamVirtualTable *)self initWithStream:a3 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMStreamVirtualTable)initWithStream:(id)a3 useCase:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 schema];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__BMStreamVirtualTable_initWithStream_useCase___block_invoke;
  v14[3] = &unk_1E55D7CA0;
  id v10 = v7;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  v12 = [(BMStreamVirtualTable *)self initWithSchema:v9 publisherBlockWithOptions:v14 acceptPublisherOptions:1];

  if (v12) {
    objc_storeStrong((id *)&v12->_stream, a3);
  }

  return v12;
}

uint64_t __47__BMStreamVirtualTable_initWithStream_useCase___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) publisherWithUseCase:*(void *)(a1 + 40) options:a2];
}

- (BMStreamVirtualTable)initWithSchema:(id)a3 publisherBlock:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__BMStreamVirtualTable_initWithSchema_publisherBlock___block_invoke;
  v10[3] = &unk_1E55D7CC8;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(BMStreamVirtualTable *)self initWithSchema:a3 publisherBlockWithOptions:v10 acceptPublisherOptions:0];

  return v8;
}

uint64_t __54__BMStreamVirtualTable_initWithSchema_publisherBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BMStreamVirtualTable)initWithSchema:(id)a3 publisherBlockWithOptions:(id)a4 acceptPublisherOptions:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMStreamVirtualTable;
  id v11 = [(BMStreamVirtualTable *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_schema, a3);
    uint64_t v13 = [v10 copy];
    id publisherBlock = v12->_publisherBlock;
    v12->_id publisherBlock = (id)v13;

    v12->_acceptPublisherOptions = a5;
  }

  return v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(BMSQLSchema *)self->_schema tableName];
  id v6 = (void *)[v3 initWithFormat:@"<%@ %p> table: %@", v4, self, v5];

  return v6;
}

- (BMStreamBase)stream
{
  return self->_stream;
}

- (BOOL)acceptPublisherOptions
{
  return self->_acceptPublisherOptions;
}

- (BMSQLSchema)schema
{
  return self->_schema;
}

- (id)publisherBlock
{
  return self->_publisherBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_publisherBlock, 0);
  objc_storeStrong((id *)&self->_schema, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

@end