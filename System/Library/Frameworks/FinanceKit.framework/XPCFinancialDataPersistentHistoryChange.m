@interface XPCFinancialDataPersistentHistoryChange
+ (BOOL)supportsSecureCoding;
- (XPCFinancialDataPersistentHistoryChange)init;
- (XPCFinancialDataPersistentHistoryChange)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCFinancialDataPersistentHistoryChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCFinancialDataPersistentHistoryChange)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCFinancialDataPersistentHistoryChange *)sub_24337E7BC(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24337D428(v4);
}

- (XPCFinancialDataPersistentHistoryChange)init
{
  result = (XPCFinancialDataPersistentHistoryChange *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end