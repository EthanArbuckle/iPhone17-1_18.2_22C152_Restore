@interface EFInt64Set
+ (id)indexSet;
+ (id)indexSetWithIndexesInRange:(_EFInt64Range)a3;
- (BOOL)containsIndex:(int64_t)a3;
- (EFInt64Set)init;
- (NSString)commaSeparatedString;
- (NSString)description;
- (NSString)ef_SQLExpression;
- (id).cxx_construct;
- (id)_initWithIndexesInRange:(_EFInt64Range)a3;
- (id)_initWithUnderlyingSet:(const void *)a3;
- (id)ef_SQLIsolatedExpression;
- (id)indexesInRange:(_EFInt64Range)a3;
- (id)lowestIndexesInRange:(_EFInt64Range)a3 maxCount:(unint64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)firstIndex;
- (int64_t)indexGreaterThanIndex:(int64_t)a3;
- (int64_t)lastIndex;
- (unint64_t)_enumerateIndexesInRange:(_EFInt64Range *)a3 maxCount:(unint64_t)a4 withBlock:(id)a5;
- (unint64_t)count;
- (unint64_t)getIndexes:(int64_t *)a3 maxCount:(unint64_t)a4 inIndexRange:(_EFInt64Range *)a5;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)ef_renderSQLExpressionInto:(id)a3 conjoiner:(id)a4;
- (void)enumerateIndexesUsingBlock:(id)a3;
@end

@implementation EFInt64Set

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (EFInt64Set)init
{
  v5[0] = 0;
  v5[1] = 0;
  v4 = v5;
  v2 = [(EFInt64Set *)self _initWithUnderlyingSet:&v4];
  std::__tree<long long>::destroy((uint64_t)&v4, v5[0]);
  return v2;
}

- (id)_initWithUnderlyingSet:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EFInt64Set;
  v4 = [(EFInt64Set *)&v8 init];
  p_underlying = (uint64_t **)&v4->_underlying;
  if (v4) {
    BOOL v6 = p_underlying == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    std::__tree<long long>::__assign_multi<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(p_underlying, *(void **)a3, (void *)a3 + 1);
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (id)_initWithIndexesInRange:(_EFInt64Range)a3
{
  unint64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v5 = [(EFInt64Set *)self init];
  if (v5)
  {
    uint64_t v6 = var0 + var1;
    for (uint64_t i = var0; i < v6; ++i)
      std::__tree<long long>::__emplace_unique_key_args<long long,long long const&>((uint64_t **)&v5->_underlying, &i, &i);
  }
  return v5;
}

+ (id)indexSet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)indexSetWithIndexesInRange:(_EFInt64Range)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "_initWithIndexesInRange:", a3.var0, a3.var1);
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  memset(v5, 170, sizeof(v5));
  std::set<long long>::set[abi:ne180100](v5, (uint64_t)&self->_underlying);
  id v3 = [(EFInt64Set *)[EFMutableInt64Set alloc] _initWithUnderlyingSet:v5];
  std::__tree<long long>::destroy((uint64_t)v5, (void *)v5[1]);
  return v3;
}

- (BOOL)containsIndex:(int64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  v4 = left;
  if (!left) {
    goto LABEL_11;
  }
  uint64_t v6 = p_pair1;
  do
  {
    int64_t v7 = (int64_t)v4[4].__value_.__left_;
    BOOL v8 = v7 < a3;
    if (v7 >= a3) {
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v4;
    }
    else {
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v4[1];
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || (uint64_t)v6[4].__value_.__left_ > a3) {
LABEL_11:
  }
    uint64_t v6 = p_pair1;
  return v6 != p_pair1;
}

- (unint64_t)count
{
  return self->_underlying.__tree_.__pair3_.__value_;
}

- (int64_t)firstIndex
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__begin_node_;
  if (begin_node == &self->_underlying.__tree_.__pair1_) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return (int64_t)begin_node[4].__value_.__left_;
  }
}

- (int64_t)lastIndex
{
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  if (&self->_underlying.__tree_.__pair1_ == self->_underlying.__tree_.__begin_node_) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)p_pair1->__value_.__left_;
  if (p_pair1->__value_.__left_)
  {
    do
    {
      v4 = left;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)left[1];
    }
    while (left);
  }
  else
  {
    do
    {
      v4 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)p_pair1[2].__value_.__left_;
      BOOL v5 = *v4 == p_pair1;
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v4;
    }
    while (v5);
  }
  return (int64_t)v4[4];
}

