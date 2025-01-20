@interface GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand)init;
- (GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsBusinessCardAltCategories:(uint64_t)a1;
- (void)_addNoFlagsBusinessCardModernAlternateCategories:(uint64_t)a1;
- (void)_addNoFlagsCategory:(uint64_t)a1;
- (void)_addNoFlagsModernPrimaryCategoryIcon:(uint64_t)a1;
- (void)_addNoFlagsPrefCategoryIcon:(uint64_t)a1;
- (void)_readBusinessCardAltCategories;
- (void)_readBusinessCardModernAlternateCategories;
- (void)_readCategorys;
- (void)addBusinessCardAltCategories:(os_unfair_lock_s *)a1;
- (void)addBusinessCardModernAlternateCategories:(os_unfair_lock_s *)a1;
- (void)addCategory:(os_unfair_lock_s *)a1;
- (void)addModernPrimaryCategoryIcon:(uint64_t)a1;
- (void)addPrefCategoryIcon:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand

- (void)_readCategorys
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(unsigned char *)(a1 + 169) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorys_tags_3462);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
}

- (GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand;
  v2 = [(GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand;
  id v3 = [(GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addCategory:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readCategorys]((uint64_t)a1);
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsCategory:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[42]._os_unfair_lock_opaque |= 0x200u;
    os_unfair_lock_unlock(a1 + 40);
    a1[42]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addPrefCategoryIcon:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 169) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefCategoryIcons_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsPrefCategoryIcon:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 168) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_DWORD *)(a1 + 168) |= 0x40000u;
  }
}

- (void)_addNoFlagsPrefCategoryIcon:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readBusinessCardAltCategories
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(unsigned char *)(a1 + 168) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessCardAltCategories_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
}

- (void)addBusinessCardAltCategories:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardAltCategories]((uint64_t)a1);
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsBusinessCardAltCategories:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[42]._os_unfair_lock_opaque |= 0x10u;
    os_unfair_lock_unlock(a1 + 40);
    a1[42]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsBusinessCardAltCategories:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addModernPrimaryCategoryIcon:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 169) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModernPrimaryCategoryIcons_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsModernPrimaryCategoryIcon:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 168) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_DWORD *)(a1 + 168) |= 0x40000u;
  }
}

- (void)_addNoFlagsModernPrimaryCategoryIcon:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readBusinessCardModernAlternateCategories
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(unsigned char *)(a1 + 168) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessCardModernAlternateCategories_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
}

