@interface KGElementIdentifierSet
+ (void)drainBitsetPool;
- (BOOL)containsIdentifier:(unint64_t)a3;
- (BOOL)containsIdentifierSet:(id)a3;
- (BOOL)intersectsIdentifierSet:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToElementIdentifierSet:(id)a3;
- (BOOL)isSubsetOfIdentifierSet:(id)a3;
- (KGElementIdentifierSet)init;
- (KGElementIdentifierSet)initWithBitmap:(const void *)a3;
- (KGElementIdentifierSet)initWithElementIdentifier:(unint64_t)a3;
- (KGElementIdentifierSet)initWithIndexArray:(id)a3;
- (KGElementIdentifierSet)initWithIndexCollection:(id)a3;
- (KGElementIdentifierSet)initWithIndexSet:(id)a3;
- (KGElementIdentifierSet)initWithLiteralData:(id)a3;
- (KGElementIdentifierSetIndex)endIndex;
- (KGElementIdentifierSetIndex)indexAfterIndex:(KGElementIdentifierSetIndex)a3;
- (KGElementIdentifierSetIndex)indexWithIterator:(const void *)a3;
- (KGElementIdentifierSetIndex)startIndex;
- (NSArray)indexArray;
- (NSIndexSet)indexSet;
- (const)bitmap;
- (id).cxx_construct;
- (id)description;
- (id)extractRangeByIndex:(_NSRange)a3;
- (id)identifierSetByAddingIdentifier:(unint64_t)a3;
- (id)identifierSetByFilteringUsingBlock:(id)a3;
- (id)identifierSetByFormingSymmetricDifferenceWithIdentifierSet:(id)a3;
- (id)identifierSetByFormingUnion:(id)a3;
- (id)identifierSetByIntersectingIdentifierSet:(id)a3;
- (id)identifierSetByRemovingIdentifier:(unint64_t)a3;
- (id)identifierSetBySubtractingIdentifierSet:(id)a3;
- (id)literalDataRepresentation;
- (id)mutableCopy;
- (id)prefix:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)elementAtOffset:(unint64_t)a3;
- (unint64_t)firstElement;
- (unint64_t)lastElement;
- (unint64_t)randomElement;
- (void)enumerateIdentifiersWithBlock:(id)a3;
- (void)mutableBitmap;
@end

@implementation KGElementIdentifierSet

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 33) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  p_bitSets = &self->_bitmap._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
}

- (id)literalDataRepresentation
{
  degas::LiteralBitmap::makeLiteralBitmap((degas::LiteralBitmap *)&self->_bitmap, (const Bitmap *)a2);
  uint64_t v3 = v2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v3 length:(144 * *(unsigned int *)(v3 + 4)) | 8];
  MEMORY[0x1D25F9A90](v3, 0x1000C4000313F17);
  return v4;
}

- (id)mutableCopy
{
  uint64_t v3 = [KGMutableElementIdentifierSet alloc];
  return [(KGElementIdentifierSet *)v3 initWithBitmap:&self->_bitmap];
}

+ (void)drainBitsetPool
{
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  uint64_t v2 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
  degas::BitsetPool::purgeEmptyPages(v2);
}

- (id)description
{
  uint64_t v2 = [(KGElementIdentifierSet *)self indexArray];
  uint64_t v3 = [v2 description];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KGElementIdentifierSet *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(KGElementIdentifierSet *)self isEqualToElementIdentifierSet:v4];
  }

  return v5;
}

- (BOOL)isEqualToElementIdentifierSet:(id)a3
{
  v4 = (KGElementIdentifierSet *)a3;
  BOOL v5 = v4;
  BOOL v6 = v4 == self
    || degas::Bitmap::operator==((uint64_t)[(KGElementIdentifierSet *)v4 bitmap], (uint64_t)&self->_bitmap);

  return v6;
}

- (void)enumerateIdentifiersWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  char v10 = 0;
  p_bitmap = &self->_bitmap;
  degas::Bitmap::begin(&self->_bitmap._bitCount, v9);
  end = self->_bitmap._bitSets.__end_;
  while (1)
  {
    BOOL v7 = (Bitmap *)v9[0] == p_bitmap && v9[1] == -1;
    if (v7 && v9[2] == (void)end) {
      break;
    }
    v4[2](v4);
    if (v10) {
      break;
    }
    degas::Bitmap::iterator::operator++(v9);
  }
}

