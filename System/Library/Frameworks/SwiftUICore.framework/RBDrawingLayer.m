@interface RBDrawingLayer
- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)init;
- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)initWithLayer:(id)a3;
- (void)drawInDisplayList:(id)a3;
@end

@implementation RBDrawingLayer

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized RBDrawingLayer.init(coder:)();
}

- (void)drawInDisplayList:(id)a3
{
  id v4 = a3;
  v5 = self;
  [(RBDrawingLayer *)v5 bounds];
  specialized RBDrawingLayer.draw(in:size:)(v4);
}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)init
{
  result = (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)initWithLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end