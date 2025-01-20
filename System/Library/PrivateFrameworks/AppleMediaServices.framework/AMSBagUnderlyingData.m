@interface AMSBagUnderlyingData
- (AMSBagUnderlyingData)init;
- (AMSBagUnderlyingData)initWithFileKey:(id)a3 aliasKeys:(id)a4 bagDictionary:(id)a5 expirationDate:(id)a6;
- (NSDate)expirationDate;
- (NSDictionary)bagDictionary;
- (NSSet)aliasKeys;
- (NSString)fileKey;
@end

@implementation AMSBagUnderlyingData

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___AMSBagUnderlyingData_expirationDate;
  sub_18DD4D9A0();
  OUTLINED_FUNCTION_17();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSDate)expirationDate
{
  uint64_t v2 = sub_18DD4D9A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BagUnderlyingData.expirationDate.getter((uint64_t)v5);
  v6 = (void *)sub_18DD4D910();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSDate *)v6;
}

- (NSSet)aliasKeys
{
  BagUnderlyingData.aliasKeys.getter();
  uint64_t v2 = (void *)sub_18DD4E320();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (AMSBagUnderlyingData)initWithFileKey:(id)a3 aliasKeys:(id)a4 bagDictionary:(id)a5 expirationDate:(id)a6
{
  uint64_t v7 = sub_18DD4D9A0();
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_18DD4DEB0();
  unint64_t v12 = v11;
  uint64_t v13 = sub_18DD4E330();
  sub_18DD4D950();
  return (AMSBagUnderlyingData *)BagUnderlyingData.init(fileKey:aliasKeys:bagDictionary:expirationDate:)(v10, v12, v13, (uint64_t)a5, (uint64_t)v9);
}

- (NSDictionary)bagDictionary
{
  id v2 = BagUnderlyingData.bagDictionary.getter();
  return (NSDictionary *)v2;
}

- (NSString)fileKey
{
  BagUnderlyingData.fileKey.getter();
  id v2 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (AMSBagUnderlyingData)init
{
}

@end