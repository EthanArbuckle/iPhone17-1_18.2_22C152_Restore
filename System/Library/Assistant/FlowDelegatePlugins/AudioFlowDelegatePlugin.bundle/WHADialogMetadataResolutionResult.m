@interface WHADialogMetadataResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithWHADialogMetadataToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithWHADialogMetadatasToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedWHADialogMetadata:(id)a3;
- (WHADialogMetadataResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation WHADialogMetadataResolutionResult

+ (id)successWithResolvedWHADialogMetadata:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static WHADialogMetadataResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithWHADialogMetadatasToDisambiguate:(id)a3
{
  type metadata accessor for WHADialogMetadata();
  unint64_t v3 = sub_298B50();
  swift_getObjCClassMetadata();
  id v4 = static WHADialogMetadataResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithWHADialogMetadataToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static WHADialogMetadataResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_2994A0();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_2994A0();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_2994A0();
  __break(1u);
  return result;
}

- (WHADialogMetadataResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_298960();
  id v6 = a4;
  Class isa = sub_298950().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WHADialogMetadataResolutionResult();
  v8 = [(WHADialogMetadataResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end