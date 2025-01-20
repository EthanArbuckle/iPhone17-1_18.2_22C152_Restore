@interface PMSavePasswordsPromptPreferenceCellView
- (_TtC17PasswordsSettings39PMSavePasswordsPromptPreferenceCellView)initWithCoder:(id)a3;
- (_TtC17PasswordsSettings39PMSavePasswordsPromptPreferenceCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17PasswordsSettings39PMSavePasswordsPromptPreferenceCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation PMSavePasswordsPromptPreferenceCellView

- (_TtC17PasswordsSettings39PMSavePasswordsPromptPreferenceCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
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
  return (_TtC17PasswordsSettings39PMSavePasswordsPromptPreferenceCellView *)sub_BA58(a3, v7, v9, a5);
}

- (_TtC17PasswordsSettings39PMSavePasswordsPromptPreferenceCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_D190();
    NSString v6 = sub_D180();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PMSavePasswordsPromptPreferenceCellView();
  uint64_t v7 = [(PMPopUpMenuCellView *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC17PasswordsSettings39PMSavePasswordsPromptPreferenceCellView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PMSavePasswordsPromptPreferenceCellView();
  return [(PMPopUpMenuCellView *)&v5 initWithCoder:a3];
}

@end