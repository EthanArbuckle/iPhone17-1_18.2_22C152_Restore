@interface KGWrapperMutableDirectedBinaryAdjacency
- (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency)init;
- (void)formUnionWith:(id)a3;
- (void)insertSource:(unint64_t)a3 target:(unint64_t)a4;
- (void)removeSource:(unint64_t)a3 target:(unint64_t)a4;
- (void)removeTargetsForSource:(unint64_t)a3;
- (void)setTargets:(id)a3 forSource:(unint64_t)a4;
- (void)subtract:(id)a3;
@end

@implementation KGWrapperMutableDirectedBinaryAdjacency

- (void)insertSource:(unint64_t)a3 target:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  ElementIdentifierTupleSet.insert(_:)(&v7, &v6, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)removeSource:(unint64_t)a3 target:(unint64_t)a4
{
  unint64_t v5 = a4;
  unint64_t v6 = a3;
  v4._0.rawValue = (Swift::UInt)&v6;
  v4._1.rawValue = (Swift::UInt)&v5;
  ElementIdentifierTupleSet.remove(_:)(v4);
}

- (void)formUnionWith:(id)a3
{
  uint64_t v3 = *(void *)((char *)a3 + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  swift_bridgeObjectRetain();
  ElementIdentifierTupleSet.formUnion(_:)(&v3);
}

- (void)subtract:(id)a3
{
  uint64_t v3 = *(void *)((char *)a3 + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  ElementIdentifierTupleSet.subtract(_:)((KnowledgeGraphKit::ElementIdentifierTupleSet)&v3);
}

- (void)setTargets:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1D16710A0(v6, a4);
}

- (void)removeTargetsForSource:(unint64_t)a3
{
  Swift::tuple_KnowledgeGraphKit_ElementIdentifier_KnowledgeGraphKit_ElementIdentifier v4 = self;
  sub_1D16A8B60(a3, &v5);

  swift_release();
}

- (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(KGWrapperDirectedBinaryAdjacency *)&v3 init];
}

@end