@interface KGMutableElementIdentifierSet
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addIdentifier:(unint64_t)a3;
- (void)formSymmetricDifferenceWithIdentifierSet:(id)a3;
- (void)intersectWithIdentifierSet:(id)a3;
- (void)mutableBitmap;
- (void)removeAllIdentifiers;
- (void)removeIdentifier:(unint64_t)a3;
- (void)subtractIdentifierSet:(id)a3;
- (void)unionWithIdentifierSet:(id)a3;
@end

@implementation KGMutableElementIdentifierSet

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[KGElementIdentifierSet allocWithZone:a3];
  v5 = [(KGElementIdentifierSet *)self bitmap];
  return [(KGElementIdentifierSet *)v4 initWithBitmap:v5];
}

- (id)copy
{
  v3 = [KGElementIdentifierSet alloc];
  v4 = [(KGElementIdentifierSet *)self bitmap];
  return [(KGElementIdentifierSet *)v3 initWithBitmap:v4];
}

- (void)formSymmetricDifferenceWithIdentifierSet:(id)a3
{
  id v4 = a3;
  degas::Bitmap::symmetricDiffWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), [v4 bitmap]);
}

- (void)subtractIdentifierSet:(id)a3
{
  id v4 = a3;
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), (degas::Bitmap *)[v4 bitmap]);
}

- (void)intersectWithIdentifierSet:(id)a3
{
  id v4 = a3;
  degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), (degas::Bitmap *)[v4 bitmap]);
}

- (void)unionWithIdentifierSet:(id)a3
{
  id v4 = a3;
  degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), [v4 bitmap]);
}

- (void)removeAllIdentifiers
{
  v2 = [(KGMutableElementIdentifierSet *)self mutableBitmap];
  void *v2 = 0;
  v2[1] = 0;
  uint64_t v3 = v2[2];
  for (uint64_t i = v2[3]; i != v3; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(void *)(i - 8) = 0;
  }
  v2[3] = v3;
}

- (void)removeIdentifier:(unint64_t)a3
{
  id v4 = [(KGMutableElementIdentifierSet *)self mutableBitmap];
  degas::Bitmap::clearBit(v4, a3);
}

- (void)addIdentifier:(unint64_t)a3
{
  id v4 = [(KGMutableElementIdentifierSet *)self mutableBitmap];
  degas::Bitmap::setBit(v4, a3);
}

- (void)mutableBitmap
{
  v3.receiver = self;
  v3.super_class = (Class)KGMutableElementIdentifierSet;
  return [(KGElementIdentifierSet *)&v3 mutableBitmap];
}

@end