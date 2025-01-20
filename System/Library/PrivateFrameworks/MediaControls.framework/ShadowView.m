@interface ShadowView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC13MediaControls10ShadowView)initWithCoder:(id)a3;
- (_TtC13MediaControls10ShadowView)initWithFrame:(CGRect)a3;
@end

@implementation ShadowView

- (_TtC13MediaControls10ShadowView)initWithCoder:(id)a3
{
  result = (_TtC13MediaControls10ShadowView *)sub_1AE9477B8();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    sub_1AE947158();
    uint64_t v5 = v4;
    v6 = self;
    v7 = (void *)sub_1AE947128();
  }
  else
  {
    v8 = self;
    v7 = 0;
    uint64_t v5 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ShadowView();
  unsigned int v9 = [(ShadowView *)&v12 _shouldAnimatePropertyWithKey:v7];

  if (v9)
  {

    swift_bridgeObjectRelease();
    char v11 = 1;
    return v11 & 1;
  }
  if (v5)
  {
    char v11 = sub_1AE947218();

    swift_bridgeObjectRelease();
    return v11 & 1;
  }
  __break(1u);
  return result;
}

- (_TtC13MediaControls10ShadowView)initWithFrame:(CGRect)a3
{
  BOOL result = (_TtC13MediaControls10ShadowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end