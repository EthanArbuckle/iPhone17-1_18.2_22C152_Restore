@interface MusicKit_SoftLinking_MPModelLibraryRequest
- (BOOL)wantsDetailedKeepLocalRequestableResponse;
- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObject:(id)a3 itemType:(int64_t)a4 properties:(id)a5 relationships:(id)a6;
- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObjectType:(int64_t)a3 itemKind:(id)a4 allowedItemIdentifiers:(id)a5 allowedItemIdentifierSets:(id)a6 itemSortDescriptors:(id)a7 itemFilterText:(id)a8 itemPropertyFilters:(id)a9 range:(_NSRange)a10 filteringOptions:(id)a11 mediaLibrary:(id)a12;
- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObjectType:(int64_t)a3 sectionLegacyModelObjectType:(int64_t)a4 itemKind:(id)a5 sectionKind:(id)a6 allowedItemIdentifiers:(id)a7 allowedSectionIdentifiers:(id)a8 allowedItemIdentifierSets:(id)a9 allowedSectionIdentifierSets:(id)a10 scopedContainers:(id)a11 itemSortDescriptors:(id)a12 sectionSortDescriptors:(id)a13 itemFilterText:(id)a14 sectionFilterText:(id)a15 itemPropertyFilters:(id)a16 sectionPropertyFilters:(id)a17 range:(_NSRange)a18 filteringOptions:(id)a19 mediaLibrary:(id)a20;
- (NSArray)allowedItemIdentifiers;
- (NSArray)allowedSectionIdentifiers;
- (NSArray)itemSortDescriptors;
- (NSArray)scopedContainers;
- (NSArray)sectionSortDescriptors;
- (NSString)itemFilterText;
- (NSString)sectionFilterText;
- (_NSRange)range;
- (void)performWithCompletionHandler:(id)a3;
- (void)setAllowedItemIdentifiers:(id)a3;
- (void)setAllowedSectionIdentifiers:(id)a3;
- (void)setItemFilterText:(id)a3;
- (void)setItemSortDescriptors:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setScopedContainers:(id)a3;
- (void)setSectionFilterText:(id)a3;
- (void)setSectionSortDescriptors:(id)a3;
- (void)setUnderlyingRequest:(id)a3;
- (void)setWantsDetailedKeepLocalRequestableResponse:(BOOL)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryRequest

- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObjectType:(int64_t)a3 sectionLegacyModelObjectType:(int64_t)a4 itemKind:(id)a5 sectionKind:(id)a6 allowedItemIdentifiers:(id)a7 allowedSectionIdentifiers:(id)a8 allowedItemIdentifierSets:(id)a9 allowedSectionIdentifierSets:(id)a10 scopedContainers:(id)a11 itemSortDescriptors:(id)a12 sectionSortDescriptors:(id)a13 itemFilterText:(id)a14 sectionFilterText:(id)a15 itemPropertyFilters:(id)a16 sectionPropertyFilters:(id)a17 range:(_NSRange)a18 filteringOptions:(id)a19 mediaLibrary:(id)a20
{
  id v92 = a5;
  id v23 = a6;
  id obj = a7;
  id v96 = a7;
  id v80 = a8;
  id v95 = a8;
  id v24 = a11;
  id v82 = a12;
  id v93 = a13;
  id v25 = a14;
  id v94 = a15;
  id v26 = a20;
  id v27 = a17;
  id v28 = a16;
  id v29 = a10;
  id v30 = a9;
  id v31 = objc_alloc_init((Class)getMPModelLibraryRequestClass());
  v89 = v23;
  v83 = v28;
  v84 = v27;
  v97 = v25;
  if (v23) {
    objc_msgSend(v23, "_underlyingKind", obj, v80);
  }
  else {
  v32 = +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:](MusicKit_SoftLinking_MPModelKind, "_modelKindForModelObjectType:", a4, obj, v80);
  }
  v33 = +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:v32];
  [v31 setSectionKind:v33];

  v34 = self;
  v35 = [(id)objc_opt_class() _supportedPropertiesForModelObjectType:a4];
  [v31 setSectionProperties:v35];

  [v31 setSectionSortDescriptors:v93];
  [v31 setSectionFilterText:v94];
  v102[0] = MEMORY[0x263EF8330];
  v102[1] = 3221225472;
  v102[2] = __402__MusicKit_SoftLinking_MPModelLibraryRequest_initWithLegacyModelObjectType_sectionLegacyModelObjectType_itemKind_sectionKind_allowedItemIdentifiers_allowedSectionIdentifiers_allowedItemIdentifierSets_allowedSectionIdentifierSets_scopedContainers_itemSortDescriptors_sectionSortDescriptors_itemFilterText_sectionFilterText_itemPropertyFilters_sectionPropertyFilters_range_filteringOptions_mediaLibrary___block_invoke;
  v102[3] = &unk_26443FCA8;
  int64_t v104 = a4;
  id v36 = v26;
  id v103 = v36;
  v37 = objc_msgSend(v95, "msv_map:", v102);
  v38 = (void *)[v37 mutableCopy];

  [v38 addObjectsFromArray:v29];
  [v31 setAllowedSectionIdentifiers:v38];
  v85 = v38;
  if (a4 == 19)
  {
    v41 = v24;
    if ([v24 count]) {
      [v31 setSectionKind:0];
    }
    v46 = [v92 _underlyingKind];
    v47 = +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:v46];
    [v31 setItemKind:v47];

    v34 = self;
    goto LABEL_15;
  }
  if (a4 != 15)
  {
    v41 = v24;
    v46 = [v92 _underlyingKind];
    v48 = +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:v46];
    [v31 setItemKind:v48];

LABEL_15:
    v49 = [(id)objc_opt_class() _supportedPropertiesForModelObjectType:a3];
    [v31 setItemProperties:v49];

    int64_t v39 = a3;
    id v43 = v82;
    NSUInteger length = a18.length;
    goto LABEL_25;
  }
  int64_t v39 = a3;
  NSUInteger length = a18.length;
  if (a3 > 25)
  {
    if (a3 == 26)
    {
      v41 = v24;
      uint64_t v50 = +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistEntryKindForSongs];
    }
    else
    {
      if (a3 != 30) {
        goto LABEL_28;
      }
      v41 = v24;
      uint64_t v50 = +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistEntryKindForTracks];
    }
    v51 = (void *)v50;
    v52 = +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:v50];
    [v31 setItemKind:v52];

    int64_t v39 = a3;
LABEL_22:
    id v43 = v82;

    goto LABEL_23;
  }
  if (a3 == 14)
  {
    v41 = v24;
    v51 = +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistEntryKindForMusicVideos];
    [v31 setItemKind:v51];
    goto LABEL_22;
  }
  if (a3 != 19)
  {
LABEL_28:
    v41 = v24;
    v76 = [v92 _underlyingKind];
    v77 = +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:v76];
    [v31 setItemKind:v77];

    int64_t v39 = a3;
    id v43 = v82;
    if ((unint64_t)a3 > 0x23 || ((1 << a3) & 0xC80002000) == 0) {
      goto LABEL_10;
    }
LABEL_23:
    v34 = self;
    v44 = objc_opt_class();
    uint64_t v45 = 17;
    goto LABEL_24;
  }
  v41 = v24;
  [v31 setSectionKind:0];
  v42 = [v92 _underlyingKind];
  [v31 setItemKind:v42];

  id v43 = v82;
LABEL_10:
  v34 = self;
  v44 = objc_opt_class();
  uint64_t v45 = v39;
LABEL_24:
  v46 = [v44 _supportedPropertiesForModelObjectType:v45];
  [v31 setItemProperties:v46];
