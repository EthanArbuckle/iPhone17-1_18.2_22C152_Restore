@interface KGMutableDirectedBinaryAdjacency
- (KGMutableDirectedBinaryAdjacency)init;
- (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency)mutableUnderlyingObject;
- (void)formUnionWith:(id)a3;
- (void)insertSource:(unint64_t)a3 target:(unint64_t)a4;
- (void)removeSource:(unint64_t)a3 target:(unint64_t)a4;
- (void)removeTargetsForSource:(unint64_t)a3;
- (void)setTargets:(id)a3 forSource:(unint64_t)a4;
- (void)subtract:(id)a3;
@end

@implementation KGMutableDirectedBinaryAdjacency

- (void)removeTargetsForSource:(unint64_t)a3
{
  id v4 = [(KGMutableDirectedBinaryAdjacency *)self mutableUnderlyingObject];
  [v4 removeTargetsForSource:a3];
}

- (void)setTargets:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(KGMutableDirectedBinaryAdjacency *)self mutableUnderlyingObject];
  [v7 setTargets:v6 forSource:a4];
}

- (void)subtract:(id)a3
{
  id v4 = a3;
  id v6 = [(KGMutableDirectedBinaryAdjacency *)self mutableUnderlyingObject];
  uint64_t v5 = v4[1];

  [v6 subtract:v5];
}

- (void)formUnionWith:(id)a3
{
  id v4 = a3;
  id v6 = [(KGMutableDirectedBinaryAdjacency *)self mutableUnderlyingObject];
  uint64_t v5 = v4[1];

  [v6 formUnionWith:v5];
}

- (void)removeSource:(unint64_t)a3 target:(unint64_t)a4
{
  id v6 = [(KGMutableDirectedBinaryAdjacency *)self mutableUnderlyingObject];
  [v6 removeSource:a3 target:a4];
}

- (void)insertSource:(unint64_t)a3 target:(unint64_t)a4
{
  id v6 = [(KGMutableDirectedBinaryAdjacency *)self mutableUnderlyingObject];
  [v6 insertSource:a3 target:a4];
}

- (KGMutableDirectedBinaryAdjacency)init
{
  v6.receiver = self;
  v6.super_class = (Class)KGMutableDirectedBinaryAdjacency;
  v2 = [(KGDirectedBinaryAdjacency *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->super._underlyingObject;
  v2->super._underlyingObject = (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *)v3;

  return v2;
}

- (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency)mutableUnderlyingObject
{
  return (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency *)self->super._underlyingObject;
}

@end