- (void)addBusinessCardModernAlternateCategories:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardModernAlternateCategories]((uint64_t)a1);
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsBusinessCardModernAlternateCategories:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[42]._os_unfair_lock_opaque |= 0x20u;
    os_unfair_lock_unlock(a1 + 40);
    a1[42]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsBusinessCardModernAlternateCategories:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand;
  v4 = [(GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *)&v8 description];
  id v5 = [(GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 168) & 2) != 0)
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 104)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 170) & 1) == 0)
    {
      objc_super v6 = *(void **)(a1 + 8);
      if (v6)
      {
        id v7 = v6;
        objc_sync_enter(v7);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefPhone_tags);
        objc_sync_exit(v7);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v8 = *(id *)(a1 + 136);
    if (v8)
    {
      if (a2) {
        v9 = @"prefPhone";
      }
      else {
        v9 = @"pref_phone";
      }
      [v4 setObject:v8 forKey:v9];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 170) & 2) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefUrl_tags);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v12 = *(id *)(a1 + 144);
    if (v12)
    {
      if (a2) {
        v13 = @"prefUrl";
      }
      else {
        v13 = @"pref_url";
      }
      [v4 setObject:v12 forKey:v13];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 169) & 0x80) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefDisplayName_tags);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v16 = *(id *)(a1 + 128);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"prefDisplayName";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"pref_display_name";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if (*(void *)(a1 + 72))
    {
      -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readCategorys](a1);
      id v20 = *(id *)(a1 + 72);
      [v4 setObject:v20 forKey:@"category"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 169) & 4) == 0)
    {
      v21 = *(void **)(a1 + 8);
      if (v21)
      {
        id v22 = v21;
        objc_sync_enter(v22);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_3463);
        objc_sync_exit(v22);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v23 = *(id *)(a1 + 80);
    if (v23)
    {
      if (a2) {
        v24 = @"countryCode";
      }
      else {
        v24 = @"country_code";
      }
      [v4 setObject:v23 forKey:v24];
    }

    int v25 = *(_DWORD *)(a1 + 168);
    if ((v25 & 4) != 0)
    {
      v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 164)];
      if (a2) {
        v27 = @"isUnclaimable";
      }
      else {
        v27 = @"is_unclaimable";
      }
      [v4 setObject:v26 forKey:v27];

      int v25 = *(_DWORD *)(a1 + 168);
    }
    if (v25)
    {
      v28 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        v29 = @"businessCardPoiIconType";
      }
      else {
        v29 = @"business_card_poi_icon_type";
      }
      [v4 setObject:v28 forKey:v29];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 168) & 0x80) == 0)
    {
      v30 = *(void **)(a1 + 8);
      if (v30)
      {
        id v31 = v30;
        objc_sync_enter(v31);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessCardPrefCategory_tags);
        objc_sync_exit(v31);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v32 = *(id *)(a1 + 56);
    if (v32)
    {
      if (a2) {
        v33 = @"businessCardPrefCategory";
      }
      else {
        v33 = @"business_card_pref_category";
      }
      [v4 setObject:v32 forKey:v33];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 169) & 0x40) == 0)
    {
      v34 = *(void **)(a1 + 8);
      if (v34)
      {
        id v35 = v34;
        objc_sync_enter(v35);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefCategoryNames_tags);
        objc_sync_exit(v35);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v36 = *(id *)(a1 + 120);
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        v39 = @"prefCategoryNames";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        v39 = @"pref_category_names";
      }
      [v4 setObject:v38 forKey:v39];
    }
    if ([*(id *)(a1 + 112) count])
    {
      v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v41 = *(id *)(a1 + 112);
      uint64_t v42 = [v41 countByEnumeratingWithState:&v89 objects:v94 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v90 != v43) {
              objc_enumerationMutation(v41);
            }
            v45 = *(void **)(*((void *)&v89 + 1) + 8 * i);
            if (a2) {
              [v45 jsonRepresentation];
            }
            else {
            v46 = [v45 dictionaryRepresentation];
            }
            [v40 addObject:v46];
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v89 objects:v94 count:16];
        }
        while (v42);
      }

      if (a2) {
        v47 = @"prefCategoryIcon";
      }
      else {
        v47 = @"pref_category_icon";
      }
      [v4 setObject:v40 forKey:v47];
    }
    if (*(void *)(a1 + 24))
    {
      -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardAltCategories](a1);
      id v48 = *(id *)(a1 + 24);
      if (a2) {
        v49 = @"businessCardAltCategories";
      }
      else {
        v49 = @"business_card_alt_categories";
      }
      [v4 setObject:v48 forKey:v49];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 168) & 0x40) == 0)
    {
      v50 = *(void **)(a1 + 8);
      if (v50)
      {
        id v51 = v50;
        objc_sync_enter(v51);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessCardModernPrimaryCategory_tags);
        objc_sync_exit(v51);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v52 = *(id *)(a1 + 40);
    if (v52)
    {
      if (a2) {
        v53 = @"businessCardModernPrimaryCategory";
      }
      else {
        v53 = @"business_card_modern_primary_category";
      }
      [v4 setObject:v52 forKey:v53];
    }

    if ([*(id *)(a1 + 88) count])
    {
      v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v55 = *(id *)(a1 + 88);
      uint64_t v56 = [v55 countByEnumeratingWithState:&v85 objects:v93 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v86;
        do
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            if (*(void *)v86 != v57) {
              objc_enumerationMutation(v55);
            }
            v59 = *(void **)(*((void *)&v85 + 1) + 8 * j);
            if (a2) {
              [v59 jsonRepresentation];
            }
            else {
            v60 = [v59 dictionaryRepresentation];
            }
            [v54 addObject:v60];
          }
          uint64_t v56 = [v55 countByEnumeratingWithState:&v85 objects:v93 count:16];
        }
        while (v56);
      }

      if (a2) {
        v61 = @"modernPrimaryCategoryIcon";
      }
      else {
        v61 = @"modern_primary_category_icon";
      }
      [v4 setObject:v54 forKey:v61];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 169) & 0x10) == 0)
    {
      v62 = *(void **)(a1 + 8);
      if (v62)
      {
        id v63 = v62;
        objc_sync_enter(v63);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModernPrimaryCategoryNames_tags);
        objc_sync_exit(v63);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v64 = *(id *)(a1 + 96);
    v65 = v64;
    if (v64)
    {
      if (a2)
      {
        v66 = [v64 jsonRepresentation];
        v67 = @"modernPrimaryCategoryNames";
      }
      else
      {
        v66 = [v64 dictionaryRepresentation];
        v67 = @"modern_primary_category_names";
      }
      [v4 setObject:v66 forKey:v67];
    }
    if (*(void *)(a1 + 32))
    {
      -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardModernAlternateCategories](a1);
      id v68 = *(id *)(a1 + 32);
      if (a2) {
        v69 = @"businessCardModernAlternateCategories";
      }
      else {
        v69 = @"business_card_modern_alternate_categories";
      }
      [v4 setObject:v68 forKey:v69];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 169) & 1) == 0)
    {
      v70 = *(void **)(a1 + 8);
      if (v70)
      {
        id v71 = v70;
        objc_sync_enter(v71);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessConnectAttributes_tags);
        objc_sync_exit(v71);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v72 = *(id *)(a1 + 64);
    v73 = v72;
    if (v72)
    {
      if (a2)
      {
        v74 = [v72 jsonRepresentation];
        v75 = @"businessConnectAttributes";
      }
      else
      {
        v74 = [v72 dictionaryRepresentation];
        v75 = @"business_connect_attributes";
      }
      [v4 setObject:v74 forKey:v75];
    }
    v76 = *(void **)(a1 + 16);
    if (v76)
    {
      v77 = [v76 dictionaryRepresentation];
      v78 = v77;
      if (a2)
      {
        v79 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v77, "count"));
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __85__GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand__dictionaryRepresentation___block_invoke;
        v83[3] = &unk_1E53D8860;
        id v80 = v79;
        id v84 = v80;
        [v78 enumerateKeysAndObjectsUsingBlock:v83];
        id v81 = v80;
      }
      else
      {
        id v81 = v77;
      }
      [v4 setObject:v81 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_3554;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3555;
      }
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

