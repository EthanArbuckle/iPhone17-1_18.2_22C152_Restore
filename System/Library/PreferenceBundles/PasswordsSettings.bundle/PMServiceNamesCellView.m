@interface PMServiceNamesCellView
- (_TtC17PasswordsSettings22PMServiceNamesCellView)initWithCoder:(id)a3;
- (_TtC17PasswordsSettings22PMServiceNamesCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17PasswordsSettings22PMServiceNamesCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation PMServiceNamesCellView

- (_TtC17PasswordsSettings22PMServiceNamesCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
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
  return (_TtC17PasswordsSettings22PMServiceNamesCellView *)sub_B190(a3, v7, v9, a5);
}

- (_TtC17PasswordsSettings22PMServiceNamesCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC17PasswordsSettings22PMServiceNamesCellView *)sub_B314(a3, (uint64_t)a4, v6);
}

- (_TtC17PasswordsSettings22PMServiceNamesCellView)initWithCoder:(id)a3
{
  return (_TtC17PasswordsSettings22PMServiceNamesCellView *)sub_B450(a3);
}

@end