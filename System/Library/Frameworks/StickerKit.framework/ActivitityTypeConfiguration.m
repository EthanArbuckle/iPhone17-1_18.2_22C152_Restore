@interface ActivitityTypeConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC10StickerKit27ActivitityTypeConfiguration)init;
- (_TtC10StickerKit27ActivitityTypeConfiguration)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation ActivitityTypeConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_TtC10StickerKit27ActivitityTypeConfiguration)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  sub_24531DF90(a3);
  v5 = v4;
  swift_unknownObjectRelease();
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectRetain();
  v5 = self;
  swift_bridgeObjectRetain();
  v6 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2453FFB08();
  objc_msgSend(a3, sel_encodeObject_forKey_, v6, v7);
  swift_unknownObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = ActivitityTypeConfiguration.isEqual(_:)((uint64_t)v8);

  sub_245203CD8((uint64_t)v8, &qword_268ECEFA0);
  return v6 & 1;
}

- (_TtC10StickerKit27ActivitityTypeConfiguration)init
{
  result = (_TtC10StickerKit27ActivitityTypeConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end