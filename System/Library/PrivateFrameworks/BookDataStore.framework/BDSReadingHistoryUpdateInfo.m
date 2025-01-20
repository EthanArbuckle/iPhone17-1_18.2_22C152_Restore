@interface BDSReadingHistoryUpdateInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryUpdate)update;
- (BDSReadingHistoryUpdateInfo)init;
- (BDSReadingHistoryUpdateInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryUpdateInfo)initWithUpdate:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSReadingHistoryUpdateInfo

- (BDSReadingHistoryUpdate)update
{
  return (BDSReadingHistoryUpdate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___BDSReadingHistoryUpdateInfo_update));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryUpdateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  result = (BDSReadingHistoryUpdateInfo *)sub_236129CBC(v4);
  if (result)
  {
    *(Class *)((char *)&v5->super.isa + OBJC_IVAR___BDSReadingHistoryUpdateInfo_update) = (Class)result;

    v8.receiver = v5;
    v8.super_class = (Class)BDSReadingHistoryUpdateInfo;
    v7 = [(BDSReadingHistoryUpdateInfo *)&v8 init];

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [(BDSReadingHistoryUpdateInfo *)v5 update];
  sub_236129F34(v4);
}

- (BDSReadingHistoryUpdateInfo)initWithUpdate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSReadingHistoryUpdateInfo_update) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)BDSReadingHistoryUpdateInfo;
  id v3 = a3;
  return [(BDSReadingHistoryUpdateInfo *)&v5 init];
}

- (NSString)description
{
  v2 = self;
  id v3 = [(BDSReadingHistoryUpdateInfo *)v2 update];
  ReadingHistoryUpdate.description.getter();

  id v4 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BDSReadingHistoryUpdateInfo)init
{
  result = (BDSReadingHistoryUpdateInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end