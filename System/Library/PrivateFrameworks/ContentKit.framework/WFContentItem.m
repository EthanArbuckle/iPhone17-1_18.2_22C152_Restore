@interface WFContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (BOOL)contentItems:(id)a3 haveContentProperties:(id)a4;
+ (BOOL)errorIsBadCoercionError:(id)a3;
+ (BOOL)hasFileOutput;
+ (BOOL)hasLibrary;
+ (BOOL)hasStringOutput;
+ (BOOL)isAvailableOnPlatform:(int64_t)a3;
+ (BOOL)isContentItemSubclass;
+ (BOOL)supportedItemClassMustBeDeterminedByInstance:(Class)a3;
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (BOOL)supportedTypesMustBeDeterminedByInstance;
+ (BOOL)supportsSecureCoding;
+ (NSArray)allProperties;
+ (NSArray)contentCategories;
+ (NSArray)pasteboardValueClasses;
+ (NSArray)properties;
+ (NSOrderedSet)allSupportedItemClasses;
+ (NSOrderedSet)supportedItemClasses;
+ (NSOrderedSet)supportedItemClassesExcludingInstanceSpecificTypes;
+ (NSOrderedSet)supportedTypes;
+ (NSOrderedSet)supportedTypesExcludingInstanceSpecificTypes;
+ (NSString)countDescription;
+ (NSString)localizedFilterDescription;
+ (NSString)localizedPluralFilterDescription;
+ (NSString)localizedPluralTypeDescription;
+ (NSString)localizedTypeDescription;
+ (WFContentItemStringConversionBehavior)stringConversionBehavior;
+ (id)badCoercionErrorDefaultResponsibleComponent;
+ (id)badCoercionErrorForItemClass:(Class)a3;
+ (id)badCoercionErrorForItemClasses:(id)a3;
+ (id)badCoercionErrorForObjectClass:(Class)a3;
+ (id)badCoercionErrorForType:(id)a3;
+ (id)badCoercionErrorForTypeDescription:(id)a3 toTypeDescription:(id)a4;
+ (id)badCoercionErrorWithReasonString:(id)a3;
+ (id)cachedCoercions;
+ (id)coercionForCoercingToType:(id)a3 concurrencyMode:(int64_t)a4;
+ (id)coercionForType:(id)a3;
+ (id)coercions;
+ (id)contentPropertySubstitutor;
+ (id)filterRepresentationsForAllowedContent:(id)a3;
+ (id)itemFromSerializedItem:(id)a3 withItemClass:(Class)a4 forType:(id)a5 nameIfKnown:(id)a6 sourceName:(id)a7 attributionSet:(id)a8 cachingIdentifier:(id)a9 completionHandler:(id)a10;
+ (id)itemWithFile:(id)a3;
+ (id)itemWithFile:(id)a3 attributionSet:(id)a4;
+ (id)itemWithFile:(id)a3 attributionSet:(id)a4 cachingIdentifier:(id)a5;
+ (id)itemWithFile:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5;
+ (id)itemWithObject:(id)a3;
+ (id)itemWithObject:(id)a3 attributionSet:(id)a4;
+ (id)itemWithObject:(id)a3 named:(id)a4;
+ (id)itemWithObject:(id)a3 named:(id)a4 attributionSet:(id)a5;
+ (id)itemWithObject:(id)a3 named:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6;
+ (id)itemWithObject:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5;
+ (id)itemWithObject:(id)a3 privacyConfiguration:(id)a4;
+ (id)itemWithRepresentation:(id)a3;
+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4;
+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4 cachingIdentifier:(id)a5;
+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4 includesDefaultAttributionSet:(BOOL)a5;
+ (id)itemWithRepresentation:(id)a3 forType:(id)a4;
+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5;
+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6;
+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6;
+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6 cachingIdentifier:(id)a7;
+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)namePropertyBuilder;
+ (id)outputTypesFromCoercions;
+ (id)ownedPasteboardTypes;
+ (id)ownedTypes;
+ (id)populateBadCoercionError:(id)a3 withResponsibleComponent:(id)a4;
+ (id)propertyBuilders;
+ (id)propertyForName:(id)a3;
+ (id)supportedPropertyForProperty:(id)a3;
+ (int64_t)tableTemplateSubjectType;
+ (void)getContentItemFromSerializedItem:(id)a3 sourceName:(id)a4 completionHandler:(id)a5;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (BOOL)alwaysEncodeUsingWFSerializableContent;
- (BOOL)cachesSupportedTypes;
- (BOOL)canEncodeWithCoder:(id)a3;
- (BOOL)canGenerateIntermediaryRepresentationForItemClass:(Class)a3;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)canPerformCoercion:(id)a3;
- (BOOL)coercionOptions:(id)a3 allowCoercionsToItemClass:(Class)a4;
- (BOOL)coercionOptions:(id)a3 allowCoercionsToType:(id)a4;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)hasStringOutput;
- (BOOL)includesFileRepresentationInSerializedItem;
- (BOOL)isCoercibleToItemClass:(Class)a3;
- (BOOL)isCoercibleToItemClasses:(id)a3;
- (BOOL)loadsListAltTextAsynchronously;
- (BOOL)loadsListContentAsynchronously;
- (BOOL)loadsListSubtitleAsynchronously;
- (BOOL)loadsListThumbnailAsynchronously;
- (Class)classForCopying;
- (NSArray)allowedClassesForDecodingInternalRepresentations;
- (NSDictionary)additionalRepresentationsForSerialization;
- (NSDictionary)metadataForSerialization;
- (NSExtensionItem)extensionItem;
- (NSExtensionItem)minimalExtensionItem;
- (NSItemProvider)itemProvider;
- (NSItemProvider)minimalItemProvider;
- (NSMutableDictionary)representationsByType;
- (NSMutableDictionary)subItemsByClass;
- (NSOrderedSet)allSupportedItemClasses;
- (NSOrderedSet)outputTypes;
- (NSOrderedSet)ownedTypes;
- (NSOrderedSet)supportedItemClasses;
- (NSOrderedSet)supportedTypes;
- (NSString)description;
- (NSString)internalName;
- (NSString)name;
- (NSString)richListTitle;
- (NSUUID)cachingIdentifier;
- (WFContentAttributionSet)attributionSet;
- (WFContentItem)initWithCoder:(id)a3;
- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5;
- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6;
- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6;
- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6 cachingIdentifier:(id)a7;
- (WFContentItem)initWithRepresentationsByType:(id)a3 forType:(id)a4 subItemsByClass:(id)a5 attributionSet:(id)a6 includesDefaultAttributionSet:(BOOL)a7 cachingIdentifier:(id)a8;
- (WFContentItemChangeTransaction)changeTransaction;
- (WFFileType)preferredFileType;
- (WFImage)icon;
- (WFObjectType)preferredObjectType;
- (WFRepresentation)internalRepresentation;
- (WFType)internalRepresentationType;
- (id)_getRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)contentItemByMergingAttributionSet:(id)a3;
- (id)copyWithName:(id)a3;
- (id)copyWithName:(id)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)extensionItemWithItemProvider:(id)a3;
- (id)fileRepresentationForType:(id)a3;
- (id)fileRepresentationsForType:(id)a3;
- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)generateFileRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)generateFirstLevelSubItemsForItemClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)generateRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)generateSubItemsForItemClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)getRepresentationsForType:(id)a3 error:(id *)a4;
- (id)getRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)intermediaryTypesForCoercionToItemClass:(Class)a3;
- (id)internalRepresentationForCopyingWithName:(id)a3;
- (id)itemProviderForTypes:(id)a3;
- (id)itemsByCoercingToItemClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)nativePasteboardTypeForObjectRepresentationOfClass:(Class)a3;
- (id)objectForClass:(Class)a3;
- (id)objectRepresentationForClass:(Class)a3;
- (id)objectRepresentationsForClass:(Class)a3;
- (id)objectsForClass:(Class)a3;
- (id)preferredTypeOfClass:(Class)a3;
- (id)representationForType:(id)a3;
- (id)representationsForType:(id)a3;
- (id)subItemForClass:(Class)a3;
- (id)subItemsForClass:(Class)a3;
- (id)typeForCoercionRequest:(id)a3;
- (unint64_t)preferredDisplayStyle;
- (void)coerceToItemClass:(Class)a3 completionHandler:(id)a4;
- (void)coerceToItemClasses:(id)a3 completionHandler:(id)a4;
- (void)coerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)forceCoerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateFirstLevelSubItemsForItemClass:(Class)a3 options:(id)a4 completionHandler:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)generateRepresentationsForType:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)generateSubItemsForItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)getFileRepresentation:(id)a3 forType:(id)a4;
- (void)getFileRepresentation:(id)a3 forType:(id)a4 options:(id)a5;
- (void)getFileRepresentations:(id)a3 forType:(id)a4;
- (void)getFileRepresentations:(id)a3 forType:(id)a4 options:(id)a5;
- (void)getFileRepresentationsForSerialization:(id)a3;
- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4;
- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4 options:(id)a5;
- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4;
- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4 options:(id)a5;
- (void)getPreferredFileExtension:(id)a3;
- (void)getPreferredFileSize:(id)a3;
- (void)getRepresentationsForType:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)getSerializedItem:(id)a3;
- (void)getTitleWithPermissionRequestor:(id)a3 completionHandler:(id)a4;
- (void)performCoercion:(id)a3;
- (void)setAttributionSet:(id)a3;
- (void)setObjectRepresentations:(id)a3 forClass:(Class)a4;
- (void)setRepresentations:(id)a3 forType:(id)a4;
- (void)setRepresentationsByType:(id)a3;
- (void)setSubItems:(id)a3 forClass:(Class)a4;
- (void)setSubItemsByClass:(id)a3;
@end

@implementation WFContentItem

+ (id)ownedPasteboardTypes
{
  return 0;
}

- (NSExtensionItem)minimalExtensionItem
{
  v3 = [(WFContentItem *)self minimalItemProvider];
  v4 = [(WFContentItem *)self extensionItemWithItemProvider:v3];

  return (NSExtensionItem *)v4;
}

- (NSItemProvider)minimalItemProvider
{
  v3 = [(WFContentItem *)self internalRepresentationType];
  int v4 = [v3 conformsToClass:objc_opt_class()];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFF9D8];
    v6 = [(WFContentItem *)self internalRepresentationType];
    v7 = [v5 orderedSetWithObject:v6];
    v8 = [(WFContentItem *)self itemProviderForTypes:v7];

    goto LABEL_9;
  }
  v6 = objc_opt_new();
  if ([(WFContentItem *)self includesFileRepresentationInSerializedItem])
  {
    uint64_t v9 = [(WFContentItem *)self preferredFileType];
LABEL_7:
    v10 = (void *)v9;
    [v6 addObject:v9];

    goto LABEL_8;
  }
  if ([(WFContentItem *)self hasStringOutput])
  {
    uint64_t v9 = +[WFObjectType typeWithClass:objc_opt_class()];
    goto LABEL_7;
  }
LABEL_8:
  v8 = [(WFContentItem *)self itemProviderForTypes:v6];
LABEL_9:

  return (NSItemProvider *)v8;
}

- (NSExtensionItem)extensionItem
{
  v3 = [(WFContentItem *)self itemProvider];
  int v4 = [(WFContentItem *)self extensionItemWithItemProvider:v3];

  return (NSExtensionItem *)v4;
}

- (NSItemProvider)itemProvider
{
  v3 = [(WFContentItem *)self supportedTypes];
  int v4 = (void *)[v3 mutableCopy];

  if ([(WFContentItem *)self includesFileRepresentationInSerializedItem])
  {
    v5 = [(WFContentItem *)self preferredFileType];
    [v4 addObject:v5];
  }
  if (![(WFContentItem *)self hasStringOutput])
  {
    v6 = +[WFObjectType typeWithClass:objc_opt_class()];
    [v4 removeObject:v6];
  }
  v7 = [(WFContentItem *)self itemProviderForTypes:v4];

  return (NSItemProvider *)v7;
}

- (id)extensionItemWithItemProvider:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(WFContentItem *)self name];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    v8 = [(WFContentItem *)self name];
    uint64_t v9 = (void *)[v7 initWithString:v8];
    [v5 setAttributedTitle:v9];
  }
  v20[0] = v4;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  [v5 setAttachments:v10];

  v11 = [v5 userInfo];
  v12 = (void *)[v11 mutableCopy];
  v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  v15 = v14;

  v16 = [MEMORY[0x263F086E0] mainBundle];
  v17 = [v16 bundleIdentifier];
  [v15 setObject:v17 forKey:@"link.contentkit.sourceapp"];

  v18 = [(WFContentItem *)self metadataForSerialization];
  [v15 addEntriesFromDictionary:v18];

  [v5 setUserInfo:v15];
  return v5;
}

