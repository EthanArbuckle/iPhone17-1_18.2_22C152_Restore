@interface BDSReadingHistoryServiceStatus
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryServiceStatus)init;
- (BDSReadingHistoryServiceStatus)initWithCoder:(id)a3;
- (BDSReadingHistoryServiceStatus)initWithIsLoaded:(BOOL)a3;
- (BOOL)isLoaded;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSReadingHistoryServiceStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryServiceStatus)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (BDSReadingHistoryServiceStatus *)sub_23612EBC8(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s13BookDataStore27ReadingHistoryServiceStatusC6encode4withySo7NSCoderC_tF_0(v4);
}

- (BDSReadingHistoryServiceStatus)init
{
  result = (BDSReadingHistoryServiceStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BDSReadingHistoryServiceStatus)initWithIsLoaded:(BOOL)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = objc_allocWithZone(ObjectType);
  v5[OBJC_IVAR___BDSReadingHistoryServiceStatus_value] = a3;
  v8.receiver = v5;
  v8.super_class = ObjectType;
  v6 = [(BDSReadingHistoryServiceStatus *)&v8 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (BOOL)isLoaded
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BDSReadingHistoryServiceStatus_value);
}

- (NSString)description
{
  v2 = self;
  sub_2361FE9B8();
  swift_bridgeObjectRelease();
  sub_2361FE9B8();

  v3 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end