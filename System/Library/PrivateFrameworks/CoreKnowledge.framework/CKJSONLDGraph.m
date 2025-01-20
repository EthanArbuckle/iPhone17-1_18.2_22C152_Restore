@interface CKJSONLDGraph
- (CKJSONLDGraph)init;
- (CKJSONLDGraph)initWithEntities:(id)a3;
- (NSArray)entities;
- (void)linkedDataWithCompletionHandler:(id)a3;
@end

@implementation CKJSONLDGraph

- (CKJSONLDGraph)initWithEntities:(id)a3
{
  if (a3)
  {
    type metadata accessor for CKEntity();
    uint64_t v3 = sub_1A783198C();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (CKJSONLDGraph *)CKJSONLDGraph.init(withEntities:)(v3);
}

- (NSArray)entities
{
  v2 = self;
  sub_1A77E7F5C();

  uint64_t v3 = (void *)sub_1A783197C();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)linkedDataWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_1A77E80D4();

  swift_release();
}

- (CKJSONLDGraph)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKJSONLDGraph_queue);
}

@end