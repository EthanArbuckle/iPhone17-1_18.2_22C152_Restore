@interface EMFDPReporterMock
- (BOOL)record:(id)a3;
- (EMFDPReporterMock)init;
- (NSArray)recordsWritten;
- (void)reset;
@end

@implementation EMFDPReporterMock

- (EMFDPReporterMock)init
{
  v7.receiver = self;
  v7.super_class = (Class)EMFDPReporterMock;
  v3 = [(EMFDPReporterMock *)&v7 init];
  if (v3 == self)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recordsWritten = self->_recordsWritten;
    self->_recordsWritten = v4;
  }
  return v3;
}

- (BOOL)record:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [(NSMutableArray *)self->_recordsWritten addObject:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return 1;
}

- (void)reset
{
}

- (NSArray)recordsWritten
{
  v2 = (void *)[(NSMutableArray *)self->_recordsWritten copy];
  return (NSArray *)v2;
}

- (void).cxx_destruct
{
}

@end