- (id)itemProviderForTypes:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v19 = *MEMORY[0x263F1DC20];
    uint64_t v20 = *MEMORY[0x263F1DD08];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
        }
        else
        {
          if ([v11 isEqualToClass:objc_opt_class()])
          {
            v13 = (void *)MEMORY[0x263F852B8];
            uint64_t v14 = v20;
          }
          else
          {
            if (![v11 isEqualToClass:objc_opt_class()]) {
              continue;
            }
            v13 = (void *)MEMORY[0x263F852B8];
            uint64_t v14 = v19;
          }
          objc_msgSend(v13, "typeWithUTType:", v14, v19);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v12;
        if (v12)
        {
          v16 = [v12 string];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke;
          v21[3] = &unk_264285DE8;
          id v22 = v15;
          v23 = self;
          id v17 = v15;
          [v5 registerItemForTypeIdentifier:v16 loadHandler:v21];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  return v5;
}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  if ([v6 isEqualToUTType:*MEMORY[0x263F1DAA0]])
  {
    uint64_t v7 = [*(id *)(a1 + 40) preferredFileType];

    id v6 = (id)v7;
  }
  if ((!a3 || objc_opt_class() == a3)
    && (([v6 conformsToUTType:*MEMORY[0x263F1DA38]] & 1) != 0
     || [v6 conformsToUTType:*MEMORY[0x263F1DD08]]))
  {
    a3 = objc_opt_class();
  }
  if (a3 == objc_opt_class())
  {
    v10 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_2;
    v17[3] = &unk_26428AA60;
    id v18 = v5;
    [v10 getFileRepresentation:v17 forType:v6];
    uint64_t v9 = v18;
    goto LABEL_17;
  }
  if ((a3 == objc_opt_class() || a3 == objc_opt_class())
    && ([*(id *)(a1 + 32) isEqualToUTType:*MEMORY[0x263F1DD08]] & 1) == 0)
  {
    id v12 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_3;
    v15[3] = &unk_26428AA60;
    id v16 = v5;
    [v12 getFileRepresentation:v15 forType:v6];
    uint64_t v9 = v16;
    goto LABEL_17;
  }
  if ([a3 conformsToProtocol:&unk_26C745770])
  {
    uint64_t v8 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_4;
    v13[3] = &unk_26428AA00;
    v13[4] = v8;
    id v14 = v5;
    [v8 getObjectRepresentation:v13 forClass:a3];
    uint64_t v9 = v14;
LABEL_17:

    goto LABEL_18;
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08188] code:-1100 userInfo:0];
  (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v11);

LABEL_18:
}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 data];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 fileURL];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  if ([(id)objc_opt_class() errorIsBadCoercionError:v6])
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08188] code:-1100 userInfo:0];

    id v6 = (id)v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 0;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 0;
}

- (BOOL)loadsListAltTextAsynchronously
{
  return 0;
}

- (BOOL)loadsListContentAsynchronously
{
  if ([(WFContentItem *)self loadsListAltTextAsynchronously]
    || [(WFContentItem *)self loadsListSubtitleAsynchronously])
  {
    return 1;
  }
  return [(WFContentItem *)self loadsListThumbnailAsynchronously];
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  return 0;
}

- (BOOL)getListAltText:(id)a3
{
  return 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [(WFContentItem *)self internalRepresentation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([(WFContentItem *)self name],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [(WFContentItem *)self internalName],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    if (v4)
    {
      v11 = [(WFContentItem *)self internalName];
      v4[2](v4, v11);
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)richListTitle
{
  v2 = [(WFContentItem *)self name];
  v3 = [MEMORY[0x263F85448] parseAnnotatedString:v2];
  uint64_t v4 = [v3 displayString];

  return (NSString *)v4;
}

- (unint64_t)preferredDisplayStyle
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRepresentationType, 0);
  objc_storeStrong((id *)&self->_subItemsByClass, 0);
  objc_storeStrong((id *)&self->_representationsByType, 0);
  objc_storeStrong((id *)&self->_attributionSet, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
}

- (WFType)internalRepresentationType
{
  return self->_internalRepresentationType;
}

- (void)setSubItemsByClass:(id)a3
{
}

- (void)setRepresentationsByType:(id)a3
{
}

- (void)setAttributionSet:(id)a3
{
}

- (WFContentAttributionSet)attributionSet
{
  return self->_attributionSet;
}

- (id)subItemForClass:(Class)a3
{
  v3 = [(WFContentItem *)self subItemsForClass:a3];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)subItemsForClass:(Class)a3
{
  uint64_t v4 = [(WFContentItem *)self subItemsByClass];
  id v5 = [v4 objectForKey:a3];

  return v5;
}

- (void)setSubItems:(id)a3 forClass:(Class)a4
{
  id v8 = a3;
  id v6 = [(WFContentItem *)self subItemsByClass];
  uint64_t v7 = v6;
  if (v8) {
    [v6 setObject:v8 forKey:a4];
  }
  else {
    [v6 removeObjectForKey:a4];
  }
}

- (NSMutableDictionary)subItemsByClass
{
  subItemsByClass = self->_subItemsByClass;
  if (!subItemsByClass)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_opt_new();
    id v5 = self->_subItemsByClass;
    self->_subItemsByClass = v4;

    subItemsByClass = self->_subItemsByClass;
  }
  return subItemsByClass;
}

- (id)objectForClass:(Class)a3
{
  v3 = [(WFContentItem *)self objectRepresentationForClass:a3];
  uint64_t v4 = [v3 object];

  return v4;
}

- (id)objectsForClass:(Class)a3
{
  v3 = [(WFContentItem *)self objectRepresentationsForClass:a3];
  uint64_t v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_397);

  return v4;
}

uint64_t __33__WFContentItem_objectsForClass___block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (void)setObjectRepresentations:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  id v7 = +[WFObjectType typeWithClass:a4];
  [(WFContentItem *)self setRepresentations:v6 forType:v7];
}

- (id)objectRepresentationForClass:(Class)a3
{
  v3 = [(WFContentItem *)self objectRepresentationsForClass:a3];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)objectRepresentationsForClass:(Class)a3
{
  uint64_t v4 = +[WFObjectType typeWithClass:a3];
  id v5 = [(WFContentItem *)self representationsForType:v4];

  return v5;
}

- (id)fileRepresentationForType:(id)a3
{
  v3 = [(WFContentItem *)self fileRepresentationsForType:a3];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)fileRepresentationsForType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(WFContentItem *)self representationsForType:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setRepresentations:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (v6
    && ([(id)objc_opt_class() filterRepresentationsForAllowedContent:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    id v8 = [(WFContentItem *)self representationsByType];
    [v8 setObject:v7 forKey:v10];
  }
  else
  {
    char v9 = v10;
    if (!v10) {
      goto LABEL_7;
    }
    id v7 = [(WFContentItem *)self representationsByType];
    [v7 removeObjectForKey:v10];
  }

  char v9 = v10;
LABEL_7:
}

- (id)representationForType:(id)a3
{
  v3 = [(WFContentItem *)self representationsForType:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)representationsForType:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WFContentItem *)self representationsByType];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x263F1DA48];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "conformsToType:", v4, (void)v16) & 1) == 0)
        {
          if (![v4 isEqualToUTType:v9]) {
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v12 = [v11 fileExtension];
          uint64_t v13 = [v12 length];

          if (!v13) {
            continue;
          }
        }
        id v14 = [v5 objectForKey:v11];
        goto LABEL_14;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

- (NSMutableDictionary)representationsByType
{
  representationsByType = self->_representationsByType;
  if (!representationsByType)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    id v5 = self->_representationsByType;
    self->_representationsByType = v4;

    representationsByType = self->_representationsByType;
  }
  return representationsByType;
}

- (WFContentItem)initWithRepresentationsByType:(id)a3 forType:(id)a4 subItemsByClass:(id)a5 attributionSet:(id)a6 includesDefaultAttributionSet:(BOOL)a7 cachingIdentifier:(id)a8
{
  v35[2] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)WFContentItem;
  long long v19 = [(WFContentItem *)&v34 init];
  p_isa = (id *)&v19->super.isa;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_internalRepresentationType, a4);
    if (v18) {
      objc_storeStrong(p_isa + 1, a8);
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __134__WFContentItem_initWithRepresentationsByType_forType_subItemsByClass_attributionSet_includesDefaultAttributionSet_cachingIdentifier___block_invoke;
    v32[3] = &unk_26428A3E8;
    uint64_t v21 = p_isa;
    v33 = v21;
    [v14 enumerateKeysAndObjectsUsingBlock:v32];
    id v22 = [v21 representationForType:v15];
    if (!v22)
    {
      uint64_t v29 = 0;
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v23 = [v16 mutableCopy];
    id v24 = v21[4];
    void v21[4] = (id)v23;

    if (v17)
    {
      if (a7)
      {
        v35[0] = v17;
        id v25 = [v21 defaultSourceForRepresentation:v22];
        v35[1] = v25;
        long long v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
        uint64_t v27 = +[WFContentAttributionSet attributionSetByMergingAttributionSets:v26];
        id v28 = v21[2];
        v21[2] = (id)v27;

LABEL_13:
        uint64_t v29 = v21;
        goto LABEL_14;
      }
      id v30 = v17;
    }
    else
    {
      id v30 = [v21 defaultSourceForRepresentation:v22];
    }
    id v25 = v21[2];
    v21[2] = v30;
    goto LABEL_13;
  }
  uint64_t v29 = 0;
LABEL_15:

  return v29;
}

uint64_t __134__WFContentItem_initWithRepresentationsByType_forType_subItemsByClass_attributionSet_includesDefaultAttributionSet_cachingIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setRepresentations:a3 forType:a2];
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6 cachingIdentifier:(id)a7
{
  BOOL v8 = a6;
  v26[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    uint64_t v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFContentItem.m", 1487, @"Invalid parameter not satisfying: %@", @"representation" object file lineNumber description];
  }
  id v17 = [(WFContentItem *)self init];
  if (v17)
  {
    id v18 = v17;
    id v24 = v13;
    id v25 = v14;
    long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v26[0] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];

    uint64_t v21 = [(WFContentItem *)v18 initWithRepresentationsByType:v20 forType:v14 subItemsByClass:0 attributionSet:v15 includesDefaultAttributionSet:v8 cachingIdentifier:v16];
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6
{
  return [(WFContentItem *)self initWithRepresentation:a3 forType:a4 attributionSet:a5 includesDefaultAttributionSet:a6 cachingIdentifier:0];
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6
{
  return [(WFContentItem *)self initWithRepresentation:a3 forType:a4 attributionSet:a5 includesDefaultAttributionSet:0 cachingIdentifier:a6];
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5
{
  return [(WFContentItem *)self initWithRepresentation:a3 forType:a4 attributionSet:a5 includesDefaultAttributionSet:0 cachingIdentifier:0];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFContentItem;
  v3 = [(WFContentItem *)&v7 description];
  id v4 = [(WFContentItem *)self name];
  id v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return (NSString *)v5;
}

- (NSOrderedSet)allSupportedItemClasses
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(WFContentItem *)self allSupportedTypes];
  id v5 = WFSupportedItemClassesForItemClass(v3, v4);

  return (NSOrderedSet *)v5;
}

- (NSOrderedSet)supportedItemClasses
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(WFContentItem *)self supportedTypes];
  id v5 = WFSupportedItemClassesForItemClass(v3, v4);

  return (NSOrderedSet *)v5;
}

- (BOOL)canGenerateIntermediaryRepresentationForItemClass:(Class)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = [(WFContentItem *)self outputTypes];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(objc_class *)a3 ownedTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v4;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if ([*(id *)(*((void *)&v18 + 1) + 8 * j) conformsToType:v10])
              {

                BOOL v16 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_19:

  return v16;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() coercionForType:v4];

  if (v5)
  {
    uint64_t v6 = [v5 handler];
    char v7 = [v6 coercionIsAvailableForItem:self];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)cachesSupportedTypes
{
  return 1;
}

- (NSOrderedSet)supportedTypes
{
  uint64_t v3 = [(WFContentItem *)self ownedTypes];
  id v4 = [(WFContentItem *)self outputTypes];
  id v5 = [v3 orderedSetByAddingObjectsFromOrderedSet:v4];

  return (NSOrderedSet *)v5;
}

- (NSOrderedSet)outputTypes
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__WFContentItem_outputTypes__block_invoke;
  aBlock[3] = &unk_26428A380;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void))_Block_copy(aBlock);
  if ([(WFContentItem *)self cachesSupportedTypes])
  {
    id v4 = self;
    id v5 = v3;
    uint64_t v6 = objc_getAssociatedObject(v4, &outputTypes_cachedValue);
    if (!v6)
    {
      uint64_t v6 = v5[2](v5);
      objc_setAssociatedObject(v4, &outputTypes_cachedValue, v6, (void *)0x303);
    }
  }
  else
  {
    uint64_t v6 = v3[2](v3);
  }

  return (NSOrderedSet *)v6;
}

