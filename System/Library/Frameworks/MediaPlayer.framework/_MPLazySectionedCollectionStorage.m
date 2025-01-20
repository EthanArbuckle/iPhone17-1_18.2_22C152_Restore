@interface _MPLazySectionedCollectionStorage
- (id).cxx_construct;
- (id)_stateDumpObject;
@end

@implementation _MPLazySectionedCollectionStorage

- (void).cxx_destruct
{
  std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::destroy((void *)self->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_sectionsCache, 0);
  std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::destroy((void *)self->_itemIdentifierSetMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_itemsCache, 0);
  begin = self->_cachedNumberOfItemsInSections.__begin_;
  if (begin)
  {
    self->_cachedNumberOfItemsInSections.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 13) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = (char *)self + 96;
  return self;
}

- (id)_stateDumpObject
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_cachedNumberOfSections];
  begin = self->_cachedNumberOfItemsInSections.__begin_;
  end = self->_cachedNumberOfItemsInSections.__end_;
  if (end != begin)
  {
    unint64_t v6 = 0;
    do
    {
      int64_t v7 = begin[v6];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = objc_msgSend(NSString, "stringWithFormat:", @"%zu: %ld", v6, v7);
        [v3 addObject:v8];

        begin = self->_cachedNumberOfItemsInSections.__begin_;
        end = self->_cachedNumberOfItemsInSections.__end_;
      }
      ++v6;
    }
    while (v6 < end - begin);
  }
  v14[0] = @"_obj";
  v9 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  v15[0] = v9;
  v14[1] = @"hasValidCachedNumberOfSections";
  v10 = [NSNumber numberWithBool:self->_hasValidCachedNumberOfSections];
  v15[1] = v10;
  v14[2] = @"cachedNumberOfSections";
  v11 = [NSNumber numberWithInteger:self->_cachedNumberOfSections];
  v14[3] = @"cachedNumberOfItemsInSections";
  v15[2] = v11;
  v15[3] = v3;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

@end