void __85__GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x70000) != 0) {
    goto LABEL_7;
  }
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x7EF0) != 0) {
      goto LABEL_7;
    }
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
      businessConnectAttributes = self->_businessConnectAttributes;
      if (businessConnectAttributes)
      {
        os_unfair_lock_lock_with_options();
        os_unfair_lock_assert_owner(&businessConnectAttributes->_readerLock);
        int v29 = *(unsigned char *)&businessConnectAttributes->_flags & 0xE;
        os_unfair_lock_unlock(&businessConnectAttributes->_readerLock);
        if (v29) {
          goto LABEL_7;
        }
      }
      $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x2000) != 0)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v30 = self->_prefCategoryIcons;
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v63 objects:v73 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v64;
LABEL_75:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v64 != v32) {
            objc_enumerationMutation(v30);
          }
          if (GEOPDIconMappingIsDirty(*(os_unfair_lock_s **)(*((void *)&v63 + 1) + 8 * v33))) {
            goto LABEL_93;
          }
          if (v31 == ++v33)
          {
            uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v31) {
              goto LABEL_75;
            }
            break;
          }
        }
      }

      $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v30 = self->_modernPrimaryCategoryIcons;
      uint64_t v34 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v59 objects:v72 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v60;
LABEL_85:
        uint64_t v36 = 0;
        while (1)
        {
          if (*(void *)v60 != v35) {
            objc_enumerationMutation(v30);
          }
          if (GEOPDIconMappingIsDirty(*(os_unfair_lock_s **)(*((void *)&v59 + 1) + 8 * v36))) {
            break;
          }
          if (v34 == ++v36)
          {
            uint64_t v34 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v59 objects:v72 count:16];
            if (v34) {
              goto LABEL_85;
            }
            goto LABEL_91;
          }
        }
