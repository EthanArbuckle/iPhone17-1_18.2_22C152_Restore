@interface CPLSimpleMerger
- (BOOL)mergeConflictsWithError:(id *)a3;
- (CPLSimpleMerger)initWithMergeBlock:(id)a3;
@end

@implementation CPLSimpleMerger

- (void).cxx_destruct
{
}

- (BOOL)mergeConflictsWithError:(id *)a3
{
  block = (uint64_t (**)(id, id *))self->_block;
  if (block) {
    return block[2](block, a3);
  }
  else {
    return 1;
  }
}

- (CPLSimpleMerger)initWithMergeBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleMerger;
  v5 = [(CPLSimpleMerger *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1BA994060](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

@end