- (unint64_t)getIndexes:(int64_t *)a3 maxCount:(unint64_t)a4 inIndexRange:(_EFInt64Range *)a5
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__EFInt64Set_getIndexes_maxCount_inIndexRange___block_invoke;
  v10[3] = &__block_descriptor_40_e11_v24__0Q8q16l;
  v10[4] = a3;
  unint64_t result = [(EFInt64Set *)self _enumerateIndexesInRange:a5 maxCount:a4 withBlock:v10];
  if (a5)
  {
    if (result)
    {
      int64_t v8 = a3[result - 1];
      unint64_t v9 = a5->var0 + a5->var1 + ~v8;
      a5->int64_t var0 = v8 + 1;
      a5->unint64_t var1 = v9;
    }
  }
  return result;
}

uint64_t __47__EFInt64Set_getIndexes_maxCount_inIndexRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(result + 32) + 8 * a2) = a3;
  return result;
}

- (id)indexesInRange:(_EFInt64Range)a3
{
  return -[EFInt64Set lowestIndexesInRange:maxCount:](self, "lowestIndexesInRange:maxCount:", a3.var0, a3.var1, -1);
}

- (id)lowestIndexesInRange:(_EFInt64Range)a3 maxCount:(unint64_t)a4
{
  unint64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  _EFInt64Range v20 = a3;
  if ([(EFInt64Set *)self count] > a4
    || var0 > [(EFInt64Set *)self firstIndex]
    || (uint64_t)(var1 + var0) <= [(EFInt64Set *)self lastIndex])
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x4812000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = &unk_1B5ADDE1D;
    v19[0] = 0;
    v19[1] = 0;
    v18 = v19;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__EFInt64Set_lowestIndexesInRange_maxCount___block_invoke;
    v11[3] = &unk_1E6122290;
    v11[4] = &v12;
    [(EFInt64Set *)self _enumerateIndexesInRange:&v20 maxCount:a4 withBlock:v11];
    unint64_t v9 = [EFInt64Set alloc];
    id v8 = [(EFInt64Set *)v9 _initWithUnderlyingSet:v13 + 6];
    _Block_object_dispose(&v12, 8);
    std::__tree<long long>::destroy((uint64_t)&v18, v19[0]);
  }
  else
  {
    id v8 = (id)[(EFInt64Set *)self copy];
  }
  return v8;
}

uint64_t *__44__EFInt64Set_lowestIndexesInRange_maxCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  return std::__tree<long long>::__emplace_unique_key_args<long long,long long const&>((uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48), &v4, &v4);
}

- (unint64_t)_enumerateIndexesInRange:(_EFInt64Range *)a3 maxCount:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = (void (**)(id, unint64_t, void))a5;
  if (a3)
  {
    unint64_t var1 = a3->var1;
    if (!var1)
    {
LABEL_24:
      unint64_t v25 = 0;
      goto LABEL_25;
    }
    int64_t var0 = a3->var0;
    int64_t v11 = a3->var0 + var1 - 1;
  }
  else
  {
    int64_t v11 = 0x7FFFFFFFFFFFFFFELL;
    int64_t var0 = 0x8000000000000000;
  }
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  uint64_t v12 = left;
  if (!left) {
    goto LABEL_24;
  }
  v15 = p_pair1;
  v16 = v12;
  do
  {
    int64_t v17 = (int64_t)v16[4].__value_.__left_;
    BOOL v18 = v17 < var0;
    if (v17 >= var0) {
      v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v16;
    }
    else {
      v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v16[1];
    }
    if (!v18) {
      v15 = v16;
    }
    v16 = *v19;
  }
  while (*v19);
  do
  {
    int64_t v20 = (int64_t)v12[4].__value_.__left_;
    BOOL v21 = v11 < v20;
    if (v11 >= v20) {
      v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v12[1];
    }
    else {
      v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v12;
    }
    if (v21) {
      p_pair1 = v12;
    }
    uint64_t v12 = *v22;
  }
  while (*v22);
  BOOL v23 = v15 == p_pair1 || a4 == 0;
  if (v23) {
    goto LABEL_24;
  }
  unint64_t v25 = 0;
  do
  {
    ((void (**)(id, unint64_t, void *))v8)[2](v8, v25, v15[4].__value_.__left_);
    v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v15[1].__value_.__left_;
    if (v26)
    {
      do
      {
        v27 = v26;
        v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v26->__value_.__left_;
      }
      while (v26);
    }
    else
    {
      do
      {
        v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v15[2].__value_.__left_;
        BOOL v23 = v27->__value_.__left_ == v15;
        v15 = v27;
      }
      while (!v23);
    }
    ++v25;
    if (v27 == p_pair1) {
      break;
    }
    v15 = v27;
  }
  while (v25 < a4);
LABEL_25:

  return v25;
}