id __28__WFContentItem_outputTypes__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() outputTypes];
  uint64_t v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [*(id *)(a1 + 32) name];
  if (v4 && ([*(id *)(a1 + 32) hasStringOutput] & 1) == 0)
  {
    char v5 = [(id)objc_opt_class() supportedTypeMustBeDeterminedByInstance:v3];

    if (v5) {
      goto LABEL_6;
    }
    [v2 orderedSetByAddingObject:v3];
    v2 = id v4 = v2;
  }

LABEL_6:
  uint64_t v6 = (void *)[v2 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v2;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "canGenerateRepresentationForType:", v12, (void)v15) & 1) == 0) {
          [v6 removeObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)[v6 copy];
  return v13;
}

- (NSOrderedSet)ownedTypes
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  uint64_t v6 = __27__WFContentItem_ownedTypes__block_invoke;
  id v7 = &unk_26428A358;
  uint64_t v8 = self;
  v2 = self;
  uint64_t v3 = objc_getAssociatedObject(v2, &ownedTypes_cachedValue);
  if (!v3)
  {
    uint64_t v3 = v6((uint64_t)v5);
    objc_setAssociatedObject(v2, &ownedTypes_cachedValue, v3, (void *)0x303);
  }

  return (NSOrderedSet *)v3;
}

id __27__WFContentItem_ownedTypes__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() ownedTypes];
  uint64_t v3 = (void *)[v2 mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "canGenerateRepresentationForType:", v9, (void)v12) & 1) == 0) {
          [v3 removeObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (void)getPreferredFileSize:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__WFContentItem_getPreferredFileSize___block_invoke;
  v6[3] = &unk_26428AA60;
  id v7 = v4;
  id v5 = v4;
  [(WFContentItem *)self getFileRepresentation:v6 forType:0];
}

uint64_t __38__WFContentItem_getPreferredFileSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 fileSize];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)getPreferredFileExtension:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(WFContentItem *)self internalRepresentationType];
  id v8 = [(WFContentItem *)self fileRepresentationForType:v5];

  if (v8)
  {
    uint64_t v6 = [v8 filename];
    [v6 pathExtension];
  }
  else
  {
    uint64_t v6 = [(WFContentItem *)self preferredFileType];
    [v6 fileExtension];
  id v7 = };
  v4[2](v4, v7);
}

- (WFContentItemChangeTransaction)changeTransaction
{
  uint64_t v2 = [[WFContentItemChangeTransaction alloc] initWithContentItem:self];
  return v2;
}

- (NSUUID)cachingIdentifier
{
  cachingIdentifier = self->_cachingIdentifier;
  if (!cachingIdentifier)
  {
    id v4 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    id v5 = self->_cachingIdentifier;
    self->_cachingIdentifier = v4;

    cachingIdentifier = self->_cachingIdentifier;
  }
  return cachingIdentifier;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[WFContentLocation genericLocation];
  uint64_t v6 = [(WFContentItem *)self cachingIdentifier];
  id v7 = +[WFContentAttributionSet attributionSetWithOrigin:v5 disclosureLevel:0 originalItemIdentifier:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
    uint64_t v9 = [v8 originalURL];

    if (v9)
    {
      v15[0] = v7;
      uint64_t v10 = [v8 originalURL];
      id v11 = +[WFURLContentItem attributionSetContentOfURL:v10];
      v15[1] = v11;
      long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
      uint64_t v13 = +[WFContentAttributionSet attributionSetByMergingAttributionSets:v12];

      id v7 = (void *)v13;
    }
  }
  return v7;
}

- (WFImage)icon
{
  uint64_t v2 = [(WFContentItem *)self preferredFileType];
  uint64_t v3 = [v2 documentIcon];

  return (WFImage *)v3;
}

- (WFFileType)preferredFileType
{
  uint64_t v3 = objc_opt_class();
  return (WFFileType *)[(WFContentItem *)self preferredTypeOfClass:v3];
}

- (WFObjectType)preferredObjectType
{
  uint64_t v3 = objc_opt_class();
  return (WFObjectType *)[(WFContentItem *)self preferredTypeOfClass:v3];
}

- (id)preferredTypeOfClass:(Class)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = [(WFContentItem *)self internalRepresentationType];
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = [(WFContentItem *)self supportedTypes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v5 = v11;

            goto LABEL_22;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v12 = [(WFContentItem *)self allSupportedTypes];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          if (objc_opt_isKindOfClass())
          {
            id v5 = v17;

            goto LABEL_22;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_22:

  return v5;
}

- (BOOL)alwaysEncodeUsingWFSerializableContent
{
  return 0;
}

- (NSArray)allowedClassesForDecodingInternalRepresentations
{
  return 0;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 1;
}

- (NSDictionary)additionalRepresentationsForSerialization
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = [(WFContentItem *)self internalRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 object];
    uint64_t v6 = +[WFSerializableContentProvider sharedProvider];
    uint64_t v7 = [v6 serializedRepresentationForObject:v5];

    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [v7 allKeys];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            if (([*(id *)(*((void *)&v17 + 1) + 8 * v12) hasPrefix:@"link.contentkit."] & 1) == 0)
            {
              [MEMORY[0x263F08690] currentHandler];
              v13 = long long v16 = a2;
              [v13 handleFailureInMethod:v16 object:self file:@"WFContentItem.m" lineNumber:1010 description:@"All serialized item keys must have the prefix link.contentkit."];

              a2 = v16;
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      id v14 = v7;
    }
    else
    {
      id v14 = (id)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    id v14 = (id)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v14;
}

- (NSDictionary)metadataForSerialization
{
  uint64_t v3 = [(WFContentItem *)self additionalRepresentationsForSerialization];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@%@", @"link.contentkit.itemclass.", v7];

  [v4 setObject:v8 forKey:@"link.contentkit.itemclass.identifier"];
  uint64_t v9 = [(WFContentItem *)self name];
  [v4 setObject:v9 forKey:@"link.contentkit.name"];

  uint64_t v10 = [(WFContentItem *)self attributionSet];
  uint64_t v11 = [v10 wfSerializedRepresentationWithPrivateItemIdentifiers];
  [v4 setObject:v11 forKey:@"link.contentkit.contentattributionset"];

  uint64_t v12 = [(WFContentItem *)self cachingIdentifier];
  uint64_t v13 = [v12 UUIDString];
  [v4 setObject:v13 forKey:@"link.contentkit.cachingidentifier"];

  return (NSDictionary *)v4;
}

- (id)nativePasteboardTypeForObjectRepresentationOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v7 = (id *)MEMORY[0x263F1DD08];
LABEL_6:
    id v6 = [*v7 identifier];
    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3
    || (+[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", @"UIImage", @"UIKit", 2), id v4 = objc_claimAutoreleasedReturnValue(), v5 = [v4 isEqualToClass:a3], v4, v5))
  {
    id v6 = (id)*MEMORY[0x263F856B0];
    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v7 = (id *)MEMORY[0x263F1DD38];
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_9:
  return v6;
}

- (void)getFileRepresentationsForSerialization:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__WFContentItem_getFileRepresentationsForSerialization___block_invoke;
  v6[3] = &unk_26428AA60;
  id v7 = v4;
  id v5 = v4;
  [(WFContentItem *)self getFileRepresentation:v6 forType:0];
}

void __56__WFContentItem_getFileRepresentationsForSerialization___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    id v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = a3;
    id v7 = a2;
    uint64_t v8 = [v5 arrayWithObjects:v10 count:1];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);
  }
  else
  {
    uint64_t v9 = *(void (**)(uint64_t, void, id))(v3 + 16);
    id v7 = a3;
    v9(v3, 0, v7);
    uint64_t v8 = 0;
  }
}

- (void)getSerializedItem:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(WFContentItem *)self internalRepresentationType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[v6 objectClass];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [(id)objc_opt_class() pasteboardValueClasses];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if ([v7 isSubclassOfClass:v13])
          {
            id v14 = [(WFContentItem *)self objectForClass:v7];
            uint64_t v15 = [(WFContentItem *)self nativePasteboardTypeForObjectRepresentationOfClass:v13];
            if (v15) {
              [v5 setObject:v14 forKey:v15];
            }

            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  long long v16 = [(WFContentItem *)self metadataForSerialization];
  [v5 addEntriesFromDictionary:v16];

  if ([(WFContentItem *)self includesFileRepresentationInSerializedItem])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __35__WFContentItem_getSerializedItem___block_invoke;
    v17[3] = &unk_26428ACE8;
    id v19 = v4;
    id v18 = v5;
    [(WFContentItem *)self getFileRepresentationsForSerialization:v17];
  }
  else
  {
    (*((void (**)(id, void *, void))v4 + 2))(v4, v5, 0);
  }
}

void __35__WFContentItem_getSerializedItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "wfType", (void)v18);
          id v14 = [v13 string];

          uint64_t v15 = [*(id *)(a1 + 32) objectForKey:v14];

          if (v15)
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

            goto LABEL_16;
          }
          long long v16 = [v12 mappedData];
          if (v16) {
            [*(id *)(a1 + 32) setObject:v16 forKey:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    long long v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    long long v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v17();
LABEL_16:
}

- (id)itemsByCoercingToItemClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(WFContentItem *)self subItemsForClass:a3];
  if (v9
    && [(WFContentItem *)self coercionOptions:v8 allowCoercionsToItemClass:a3])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [(WFContentItem *)self generateSubItemsForItemClass:a3 options:v8 error:a5];
  }
  uint64_t v11 = v10;

  return v11;
}

- (void)forceCoerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = [(WFContentItem *)self subItemsForClass:v16];
        if (v17
          && [(WFContentItem *)self coercionOptions:v9 allowCoercionsToItemClass:v16])
        {
          v10[2](v10, v17, 0);

          long long v18 = v11;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__WFContentItem_forceCoerceToItemClasses_options_completionHandler___block_invoke;
  v19[3] = &unk_26428AF18;
  long long v20 = v10;
  [(WFContentItem *)self generateSubItemsForItemClasses:v11 options:v9 completionHandler:v19];
  long long v18 = v20;
LABEL_12:
}

uint64_t __68__WFContentItem_forceCoerceToItemClasses_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)coerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
        if (objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", v16, (void)v18)
          && [(WFContentItem *)self coercionOptions:v9 allowCoercionsToItemClass:v16])
        {
          long long v22 = self;
          long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
          v10[2](v10, v17, 0);

          goto LABEL_12;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  [(WFContentItem *)self forceCoerceToItemClasses:v11 options:v9 completionHandler:v10];
LABEL_12:
}

- (BOOL)coercionOptions:(id)a3 allowCoercionsToItemClass:(Class)a4
{
  id v5 = (void *)MEMORY[0x263EFF9D8];
  id v6 = a3;
  id v7 = objc_msgSend(v5, "orderedSetWithObjects:", objc_opt_class(), a4, 0);
  char v8 = [v6 coercionPathIsDisallowed:v7];

  return v8 ^ 1;
}

- (BOOL)coercionOptions:(id)a3 allowCoercionsToType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[WFContentItemRegistry sharedRegistry];
  uint64_t v9 = [v8 contentItemClassForType:v7];

  if (v9) {
    BOOL v10 = [(WFContentItem *)self coercionOptions:v6 allowCoercionsToItemClass:v9];
  }
  else {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)canPerformCoercion:(id)a3
{
  id v4 = a3;
  if ([v4 requestType] == 2)
  {
    id v5 = [v4 contentItemClasses];
    id v6 = [v4 options];

    +[WFContentCoercionSearch searchForCoercingItem:self toItemClasses:v5 options:v6];
  }
  else
  {
    id v5 = [(WFContentItem *)self typeForCoercionRequest:v4];
    id v6 = [v4 options];

    +[WFContentCoercionSearch searchForCoercingItem:self toType:v5 options:v6];
  id v7 = };
  char v8 = [v7 nextPathNode];

  return v8 != 0;
}

- (void)performCoercion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requestType];
  switch(v5)
  {
    case 0:
      uint64_t v9 = [(WFContentItem *)self typeForCoercionRequest:v4];
      BOOL v10 = [v4 options];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __33__WFContentItem_performCoercion___block_invoke_2;
      v14[3] = &unk_26428A1F8;
      id v15 = v4;
      [(WFContentItem *)self getRepresentationsForType:v9 options:v10 completionHandler:v14];

      char v8 = v15;
      goto LABEL_6;
    case 1:
      id v11 = [(WFContentItem *)self typeForCoercionRequest:v4];
      uint64_t v12 = [v4 options];
      uint64_t v13 = [v4 fileRepresentationResultHandler];
      [(WFContentItem *)self getRepresentationsForType:v11 options:v12 completionHandler:v13];

      break;
    case 2:
      id v6 = [v4 contentItemClasses];
      id v7 = [v4 options];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __33__WFContentItem_performCoercion___block_invoke;
      v16[3] = &unk_26428A1D0;
      id v17 = v4;
      long long v18 = self;
      [(WFContentItem *)self coerceToItemClasses:v6 options:v7 completionHandler:v16];

      char v8 = v17;
LABEL_6:

      break;
  }
}