LABEL_93:

        goto LABEL_7;
      }
LABEL_91:
    }
    v37 = self->_reader;
    objc_sync_enter(v37);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v38 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v38];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v37);
    goto LABEL_67;
  }
  if (!GEOLocalizedStringIsDirty((uint64_t)self->_prefDisplayName))
  {
    $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_prefPhone) {
    PBDataWriterWriteStringField();
  }
  if (self->_prefUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_prefDisplayName) {
    PBDataWriterWriteSubmessage();
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = self->_categorys;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v8);
  }

  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  $9225C5C446B130B62C0262B23D04059C v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    $9225C5C446B130B62C0262B23D04059C v11 = self->_flags;
  }
  if (*(unsigned char *)&v11) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_businessCardPrefCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_prefCategoryNames) {
    PBDataWriterWriteSubmessage();
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v12 = self->_prefCategoryIcons;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v51 objects:v70 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v51 objects:v70 count:16];
    }
    while (v13);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v16 = self->_businessCardAltCategories;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v47 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v47 objects:v69 count:16];
    }
    while (v17);
  }

  if (self->_businessCardModernPrimaryCategory) {
    PBDataWriterWriteStringField();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = self->_modernPrimaryCategoryIcons;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v68 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v68 count:16];
    }
    while (v21);
  }

  if (self->_modernPrimaryCategoryNames) {
    PBDataWriterWriteSubmessage();
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v24 = self->_businessCardModernAlternateCategories;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v39 objects:v67 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v25; ++n)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v39 objects:v67 count:16];
    }
    while (v25);
  }

  if (self->_businessConnectAttributes) {
    PBDataWriterWriteSubmessage();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v39);