- (id)identifierSetByFilteringUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4677;
  v16 = __Block_byref_object_dispose__4678;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__KGElementIdentifierSet_identifierSetByFilteringUsingBlock___block_invoke;
  unint64_t v9[3] = &unk_1E68DC748;
  id v10 = v4;
  v11 = &v12;
  v9[4] = self;
  id v5 = v4;
  [(KGElementIdentifierSet *)self enumerateIdentifiersWithBlock:v9];
  BOOL v6 = (KGElementIdentifierSet *)v13[5];
  if (!v6) {
    BOOL v6 = self;
  }
  BOOL v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __61__KGElementIdentifierSet_identifierSetByFilteringUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) mutableCopy];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    return [v5 removeIdentifier:a2];
  }
  return result;
}

- (id)identifierSetByFormingSymmetricDifferenceWithIdentifierSet:(id)a3
{
  id v4 = a3;
  id v5 = [[KGElementIdentifierSet alloc] initWithBitmap:&self->_bitmap];
  degas::Bitmap::symmetricDiffWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (uint64_t)v4 + 8);

  return v5;
}

- (id)identifierSetBySubtractingIdentifierSet:(id)a3
{
  id v4 = (char *)a3;
  id v5 = [[KGElementIdentifierSet alloc] initWithBitmap:&self->_bitmap];
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (degas::Bitmap *)(v4 + 8));

  return v5;
}

- (id)identifierSetByIntersectingIdentifierSet:(id)a3
{
  id v4 = (char *)a3;
  id v5 = [[KGElementIdentifierSet alloc] initWithBitmap:&self->_bitmap];
  degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (degas::Bitmap *)(v4 + 8));

  return v5;
}

- (id)identifierSetByFormingUnion:(id)a3
{
  id v4 = a3;
  id v5 = [[KGElementIdentifierSet alloc] initWithBitmap:&self->_bitmap];
  degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (uint64_t)v4 + 8);

  return v5;
}

- (id)identifierSetByRemovingIdentifier:(unint64_t)a3
{
  id v4 = [[KGElementIdentifierSet alloc] initWithBitmap:&self->_bitmap];
  degas::Bitmap::clearBit((degas::BitsetPtr **)&v4->_bitmap, a3);
  return v4;
}

- (id)identifierSetByAddingIdentifier:(unint64_t)a3
{
  id v4 = [[KGElementIdentifierSet alloc] initWithBitmap:&self->_bitmap];
  degas::Bitmap::setBit((degas::Bitmap *)&v4->_bitmap, a3);
  return v4;
}

- (id)prefix:(unint64_t)a3
{
  *(_OWORD *)uint64_t v7 = 0u;
  degas::Bitmap::getBatch((unint64_t *)[(KGElementIdentifierSet *)self bitmap], (degas::Bitmap *)&v5, a3);
  uint64_t v3 = [[KGElementIdentifierSet alloc] initWithBitmap:&v5];
  v8 = (void **)&v6;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v8);
  return v3;
}

- (id)extractRangeByIndex:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v14 = 0u;
  memset(v15, 0, 25);
  p_bitmap = &self->_bitmap;
  degas::Bitmap::begin(&self->_bitmap._bitCount, &v11);
  degas::Bitmap::iterator::seek(&v11, location);
  while (length)
  {
    unint64_t v7 = v12;
    if ((Bitmap *)v11 == p_bitmap && v12 == -1)
    {
      if (v13 == self->_bitmap._bitSets.__end_) {
        break;
      }
      unint64_t v7 = -1;
    }
    degas::Bitmap::setBit((degas::Bitmap *)&v14, v7);
    --length;
    degas::Bitmap::iterator::operator++(&v11);
  }
  v9 = [[KGElementIdentifierSet alloc] initWithBitmap:&v14];
  unint64_t v11 = (unint64_t)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
  return v9;
}

