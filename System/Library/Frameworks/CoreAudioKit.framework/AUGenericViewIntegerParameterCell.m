@interface AUGenericViewIntegerParameterCell
- (UIButton)editButton;
- (UIButton)valueButton;
- (_TtC12CoreAudioKit33AUGenericViewIntegerParameterCell)initWithCoder:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setEditButton:(id)a3;
- (void)setValueButton:(id)a3;
@end

@implementation AUGenericViewIntegerParameterCell

- (UIButton)editButton
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_editButton, a2);

  return (UIButton *)v2;
}

- (void)setEditButton:(id)a3
{
}

- (UIButton)valueButton
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_valueButton, a2);

  return (UIButton *)v2;
}

- (void)setValueButton:(id)a3
{
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_21E57356C();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_21E573648();
}

- (_TtC12CoreAudioKit33AUGenericViewIntegerParameterCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_indexPath;
  uint64_t v6 = sub_21E5B6498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AUGenericViewIntegerParameterCell();
  return [(AUGenericViewParameterCellBase *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_indexPath, &qword_267D37BB0);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end