LABEL_25:

  v91 = v41;
  uint64_t v53 = objc_msgSend(v41, "msv_map:", &__block_literal_global_1);
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __402__MusicKit_SoftLinking_MPModelLibraryRequest_initWithLegacyModelObjectType_sectionLegacyModelObjectType_itemKind_sectionKind_allowedItemIdentifiers_allowedSectionIdentifiers_allowedItemIdentifierSets_allowedSectionIdentifierSets_scopedContainers_itemSortDescriptors_sectionSortDescriptors_itemFilterText_sectionFilterText_itemPropertyFilters_sectionPropertyFilters_range_filteringOptions_mediaLibrary___block_invoke_3;
  v99[3] = &unk_26443FCA8;
  int64_t v101 = v39;
  id v54 = v36;
  id v100 = v54;
  v55 = objc_msgSend(v96, "msv_map:", v99);
  v56 = (void *)[v55 mutableCopy];

  [v56 addObjectsFromArray:v30];
  [v31 setItemSortDescriptors:v43];
  [v31 setFilterText:v97];
  [v31 setAllowedItemIdentifiers:v56];
  v88 = (void *)v53;
  [v31 setScopedContainers:v53];
  objc_msgSend(v31, "setContentRange:", a18.location, length);
  [v31 setWantsDetailedKeepLocalRequestableResponse:(*(unint64_t *)&a19 >> 8) & 1];
  v57 = [v54 _underlyingMediaLibrary];
  [v31 setMediaLibrary:v57];

  v58 = objc_msgSend(v83, "msv_map:", &__block_literal_global_5);

  v59 = objc_msgSend(v84, "msv_map:", &__block_literal_global_7);

  [v31 setItemPropertyFilters:v58];
  [v31 setSectionPropertyFilters:v59];
  uint64x2_t v60 = (uint64x2_t)vdupq_n_s64(*(void *)&a19);
  int8x16_t v61 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v60, (uint64x2_t)xmmword_21D2F2AF0), (int8x16_t)xmmword_21D2F2B20), vandq_s8((int8x16_t)vshlq_u64(v60, (uint64x2_t)xmmword_21D2F2B00), (int8x16_t)xmmword_21D2F2B10));
  objc_msgSend(v31, "setFilteringOptions:", *(void *)&vorr_s8(*(int8x8_t *)v61.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL)) | (2 * a19.var0) | (*(unint64_t *)&a19 >> 9) & 0x800000 | (*(unint64_t *)&a19 >> 16) & 0x1000000);
  v98.receiver = v34;
  v98.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequest;
  v62 = [(MusicKit_SoftLinking_MPModelRequest *)&v98 _initWithUnderlyingRequest:v31];
  v63 = v43;
  v64 = (MusicKit_SoftLinking_MPModelLibraryRequest *)v62;
  if (v62)
  {
    objc_storeStrong(v62 + 3, obja);
    objc_storeStrong((id *)&v64->_allowedSectionIdentifiers, v81);
    uint64_t v65 = [v91 copy];
    scopedContainers = v64->_scopedContainers;
    v64->_scopedContainers = (NSArray *)v65;

    uint64_t v67 = [v63 copy];
    itemSortDescriptors = v64->_itemSortDescriptors;
    v64->_itemSortDescriptors = (NSArray *)v67;

    uint64_t v69 = [v93 copy];
    sectionSortDescriptors = v64->_sectionSortDescriptors;
    v64->_sectionSortDescriptors = (NSArray *)v69;

    uint64_t v71 = [v97 copy];
    itemFilterText = v64->_itemFilterText;
    v64->_itemFilterText = (NSString *)v71;

    uint64_t v73 = [v94 copy];
    sectionFilterText = v64->_sectionFilterText;
    v64->_sectionFilterText = (NSString *)v73;

    v64->_range = a18;
    v64->_wantsDetailedKeepLocalRequestableResponse = (unsigned __int16)(*(_WORD *)&a19.var0 & 0x100) >> 8;
  }

  return v64;
}

- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObjectType:(int64_t)a3 itemKind:(id)a4 allowedItemIdentifiers:(id)a5 allowedItemIdentifierSets:(id)a6 itemSortDescriptors:(id)a7 itemFilterText:(id)a8 itemPropertyFilters:(id)a9 range:(_NSRange)a10 filteringOptions:(id)a11 mediaLibrary:(id)a12
{
  id v17 = a5;
  id v38 = a8;
  id v39 = a7;
  id v40 = a8;
  id v18 = a12;
  id v42 = a9;
  id v19 = a6;
  id v20 = a4;
  id v21 = objc_alloc_init((Class)getMPModelLibraryRequestClass());
  [v21 setSectionKind:0];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __225__MusicKit_SoftLinking_MPModelLibraryRequest_initWithLegacyModelObjectType_itemKind_allowedItemIdentifiers_allowedItemIdentifierSets_itemSortDescriptors_itemFilterText_itemPropertyFilters_range_filteringOptions_mediaLibrary___block_invoke;
  v44[3] = &unk_26443FCA8;
  int64_t v46 = a3;
  id v22 = v18;
  id v45 = v22;
  id v23 = objc_msgSend(v17, "msv_map:", v44);
  id v24 = (void *)[v23 mutableCopy];

  [v24 addObjectsFromArray:v19];
  id v25 = [v20 _underlyingKind];

  id v26 = +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:v25];
  [v21 setItemKind:v26];

  id v27 = [(id)objc_opt_class() _supportedPropertiesForModelObjectType:a3];
  [v21 setItemProperties:v27];

  [v21 setItemSortDescriptors:v39];
  [v21 setFilterText:v40];
  [v21 setAllowedItemIdentifiers:v24];
  objc_msgSend(v21, "setContentRange:", a10.location, a10.length);
  [v21 setWantsDetailedKeepLocalRequestableResponse:(*(unint64_t *)&a11 >> 8) & 1];
  id v28 = [v22 _underlyingMediaLibrary];
  [v21 setMediaLibrary:v28];

  id v29 = objc_msgSend(v42, "msv_map:", &__block_literal_global_9);

  [v21 setItemPropertyFilters:v29];
  uint64x2_t v30 = (uint64x2_t)vdupq_n_s64(*(void *)&a11);
  int8x16_t v31 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v30, (uint64x2_t)xmmword_21D2F2AF0), (int8x16_t)xmmword_21D2F2B20), vandq_s8((int8x16_t)vshlq_u64(v30, (uint64x2_t)xmmword_21D2F2B00), (int8x16_t)xmmword_21D2F2B10));
  objc_msgSend(v21, "setFilteringOptions:", *(void *)&vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL)) | (2 * a11.var0) | (*(unint64_t *)&a11 >> 9) & 0x800000 | (*(unint64_t *)&a11 >> 16) & 0x1000000);
  v43.receiver = self;
  v43.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequest;
  v32 = [(MusicKit_SoftLinking_MPModelRequest *)&v43 _initWithUnderlyingRequest:v21];
  v33 = (MusicKit_SoftLinking_MPModelLibraryRequest *)v32;
  if (v32)
  {
    objc_storeStrong(v32 + 3, a5);
    uint64_t v34 = [v39 copy];
    itemSortDescriptors = v33->_itemSortDescriptors;
    v33->_itemSortDescriptors = (NSArray *)v34;

    objc_storeStrong((id *)&v33->_itemFilterText, v38);
    v33->_range = a10;
    v33->_wantsDetailedKeepLocalRequestableResponse = (unsigned __int16)(*(_WORD *)&a11.var0 & 0x100) >> 8;
  }

  return v33;
}

- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObject:(id)a3 itemType:(int64_t)a4 properties:(id)a5 relationships:(id)a6
{
  v30[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init((Class)getMPModelLibraryRequestClass());
  [v13 setSectionKind:0];
  v14 = +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:a4];
  [v13 setItemKind:v14];

  v15 = [v10 _underlyingModelObject];
  v16 = [v15 identifiers];
  v30[0] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];

  [v13 setAllowedItemIdentifiers:v17];
  id v18 = +[MusicKit_SoftLinking_MPModelRequest _propertySetForRawProperties:v11 relationships:v12];
  [v13 setItemProperties:v18];

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v19 = (void *)getMPMediaLibraryClass_softClass;
  uint64_t v29 = getMPMediaLibraryClass_softClass;
  if (!getMPMediaLibraryClass_softClass)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __getMPMediaLibraryClass_block_invoke;
    v25[3] = &unk_26443F950;
    v25[4] = &v26;
    __getMPMediaLibraryClass_block_invoke((uint64_t)v25);
    id v19 = (void *)v27[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v26, 8);
  id v21 = [v20 deviceMediaLibrary];
  [v13 setMediaLibrary:v21];

  v24.receiver = self;
  v24.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequest;
  id v22 = [(MusicKit_SoftLinking_MPModelRequest *)&v24 _initWithUnderlyingRequest:v13];

  return v22;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (MRMediaRemoteIsMusicAppInstalled())
  {
    v5 = [(MusicKit_SoftLinking_MPModelRequest *)self _underlyingRequest];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__MusicKit_SoftLinking_MPModelLibraryRequest_performWithCompletionHandler___block_invoke;
    v7[3] = &unk_26443FD10;
    id v8 = v4;
    [v5 performWithResponseHandler:v7];
  }
  else
  {
    v6 = MusicKit_Logging_Library();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MusicKit_SoftLinking_MPModelLibraryRequest performWithCompletionHandler:](v6);
    }

    v5 = objc_msgSend(MEMORY[0x263F087E8], "musicKit_defaultLibraryError");
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v5);
  }
}

- (NSArray)allowedItemIdentifiers
{
  return self->_allowedItemIdentifiers;
}

- (void)setAllowedItemIdentifiers:(id)a3
{
}

- (NSArray)allowedSectionIdentifiers
{
  return self->_allowedSectionIdentifiers;
}

- (void)setAllowedSectionIdentifiers:(id)a3
{
}

- (NSArray)scopedContainers
{
  return self->_scopedContainers;
}

- (void)setScopedContainers:(id)a3
{
}

- (NSArray)itemSortDescriptors
{
  return self->_itemSortDescriptors;
}

- (void)setItemSortDescriptors:(id)a3
{
}

- (NSArray)sectionSortDescriptors
{
  return self->_sectionSortDescriptors;
}

- (void)setSectionSortDescriptors:(id)a3
{
}

- (NSString)itemFilterText
{
  return self->_itemFilterText;
}

- (void)setItemFilterText:(id)a3
{
}

- (NSString)sectionFilterText
{
  return self->_sectionFilterText;
}

- (void)setSectionFilterText:(id)a3
{
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (BOOL)wantsDetailedKeepLocalRequestableResponse
{
  return self->_wantsDetailedKeepLocalRequestableResponse;
}

- (void)setWantsDetailedKeepLocalRequestableResponse:(BOOL)a3
{
  self->_wantsDetailedKeepLocalRequestableResponse = a3;
}

- (void)setUnderlyingRequest:(id)a3
{
  self->_underlyingRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFilterText, 0);
  objc_storeStrong((id *)&self->_itemFilterText, 0);
  objc_storeStrong((id *)&self->_sectionSortDescriptors, 0);
  objc_storeStrong((id *)&self->_itemSortDescriptors, 0);
  objc_storeStrong((id *)&self->_scopedContainers, 0);
  objc_storeStrong((id *)&self->_allowedSectionIdentifiers, 0);

  objc_storeStrong((id *)&self->_allowedItemIdentifiers, 0);
}

- (void)performWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21CC71000, log, OS_LOG_TYPE_ERROR, "Failed to perform MusicKit library request because the Music application is not installed.", v1, 2u);
}

@end