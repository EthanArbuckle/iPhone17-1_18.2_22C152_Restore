@interface CNEntitySpotlightIndexing
+ (void)associateAttributeSet:(id)a3 withContactEntityIdentifiedBy:(id)a4;
@end

@implementation CNEntitySpotlightIndexing

+ (void)associateAttributeSet:(id)a3 withContactEntityIdentifiedBy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v7 = (void *)getLNSpotlightAppEntityMapperClass_softClass;
  uint64_t v17 = getLNSpotlightAppEntityMapperClass_softClass;
  if (!getLNSpotlightAppEntityMapperClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getLNSpotlightAppEntityMapperClass_block_invoke;
    v13[3] = &unk_1E56B45C0;
    v13[4] = &v14;
    __getLNSpotlightAppEntityMapperClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v14, 8);
  v9 = +[CNContactEntityIdentifierProvider EntityTypeIdentifier];
  uint64_t v10 = [v5 displayName];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = &stru_1EE052B80;
  }
  [v8 tagCSSearchableItem:v5 entityInstanceIdentifier:v6 typeIdentifier:v9 displayTitle:v12 displaySubtitle:0 displaySynonyms:0 typeDisplayName:0 typeDisplaySynonyms:0 propertyDictionary:0 priority:&unk_1EE0893B0];
}

@end