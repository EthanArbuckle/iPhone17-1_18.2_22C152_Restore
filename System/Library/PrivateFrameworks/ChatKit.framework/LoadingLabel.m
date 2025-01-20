@interface LoadingLabel
- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A12LoadingLabel)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A12LoadingLabel)initWithFrame:(CGRect)a3;
- (uint64_t)levelOfDetailChangedWithNotification:;
@end

@implementation LoadingLabel

- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A12LoadingLabel)initWithCoder:(id)a3
{
  result = (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A12LoadingLabel *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A12LoadingLabel)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A12LoadingLabel *)sub_18F5D3A5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (uint64_t)levelOfDetailChangedWithNotification:
{
  uint64_t v0 = sub_18F7B5D30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end