uint64_t __33__WFContentItem_performCoercion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeContentItemCoercionRequestWithResultItems:a2 originalItem:*(void *)(a1 + 40) error:a3];
}

void __33__WFContentItem_performCoercion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectRepresentationResultHandler];
  char v8 = (objc_class *)MEMORY[0x263EFF980];
  id v9 = v5;
  id v10 = v6;
  id v11 = objc_msgSend([v8 alloc], "initWithCapacity:", objc_msgSend(v9, "count"));
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __WFInvokeObjectRepresentationsResultHandlerWithRepresentations_block_invoke;
  v14[3] = &unk_26428A430;
  id v15 = v11;
  id v12 = v11;
  uint64_t v13 = objc_msgSend(v9, "if_compactMap:", v14);

  ((void (**)(void, void *, id, id))v7)[2](v7, v13, v12, v10);
}

- (id)typeForCoercionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requestType];
  uint64_t v6 = v5;
  if (v5)
  {
    if (v5 == 2)
    {
      id v9 = 0;
      goto LABEL_21;
    }
    if (v5 == 1)
    {
      id v7 = [v4 fileType];

      if (v7)
      {
        uint64_t v8 = [v4 fileType];
LABEL_8:
        id v9 = (void *)v8;
        goto LABEL_21;
      }
    }
  }
  else if ([v4 objectClass])
  {
    uint64_t v8 = +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", [v4 objectClass]);
    goto LABEL_8;
  }
  id v10 = [v4 options];
  id v11 = [v10 preferredTypes];

  if (v11)
  {
    id v12 = [(WFContentItem *)self supportedTypes];
    uint64_t v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithArray:v11];
    [v13 intersectOrderedSet:v14];
    if ([v13 count])
    {
      id v9 = [v13 firstObject];

      goto LABEL_20;
    }
  }
  if (v6)
  {
    if (v6 != 1)
    {
      id v9 = 0;
      goto LABEL_20;
    }
    uint64_t v15 = [(WFContentItem *)self preferredFileType];
  }
  else
  {
    uint64_t v15 = [(WFContentItem *)self preferredObjectType];
  }
  id v9 = (void *)v15;
LABEL_20:

LABEL_21:
  return v9;
}

- (id)contentItemByMergingAttributionSet:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFContentAttributionSet *)self->_attributionSet isSupersetOfAttributionSet:v4])
  {
    uint64_t v5 = self;
  }
  else
  {
    v27[0] = self->_attributionSet;
    v27[1] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    id v7 = +[WFContentAttributionSet attributionSetByMergingAttributionSets:v6];

    objc_opt_class();
    uint64_t v5 = (WFContentItem *)objc_opt_new();
    if (v5)
    {
      uint64_t v8 = [(WFContentItem *)self internalRepresentationType];
      internalRepresentationType = v5->_internalRepresentationType;
      v5->_internalRepresentationType = (WFType *)v8;

      id v10 = [(WFContentItem *)self representationsByType];
      uint64_t v11 = [v10 mutableCopy];
      representationsByType = v5->_representationsByType;
      v5->_representationsByType = (NSMutableDictionary *)v11;

      uint64_t v13 = [(WFContentItem *)self subItemsByClass];
      uint64_t v14 = [v13 mutableCopy];
      subItemsByClass = v5->_subItemsByClass;
      v5->_subItemsByClass = (NSMutableDictionary *)v14;

      objc_storeStrong((id *)&v5->_attributionSet, v7);
      uint64_t v16 = [(WFContentItem *)self cachingIdentifier];
      cachingIdentifier = v5->_cachingIdentifier;
      v5->_cachingIdentifier = (NSUUID *)v16;

      [(WFContentItem *)self copyStateToItem:v5];
      long long v18 = v5;
    }
    else
    {
      long long v19 = getWFContentGraphLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        long long v20 = (objc_class *)objc_opt_class();
        long long v21 = NSStringFromClass(v20);
        int v23 = 136315394;
        uint64_t v24 = "-[WFContentItem contentItemByMergingAttributionSet:]";
        __int16 v25 = 2112;
        uint64_t v26 = v21;
        _os_log_impl(&dword_216505000, v19, OS_LOG_TYPE_FAULT, "%s Failed to create content item object of type %@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  return v5;
}

- (id)generateSubItemsForItemClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(WFContentItem *)self supportedItemClasses];
  int v10 = [v9 containsObject:a3];

  if (v10)
  {
    uint64_t v11 = [(WFContentItem *)self generateFirstLevelSubItemsForItemClass:a3 options:v8 error:a5];
  }
  else
  {
    id v12 = [(WFContentItem *)self allSupportedItemClasses];
    int v13 = [v12 containsObject:a3];

    if (v13)
    {
      uint64_t v14 = +[WFContentCoercionSearch searchForCoercingItem:self toItemClass:a3 options:v8];
      uint64_t v11 = [v14 runCoercionSynchronouslyWithError:a5];
      if ([v11 count])
      {
        uint64_t v15 = [v8 itemClassPrioritizationType];

        if (!v15) {
          [(WFContentItem *)self setSubItems:v11 forClass:a3];
        }
      }
    }
    else if (a5)
    {
      [(id)objc_opt_class() badCoercionErrorForItemClass:a3];
      uint64_t v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (void)generateSubItemsForItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  void v35[3] = __Block_byref_object_copy__243;
  v35[4] = __Block_byref_object_dispose__244;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__243;
  v33[4] = __Block_byref_object_dispose__244;
  id v34 = 0;
  uint64_t v11 = [v9 itemClassPrioritizationType];
  int v12 = [v11 isEqualToString:@"SupportedTypes"];

  if (v12)
  {
    int v13 = [(WFContentItem *)self supportedItemClasses];
    id v14 = [v13 array];

    id v15 = v8;
  }
  else
  {
    id v14 = v8;
    uint64_t v16 = [(WFContentItem *)self supportedItemClasses];
    id v15 = [v16 array];
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke;
  void v27[3] = &unk_26428A180;
  id v17 = v15;
  id v28 = v17;
  uint64_t v29 = self;
  id v30 = v9;
  v31 = v33;
  v32 = v35;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_3;
  v21[3] = &unk_26428A1A8;
  __int16 v25 = v33;
  uint64_t v26 = v35;
  id v18 = v10;
  id v24 = v18;
  void v21[4] = self;
  id v19 = v8;
  id v22 = v19;
  id v20 = v30;
  id v23 = v20;
  objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v27, v21);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_2;
    v11[3] = &unk_26428A158;
    long long v13 = *(_OWORD *)(a1 + 56);
    uint64_t v14 = a5;
    id v12 = v8;
    [v9 generateFirstLevelSubItemsForItemClass:a2 options:v10 completionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) | *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                               + 40))
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
  else
  {
    uint64_t v2 = +[WFContentCoercionSearch searchForCoercingItem:*(void *)(a1 + 32) toItemClasses:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_4;
    v6[3] = &unk_26428AF68;
    id v7 = *(id *)(a1 + 48);
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v8 = v3;
    uint64_t v9 = v4;
    id v10 = *(id *)(a1 + 56);
    [v2 runCoercion:v6];
  }
}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 firstObject];
  id v8 = objc_opt_class();

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) itemClassPrioritizationType];

    if (!v9)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v8, "isSubclassOfClass:", v15, (void)v16)) {
              [*(id *)(a1 + 48) setSubItems:v5 forClass:v15];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  **(unsigned char **)(a1 + 56) = [v12 count] != 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)generateFirstLevelSubItemsForItemClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a4;
  Class v29 = a3;
  [(WFContentItem *)self intermediaryTypesForCoercionToItemClass:a3];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(WFContentItem *)self getRepresentationsForType:*(void *)(*((void *)&v34 + 1) + 8 * i) options:v8 error:a5];
        if (v14)
        {
          long long v16 = (void *)v14;
          uint64_t v27 = v9;
          id v28 = v8;
          uint64_t v15 = objc_opt_new();
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v31 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
                id v23 = [(WFContentItem *)self attributionSet];
                id v24 = +[WFContentItem itemWithRepresentation:v22 attributionSet:v23];

                if (v24) {
                  [v15 addObject:v24];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v19);
          }

          id v8 = v28;
          __int16 v25 = [v28 itemClassPrioritizationType];

          if (!v25) {
            [(WFContentItem *)self setSubItems:v15 forClass:v29];
          }

          id v9 = v27;
          goto LABEL_23;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (a5)
  {
    [(id)objc_opt_class() badCoercionErrorForItemClass:v29];
    uint64_t v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_23:

  return v15;
}

- (void)generateFirstLevelSubItemsForItemClass:(Class)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(WFContentItem *)self coercionOptions:v8 allowCoercionsToItemClass:a3])
  {
    uint64_t v10 = [(WFContentItem *)self intermediaryTypesForCoercionToItemClass:a3];
    uint64_t v11 = [v10 objectEnumerator];
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      uint64_t v12 = (void *)MEMORY[0x263EF83A0];
      id v13 = MEMORY[0x263EF83A0];
    }
    else
    {
      uint64_t v12 = dispatch_get_global_queue(0, 0);
    }
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    Class v29 = __Block_byref_object_copy__21461;
    long long v30 = __Block_byref_object_dispose__21462;
    id v31 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke;
    aBlock[3] = &unk_26428A128;
    id v14 = v11;
    id v19 = v14;
    id v23 = v9;
    id v24 = &v26;
    uint64_t v20 = self;
    Class v25 = a3;
    id v21 = v8;
    id v15 = v12;
    id v22 = v15;
    long long v16 = _Block_copy(aBlock);
    id v17 = (void *)v27[5];
    v27[5] = (uint64_t)v16;

    (*(void (**)(void))(v27[5] + 16))();
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() badCoercionErrorForItemClass:a3];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v10);
  }
}

void __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) nextObject];
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_2;
    v16[3] = &unk_26428A100;
    uint64_t v22 = *(void *)(a1 + 72);
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    id v17 = v7;
    uint64_t v18 = v8;
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 80);
    id v19 = v10;
    uint64_t v23 = v11;
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    [v5 getRepresentationsForType:v4 options:v6 completionHandler:v16];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 64);
    if (v3)
    {
      (*(void (**)(void, void, id))(v12 + 16))(*(void *)(a1 + 64), 0, v3);
    }
    else
    {
      id v13 = [(id)objc_opt_class() badCoercionErrorForItemClass:*(void *)(a1 + 80)];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }
}

void __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v24 = v6;
    uint64_t v8 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v25 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v15 = [*(id *)(a1 + 40) attributionSet];
          long long v16 = +[WFContentItem itemWithRepresentation:v14 attributionSet:v15 includesDefaultAttributionSet:1];

          if (v16) {
            [v8 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v11);
    }

    id v17 = [*(id *)(a1 + 48) itemClassPrioritizationType];

    if (!v17) {
      [*(id *)(a1 + 40) setSubItems:v8 forClass:*(void *)(a1 + 80)];
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_3;
    block[3] = &unk_26428A9D8;
    id v20 = *(NSObject **)(a1 + 56);
    id v29 = *(id *)(a1 + 64);
    id v27 = v8;
    id v7 = v24;
    id v28 = v24;
    id v21 = v8;
    dispatch_async(v20, block);

    id v5 = v25;
  }
  else
  {
    id v23 = v6;
    if (!v6) {
      id v23 = *(id *)(a1 + 32);
    }
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v23);
  }
}

uint64_t __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)intermediaryTypesForCoercionToItemClass:(Class)a3
{
  uint64_t v4 = [(objc_class *)a3 ownedTypes];
  id v5 = [(WFContentItem *)self outputTypes];
  id v6 = (void *)MEMORY[0x263F08A98];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__WFContentItem_intermediaryTypesForCoercionToItemClass___block_invoke;
  v11[3] = &unk_26428A0D8;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 predicateWithBlock:v11];
  id v9 = [v5 filteredOrderedSetUsingPredicate:v8];

  return v9;
}

uint64_t __57__WFContentItem_intermediaryTypesForCoercionToItemClass___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToTypes:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFContentItem *)self internalRepresentation];
  int v6 = [v5 isEncodable];
  id v7 = [v4 wfFileCoder];

  BOOL v8 = [(WFContentItem *)self alwaysEncodeUsingWFSerializableContent];
  id v9 = objc_opt_class();
  uint64_t v10 = [v4 wfFileCoder];
  int v11 = objc_msgSend(v9, "isAvailableOnPlatform:", objc_msgSend(v10, "targetPlatform"));

  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if (v6 && (!v7 ? (int v13 = 1) : (int v13 = v11), !v8 && ((v13 | isKindOfClass) & 1) != 0))
  {
    if (!v7)
    {
      long long v16 = getWFContentGraphLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        int v19 = 136315138;
        id v20 = "-[WFContentItem encodeWithCoder:]";
        _os_log_impl(&dword_216505000, v16, OS_LOG_TYPE_FAULT, "%s WFContentItem representation is being encoded without using a WFFileCoder. This could result in a significant spike in memory usage, and is not recommended.", (uint8_t *)&v19, 0xCu);
      }
    }
    [v4 encodeObject:v5 forKey:@"internalRepresentation"];
    uint64_t v14 = [(WFContentItem *)self internalRepresentationType];
    id v15 = @"internalRepresentationType";
  }
  else
  {
    uint64_t v14 = [(WFContentItem *)self metadataForSerialization];
    id v15 = @"serializationMetadata";
  }
  [v4 encodeObject:v14 forKey:v15];

  id v17 = [(WFContentItem *)self attributionSet];
  [v4 encodeObject:v17 forKey:@"attributionSet"];

  uint64_t v18 = [(WFContentItem *)self cachingIdentifier];
  [v4 encodeObject:v18 forKey:@"cachingIdentifier"];
}

