@interface MTLPrivateDataTable
- (BOOL)getPrivateDataAndOffset:(id)a3 privateData:(id *)a4 privateDataOffset:(unint64_t *)a5;
- (MTLPrivateDataTable)init;
- (void)releasePrivateData:(id *)a3 privateDataOffset:(unint64_t)a4;
- (void)setPrivateData:(id)a3 privateDataOffset:(unint64_t)a4 logState:(id)a5;
@end

@implementation MTLPrivateDataTable

- (MTLPrivateDataTable)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLPrivateDataTable;
  return [(MTLPrivateDataTable *)&v3 init];
}

- (void)setPrivateData:(id)a3 privateDataOffset:(unint64_t)a4 logState:(id)a5
{
  if (a5)
  {
    uint64_t v7 = [a3 contents];
    *(void *)(v7 + a4) = [*((id *)a5 + 3) gpuAddress];
  }
}

- (BOOL)getPrivateDataAndOffset:(id)a3 privateData:(id *)a4 privateDataOffset:(unint64_t *)a5
{
  *a4 = (id)[a3 newBufferWithLength:8 options:0];
  *a5 = 0;
  return *a4 != 0;
}

- (void)releasePrivateData:(id *)a3 privateDataOffset:(unint64_t)a4
{
  *a3 = 0;
}

@end