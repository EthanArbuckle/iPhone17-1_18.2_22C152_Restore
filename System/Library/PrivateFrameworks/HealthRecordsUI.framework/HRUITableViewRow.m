@interface HRUITableViewRow
- (HRUITableViewRow)init;
- (HRUITableViewRow)initWithReuseIdentifier:(id)a3;
- (NSString)reuseIdentifier;
@end

@implementation HRUITableViewRow

- (NSString)reuseIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (HRUITableViewRow)initWithReuseIdentifier:(id)a3
{
  uint64_t v4 = sub_1C254F470();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___HRUITableViewRow_reuseIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TableViewRow();
  return [(HRUITableViewRow *)&v8 init];
}

- (HRUITableViewRow)init
{
  result = (HRUITableViewRow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end