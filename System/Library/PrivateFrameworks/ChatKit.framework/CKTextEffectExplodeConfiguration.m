@interface CKTextEffectExplodeConfiguration
+ (id)defaultConfiguration;
- (UIColor)sourceColor;
- (UIColor)targetColor;
- (_TtC7ChatKit32CKTextEffectExplodeConfiguration)init;
- (_TtC7ChatKit32CKTextEffectExplodeConfiguration)initWithSourceColor:(id)a3 targetColor:(id)a4;
@end

@implementation CKTextEffectExplodeConfiguration

+ (id)defaultConfiguration
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CKTextEffectExplodeConfiguration()), sel_init);

  return v2;
}

- (_TtC7ChatKit32CKTextEffectExplodeConfiguration)initWithSourceColor:(id)a3 targetColor:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_sourceColor) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_targetColor) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CKTextEffectExplodeConfiguration();
  id v6 = a3;
  id v7 = a4;
  return [(CKTextEffectExplodeConfiguration *)&v9 init];
}

- (_TtC7ChatKit32CKTextEffectExplodeConfiguration)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_sourceColor) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_targetColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKTextEffectExplodeConfiguration();
  return [(CKTextEffectExplodeConfiguration *)&v3 init];
}

- (UIColor)sourceColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_sourceColor));
}

- (UIColor)targetColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_targetColor));
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_targetColor);
}

@end