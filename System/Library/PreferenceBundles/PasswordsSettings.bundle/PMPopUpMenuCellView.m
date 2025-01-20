@interface PMPopUpMenuCellView
- (_TtC17PasswordsSettings19PMPopUpMenuCellView)initWithCoder:(id)a3;
- (_TtC17PasswordsSettings19PMPopUpMenuCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17PasswordsSettings19PMPopUpMenuCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PMPopUpMenuCellView

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_BE6C((uint64_t)a3);
}

- (_TtC17PasswordsSettings19PMPopUpMenuCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_D190();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC17PasswordsSettings19PMPopUpMenuCellView *)sub_C994(a3, v7, v9, a5);
}

- (_TtC17PasswordsSettings19PMPopUpMenuCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_D190();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC17PasswordsSettings19PMPopUpMenuCellView *)sub_CAD0(a3, (uint64_t)a4, v6);
}

- (_TtC17PasswordsSettings19PMPopUpMenuCellView)initWithCoder:(id)a3
{
  *(void *)&self->PSTableCell_opaque[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_traitChangeRegistration] = 0;
  *(void *)&self->PSTableCell_opaque[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_stackView] = 0;
  *(void *)&self->PSTableCell_opaque[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_popUpButton] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PMPopUpMenuCellView();
  return [(PMPopUpMenuCellView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  v3 = *(void **)&self->PSTableCell_opaque[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_popUpButton];
}

@end