- (BOOL)canEncodeWithCoder:(id)a3
{
  return 1;
}

- (WFContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"attributionSet"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributionSet"];
  }
  else
  {
    id v5 = 0;
  }
  if ([v4 containsValueForKey:@"cachingIdentifier"])
  {
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cachingIdentifier"];
  }
  else
  {
    int v6 = 0;
  }
  if ([v4 containsValueForKey:@"internalRepresentation"])
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internalRepresentationType"];
    BOOL v8 = [MEMORY[0x263EFF9C0] setWithObject:objc_opt_class()];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v8, "addObject:", objc_msgSend(v7, "objectClass"));
      id v9 = [(WFContentItem *)self allowedClassesForDecodingInternalRepresentations];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        int v11 = [(WFContentItem *)self allowedClassesForDecodingInternalRepresentations];
        [v8 addObjectsFromArray:v11];
      }
    }
    id v12 = [v4 decodeObjectOfClasses:v8 forKey:@"internalRepresentation"];
    self = [(WFContentItem *)self initWithRepresentation:v12 forType:v7 attributionSet:v5 cachingIdentifier:v6];
    int v13 = self;
  }
  else
  {
    if (![v4 containsValueForKey:@"serializationMetadata"])
    {
      int v13 = 0;
      goto LABEL_16;
    }
    uint64_t v14 = (void *)MEMORY[0x263EFFA08];
    id v15 = [(id)objc_opt_class() pasteboardValueClasses];
    long long v16 = [v14 setWithArray:v15];
    id v7 = [v4 decodeObjectOfClasses:v16 forKey:@"serializationMetadata"];

    BOOL v8 = [v7 objectForKey:@"link.contentkit.name"];
    id v17 = [v7 objectForKey:@"link.contentkit.contentattributionset"];
    id v12 = +[WFContentAttributionSet objectWithWFSerializedRepresentation:v17];

    uint64_t v18 = [v7 objectForKey:@"link.contentkit.cachingidentifier"];
    int v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v18];
    int v13 = [(id)objc_opt_class() itemWithSerializedItem:v7 forType:0 named:v8 attributionSet:v12 cachingIdentifier:v19];
  }
LABEL_16:

  return v13;
}

- (Class)classForCopying
{
  return (Class)objc_opt_class();
}

- (id)copyWithName:(id)a3
{
  return [(WFContentItem *)self copyWithName:a3 zone:0];
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  id v6 = a3;
  id v7 = [(WFContentItem *)self internalRepresentationForCopyingWithName:v6];
  BOOL v8 = v7;
  if (v6)
  {
    id v9 = (void *)[v7 copyWithName:v6 zone:a4];
  }
  else
  {
    uint64_t v10 = [(WFContentItem *)self name];
    id v9 = (void *)[v8 copyWithName:v10 zone:a4];
  }
  int v11 = [(WFContentItem *)self classForCopying];
  id v12 = [(WFContentItem *)self attributionSet];
  int v13 = [(WFContentItem *)self cachingIdentifier];
  uint64_t v14 = [(objc_class *)v11 itemWithRepresentation:v9 attributionSet:v12 cachingIdentifier:v13];

  [(WFContentItem *)self copyStateToItem:v14];
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(WFContentItem *)self copyWithName:0 zone:a3];
}

- (id)internalRepresentationForCopyingWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentItem *)self internalRepresentation];
  if (v4)
  {
    id v6 = [MEMORY[0x263F852B8] typeFromFilename:v4];
    int v7 = [v6 isDeclared];

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v8 = [(WFContentItem *)self preferredFileType];
        id v9 = +[WFCoercionOptions new];
        uint64_t v10 = [(WFContentItem *)self getRepresentationsForType:v8 options:v9 error:0];
        int v11 = [v10 firstObject];

        if (v11)
        {
          id v12 = v11;

          id v5 = v12;
        }
      }
    }
  }
  id v13 = v5;

  return v13;
}

- (BOOL)hasStringOutput
{
  uint64_t v2 = objc_opt_class();
  return [v2 hasStringOutput];
}

- (NSString)internalName
{
  id v3 = [(WFContentItem *)self internalRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 object];
    id v5 = [v4 wfName];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(WFContentItem *)self name];
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = [(WFContentItem *)self name];
  }

  return (NSString *)v8;
}

- (void)getTitleWithPermissionRequestor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(WFContentItem *)self name];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (NSString)name
{
  uint64_t v2 = [(WFContentItem *)self internalRepresentation];
  id v3 = [v2 wfName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() localizedTypeDescription];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (WFRepresentation)internalRepresentation
{
  id v3 = [(WFContentItem *)self internalRepresentationType];
  id v4 = [(WFContentItem *)self representationForType:v3];

  return (WFRepresentation *)v4;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(WFContentItem *)self generateObjectRepresentationForClass:a3 options:a4 error:a5];
  id v6 = (void *)v5;
  if (v5)
  {
    v9[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)generateFileRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(WFContentItem *)self generateFileRepresentationForType:a3 options:a4 error:a5];
  id v6 = (void *)v5;
  if (v5)
  {
    v9[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)generateRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(id)objc_opt_class() coercionForCoercingToType:v8 concurrencyMode:0];
  int v11 = v10;
  if (v10)
  {
    id v12 = [v10 handler];
    id v13 = [v12 performSynchronousCoercionWithContentItem:self forType:v8 options:v9 error:a5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[WFContentItem generateObjectRepresentationsForClass:options:error:](self, "generateObjectRepresentationsForClass:options:error:", [v8 objectClass], v9, a5);
    }
    else {
    id v13 = [(WFContentItem *)self generateFileRepresentationsForType:v8 options:v9 error:a5];
    }
  }

  return v13;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7 = a3;
  id v8 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
  (*((void (**)(id, void, void, id))a3 + 2))(v7, 0, 0, v8);
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() badCoercionErrorForType:v6];

  (*((void (**)(id, void, id))a3 + 2))(v7, 0, v8);
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __64__WFContentItem_generateObjectRepresentations_options_forClass___block_invoke;
  v10[3] = &unk_26428A0B0;
  id v11 = v8;
  id v9 = v8;
  [(WFContentItem *)self generateObjectRepresentation:v10 options:a4 forClass:a5];
}

void __64__WFContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (a2)
  {
    id v8 = +[WFObjectRepresentation object:a2 named:a3];
    v10[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __61__WFContentItem_generateFileRepresentations_options_forType___block_invoke;
  v10[3] = &unk_26428AA60;
  id v11 = v8;
  id v9 = v8;
  [(WFContentItem *)self generateFileRepresentation:v10 options:a4 forType:a5];
}

void __61__WFContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = a3;
    id v7 = a2;
    id v8 = [v5 arrayWithObjects:v10 count:1];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);
  }
  else
  {
    id v9 = *(void (**)(uint64_t, void, id))(v3 + 16);
    id v7 = a3;
    v9(v3, 0, v7);
    id v8 = 0;
  }
}

- (void)generateRepresentationsForType:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(id)objc_opt_class() coercionForCoercingToType:v13 concurrencyMode:1];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 handler];
    [v12 performAsynchronousCoercionWithContentItem:self forType:v13 options:v8 completionHandler:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[WFContentItem generateObjectRepresentations:options:forClass:](self, "generateObjectRepresentations:options:forClass:", v9, v8, [v13 objectClass]);
    }
    else {
      [(WFContentItem *)self generateFileRepresentations:v9 options:v8 forType:v13];
    }
  }
}

- (id)getRepresentationsForType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[WFCoercionOptions new];
  id v8 = [(WFContentItem *)self getRepresentationsForType:v6 options:v7 error:a4];

  return v8;
}

- (id)getRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(WFContentItem *)self coercionOptions:v9 allowCoercionsToType:v8])
  {
    id v21 = 0;
    uint64_t v10 = [(WFContentItem *)self _getRepresentationsForType:v8 options:v9 error:&v21];
    id v11 = v21;
    id v12 = v11;
    if (a5 && v11) {
      *a5 = v11;
    }
    if (v10)
    {
      id v13 = v10;
    }
    else
    {
      int v14 = [v8 isEqualToClass:objc_opt_class()];
      id v13 = 0;
      if (!v12 && v14)
      {
        uint64_t v15 = [(WFContentItem *)self internalName];
        if (v15
          && (v16 = (void *)v15, BOOL v17 = [(WFContentItem *)self hasStringOutput],
                                 v16,
                                 !v17))
        {
          int v19 = [(WFContentItem *)self internalName];
          id v20 = +[WFObjectRepresentation object:v19];
          v22[0] = v20;
          id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
        }
        else
        {
          id v13 = 0;
        }
      }
    }
  }
  else if (a5)
  {
    [(id)objc_opt_class() badCoercionErrorForType:v8];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_getRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(WFContentItem *)self representationsForType:v8];
  if (!v10)
  {
    if ([(WFContentItem *)self canGenerateRepresentationForType:v8])
    {
      id v11 = getWFContentGraphLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v8 typeDescription];
        id v13 = v12;
        if (!v12)
        {
          id v13 = [v8 string];
        }
        int v18 = 136315650;
        int v19 = "-[WFContentItem _getRepresentationsForType:options:error:]";
        __int16 v20 = 2114;
        id v21 = v13;
        __int16 v22 = 2112;
        id v23 = self;
        _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_INFO, "%s Generating %{public}@ representation from %@", (uint8_t *)&v18, 0x20u);
        if (!v12) {
      }
        }
      uint64_t v10 = [(WFContentItem *)self generateRepresentationsForType:v8 options:v9 error:a5];
      if ([v10 count])
      {
        int v14 = [v9 itemClassPrioritizationType];

        if (!v14)
        {
          uint64_t v15 = [v10 firstObject];
          long long v16 = [v15 wfType];
          [(WFContentItem *)self setRepresentations:v10 forType:v16];
        }
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (void)getRepresentationsForType:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, id))a5;
  if ([(WFContentItem *)self coercionOptions:v9 allowCoercionsToType:v8])
  {
    id v30 = 0;
    uint64_t v11 = [(WFContentItem *)self _getRepresentationsForType:v8 options:v9 error:&v30];
    unint64_t v12 = (unint64_t)v30;
    if (v11 | v12)
    {
      v10[2](v10, v11, (id)v12);
    }
    else
    {
      int v14 = [(WFContentItem *)self supportedTypes];
      int v15 = WFAnyInTypesConformsToType(v14, v8);

      if (v15)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke;
        v25[3] = &unk_26428AF68;
        id v26 = v9;
        id v27 = self;
        id v28 = v8;
        id v29 = v10;
        [(WFContentItem *)self generateRepresentationsForType:v28 options:v26 completionHandler:v25];
      }
      else
      {
        long long v16 = [(WFContentItem *)self allSupportedTypes];
        int v17 = WFAnyInTypesConformsToType(v16, v8);

        if (v17)
        {
          int v18 = +[WFContentCoercionSearch searchForCoercingItem:self toType:v8 options:v9];
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          void v20[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_2;
          v20[3] = &unk_26428AF68;
          uint64_t v24 = v10;
          id v21 = v8;
          id v22 = v9;
          id v23 = self;
          [v18 runCoercion:v20];
        }
        else
        {
          int v19 = [(id)objc_opt_class() badCoercionErrorForType:v8];
          v10[2](v10, 0, v19);
        }
      }
    }
  }
  else
  {
    id v13 = [(id)objc_opt_class() badCoercionErrorForType:v8];
    v10[2](v10, 0, v13);
  }
}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = [*(id *)(a1 + 32) itemClassPrioritizationType];

    if (!v7) {
      [*(id *)(a1 + 40) setRepresentations:v5 forType:*(void *)(a1 + 48)];
    }
  }
  int v8 = [*(id *)(a1 + 48) isEqualToClass:objc_opt_class()];
  if (!v5
    && v8
    && [(id)objc_opt_class() errorIsBadCoercionError:v6]
    && ([*(id *)(a1 + 40) internalName], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v10 = (void *)v9, v11 = [*(id *)(a1 + 40) hasStringOutput], v10, (v11 & 1) == 0))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = [*(id *)(a1 + 40) internalName];
    int v14 = +[WFObjectRepresentation object:v13];
    v16[0] = v14;
    int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v15, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v7();
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_3;
    v13[3] = &unk_26428A088;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_5;
    v8[3] = &unk_26428AF68;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 56);
    objc_msgSend(a2, "if_flatMapAsynchronously:completionHandler:", v13, v8);
  }
}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_4;
  v10[3] = &unk_26428AF18;
  id v11 = v6;
  id v9 = v6;
  [a2 getRepresentationsForType:v8 options:v7 completionHandler:v10];
}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 count])
  {
    id v6 = [*(id *)(a1 + 32) itemClassPrioritizationType];

    if (!v6) {
      [*(id *)(a1 + 40) setRepresentations:v7 forType:*(void *)(a1 + 48)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__WFContentItem_dealloc__block_invoke;
  aBlock[3] = &unk_26428A060;
  void aBlock[4] = self;
  uint64_t v3 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v3[2](v3);
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)WFContentItem;
  [(WFContentItem *)&v4 dealloc];
}

void __24__WFContentItem_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

+ (id)populateBadCoercionError:(id)a3 withResponsibleComponent:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 localizedDescription];
  id v9 = [a1 badCoercionErrorDefaultResponsibleComponent];
  uint64_t v10 = [v8 stringByReplacingOccurrencesOfString:v9 withString:v6];

  id v11 = (void *)MEMORY[0x263F087E8];
  v16[0] = *MEMORY[0x263F08338];
  id v12 = [v7 localizedFailureReason];

  v16[1] = *MEMORY[0x263F08320];
  v17[0] = v12;
  v17[1] = v10;
  id v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v14 = [v11 errorWithDomain:@"WFContentItemErrorDomain" code:0 userInfo:v13];

  return v14;
}