- (KGElementIdentifierSetIndex)indexAfterIndex:(KGElementIdentifierSetIndex)a3
{
  v6[0] = (unint64_t)&self->_bitmap;
  v6[1] = a3.var0;
  v6[2] = (unint64_t)self->_bitmap._bitSets.__begin_ + 16 * a3.var1;
  degas::Bitmap::iterator::operator++(v6);
  unint64_t v4 = [(KGElementIdentifierSet *)self indexWithIterator:v6];
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (KGElementIdentifierSetIndex)endIndex
{
  end = self->_bitmap._bitSets.__end_;
  v5[0] = &self->_bitmap;
  v5[1] = -1;
  v5[2] = end;
  unint64_t v3 = [(KGElementIdentifierSet *)self indexWithIterator:v5];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (KGElementIdentifierSetIndex)startIndex
{
  degas::Bitmap::begin(&self->_bitmap._bitCount, v5);
  unint64_t v3 = [(KGElementIdentifierSet *)self indexWithIterator:v5];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (KGElementIdentifierSetIndex)indexWithIterator:(const void *)a3
{
  unint64_t v3 = *((void *)a3 + 1);
  int64_t v4 = (uint64_t)(*((void *)a3 + 2) - *(void *)(*(void *)a3 + 16)) >> 4;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)randomElement
{
  uint32_t v3 = degas::Bitmap::count((degas::Bitmap *)&self->_bitmap);
  if ([(KGElementIdentifierSet *)self isEmpty]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = arc4random_uniform(v3);
  return [(KGElementIdentifierSet *)self elementAtOffset:v5];
}

- (unint64_t)elementAtOffset:(unint64_t)a3
{
  return degas::Bitmap::bitAtIndex((degas::Bitmap *)&self->_bitmap, a3);
}

- (unint64_t)count
{
  return degas::Bitmap::count((degas::Bitmap *)&self->_bitmap);
}

- (BOOL)isEmpty
{
  return self->_bitmap._bitSets.__begin_ == self->_bitmap._bitSets.__end_;
}

- (unint64_t)lastElement
{
  if (self->_bitmap._bitSets.__begin_ == self->_bitmap._bitSets.__end_) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return degas::Bitmap::lastBit((degas::Bitmap *)&self->_bitmap);
  }
}

- (unint64_t)firstElement
{
  unint64_t result = degas::Bitmap::firstBit((degas::Bitmap *)&self->_bitmap);
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (NSArray)indexArray
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  degas::Bitmap::begin(&self->_bitmap._bitCount, v7);
  while (1)
  {
    BOOL v4 = (Bitmap *)v7[0] == &self->_bitmap && v7[1] == -1;
    if (v4 && (BitsetPtr *)v7[2] == self->_bitmap._bitSets.__end_) {
      break;
    }
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v3 addObject:v5];

    degas::Bitmap::iterator::operator++(v7);
  }
  return (NSArray *)v3;
}

- (NSIndexSet)indexSet
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  degas::Bitmap::begin(&self->_bitmap._bitCount, v6);
  while (1)
  {
    BOOL v4 = (Bitmap *)v6[0] == &self->_bitmap && v6[1] == -1;
    if (v4 && (BitsetPtr *)v6[2] == self->_bitmap._bitSets.__end_) {
      break;
    }
    objc_msgSend(v3, "addIndex:");
    degas::Bitmap::iterator::operator++(v6);
  }
  return (NSIndexSet *)v3;
}

- (BOOL)containsIdentifierSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bitmap];
  LOBYTE(self) = degas::Bitmap::isSubsetOf<degas::Bitmap>(*(void *)(v5 + 16), *(void *)(v5 + 24), (uint64_t)self->_bitmap._bitSets.__begin_, (uint64_t)self->_bitmap._bitSets.__end_);

  return (char)self;
}

- (BOOL)isSubsetOfIdentifierSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bitmap];
  LOBYTE(self) = degas::Bitmap::isSubsetOf<degas::Bitmap>((uint64_t)self->_bitmap._bitSets.__begin_, (uint64_t)self->_bitmap._bitSets.__end_, *(void *)(v5 + 16), *(void *)(v5 + 24));

  return (char)self;
}