LABEL_67:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 104) = self->_muid;
    *(_DWORD *)(v5 + 168) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_prefPhone copyWithZone:a3];
  id v10 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v9;

  uint64_t v11 = [(NSString *)self->_prefUrl copyWithZone:a3];
  id v12 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v11;

  id v13 = [(GEOLocalizedString *)self->_prefDisplayName copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v13;

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v15 = self->_categorys;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v72 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addCategory:]((os_unfair_lock_s *)v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_countryCode copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v20;

  $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 164) = self->_isUnclaimable;
    *(_DWORD *)(v5 + 168) |= 4u;
    $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
  }
  if (*(unsigned char *)&flags)
  {
    *(void *)(v5 + 48) = self->_businessCardPoiIconType;
    *(_DWORD *)(v5 + 168) |= 1u;
  }
  uint64_t v23 = [(NSString *)self->_businessCardPrefCategory copyWithZone:a3];
  v24 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v23;

  id v25 = [(GEOPDMultiLocalizedString *)self->_prefCategoryNames copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v25;

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v27 = self->_prefCategoryIcons;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v67 objects:v78 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v68 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addPrefCategoryIcon:](v5, v31);
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v67 objects:v78 count:16];
    }
    while (v28);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v32 = self->_businessCardAltCategories;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v63 objects:v77 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v64 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v36 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardAltCategories:]((os_unfair_lock_s *)v5, v36);
      }
      uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v63 objects:v77 count:16];
    }
    while (v33);
  }

  uint64_t v37 = [(NSString *)self->_businessCardModernPrimaryCategory copyWithZone:a3];
  v38 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v37;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v39 = self->_modernPrimaryCategoryIcons;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v59 objects:v76 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v40; ++m)
      {
        if (*(void *)v60 != v41) {
          objc_enumerationMutation(v39);
        }
        long long v43 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addModernPrimaryCategoryIcon:](v5, v43);
      }
      uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v59 objects:v76 count:16];
    }
    while (v40);
  }

  id v44 = [(GEOPDMultiLocalizedString *)self->_modernPrimaryCategoryNames copyWithZone:a3];
  long long v45 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v44;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v46 = self->_businessCardModernAlternateCategories;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v55 objects:v75 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v56;
    do
    {
      for (uint64_t n = 0; n != v47; ++n)
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(v46);
        }
        long long v50 = objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * n), "copyWithZone:", a3, (void)v55);
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardModernAlternateCategories:]((os_unfair_lock_s *)v5, v50);
      }
      uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v55 objects:v75 count:16];
    }
    while (v47);
  }

  id v51 = [(GEOPDBusinessConnectAttributes *)self->_businessConnectAttributes copyWithZone:a3];
  long long v52 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v51;

  long long v53 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v53;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 1);
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)v4, 1);
  int v5 = *((_DWORD *)v4 + 42);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_muid != *((void *)v4 + 13)) {
      goto LABEL_48;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_48;
  }
  prefPhone = self->_prefPhone;
  if ((unint64_t)prefPhone | *((void *)v4 + 17) && !-[NSString isEqual:](prefPhone, "isEqual:")) {
    goto LABEL_48;
  }
  prefUrl = self->_prefUrl;
  if ((unint64_t)prefUrl | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](prefUrl, "isEqual:")) {
      goto LABEL_48;
    }
  }
  prefDisplayName = self->_prefDisplayName;
  if ((unint64_t)prefDisplayName | *((void *)v4 + 16))
  {
    if (!-[GEOLocalizedString isEqual:](prefDisplayName, "isEqual:")) {
      goto LABEL_48;
    }
  }
  categorys = self->_categorys;
  if ((unint64_t)categorys | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](categorys, "isEqual:")) {
      goto LABEL_48;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_48;
    }
  }
  $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
  int v12 = *((_DWORD *)v4 + 42);
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v12 & 4) != 0)
    {
      if (self->_isUnclaimable)
      {
        if (!*((unsigned char *)v4 + 164)) {
          goto LABEL_48;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 164)) {
        goto LABEL_25;
      }
    }
LABEL_48:
    char v22 = 0;
    goto LABEL_49;
  }
  if ((v12 & 4) != 0) {
    goto LABEL_48;
  }