+ (id)badCoercionErrorDefaultResponsibleComponent
{
  return WFLocalizedString(@"The operation");
}

+ (id)filterRepresentationsForAllowedContent:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (NSArray)contentCategories
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

+ (NSOrderedSet)allSupportedItemClasses
{
  id v3 = [a1 allSupportedTypes];
  uint64_t v4 = WFSupportedItemClassesForItemClass((uint64_t)a1, v3);

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)supportedItemClasses
{
  id v3 = [a1 supportedTypes];
  uint64_t v4 = WFSupportedItemClassesForItemClass((uint64_t)a1, v3);

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)supportedItemClassesExcludingInstanceSpecificTypes
{
  id v3 = [a1 supportedTypesExcludingInstanceSpecificTypes];
  uint64_t v4 = WFSupportedItemClassesForItemClass((uint64_t)a1, v3);

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)supportedTypesExcludingInstanceSpecificTypes
{
  id v3 = [a1 supportedTypes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__WFContentItem_supportedTypesExcludingInstanceSpecificTypes__block_invoke;
  v7[3] = &__block_descriptor_40_e33_B24__0__WFType_8__NSDictionary_16l;
  v7[4] = a1;
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithBlock:v7];
  id v5 = [v3 filteredOrderedSetUsingPredicate:v4];

  return (NSOrderedSet *)v5;
}

uint64_t __61__WFContentItem_supportedTypesExcludingInstanceSpecificTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) supportedTypeMustBeDeterminedByInstance:a2] ^ 1;
}

+ (BOOL)supportedTypesMustBeDeterminedByInstance
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a1, "supportedTypes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([a1 supportedTypeMustBeDeterminedByInstance:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() coercionForType:v3];

  if (v4)
  {
    uint64_t v5 = [v4 handler];
    char v6 = [v5 hasAvailabilityCheck];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)supportedItemClassMustBeDeterminedByInstance:(Class)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(objc_class *)a3 ownedTypes];
  uint64_t v5 = [a1 outputTypes];
  char v6 = (void *)[v5 mutableCopy];

  [v6 intersectOrderedSet:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(a1, "supportedTypeMustBeDeterminedByInstance:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (NSOrderedSet)supportedTypes
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  char v6 = __31__WFContentItem_supportedTypes__block_invoke;
  id v7 = &__block_descriptor_40_e5__8__0l;
  id v8 = a1;
  id v2 = a1;
  id v3 = objc_getAssociatedObject(v2, &supportedTypes_cachedValue);
  if (!v3)
  {
    id v3 = v6((uint64_t)v5);
    objc_setAssociatedObject(v2, &supportedTypes_cachedValue, v3, (void *)0x303);
  }

  return (NSOrderedSet *)v3;
}

id __31__WFContentItem_supportedTypes__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ownedTypes];
  id v3 = [*(id *)(a1 + 32) outputTypes];
  uint64_t v4 = [v2 orderedSetByAddingObjectsFromOrderedSet:v3];

  uint64_t v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  if (([*(id *)(a1 + 32) hasStringOutput] & 1) != 0
    || [*(id *)(a1 + 32) supportedTypeMustBeDeterminedByInstance:v5])
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v4 orderedSetByAddingObject:v5];
  }
  id v7 = v6;

  return v7;
}

+ (id)coercionForType:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [(id)objc_opt_class() cachedCoercions];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "type", (void)v12);
        char v10 = [v9 isEqualToType:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)coercionForCoercingToType:(id)a3 concurrencyMode:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(id)objc_opt_class() cachedCoercions];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "canProduceType:withConcurrencyMode:", v5, a4, (void)v14))
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

+ (id)coercions
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)cachedCoercions
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  id v6 = __32__WFContentItem_cachedCoercions__block_invoke;
  uint64_t v7 = &__block_descriptor_40_e14___NSArray_8__0l;
  id v8 = a1;
  id v2 = a1;
  id v3 = objc_getAssociatedObject(v2, &cachedCoercions_cachedValue);
  if (!v3)
  {
    id v3 = v6((uint64_t)v5);
    objc_setAssociatedObject(v2, &cachedCoercions_cachedValue, v3, (void *)0x303);
  }

  return v3;
}

uint64_t __32__WFContentItem_cachedCoercions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) coercions];
}

+ (BOOL)contentItems:(id)a3 haveContentProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 contentPropertySubstitutor];
  char HaveProperties = WFContentObjectsHaveProperties(v7, v6, v8);

  return HaveProperties;
}

+ (id)contentPropertySubstitutor
{
  return &__block_literal_global_374;
}

id __43__WFContentItem_contentPropertySubstitutor__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() supportedPropertyForProperty:v3];

  return v4;
}

+ (id)supportedPropertyForProperty:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(a1, "allProperties", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v4 isEquivalentToProperty:v9])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[WFContentItem contentPropertySubstitutor];
  [v10 runWithObjects:v9 propertySubstitutor:v11 completionHandler:v8];
}

+ (WFContentItemStringConversionBehavior)stringConversionBehavior
{
  id v2 = [a1 localizedTypeDescription];
  id v3 = +[WFContentItemStringConversionBehavior coercingToStringWithDescription:v2];

  return (WFContentItemStringConversionBehavior *)v3;
}

+ (BOOL)hasLibrary
{
  return 0;
}

+ (id)propertyForName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allProperties];
  id v6 = [v5 objectMatchingKey:@"name" value:v4];

  if (!v6)
  {
    uint64_t v7 = [a1 allProperties];
    id v6 = [v7 objectMatchingKey:@"displayName" value:v4];

    if (!v6)
    {
      id v8 = [a1 allProperties];
      id v6 = [v8 objectMatchingKey:@"singularItemName" value:v4];
    }
  }

  return v6;
}

+ (NSArray)allProperties
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  [a1 superclass];
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "allProperties");
    [v3 addObjectsFromArray:v4];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [a1 properties];
  id v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __30__WFContentItem_allProperties__block_invoke;
        v14[3] = &unk_26428A310;
        void v14[4] = v11;
        uint64_t v12 = [v3 indexOfObjectPassingTest:v14];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          [v3 insertObject:v11 atIndex:0];
        }
        else {
          [v3 replaceObjectAtIndex:v12 withObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return (NSArray *)v3;
}

uint64_t __30__WFContentItem_allProperties__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userInfo];
  id v5 = [v3 userInfo];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

+ (NSArray)properties
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  uint64_t v6 = __27__WFContentItem_properties__block_invoke;
  uint64_t v7 = &__block_descriptor_40_e14___NSArray_8__0l;
  id v8 = a1;
  id v2 = a1;
  id v3 = objc_getAssociatedObject(v2, &properties_cachedValue);
  if (!v3)
  {
    id v3 = v6((uint64_t)v5);
    objc_setAssociatedObject(v2, &properties_cachedValue, v3, (void *)0x303);
  }

  return (NSArray *)v3;
}

id __27__WFContentItem_properties__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) propertyBuilders];
  id v2 = objc_msgSend(v1, "if_map:", &__block_literal_global_359);

  return v2;
}

uint64_t __27__WFContentItem_properties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 build];
}

+ (id)propertyBuilders
{
  v20[1] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    id v4 = [a1 namePropertyBuilder];
    if ([a1 hasFileOutput])
    {
      v19[0] = v4;
      long long v18 = WFLocalizedContentPropertyNameMarker(@"File Size");
      long long v17 = +[WFContentPropertyBuilder block:&__block_literal_global_345 name:v18 class:objc_opt_class()];
      long long v16 = [v17 userInfo:@"WFFileSizeProperty"];
      long long v15 = [v16 sortable:0];
      long long v14 = [v15 filterable:0];
      id v5 = [v14 gettable:0];
      v19[1] = v5;
      uint64_t v6 = WFLocalizedContentPropertyNameMarker(@"File Extension");
      uint64_t v7 = +[WFContentPropertyBuilder block:&__block_literal_global_353 name:v6 class:objc_opt_class()];
      id v8 = [v7 userInfo:@"WFFileExtensionProperty"];
      uint64_t v9 = [v8 caseInsensitive:1];
      id v10 = [v9 sortable:0];
      uint64_t v11 = [v10 filterable:0];
      uint64_t v12 = [v11 gettable:0];
      v19[2] = v12;
      id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
    }
    else
    {
      v20[0] = v4;
      id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t __33__WFContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 getPreferredFileExtension:a4];
}

void __33__WFContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__WFContentItem_propertyBuilders__block_invoke_2;
  v7[3] = &unk_26428A288;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredFileSize:v7];
}

void __33__WFContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [[WFFileSize alloc] initWithByteCount:a2];
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);
}

+ (id)namePropertyBuilder
{
  uint64_t v2 = WFLocalizedContentPropertyNameMarker(@"Name");
  id v3 = +[WFContentPropertyBuilder keyPath:@"name" name:v2 class:objc_opt_class()];
  id v4 = [v3 userInfo:@"WFItemName"];

  return v4;
}

+ (int64_t)tableTemplateSubjectType
{
  return 0;
}

+ (BOOL)canLowercaseTypeDescription
{
  return 1;
}

+ (NSString)countDescription
{
  if ([a1 isContentItemSubclass])
  {
    id v3 = [a1 ownedTypes];
    id v4 = [v3 firstObject];

    if ([v4 isEqualToUTType:*MEMORY[0x263F1DA48]])
    {
      id v5 = WFLocalizedPluralString(@"%d Files");

      goto LABEL_6;
    }
  }
  id v5 = WFLocalizedPluralString(@"%d Items");
LABEL_6:
  return (NSString *)v5;
}

+ (NSString)localizedPluralFilterDescription
{
  id v3 = [MEMORY[0x263F85368] defaultContext];
  id v4 = [a1 localizedPluralFilterDescriptionWithContext:v3];

  return (NSString *)v4;
}

+ (NSString)localizedFilterDescription
{
  id v3 = [MEMORY[0x263F85368] defaultContext];
  id v4 = [a1 localizedFilterDescriptionWithContext:v3];

  return (NSString *)v4;
}

+ (NSString)localizedPluralTypeDescription
{
  id v3 = [MEMORY[0x263F85368] defaultContext];
  id v4 = [a1 localizedPluralTypeDescriptionWithContext:v3];

  return (NSString *)v4;
}

+ (NSString)localizedTypeDescription
{
  id v3 = [MEMORY[0x263F85368] defaultContext];
  id v4 = [a1 localizedTypeDescriptionWithContext:v3];

  return (NSString *)v4;
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v5 = a3;
  if ([a1 isContentItemSubclass])
  {
    id v6 = [a1 ownedTypes];
    uint64_t v7 = [v6 firstObject];

    if ([v7 isEqualToUTType:*MEMORY[0x263F1DA48]])
    {
      id v8 = WFLocalizedStringResourceWithKey(@"Files", @"Files");
      uint64_t v9 = [v5 localize:v8];

      goto LABEL_6;
    }
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"WFContentItem.m" lineNumber:1105 description:@"Subclasses of WFContentItem should provide a plural description of the type"];
  }
  uint64_t v7 = WFLocalizedStringResourceWithKey(@"Anything (Plural)", @"Anything");
  uint64_t v9 = [v5 localize:v7];
