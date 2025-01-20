@interface AMSStorefrontHeaderValueCreation
+ (id)combinedStorefrontFromStorefront:(id)a3 suffix:(id)a4 error:(id *)a5;
+ (void)storefrontHeaderValueForAccount:(ACAccount *)a3 bag:(AMSBagProtocol *)a4 mediaType:(NSString *)a5 allowFailedSuffixFetch:(BOOL)a6 completionHandler:(id)a7;
- (AMSStorefrontHeaderValueCreation)init;
@end

@implementation AMSStorefrontHeaderValueCreation

+ (void)storefrontHeaderValueForAccount:(ACAccount *)a3 bag:(AMSBagProtocol *)a4 mediaType:(NSString *)a5 allowFailedSuffixFetch:(BOOL)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = a5;
  *(unsigned char *)(v13 + 40) = a6;
  *(void *)(v13 + 48) = v12;
  *(void *)(v13 + 56) = a1;
  v14 = a3;
  swift_unknownObjectRetain();
  v15 = a5;
  sub_18D677FD0((uint64_t)&unk_1E91BBB28, v13);
}

+ (id)combinedStorefrontFromStorefront:(id)a3 suffix:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_18DD4DEB0();
  unint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_18DD4DEB0();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  static StorefrontHeaderValueCreation.combinedStorefront(fromStorefront:suffix:)(v6, v8, v9, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return v11;
}

- (AMSStorefrontHeaderValueCreation)init
{
  return (AMSStorefrontHeaderValueCreation *)StorefrontHeaderValueCreation.init()();
}

@end