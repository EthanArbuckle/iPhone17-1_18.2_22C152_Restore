@interface _LSTypeEnumerator
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _LSTypeEnumerator

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x18530F680](self, a2, a3, a4);
  db = a3->db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47___LSTypeEnumerator__prepareWithContext_error___block_invoke;
  v9[3] = &unk_1E5230D80;
  v9[4] = self;
  _UTEnumerateActiveTypes((uint64_t)db, v9);
  return 1;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_typeIDs.__begin_;
  unint64_t v7 = self->_typeIDs.__end_ - begin;
  if (v7 > a4)
  {
    uint64_t v10 = begin[a4];
    if (_UTTypeGet())
    {
      id v11 = [(LSRecord *)[_UTDeclaredTypeRecord alloc] _initWithContext:a5 tableID:a5->db->schema.utypeTable unitID:v10];
      id v12 = *a3;
      *a3 = v11;
    }
  }
  return v7 > a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_LSTypeEnumerator;
  v4 = [(_LSDBEnumerator *)&v8 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == (char *)self;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>(v4 + 88, (char *)self->_typeIDs.__begin_, (uint64_t)self->_typeIDs.__end_, self->_typeIDs.__end_ - self->_typeIDs.__begin_);
  }
  return v5;
}

- (void).cxx_destruct
{
  p_typeIDs = &self->_typeIDs;
  begin = self->_typeIDs.__begin_;
  if (begin)
  {
    p_typeIDs->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end