LABEL_6:

  return v9;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v4 = a3;
  if ([a1 isContentItemSubclass])
  {
    id v5 = [a1 ownedTypes];
    id v6 = [v5 firstObject];

    if ([v6 isEqualToUTType:*MEMORY[0x263F1DA48]])
    {
      uint64_t v7 = WFLocalizedStringResourceWithKey(@"File", @"File");
      id v8 = [v4 localize:v7];
    }
    else
    {
      uint64_t v7 = [v6 typeDescription];
      uint64_t v9 = [v4 locale];
      id v8 = [v7 capitalizedStringWithLocale:v9];
    }
  }
  else
  {
    id v6 = WFLocalizedStringResourceWithKey(@"Anything (Singular)", @"Anything");
    id v8 = [v4 localize:v6];
  }

  return v8;
}

+ (id)outputTypesFromCoercions
{
  uint64_t v2 = [a1 cachedCoercions];
  id v3 = objc_alloc(MEMORY[0x263EFF9D8]);
  id v4 = objc_msgSend(v2, "if_map:", &__block_literal_global_291);
  id v5 = (void *)[v3 initWithArray:v4];

  return v5;
}

uint64_t __41__WFContentItem_outputTypesFromCoercions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type];
}

+ (id)ownedTypes
{
  return (id)[MEMORY[0x263EFF9D8] orderedSet];
}

+ (BOOL)isAvailableOnPlatform:(int64_t)a3
{
  return 1;
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v15 = [a1 ownedTypes];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v27 = a1;
    id v28 = v12;
    uint64_t v18 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v20;
          uint64_t v22 = [v21 objectClass];
          id v23 = +[WFSerializableContentProvider sharedProvider];
          uint64_t v24 = [v23 objectOfClass:v22 withSerializedRepresentation:v11];

          if (v24)
          {
            id v12 = v28;
            id v25 = [v27 itemWithObject:v24 named:v28 attributionSet:v13 cachingIdentifier:v14];

            goto LABEL_14;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    id v25 = 0;
    id v12 = v28;
  }
  else
  {
    id v25 = 0;
  }
LABEL_14:

  return v25;
}

+ (id)itemFromSerializedItem:(id)a3 withItemClass:(Class)a4 forType:(id)a5 nameIfKnown:(id)a6 sourceName:(id)a7 attributionSet:(id)a8 cachingIdentifier:(id)a9 completionHandler:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!v17 && v18)
  {
    if ([v16 isEqualToUTType:*MEMORY[0x263F1DD08]])
    {
      id v17 = 0;
    }
    else
    {
      id v21 = (void *)MEMORY[0x263F08790];
      uint64_t v22 = [MEMORY[0x263EFF910] date];
      id v23 = [v21 localizedStringFromDate:v22 dateStyle:2 timeStyle:1];

      uint64_t v24 = [v23 stringByReplacingOccurrencesOfString:@":" withString:@"."];

      id v17 = [NSString stringWithFormat:@"%@ %@", v18, v24];
    }
  }
  id v25 = [(objc_class *)a4 itemWithSerializedItem:v15 forType:v16 named:v17 attributionSet:v19 cachingIdentifier:v20];

  return v25;
}

+ (void)getContentItemFromSerializedItem:(id)a3 sourceName:(id)a4 completionHandler:(id)a5
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v94 = a4;
  v95 = (void (**)(id, uint64_t, void))a5;
  uint64_t v7 = (void *)[a3 mutableCopy];
  id v8 = WFPopStringForKey(v7, @"link.contentkit.name");
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    WFPopStringForKey(v7, (void *)*MEMORY[0x263F856B8]);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v93 = v10;

  id v11 = WFPopStringForKey(v7, @"link.contentkit.itemclass.identifier");
  id v12 = v7;
  id v13 = [v12 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.contentattributionset"];
  [v12 removeObjectForKey:@"link.contentkit.contentattributionset"];
  v96 = v12;

  if (v13)
  {
    id v14 = +[WFContentAttributionSet objectWithWFSerializedRepresentation:v13];
  }
  else
  {
    id v14 = 0;
  }
  id v15 = WFPopStringForKey(v12, @"link.contentkit.cachingidentifier");
  id v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v15];
  if (v14) {
    goto LABEL_12;
  }
  if ([v94 isEqualToString:@"Clipboard"])
  {
    if (!v16)
    {
      id v16 = [MEMORY[0x263F08C38] UUID];
    }
    id v17 = +[WFContentLocation clipboardLocation];
    id v14 = +[WFContentAttributionSet attributionSetWithOrigin:v17 disclosureLevel:1 originalItemIdentifier:v16];

LABEL_12:
    if (!v11) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  id v14 = 0;
  if (!v11) {
    goto LABEL_17;
  }
LABEL_13:
  id v18 = [v11 stringByReplacingOccurrencesOfString:@"link.contentkit.itemclass.", &stru_26C71CE08, 8, 0, objc_msgSend(@"link.contentkit.itemclass.", "length") withString options range];
  Class v19 = NSClassFromString(v18);
  if ([(objc_class *)v19 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v20 = [(objc_class *)v19 itemWithSerializedItem:v12 forType:0 named:v93 attributionSet:v14 cachingIdentifier:v16];
    if (v20)
    {
      id v21 = (void *)v20;
      v95[2](v95, v20, 0);

      goto LABEL_90;
    }
  }

LABEL_17:
  uint64_t v22 = [v12 allKeys];
  v89 = objc_msgSend(v22, "if_map:", &__block_literal_global_21647);

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v23 = +[WFContentItemRegistry sharedRegistry];
  uint64_t v24 = [v23 contentItemClasses];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v123 objects:v133 count:16];
  v90 = v16;
  v85 = v13;
  v86 = v11;
  v84 = v15;
  v92 = v14;
  if (v25)
  {
    uint64_t v26 = *(void *)v124;
    v87 = v24;
    uint64_t v76 = *(void *)v124;
    do
    {
      uint64_t v27 = 0;
      uint64_t v78 = v25;
      do
      {
        if (*(void *)v124 != v26) {
          objc_enumerationMutation(v24);
        }
        id v28 = *(void **)(*((void *)&v123 + 1) + 8 * v27);
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v29 = [v28 ownedPasteboardTypes];
        uint64_t v82 = [v29 countByEnumeratingWithState:&v119 objects:v132 count:16];
        if (v82)
        {
          uint64_t v30 = *(void *)v120;
          obuint64_t j = v29;
          uint64_t v80 = *(void *)v120;
          do
          {
            for (uint64_t i = 0; i != v82; ++i)
            {
              if (*(void *)v120 != v30) {
                objc_enumerationMutation(v29);
              }
              uint64_t v32 = *(void *)(*((void *)&v119 + 1) + 8 * i);
              long long v115 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              long long v118 = 0u;
              id v33 = v89;
              uint64_t v34 = [v33 countByEnumeratingWithState:&v115 objects:v131 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v116;
                while (2)
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v116 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    v38 = *(void **)(*((void *)&v115 + 1) + 8 * j);
                    if ([v38 conformsToType:v32])
                    {
                      uint64_t v39 = [a1 itemFromSerializedItem:v12 withItemClass:v28 forType:v38 nameIfKnown:v93 sourceName:v94 attributionSet:v92 cachingIdentifier:v90 completionHandler:v95];
                      if (v39)
                      {
                        v49 = (void *)v39;
                        v95[2](v95, v39, 0);

                        id v16 = v90;
                        id v50 = v87;
                        goto LABEL_89;
                      }
                    }
                  }
                  uint64_t v35 = [v33 countByEnumeratingWithState:&v115 objects:v131 count:16];
                  if (v35) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v30 = v80;
              long long v29 = obj;
            }
            uint64_t v82 = [obj countByEnumeratingWithState:&v119 objects:v132 count:16];
          }
          while (v82);
        }

        ++v27;
        uint64_t v26 = v76;
        uint64_t v24 = v87;
      }
      while (v27 != v78);
      uint64_t v25 = [v87 countByEnumeratingWithState:&v123 objects:v133 count:16];
    }
    while (v25);
  }

  uint64_t v40 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obja = v89;
  uint64_t v41 = [obja countByEnumeratingWithState:&v111 objects:v130 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    int v43 = 0;
    uint64_t v44 = *(void *)v112;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v112 != v44) {
          objc_enumerationMutation(obja);
        }
        v46 = *(void **)(*((void *)&v111 + 1) + 8 * k);
        v47 = +[WFContentItemRegistry sharedRegistry];
        uint64_t v48 = [v47 contentItemClassForType:v46];

        if (v48) {
          [v40 addObject:v48];
        }
        if (v48 == objc_opt_class()) {
          v43 |= [v46 isDynamic] ^ 1;
        }
      }
      uint64_t v42 = [obja countByEnumeratingWithState:&v111 objects:v130 count:16];
    }
    while (v42);
  }
  else
  {
    LOBYTE(v43) = 0;
  }

  uint64_t v51 = [v40 count];
  id v16 = v90;
  if (v51 >= 2)
  {
    uint64_t v52 = v51;
    uint64_t v53 = [v40 indexOfObject:NSClassFromString(&cfstr_Wfrichtextcont_3.isa)];
    if (v53 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v54 = [MEMORY[0x263F088D0] indexSetWithIndex:v53];
      [v40 moveObjectsAtIndexes:v54 toIndex:0];
    }
    uint64_t v55 = [v40 indexOfObject:NSClassFromString(&cfstr_Wfstringconten_1.isa)];
    if (v55 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v56 = [MEMORY[0x263F088D0] indexSetWithIndex:v55];
      [v40 moveObjectsAtIndexes:v56 toIndex:v52 - 1];
    }
    if ((v43 & 1) == 0)
    {
      uint64_t v57 = [v40 indexOfObject:objc_opt_class()];
      if (v57 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v58 = [MEMORY[0x263F088D0] indexSetWithIndex:v57];
        [v40 moveObjectsAtIndexes:v58 toIndex:v52 - 1];
      }
    }
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v50 = v40;
  uint64_t v59 = [v50 countByEnumeratingWithState:&v107 objects:v129 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v108;
    v88 = v50;
    uint64_t v75 = *(void *)v108;
    do
    {
      uint64_t v61 = 0;
      uint64_t v77 = v59;
      do
      {
        if (*(void *)v108 != v60) {
          objc_enumerationMutation(v50);
        }
        v62 = *(void **)(*((void *)&v107 + 1) + 8 * v61);
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        v63 = [v62 ownedTypes];
        uint64_t v81 = [v63 countByEnumeratingWithState:&v103 objects:v128 count:16];
        if (v81)
        {
          uint64_t v64 = *(void *)v104;
          v83 = v63;
          uint64_t v79 = *(void *)v104;
          do
          {
            for (uint64_t m = 0; m != v81; ++m)
            {
              if (*(void *)v104 != v64) {
                objc_enumerationMutation(v63);
              }
              uint64_t v66 = *(void *)(*((void *)&v103 + 1) + 8 * m);
              long long v99 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              id v67 = obja;
              uint64_t v68 = [v67 countByEnumeratingWithState:&v99 objects:v127 count:16];
              if (v68)
              {
                uint64_t v69 = v68;
                uint64_t v70 = *(void *)v100;
                while (2)
                {
                  for (uint64_t n = 0; n != v69; ++n)
                  {
                    if (*(void *)v100 != v70) {
                      objc_enumerationMutation(v67);
                    }
                    v72 = *(void **)(*((void *)&v99 + 1) + 8 * n);
                    if ([v72 conformsToType:v66])
                    {
                      uint64_t v73 = [a1 itemFromSerializedItem:v96 withItemClass:v62 forType:v72 nameIfKnown:v93 sourceName:v94 attributionSet:v92 cachingIdentifier:v90 completionHandler:v95];
                      if (v73)
                      {
                        v74 = (void *)v73;
                        v95[2](v95, v73, 0);

                        id v50 = v88;
                        goto LABEL_89;
                      }
                    }
                  }
                  uint64_t v69 = [v67 countByEnumeratingWithState:&v99 objects:v127 count:16];
                  if (v69) {
                    continue;
                  }
                  break;
                }
              }

              v63 = v83;
              uint64_t v64 = v79;
            }
            uint64_t v60 = v75;
            uint64_t v81 = [v83 countByEnumeratingWithState:&v103 objects:v128 count:16];
          }
          while (v81);
        }

        ++v61;
        id v50 = v88;
      }
      while (v61 != v77);
      uint64_t v59 = [v88 countByEnumeratingWithState:&v107 objects:v129 count:16];
    }
    while (v59);
  }

  v95[2](v95, 0, 0);
LABEL_89:

  id v13 = v85;
  id v11 = v86;
  id v15 = v84;
  id v14 = v92;
LABEL_90:
}

uint64_t __79__WFContentItem_getContentItemFromSerializedItem_sourceName_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F852B8] typeFromPasteboardType:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasFileOutput
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [a1 ownedTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_18;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a1, "outputTypes", 0, 0);
  uint64_t v8 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
LABEL_11:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v3);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v8) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v8) = 1;
  }
LABEL_19:

  return v8;
}

