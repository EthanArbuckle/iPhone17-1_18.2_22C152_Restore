@interface SortKeyTrashDate
@end

@implementation SortKeyTrashDate

id PHQueryForAssetsInAlbum_SortKeyTrashDate_block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    v12 = "PHQueryForAssetsInAlbum_SortKeyTrashDate_block_invoke_97";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v7 = v2[2](v2);
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

@end