- (int64_t)indexGreaterThanIndex:(int64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  uint64_t v4 = left;
  if (!left) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = p_pair1;
  do
  {
    int64_t v7 = (int64_t)v4[4].__value_.__left_;
    BOOL v8 = v7 < a3;
    if (v7 >= a3) {
      unint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v4;
    }
    else {
      unint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v4[1];
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while (1)
  {
    int64_t v10 = (int64_t)v6[4].__value_.__left_;
    if (v10 != a3) {
      break;
    }
    int64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v6[1].__value_.__left_;
    if (v11)
    {
      do
      {
        uint64_t v12 = v11;
        int64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v11->__value_.__left_;
      }
      while (v11);
    }
    else
    {
      do
      {
        uint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v6[2].__value_.__left_;
        BOOL v13 = v12->__value_.__left_ == v6;
        uint64_t v6 = v12;
      }
      while (!v13);
    }
    uint64_t v6 = v12;
    if (v12 == p_pair1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v10;
}

- (void)enumerateIndexesUsingBlock:(id)a3
{
  BOOL v5 = (void (**)(id, void *, unsigned char *))a3;
  if (!v5)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/EmailFoundation/Containers/EFInt64Set.mm"];
    int64_t v7 = (void *)v6;
    BOOL v8 = @"<Unknown File>";
    if (v6) {
      BOOL v8 = (__CFString *)v6;
    }
    unint64_t v9 = v8;

    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 152, @"Invalid parameter not satisfying: %s", "block", 0, 0, 0, 0);
  }
  char v16 = 0;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__begin_node_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  if (begin_node != p_pair1)
  {
    do
    {
      v5[2](v5, begin_node[4].__value_.__left_, &v16);
      if (v16) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          uint64_t v14 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)begin_node[2].__value_.__left_;
          BOOL v15 = v14->__value_.__left_ == begin_node;
          begin_node = v14;
        }
        while (!v15);
      }
      begin_node = v14;
    }
    while (v14 != p_pair1);
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p> [", objc_opt_class(), self];
  begin_node = (EFInt64Set *)self->_underlying.__tree_.__begin_node_;
  if (begin_node != (EFInt64Set *)&self->_underlying.__tree_.__pair1_)
  {
    do
    {
      objc_msgSend(v3, "appendFormat:", @"%lld,", begin_node[1].super.isa);
      isa = (EFInt64Set *)begin_node->_underlying.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (EFInt64Set *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (EFInt64Set *)begin_node->_underlying.__tree_.__pair1_.__value_.__left_;
          BOOL v7 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v7);
      }
      begin_node = left;
    }
    while (left != (EFInt64Set *)&self->_underlying.__tree_.__pair1_);
  }
  [v3 appendString:@"]"];
  return (NSString *)v3;
}

- (NSString)commaSeparatedString
{
  begin_node = (EFInt64Set *)self->_underlying.__tree_.__begin_node_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  if (begin_node == (EFInt64Set *)&self->_underlying.__tree_.__pair1_)
  {
    uint64_t v4 = &stru_1F0EAE5A8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%lld", begin_node[1].super.isa);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    isa = (EFInt64Set *)begin_node->_underlying.__tree_.__begin_node_;
    if (isa)
    {
      do
      {
        left = isa;
        isa = (EFInt64Set *)isa->super.isa;
      }
      while (isa);
    }
    else
    {
      do
      {
        left = (EFInt64Set *)begin_node->_underlying.__tree_.__pair1_.__value_.__left_;
        BOOL v7 = left->super.isa == (Class)begin_node;
        begin_node = left;
      }
      while (!v7);
    }
    if (left != (EFInt64Set *)p_pair1)
    {
      do
      {
        [(__CFString *)v4 appendFormat:@",%lld", left[1].super.isa];
        BOOL v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)left->_underlying.__tree_.__begin_node_;
        if (v8)
        {
          do
          {
            unint64_t v9 = v8;
            BOOL v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v8->__value_.__left_;
          }
          while (v8);
        }
        else
        {
          do
          {
            unint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)left->_underlying.__tree_.__pair1_.__value_.__left_;
            BOOL v7 = v9->__value_.__left_ == left;
            left = (EFInt64Set *)v9;
          }
          while (!v7);
        }
        left = (EFInt64Set *)v9;
      }
      while (v9 != p_pair1);
    }
  }
  return (NSString *)v4;
}

- (NSString)ef_SQLExpression
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [(EFInt64Set *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3 conjoiner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__EFInt64Set_EFSQLExpressable__ef_renderSQLExpressionInto_conjoiner___block_invoke;
  v10[3] = &unk_1E61231E8;
  id v12 = v7;
  BOOL v13 = v14;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [(EFInt64Set *)self enumerateIndexesUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

uint64_t __69__EFInt64Set_EFSQLExpressable__ef_renderSQLExpressionInto_conjoiner___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    [*(id *)(a1 + 32) appendString:*(void *)(a1 + 40)];
  }
  else {
    *(unsigned char *)(v4 + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%lld", a2);
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
}

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueCollectionExpressable:self];
}

@end