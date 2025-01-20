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
  v4 = (BDSReadingHistoryServiceStatus *)sub_100128C8C(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10012856C(v4);
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
  BOOL v2 = *((unsigned char *)&self->super.isa + OBJC_IVAR___BDSReadingHistoryServiceStatus_value) == 0;
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___BDSReadingHistoryServiceStatus_value)) {
    v3._countAndFlagsBits = 1702195828;
  }
  else {
    v3._countAndFlagsBits = 0x65736C6166;
  }
  if (v2) {
    id v4 = (void *)0xE500000000000000;
  }
  else {
    id v4 = (void *)0xE400000000000000;
  }
  v3._object = v4;
  sub_1001EC490(v3);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 125;
  v8._object = (void *)0xE100000000000000;
  sub_1001EC490(v8);
  NSString v5 = sub_1001EC340();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

@end