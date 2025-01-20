@interface AttachmentDataReport
+ (BOOL)supportsSecureCoding;
- (_TtC14CopresenceCore20AttachmentDataReport)init;
- (_TtC14CopresenceCore20AttachmentDataReport)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AttachmentDataReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AttachmentDataReport.encode(with:)((NSCoder)v4);
}

- (_TtC14CopresenceCore20AttachmentDataReport)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC14CopresenceCore20AttachmentDataReport *)specialized AttachmentDataReport.init(coder:)(v3);

  return v4;
}

- (_TtC14CopresenceCore20AttachmentDataReport)init
{
  result = (_TtC14CopresenceCore20AttachmentDataReport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end