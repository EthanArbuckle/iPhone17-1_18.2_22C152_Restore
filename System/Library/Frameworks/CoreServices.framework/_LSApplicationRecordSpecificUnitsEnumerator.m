@interface _LSApplicationRecordSpecificUnitsEnumerator
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (_LSApplicationRecordSpecificUnitsEnumerator)initWithContext:(LSContext *)a3 options:(unint64_t)a4 unitIDs:(const unsigned int *)a5 unitCount:(unint64_t)a6;
- (id).cxx_construct;
@end

@implementation _LSApplicationRecordSpecificUnitsEnumerator

- (_LSApplicationRecordSpecificUnitsEnumerator)initWithContext:(LSContext *)a3 options:(unint64_t)a4 unitIDs:(const unsigned int *)a5 unitCount:(unint64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_LSApplicationRecordSpecificUnitsEnumerator;
  v9 = [(_LSDBEnumerator *)&v12 _initWithContext:a3];
  v10 = v9;
  if (v9)
  {
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,unsigned int const*,unsigned int const*,std::back_insert_iterator<std::vector<unsigned int>>,0>(a5, &a5[a6], (uint64_t)&v9->_unitIDs);
    v10->_options = a4;
  }
  return v10;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_unitIDs.__begin_;
  unint64_t v7 = self->_unitIDs.__end_ - begin;
  if (v7 > a4)
  {
    v11 = (LSContext *)begin[a4];
    uint64_t v12 = _LSBundleGet(a5->db, begin[a4]);
    if (v12)
    {
      uint64_t v13 = v12;
      if (evaluateBundleNoIOCommon(v11, v12, (const LSBundleData *)self->_options))
      {
        id v19 = 0;
        id v14 = [[LSApplicationRecord alloc] _initWithContext:a5 bundleID:v11 bundleData:v13 error:&v19];
        id v15 = v19;
        if (!v14)
        {
          v16 = _LSDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[_LSLinkedChildApplicationRecordEnumerator _getObject:atIndex:context:]();
          }

          _LSEnumeratorFireErrorHandler((atomic_uchar *)self, v15);
        }
        id v17 = *a3;
        *a3 = v14;
      }
    }
  }
  return v7 > a4;
}

- (void).cxx_destruct
{
  p_unitIDs = &self->_unitIDs;
  begin = self->_unitIDs.__begin_;
  if (begin)
  {
    p_unitIDs->__end_ = begin;
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