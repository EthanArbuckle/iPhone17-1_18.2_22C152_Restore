@interface TextFieldCollectionViewCell.TextFieldCollectionViewCellInner
- (BOOL)respondsToSelector:(SEL)a3;
- (_TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner)init;
- (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation TextFieldCollectionViewCell.TextFieldCollectionViewCellInner

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v5 = MEMORY[0x1B3E68580]((char *)self+ OBJC_IVAR____TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner_target, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = self;
    unsigned __int8 v8 = objc_msgSend(v6, sel_respondsToSelector_, a3);
    swift_unknownObjectRelease();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for TextFieldCollectionViewCell.TextFieldCollectionViewCellInner();
    return [(TextFieldCollectionViewCell.TextFieldCollectionViewCellInner *)&v10 respondsToSelector:a3];
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v3 = (void *)MEMORY[0x1B3E68580]((char *)self+ OBJC_IVAR____TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner_target, a2, a3);
  if (v3)
  {
    v5[3] = swift_getObjectType();
    v5[0] = v3;
    v3 = (void *)sub_1AD740BA0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  return v3;
}

- (_TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner)init
{
  result = (_TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end