LABEL_25:
  if (*(unsigned char *)&flags)
  {
    if ((v12 & 1) == 0 || self->_businessCardPoiIconType != *((void *)v4 + 6)) {
      goto LABEL_48;
    }
  }
  else if (v12)
  {
    goto LABEL_48;
  }
  businessCardPrefCategory = self->_businessCardPrefCategory;
  if ((unint64_t)businessCardPrefCategory | *((void *)v4 + 7)
    && !-[NSString isEqual:](businessCardPrefCategory, "isEqual:"))
  {
    goto LABEL_48;
  }
  prefCategoryNames = self->_prefCategoryNames;
  if ((unint64_t)prefCategoryNames | *((void *)v4 + 15))
  {
    if (!-[GEOPDMultiLocalizedString isEqual:](prefCategoryNames, "isEqual:")) {
      goto LABEL_48;
    }
  }
  prefCategoryIcons = self->_prefCategoryIcons;
  if ((unint64_t)prefCategoryIcons | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](prefCategoryIcons, "isEqual:")) {
      goto LABEL_48;
    }
  }
  businessCardAltCategories = self->_businessCardAltCategories;
  if ((unint64_t)businessCardAltCategories | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](businessCardAltCategories, "isEqual:")) {
      goto LABEL_48;
    }
  }
  businessCardModernPrimaryCategory = self->_businessCardModernPrimaryCategory;
  if ((unint64_t)businessCardModernPrimaryCategory | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](businessCardModernPrimaryCategory, "isEqual:")) {
      goto LABEL_48;
    }
  }
  modernPrimaryCategoryIcons = self->_modernPrimaryCategoryIcons;
  if ((unint64_t)modernPrimaryCategoryIcons | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](modernPrimaryCategoryIcons, "isEqual:")) {
      goto LABEL_48;
    }
  }
  modernPrimaryCategoryNames = self->_modernPrimaryCategoryNames;
  if ((unint64_t)modernPrimaryCategoryNames | *((void *)v4 + 12))
  {
    if (!-[GEOPDMultiLocalizedString isEqual:](modernPrimaryCategoryNames, "isEqual:")) {
      goto LABEL_48;
    }
  }
  businessCardModernAlternateCategories = self->_businessCardModernAlternateCategories;
  if ((unint64_t)businessCardModernAlternateCategories | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](businessCardModernAlternateCategories, "isEqual:")) {
      goto LABEL_48;
    }
  }
  businessConnectAttributes = self->_businessConnectAttributes;
  if ((unint64_t)businessConnectAttributes | *((void *)v4 + 8)) {
    char v22 = -[GEOPDBusinessConnectAttributes isEqual:](businessConnectAttributes, "isEqual:");
  }
  else {
    char v22 = 1;
  }
LABEL_49:

  return v22;
}

- (unint64_t)hash
{
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_prefPhone hash];
  NSUInteger v5 = [(NSString *)self->_prefUrl hash];
  unint64_t v6 = [(GEOLocalizedString *)self->_prefDisplayName hash];
  uint64_t v7 = [(NSMutableArray *)self->_categorys hash];
  NSUInteger v8 = [(NSString *)self->_countryCode hash];
  $9225C5C446B130B62C0262B23D04059C flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_isUnclaimable;
    if (*(unsigned char *)&flags) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v11 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v11 = 2654435761u * self->_businessCardPoiIconType;
LABEL_9:
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10;
  NSUInteger v13 = v11 ^ [(NSString *)self->_businessCardPrefCategory hash];
  unint64_t v14 = v13 ^ [(GEOPDMultiLocalizedString *)self->_prefCategoryNames hash];
  uint64_t v15 = v12 ^ v14 ^ [(NSMutableArray *)self->_prefCategoryIcons hash];
  uint64_t v16 = [(NSMutableArray *)self->_businessCardAltCategories hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_businessCardModernPrimaryCategory hash];
  uint64_t v18 = v17 ^ [(NSMutableArray *)self->_modernPrimaryCategoryIcons hash];
  unint64_t v19 = v18 ^ [(GEOPDMultiLocalizedString *)self->_modernPrimaryCategoryNames hash];
  uint64_t v20 = v15 ^ v19 ^ [(NSMutableArray *)self->_businessCardModernAlternateCategories hash];
  return v20 ^ [(GEOPDBusinessConnectAttributes *)self->_businessConnectAttributes hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefUrl, 0);
  objc_storeStrong((id *)&self->_prefPhone, 0);
  objc_storeStrong((id *)&self->_prefDisplayName, 0);
  objc_storeStrong((id *)&self->_prefCategoryNames, 0);
  objc_storeStrong((id *)&self->_prefCategoryIcons, 0);
  objc_storeStrong((id *)&self->_modernPrimaryCategoryNames, 0);
  objc_storeStrong((id *)&self->_modernPrimaryCategoryIcons, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_businessConnectAttributes, 0);
  objc_storeStrong((id *)&self->_businessCardPrefCategory, 0);
  objc_storeStrong((id *)&self->_businessCardModernPrimaryCategory, 0);
  objc_storeStrong((id *)&self->_businessCardModernAlternateCategories, 0);
  objc_storeStrong((id *)&self->_businessCardAltCategories, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end