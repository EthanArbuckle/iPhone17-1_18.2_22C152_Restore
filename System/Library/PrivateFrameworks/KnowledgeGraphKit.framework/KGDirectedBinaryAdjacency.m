@interface KGDirectedBinaryAdjacency
+ (id)identityWith:(id)a3;
- (BOOL)containsSource:(unint64_t)a3 target:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (KGDirectedBinaryAdjacency)init;
- (KGDirectedBinaryAdjacency)initWithUnderlyingObject:(id)a3;
- (KGElementIdentifierSet)sources;
- (KGElementIdentifierSet)targets;
- (NSString)description;
- (id)differenceWith:(id)a3;
- (id)intersectingSourcesWith:(id)a3;
- (id)intersectingTargetsWith:(id)a3;
- (id)joinOnTargetsOfAdjacency:(id)a3;
- (id)mutableCopy;
- (id)subtractingSourcesWith:(id)a3;
- (id)subtractingTargetsWith:(id)a3;
- (id)targetsForSourceIdentifier:(unint64_t)a3;
- (id)targetsForSources:(id)a3;
- (id)targetsWithMinimumCount:(unint64_t)a3;
- (id)transposed;
- (id)unionWith:(id)a3;
- (unint64_t)hash;
- (unint64_t)sourcesCount;
- (void)enumerateTargetsBySourceWith:(id)a3;
@end

@implementation KGDirectedBinaryAdjacency

- (void).cxx_destruct
{
}

- (id)mutableCopy
{
  v3 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  v4 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject mutableCopy];
  underlyingObject = v3->super._underlyingObject;
  v3->super._underlyingObject = v4;

  return v3;
}

+ (id)identityWith:(id)a3
{
  v3 = +[KGWrapperDirectedBinaryAdjacency identityWith:a3];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject isEqual:v4[1]];

  return v5;
}

- (id)targetsWithMinimumCount:(unint64_t)a3
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject targetsWithMinimumCount:a3];
}

- (id)unionWith:(id)a3
{
  v3 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject unionWith:*((void *)a3 + 1)];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];

  return v4;
}

- (id)differenceWith:(id)a3
{
  v3 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject differenceWith:*((void *)a3 + 1)];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];

  return v4;
}

- (id)transposed
{
  v2 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject transposed];
  v3 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v2];

  return v3;
}

- (id)targetsForSourceIdentifier:(unint64_t)a3
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject targetsForSourceIdentifier:a3];
}

- (id)targetsForSources:(id)a3
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject targetsForSources:a3];
}

- (BOOL)containsSource:(unint64_t)a3 target:(unint64_t)a4
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject containsSource:a3 target:a4];
}

- (void)enumerateTargetsBySourceWith:(id)a3
{
}

- (id)joinOnTargetsOfAdjacency:(id)a3
{
  v3 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject joinOnTargetsOfAdjacency:*((void *)a3 + 1)];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];

  return v4;
}

- (id)subtractingSourcesWith:(id)a3
{
  uint64_t v3 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject subtractingSourcesWith:a3];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];
  underlyingObject = v4->_underlyingObject;
  v4->_underlyingObject = (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *)v3;

  return v4;
}

- (id)subtractingTargetsWith:(id)a3
{
  uint64_t v3 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject subtractingTargetsWith:a3];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];
  underlyingObject = v4->_underlyingObject;
  v4->_underlyingObject = (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *)v3;

  return v4;
}

- (id)intersectingSourcesWith:(id)a3
{
  uint64_t v3 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject intersectingSourcesWith:a3];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];

  return v4;
}

- (id)intersectingTargetsWith:(id)a3
{
  uint64_t v3 = [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject intersectingTargetsWith:a3];
  v4 = [[KGDirectedBinaryAdjacency alloc] initWithUnderlyingObject:v3];

  return v4;
}

- (unint64_t)sourcesCount
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject sourcesCount];
}

- (KGElementIdentifierSet)targets
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject targets];
}

- (KGElementIdentifierSet)sources
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject sources];
}

- (NSString)description
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject description];
}

- (unint64_t)hash
{
  return [(KGWrapperDirectedBinaryAdjacency *)self->_underlyingObject hash];
}

- (KGDirectedBinaryAdjacency)initWithUnderlyingObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDirectedBinaryAdjacency;
  v6 = [(KGDirectedBinaryAdjacency *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingObject, a3);
  }

  return v7;
}

- (KGDirectedBinaryAdjacency)init
{
  v6.receiver = self;
  v6.super_class = (Class)KGDirectedBinaryAdjacency;
  v2 = [(KGDirectedBinaryAdjacency *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency);
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = v3;
  }
  return v2;
}

@end