- (BOOL)intersectsIdentifierSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bitmap];
  uint64_t v6 = *(void *)(v5 + 16);
  unint64_t v7 = *(void *)(v5 + 24) - v6;
  if ((v7 >> 4))
  {
    begin = self->_bitmap._bitSets.__begin_;
    end = self->_bitmap._bitSets.__end_;
    if (begin != end)
    {
      unint64_t v10 = 0;
      unint64_t v11 = (v7 >> 4);
      while (1)
      {
        uint64_t v12 = *(void *)(v6 + 16 * v10);
        uint64_t v13 = *(void *)begin;
        unint64_t v14 = *(void *)(*(void *)begin + 8);
        unint64_t v15 = *(void *)(v12 + 8);
        if (v14 >= v15)
        {
          if (v14 <= v15)
          {
            if ((*(_DWORD *)(v12 + 16) & *(_DWORD *)(v13 + 16)) != 0)
            {
LABEL_19:
              BOOL v22 = 1;
              goto LABEL_18;
            }
            uint64_t v16 = 0;
            uint64_t v17 = v12 + 20;
            uint64_t v18 = v13 + 20;
            while (v16 != 31)
            {
              uint64_t v19 = v16 + 1;
              int v20 = *(_DWORD *)(v18 + 4 * v16);
              int v21 = *(_DWORD *)(v17 + 4 * v16++);
              if ((v21 & v20) != 0)
              {
                if ((unint64_t)(v19 - 1) < 0x1F) {
                  goto LABEL_19;
                }
                break;
              }
            }
            begin = (BitsetPtr *)((char *)begin + 16);
          }
          ++v10;
        }
        else
        {
          begin = (BitsetPtr *)((char *)begin + 16);
        }
        BOOL v22 = 0;
        if (begin == end || v10 >= v11) {
          goto LABEL_18;
        }
      }
    }
  }
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (BOOL)containsIdentifier:(unint64_t)a3
{
  return degas::Bitmap::isSet((degas::Bitmap *)&self->_bitmap, a3);
}

- (void)mutableBitmap
{
  return &self->_bitmap;
}

- (const)bitmap
{
  return &self->_bitmap;
}

- (KGElementIdentifierSet)initWithLiteralData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    degas::Bitmap::Bitmap((degas::Bitmap *)v7, (const degas::LiteralBitmap *)[v4 bytes]);
    uint64_t v5 = [(KGElementIdentifierSet *)self initWithBitmap:v7];
    v9 = (void **)&v8;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v9);
  }
  else
  {
    uint64_t v5 = [(KGElementIdentifierSet *)self init];
  }

  return v5;
}

- (KGElementIdentifierSet)initWithBitmap:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)KGElementIdentifierSet;
  id v4 = [(KGElementIdentifierSet *)&v7 init];
  uint64_t v5 = v4;
  if (v4) {
    degas::Bitmap::operator=(&v4->_bitmap._bitCount, a3);
  }
  return v5;
}

- (KGElementIdentifierSet)initWithIndexCollection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KGElementIdentifierSet;
  uint64_t v5 = [(KGElementIdentifierSet *)&v15 init];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          degas::Bitmap::setBit((degas::Bitmap *)&v5->_bitmap, objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "unsignedLongLongValue", (void)v11));
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (KGElementIdentifierSet)initWithIndexArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KGElementIdentifierSet;
  uint64_t v5 = [(KGElementIdentifierSet *)&v15 init];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          degas::Bitmap::setBit((degas::Bitmap *)&v5->_bitmap, objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "unsignedLongLongValue", (void)v11));
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (KGElementIdentifierSet)initWithIndexSet:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KGElementIdentifierSet;
  uint64_t v5 = [(KGElementIdentifierSet *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__KGElementIdentifierSet_initWithIndexSet___block_invoke;
    v8[3] = &unk_1E68DC268;
    uint64_t v9 = v5;
    [v4 enumerateIndexesUsingBlock:v8];
  }
  return v6;
}

uint64_t __43__KGElementIdentifierSet_initWithIndexSet___block_invoke(uint64_t a1, unint64_t a2)
{
  return degas::Bitmap::setBit((degas::Bitmap *)(*(void *)(a1 + 32) + 8), a2);
}

- (KGElementIdentifierSet)initWithElementIdentifier:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)KGElementIdentifierSet;
  id v4 = [(KGElementIdentifierSet *)&v7 init];
  uint64_t v5 = v4;
  if (v4) {
    degas::Bitmap::setBit((degas::Bitmap *)&v4->_bitmap, a3);
  }
  return v5;
}

- (KGElementIdentifierSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)KGElementIdentifierSet;
  return [(KGElementIdentifierSet *)&v3 init];
}

@end