@interface MPModelStoreBrowseSectionUniformContentItemTypeResolver
- (id).cxx_construct;
- (int64_t)uniformContentItemType;
- (void)addContentItemType:(int64_t)a3;
@end

@implementation MPModelStoreBrowseSectionUniformContentItemTypeResolver

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

- (void).cxx_destruct
{
}

- (int64_t)uniformContentItemType
{
  if (self->_hasValidUniformContentItemType) {
    return self->_uniformContentItemType;
  }
  unint64_t totalNumberOfOccurrences = self->_totalNumberOfOccurrences;
  if (!totalNumberOfOccurrences) {
    goto LABEL_23;
  }
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MPModelStoreBrowseDetailedContentItemType, unsigned long>, void *>>> *)self->_contentItemTypeOccurrences.__tree_.__begin_node_;
  if (begin_node == &self->_contentItemTypeOccurrences.__tree_.__pair1_)
  {
    int64_t left = 0;
    float v9 = 0.0;
  }
  else
  {
    unint64_t v5 = 0;
    int64_t left = 0;
    do
    {
      if (begin_node[5].__value_.__left_ > (void *)v5)
      {
        int64_t left = (int64_t)begin_node[4].__value_.__left_;
        unint64_t v5 = (unint64_t)begin_node[5].__value_.__left_;
      }
      isa = (MPModelStoreBrowseSectionUniformContentItemTypeResolver *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          v7 = isa;
          isa = (MPModelStoreBrowseSectionUniformContentItemTypeResolver *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          v7 = (MPModelStoreBrowseSectionUniformContentItemTypeResolver *)begin_node[2].__value_.__left_;
          BOOL v8 = v7->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MPModelStoreBrowseDetailedContentItemType, unsigned long>, void *>>> *)v7;
        }
        while (!v8);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MPModelStoreBrowseDetailedContentItemType, unsigned long>, void *>>> *)v7;
    }
    while (v7 != (MPModelStoreBrowseSectionUniformContentItemTypeResolver *)&self->_contentItemTypeOccurrences.__tree_.__pair1_);
    float v9 = (float)v5;
  }
  float v10 = 1.0;
  if ((unint64_t)(left - 3) < 3) {
    float v10 = 0.75;
  }
  float v11 = v9 / (float)totalNumberOfOccurrences;
  BOOL v13 = v11 <= v10;
  float v12 = vabds_f32(v11, v10);
  BOOL v13 = v13 && v12 > 0.00000011921;
  if (v13) {
LABEL_23:
  }
    int64_t left = 0;
  self->_uniformContentItemType = left;
  self->_hasValidUniformContentItemType = 1;
  return left;
}

- (void)addContentItemType:(int64_t)a3
{
  v14 = (uint64_t *)a3;
  p_pair1 = &self->_contentItemTypeOccurrences.__tree_.__pair1_;
  int64_t left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MPModelStoreBrowseDetailedContentItemType, unsigned long>, void *>>> *)self->_contentItemTypeOccurrences.__tree_.__pair1_.__value_.__left_;
  p_contentItemTypeOccurrences = (uint64_t **)&self->_contentItemTypeOccurrences;
  if (!left) {
    goto LABEL_11;
  }
  v7 = p_pair1;
  do
  {
    int64_t v8 = (int64_t)left[4].__value_.__left_;
    BOOL v9 = v8 < a3;
    if (v8 >= a3) {
      float v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MPModelStoreBrowseDetailedContentItemType, unsigned long>, void *>>> **)left;
    }
    else {
      float v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MPModelStoreBrowseDetailedContentItemType, unsigned long>, void *>>> **)&left[1];
    }
    if (!v9) {
      v7 = left;
    }
    int64_t left = *v10;
  }
  while (*v10);
  if (v7 != p_pair1 && (uint64_t)v7[4].__value_.__left_ <= a3)
  {
    BOOL v13 = v7[5].__value_.__left_;
    float v11 = std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(p_contentItemTypeOccurrences, a3, &v14);
    uint64_t v12 = (uint64_t)v13 + 1;
  }
  else
  {
LABEL_11:
    float v11 = std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(p_contentItemTypeOccurrences, a3, &v14);
    uint64_t v12 = 1;
  }
  v11[5] = (uint64_t *)v12;
  ++self->_totalNumberOfOccurrences;
  self->_hasValidUniformContentItemType = 0;
}

@end