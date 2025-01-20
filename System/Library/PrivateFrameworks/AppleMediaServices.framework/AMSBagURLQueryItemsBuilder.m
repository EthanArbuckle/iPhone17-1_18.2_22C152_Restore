@interface AMSBagURLQueryItemsBuilder
+ (id)storefrontFromQueryItems:(id)a3;
- (AMSBagURLQueryItemsBuilder)init;
- (AMSBagURLQueryItemsBuilder)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5;
- (AMSBagURLQueryItemsBuilder)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 operatingSystem:(id)a6 operatingSystemVersion:(id)a7 deviceClass:(id)a8 buildVariant:(id)a9;
- (id)queryItemsWithCookies:(id)a3 storefront:(id)a4;
@end

@implementation AMSBagURLQueryItemsBuilder

- (AMSBagURLQueryItemsBuilder)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  return (AMSBagURLQueryItemsBuilder *)BagURLQueryItemsBuilder.init(clientInfo:profile:profileVersion:)(a3);
}

- (AMSBagURLQueryItemsBuilder)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 operatingSystem:(id)a6 operatingSystemVersion:(id)a7 deviceClass:(id)a8 buildVariant:(id)a9
{
  uint64_t v9 = (uint64_t)a9;
  uint64_t v10 = sub_18DD4DEB0();
  uint64_t v28 = v11;
  uint64_t v29 = v10;
  uint64_t v12 = sub_18DD4DEB0();
  uint64_t v14 = v13;
  uint64_t v15 = sub_18DD4DEB0();
  uint64_t v17 = v16;
  uint64_t v18 = sub_18DD4DEB0();
  uint64_t v20 = v19;
  uint64_t v21 = sub_18DD4DEB0();
  uint64_t v23 = v22;
  if (a9)
  {
    uint64_t v9 = sub_18DD4DEB0();
    unint64_t v25 = v24;
  }
  else
  {
    unint64_t v25 = 0;
  }
  return (AMSBagURLQueryItemsBuilder *)BagURLQueryItemsBuilder.init(clientInfo:profile:profileVersion:operatingSystem:operatingSystemVersion:deviceClass:buildVariant:)((uint64_t)a3, v29, v28, v12, v14, v15, v17, v18, v20, v21, v23, v9, v25);
}

- (id)queryItemsWithCookies:(id)a3 storefront:(id)a4
{
  sub_18D688980();
  unint64_t v6 = sub_18DD4E100();
  if (a4)
  {
    uint64_t v7 = sub_18DD4DEB0();
    a4 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v9 = self;
  BagURLQueryItemsBuilder.queryItems(withCookies:storefront:)(v6, v7, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18DD4D3D0();
  uint64_t v10 = (void *)sub_18DD4E0F0();
  swift_bridgeObjectRelease();
  return v10;
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_5_10();
  swift_bridgeObjectRelease();
}

+ (id)storefrontFromQueryItems:(id)a3
{
  sub_18DD4D3D0();
  uint64_t v3 = sub_18DD4E100();
  static BagURLQueryItemsBuilder.storefront(fromQueryItems:)(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    unint64_t v6 = (void *)sub_18DD4DE80();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

- (AMSBagURLQueryItemsBuilder)init
{
}

@end