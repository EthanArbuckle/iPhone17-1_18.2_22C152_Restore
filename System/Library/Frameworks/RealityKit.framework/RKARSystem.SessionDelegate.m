@interface RKARSystem.SessionDelegate
- (_TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate)init;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didOutputCollaborationData:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5;
@end

@implementation RKARSystem.SessionDelegate

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  uint64_t v7 = MEMORY[0x1E4E64ED0]((char *)self+ OBJC_IVAR____TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate_system, a2);
  if (v7)
  {
    id v11 = (id)v7;
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    specialized RKARSystem.session(_:didUpdate:)(v9);
  }
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
}

- (void)session:(id)a3 didOutputCollaborationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  specialized RKARSystem.SessionDelegate.session(_:didOutputCollaborationData:)(v7);
}

- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  specialized RKARSystem.SessionDelegate.session(_:requestedRunWith:options:)();
}

- (_TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RKARSystem.SessionDelegate();
  return [(RKARSystem.SessionDelegate *)&v4 init];
}

- (void).cxx_destruct
{
}

@end