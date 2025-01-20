@interface KGWrapperDirectedBinaryAdjacency
+ (id)identityWith:(id)a3;
- (BOOL)containsSource:(unint64_t)a3 target:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (KGElementIdentifierSet)sources;
- (KGElementIdentifierSet)targets;
- (NSString)description;
- (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency)init;
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
- (int64_t)hash;
- (int64_t)sourcesCount;
- (void)enumerateTargetsBySourceWith:(id)a3;
@end

@implementation KGWrapperDirectedBinaryAdjacency

- (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue) = (Class)sub_1D165F754(MEMORY[0x1E4FBC860]);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  return [(KGWrapperDirectedBinaryAdjacency *)&v4 init];
}

+ (id)identityWith:(id)a3
{
  id v3 = a3;
  id v4 = sub_1D16713B8(v3);

  return v4;
}

- (KGElementIdentifierSet)sources
{
  v2 = self;
  id v3 = (void *)sub_1D166FC80();

  return (KGElementIdentifierSet *)v3;
}

- (KGElementIdentifierSet)targets
{
  v2 = self;
  id v3 = (void *)sub_1D166FD84();

  return (KGElementIdentifierSet *)v3;
}

- (int64_t)sourcesCount
{
  return (*(void **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue))[2];
}

- (id)intersectingTargetsWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D166FEB0(v4);

  return v6;
}

- (id)intersectingSourcesWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D166FF28(v4);

  return v6;
}

- (id)subtractingTargetsWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D16700A0(v4);

  return v6;
}

- (id)subtractingSourcesWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D167024C(v4);

  return v6;
}

- (id)joinOnTargetsOfAdjacency:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D16703D0((uint64_t)v4);

  return v6;
}

- (void)enumerateTargetsBySourceWith:(id)a3
{
  v5 = _Block_copy(a3);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  id v4 = self;
  swift_bridgeObjectRetain();
  sub_1D16607D4(&v6, (void (*)(uint64_t, void *, char *))sub_1D167139C);
  swift_bridgeObjectRelease();
  _Block_release(v5);
}

- (BOOL)containsSource:(unint64_t)a3 target:(unint64_t)a4
{
  uint64_t v6 = self;
  LOBYTE(a4) = sub_1D167053C(a3, a4);

  return a4 & 1;
}

- (id)targetsForSources:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_1D16705EC(v4);

  return v6;
}

- (id)targetsForSourceIdentifier:(unint64_t)a3
{
  id v4 = self;
  v5 = (void *)sub_1D16707B0(a3);

  return v5;
}

- (id)transposed
{
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  v2 = self;
  DirectedBinaryAdjacency.transposed()();
  id v3 = (objc_class *)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  id v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue] = v9;
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = [(KGWrapperDirectedBinaryAdjacency *)&v7 init];

  return v5;
}

- (id)differenceWith:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  uint64_t v13 = *(void *)((char *)a3 + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  uint64_t v14 = v4;
  id v5 = a3;
  uint64_t v6 = self;
  swift_bridgeObjectRetain();
  ElementIdentifierTupleSet.subtract(_:)((KnowledgeGraphKit::ElementIdentifierTupleSet)&v13);
  uint64_t v7 = v14;
  uint64_t v8 = (objc_class *)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue] = v7;
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = [(KGWrapperDirectedBinaryAdjacency *)&v12 init];

  return v10;
}

- (id)unionWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1D1670A60((uint64_t)v4);

  return v6;
}

- (id)targetsWithMinimumCount:(unint64_t)a3
{
  id v4 = self;
  id v5 = (void *)sub_1D1670B48(a3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1D17BE690();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = sub_1D1670C58((uint64_t)v8);

  sub_1D167133C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  sub_1D17BED20();
  id v4 = self;
  swift_bridgeObjectRetain();
  sub_1D16A981C(v7, v3);
  int64_t v5 = sub_1D17BED80();

  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)description
{
  sub_1D16712E8();
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  sub_1D17BDE60();

  swift_bridgeObjectRelease();
  id v4 = (void *)sub_1D17BDFE0();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (id)mutableCopy
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  uint64_t v3 = (char *)objc_allocWithZone((Class)type metadata accessor for KGWrapperMutableDirectedBinaryAdjacency());
  *(void *)&v3[OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue] = v2;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  swift_bridgeObjectRetain();
  return [(KGWrapperDirectedBinaryAdjacency *)&v5 init];
}

- (void).cxx_destruct
{
}

@end