+ (BOOL)hasStringOutput
{
  id v3 = +[WFStringContentItem ownedTypes];
  uint64_t v4 = [a1 ownedTypes];
  if ([v3 intersectsOrderedSet:v4])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = +[WFStringContentItem ownedTypes];
    uint64_t v7 = [a1 outputTypes];
    char v5 = [v6 intersectsOrderedSet:v7];
  }
  return v5;
}

+ (BOOL)isContentItemSubclass
{
  return objc_opt_class() != (void)a1;
}

+ (id)itemWithFile:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFContentItem.m", 168, @"object must be a WFFileRepresentation, use itemWithObject: for objects" object file lineNumber description];
  }
  id v16 = 0;
  id v11 = WFMakeContentAttributionSetFromOrigin(v10, a5, MEMORY[0x263EFFA68], &v16);
  id v12 = v16;
  long long v13 = [a1 itemWithFile:v9 attributionSet:v11 cachingIdentifier:v12];

  return v13;
}

+ (id)itemWithFile:(id)a3 attributionSet:(id)a4 cachingIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFContentItem.m", 163, @"object must be a WFFileRepresentation, use itemWithObject: for objects" object file lineNumber description];
  }
  id v12 = [a1 itemWithRepresentation:v9 attributionSet:v10 cachingIdentifier:v11];

  return v12;
}

+ (id)itemWithFile:(id)a3 attributionSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFContentItem.m", 158, @"object must be a WFFileRepresentation, use itemWithObject: for objects" object file lineNumber description];
  }
  id v9 = [a1 itemWithRepresentation:v7 attributionSet:v8];

  return v9;
}

+ (id)itemWithFile:(id)a3
{
  return (id)[a1 itemWithFile:a3 attributionSet:0];
}

+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4 includesDefaultAttributionSet:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 wfType];
  id v11 = [a1 itemWithRepresentation:v9 forType:v10 attributionSet:v8 includesDefaultAttributionSet:v5];

  return v11;
}

+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4 cachingIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 wfType];
  id v12 = [a1 itemWithRepresentation:v10 forType:v11 attributionSet:v9 cachingIdentifier:v8];

  return v12;
}

+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 wfType];
  id v9 = [a1 itemWithRepresentation:v7 forType:v8 attributionSet:v6];

  return v9;
}

+ (id)itemWithRepresentation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 wfType];
  id v6 = [a1 itemWithRepresentation:v4 forType:v5];

  return v6;
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6 cachingIdentifier:(id)a7
{
  BOOL v8 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([a1 isContentItemSubclass])
  {
    id v31 = v14;
    id v32 = v12;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v16 = [a1 ownedTypes];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      uint64_t v20 = *MEMORY[0x263F1DA48];
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (([v13 conformsToType:v22] & 1) == 0)
          {
            if (![v22 isEqualToUTType:v20]) {
              continue;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
          id v28 = objc_alloc((Class)a1);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v29 = v22;
          }
          else {
            id v29 = v13;
          }
          id v14 = v31;
          id v12 = v32;
          id v23 = (void *)[v28 initWithRepresentation:v32 forType:v29 attributionSet:v31 includesDefaultAttributionSet:v8 cachingIdentifier:v15];

          goto LABEL_22;
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v23 = 0;
    id v14 = v31;
    id v12 = v32;
  }
  else
  {
    uint64_t v24 = +[WFContentItemRegistry sharedRegistry];
    uint64_t v25 = (void *)[v24 contentItemClassForType:v13];

    if (!v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DA48]];

        uint64_t v27 = +[WFContentItemRegistry sharedRegistry];
        uint64_t v25 = (void *)[v27 contentItemClassForType:v26];

        id v13 = (id)v26;
      }
      else
      {
        uint64_t v25 = 0;
      }
    }
    id v23 = [v25 itemWithRepresentation:v12 forType:v13 attributionSet:v14 cachingIdentifier:v15];
  }
LABEL_22:

  return v23;
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6
{
  return (id)[a1 itemWithRepresentation:a3 forType:a4 attributionSet:a5 includesDefaultAttributionSet:a6 cachingIdentifier:0];
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6
{
  return (id)[a1 itemWithRepresentation:a3 forType:a4 attributionSet:a5 includesDefaultAttributionSet:1 cachingIdentifier:a6];
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5
{
  return (id)[a1 itemWithRepresentation:a3 forType:a4 attributionSet:a5 includesDefaultAttributionSet:1];
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4
{
  return (id)[a1 itemWithRepresentation:a3 forType:a4 attributionSet:0];
}

+ (id)itemWithObject:(id)a3 named:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"WFContentItem.m", 97, @"object should not be a WFFileRepresentation, use itemWithFile: for files" object file lineNumber description];
  }
  id v15 = +[WFObjectRepresentation object:v11 named:v12];
  id v16 = [a1 itemWithRepresentation:v15 attributionSet:v14 cachingIdentifier:v13];

  return v16;
}

+ (id)itemWithObject:(id)a3 named:(id)a4 attributionSet:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFContentItem.m", 92, @"object should not be a WFFileRepresentation, use itemWithFile: for files" object file lineNumber description];
  }
  id v12 = +[WFObjectRepresentation object:v9 named:v10];
  id v13 = [a1 itemWithRepresentation:v12 attributionSet:v11];

  return v13;
}

+ (id)itemWithObject:(id)a3 named:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFContentItem.m", 87, @"object should not be a WFFileRepresentation, use itemWithFile: for files" object file lineNumber description];
  }
  id v9 = +[WFObjectRepresentation object:v7 named:v8];
  id v10 = [a1 itemWithRepresentation:v9];

  return v10;
}

+ (id)itemWithObject:(id)a3 attributionSet:(id)a4
{
  return (id)[a1 itemWithObject:a3 named:0 attributionSet:a4];
}

+ (id)itemWithObject:(id)a3 privacyConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 origin];
  uint64_t v9 = [v6 disclosureLevel];
  id v10 = [v6 disclosureWarnings];

  id v11 = [v10 array];
  id v16 = 0;
  id v12 = WFMakeContentAttributionSetFromOrigin(v8, v9, v11, &v16);
  id v13 = v16;

  id v14 = [a1 itemWithObject:v7 named:0 attributionSet:v12 cachingIdentifier:v13];

  return v14;
}

+ (id)itemWithObject:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = +[WFContentItemPrivacyConfiguration configurationWithOrigin:a4 disclosureLevel:a5];
  id v10 = [a1 itemWithObject:v8 privacyConfiguration:v9];

  return v10;
}

+ (id)itemWithObject:(id)a3
{
  return (id)[a1 itemWithObject:a3 named:0];
}

- (void)getFileRepresentations:(id)a3 forType:(id)a4
{
}

- (void)getFileRepresentation:(id)a3 forType:(id)a4
{
}

- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4
{
}

- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4
{
}

- (void)coerceToItemClasses:(id)a3 completionHandler:(id)a4
{
  id v5 = +[WFCoercionRequest _requestForCoercingToContentClasses:a3 itemCompletionHandler:a4];
  [(WFContentItem *)self performCoercion:v5];
}

- (void)coerceToItemClass:(Class)a3 completionHandler:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  Class v8 = a3;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a4;
  id v7 = [v5 arrayWithObjects:&v8 count:1];
  -[WFContentItem coerceToItemClasses:completionHandler:](self, "coerceToItemClasses:completionHandler:", v7, v6, v8, v9);
}

- (BOOL)isCoercibleToItemClasses:(id)a3
{
  id v4 = +[WFCoercionRequest requestForCoercingToContentClasses:a3 completionHandler:0];
  LOBYTE(self) = [(WFContentItem *)self canPerformCoercion:v4];

  return (char)self;
}

- (BOOL)isCoercibleToItemClass:(Class)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = a3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  LOBYTE(self) = [(WFContentItem *)self isCoercibleToItemClasses:v4];

  return (char)self;
}

- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = +[WFCoercionRequest requestForCoercingToObjectClass:a4 completionHandler:a3];
  [v9 setOptions:v8];

  [(WFContentItem *)self performCoercion:v9];
}

- (void)getFileRepresentations:(id)a3 forType:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = +[WFCoercionRequest requestForCoercingToFileType:a4 completionHandler:a3];
  [v9 setOptions:v8];

  [(WFContentItem *)self performCoercion:v9];
}

- (void)getFileRepresentation:(id)a3 forType:(id)a4 options:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __76__WFContentItem_CoercionConvenience__getFileRepresentation_forType_options___block_invoke;
  v10[3] = &unk_26428AF18;
  id v11 = v8;
  id v9 = v8;
  [(WFContentItem *)self getFileRepresentations:v10 forType:a4 options:a5];
}

void __76__WFContentItem_CoercionConvenience__getFileRepresentation_forType_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4 options:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __79__WFContentItem_CoercionConvenience__getObjectRepresentation_forClass_options___block_invoke;
  v10[3] = &unk_26428AFB0;
  id v11 = v8;
  id v9 = v8;
  [(WFContentItem *)self getObjectRepresentations:v10 forClass:a4 options:a5];
}

void __79__WFContentItem_CoercionConvenience__getObjectRepresentation_forClass_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a4;
  id v8 = [a3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v8 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v11 firstObject];
  (*(void (**)(uint64_t, void *, void *, id))(v9 + 16))(v9, v10, v8, v7);
}

+ (id)badCoercionErrorForObjectClass:(Class)a3
{
  uint64_t v4 = +[WFObjectType typeWithClass:a3];
  id v5 = [a1 badCoercionErrorForType:v4];

  return v5;
}

+ (id)badCoercionErrorForType:(id)a3
{
  id v4 = a3;
  id v5 = +[WFContentItemRegistry sharedRegistry];
  id v6 = (void *)[v5 contentItemClassForType:v4];

  if ([v6 isSubclassOfClass:a1]) {
    [v4 typeDescription];
  }
  else {
  id v7 = [v6 localizedTypeDescription];
  }
  id v8 = objc_opt_class();
  uint64_t v9 = [a1 localizedTypeDescription];
  id v10 = [v8 badCoercionErrorForTypeDescription:v9 toTypeDescription:v7];

  return v10;
}

+ (id)badCoercionErrorForItemClass:(Class)a3
{
  id v5 = objc_opt_class();
  id v6 = [a1 localizedTypeDescription];
  id v7 = [(objc_class *)a3 localizedTypeDescription];
  id v8 = [v5 badCoercionErrorForTypeDescription:v6 toTypeDescription:v7];

  return v8;
}

+ (id)badCoercionErrorForItemClasses:(id)a3
{
  id v4 = [a3 valueForKey:@"localizedTypeDescription"];
  id v5 = objc_opt_new();
  if ([v4 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      id v8 = [v4 objectAtIndexedSubscript:v7];
      [v5 appendString:v8];

      unint64_t v9 = [v4 count] + v6;
      id v10 = @", ";
      if (v9 > 2
        || [v4 count] - 2 == v7 && (v11 = objc_msgSend(v4, "count"), id v10 = @", or ", v11 > 2)
        || [v4 count] == 2 && (id v10 = @" or ", !v7))
      {
        id v12 = WFLocalizedString(v10);
        [v5 appendString:v12];
      }
      ++v7;
      --v6;
    }
    while (v7 < [v4 count]);
  }
  id v13 = objc_opt_class();
  id v14 = [a1 localizedTypeDescription];
  id v15 = [v13 badCoercionErrorForTypeDescription:v14 toTypeDescription:v5];

  return v15;
}

+ (id)badCoercionErrorForTypeDescription:(id)a3 toTypeDescription:(id)a4
{
  id v6 = a4;
  unint64_t v7 = NSString;
  id v8 = a3;
  if (v6)
  {
    unint64_t v9 = WFLocalizedString(@"Shortcuts couldn’t convert from %@ to %@");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    unint64_t v9 = WFLocalizedString(@"Shortcuts couldn’t convert from %@ to the required type");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v13);
  id v10 = };

  unint64_t v11 = [a1 badCoercionErrorWithReasonString:v10];

  return v11;
}

+ (id)badCoercionErrorWithReasonString:(id)a3
{
  void v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLocalizedString(@"Conversion Error");
  id v6 = NSString;
  unint64_t v7 = WFLocalizedString(@"%@ failed because %@.");
  id v8 = [a1 badCoercionErrorDefaultResponsibleComponent];
  unint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v4);

  id v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  v15[0] = *MEMORY[0x263F08338];
  v15[1] = v11;
  v16[0] = v5;
  v16[1] = v9;
  id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v13 = [v10 errorWithDomain:@"WFContentItemErrorDomain" code:0 userInfo:v12];

  return v13;
}

+ (BOOL)errorIsBadCoercionError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"WFContentItemErrorDomain"]) {
    BOOL v5 = [v3 code] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (NSArray)pasteboardValueClasses
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v2 = +[WFObjectType typeWithClassName:@"UIImage", @"UIKit", 2, v5, v6, v7, v8, v9, objc_opt_class() frameworkName location];
  uint64_t v10 = [v2 objectClass];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:9];

  return (NSArray *)v3;
}

@end