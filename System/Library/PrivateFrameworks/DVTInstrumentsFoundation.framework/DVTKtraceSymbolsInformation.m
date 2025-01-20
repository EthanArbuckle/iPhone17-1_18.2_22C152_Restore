@interface DVTKtraceSymbolsInformation
- (id).cxx_construct;
- (id)getSymbolInfoForAddress:(unint64_t)a3;
- (void)addSymbolInfoForRange:(unint64_t)a3 length:(unint64_t)a4 symbolInfo:(id)a5;
@end

@implementation DVTKtraceSymbolsInformation

- (void)addSymbolInfoForRange:(unint64_t)a3 length:(unint64_t)a4 symbolInfo:(id)a5
{
  v7[0] = a3;
  v7[1] = a4;
  id v8 = a5;
  id v6 = v8;
  sub_2308C339C((uint64_t **)&self->_symbolInfos, v7, (uint64_t)v7);
}

- (id)getSymbolInfoForAddress:(unint64_t)a3
{
  if (!self->_symbolInfos.__tree_.__pair3_.__value_) {
    goto LABEL_24;
  }
  p_pair1 = &self->_symbolInfos.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> **)self->_symbolInfos.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v5 = &self->_symbolInfos.__tree_.__pair1_;
    id v6 = (char *)self->_symbolInfos.__tree_.__pair1_.__value_.__left_;
    do
    {
      unint64_t v7 = *((void *)v6 + 4);
      BOOL v8 = v7 >= a3;
      if (v7 >= a3) {
        v9 = (char **)v6;
      }
      else {
        v9 = (char **)(v6 + 8);
      }
      if (v8) {
        v5 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> *)v6;
      }
      id v6 = *v9;
    }
    while (*v9);
    if (v5 != p_pair1)
    {
      unint64_t v10 = (unint64_t)v5[4].__value_.__left_;
      if (v5 == self->_symbolInfos.__tree_.__begin_node_ && v10 > a3) {
        goto LABEL_24;
      }
      if (v10 == a3)
      {
        v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> **)v5;
LABEL_23:
        v15 = v12[6];
        goto LABEL_25;
      }
      v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> **)v5->__value_.__left_;
      if (v5->__value_.__left_)
      {
        do
        {
          v12 = v17;
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> **)v17[1];
        }
        while (v17);
      }
      else
      {
        do
        {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> **)v5[2].__value_.__left_;
          BOOL v13 = *v12 == v5;
          v5 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> *)v12;
        }
        while (v13);
      }
      unint64_t v14 = (unint64_t)v12[4];
      if (v14 >= a3) {
        sub_23093D798();
      }
      goto LABEL_22;
    }
    do
    {
      v12 = left;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> **)left[1];
    }
    while (left);
  }
  else
  {
    do
    {
      v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> **)p_pair1[2].__value_.__left_;
      BOOL v13 = *v12 == p_pair1;
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::pair<unsigned long long, id>>, void *>>> *)v12;
    }
    while (v13);
  }
  unint64_t v14 = (unint64_t)v12[4];
LABEL_22:
  if ((unint64_t)v12[5] + v14 > a3) {
    goto LABEL_23;
  }
LABEL_24:
  v15 = 0;
LABEL_25:
  return v15;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end