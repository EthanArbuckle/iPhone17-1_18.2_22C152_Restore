@interface PHAssetCollection(Clouseau)
- (id)_fetchFirstAssetSortedByCreationDateAscending:()Clouseau;
- (id)_legacyLocalEndDate;
- (id)_legacyLocalEndDateComponents;
- (id)_legacyLocalStartDate;
- (id)_legacyLocalStartDateComponents;
- (id)_legacyUniversalEndDate;
- (id)_legacyUniversalStartDate;
- (id)cls_localEndDate;
- (id)cls_localEndDateComponents;
- (id)cls_localStartDate;
- (id)cls_localStartDateComponents;
- (id)cls_universalEndDate;
- (id)cls_universalStartDate;
@end

@implementation PHAssetCollection(Clouseau)

- (id)_fetchFirstAssetSortedByCreationDateAscending:()Clouseau
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = [a1 photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:a3];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v6 setSortDescriptors:v8];

  [v6 setFetchLimit:1];
  [v6 setIncludeGuestAssets:1];
  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1 options:v6];
  v10 = [v9 firstObject];

  return v10;
}

- (id)_legacyLocalEndDate
{
  v2 = (void *)MEMORY[0x1D2602300]();
  v3 = [a1 _fetchFirstAssetSortedByCreationDateAscending:0];
  v4 = objc_msgSend(v3, "cls_localDate");

  return v4;
}

- (id)_legacyLocalStartDate
{
  v2 = (void *)MEMORY[0x1D2602300]();
  v3 = [a1 _fetchFirstAssetSortedByCreationDateAscending:1];
  v4 = objc_msgSend(v3, "cls_localDate");

  return v4;
}

- (id)_legacyUniversalEndDate
{
  v4 = objc_getAssociatedObject(a1, a2);
  if (!v4)
  {
    v4 = [a1 endDate];
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1D2602300]();
      v6 = [a1 _fetchFirstAssetSortedByCreationDateAscending:0];
      v4 = objc_msgSend(v6, "cls_universalDate");
    }
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (id)_legacyUniversalStartDate
{
  v4 = objc_getAssociatedObject(a1, a2);
  if (!v4)
  {
    v4 = [a1 startDate];
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1D2602300]();
      v6 = [a1 _fetchFirstAssetSortedByCreationDateAscending:1];
      v4 = objc_msgSend(v6, "cls_universalDate");
    }
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (id)_legacyLocalEndDateComponents
{
  v2 = (void *)MEMORY[0x1D2602300]();
  v3 = [a1 _fetchFirstAssetSortedByCreationDateAscending:0];
  v4 = objc_msgSend(v3, "cls_localDateComponents");

  return v4;
}

- (id)_legacyLocalStartDateComponents
{
  v2 = (void *)MEMORY[0x1D2602300]();
  v3 = [a1 _fetchFirstAssetSortedByCreationDateAscending:1];
  v4 = objc_msgSend(v3, "cls_localDateComponents");

  return v4;
}

- (id)cls_localEndDate
{
  uint64_t v2 = [a1 assetCollectionType];
  if (v2 == 6 || v2 == 3)
  {
    v3 = [a1 localEndDate];
  }
  else
  {
    v3 = [a1 _legacyLocalEndDate];
  }
  return v3;
}

- (id)cls_localStartDate
{
  uint64_t v2 = [a1 assetCollectionType];
  if (v2 == 6 || v2 == 3)
  {
    v3 = [a1 localStartDate];
  }
  else
  {
    v3 = [a1 _legacyLocalStartDate];
  }
  return v3;
}

- (id)cls_universalEndDate
{
  uint64_t v2 = [a1 assetCollectionType];
  if (v2 == 6 || v2 == 3)
  {
    v3 = [a1 endDate];
  }
  else
  {
    v3 = [a1 _legacyUniversalEndDate];
  }
  return v3;
}

- (id)cls_universalStartDate
{
  uint64_t v2 = [a1 assetCollectionType];
  if (v2 == 6 || v2 == 3)
  {
    v3 = [a1 startDate];
  }
  else
  {
    v3 = [a1 _legacyUniversalStartDate];
  }
  return v3;
}

- (id)cls_localEndDateComponents
{
  uint64_t v2 = [a1 assetCollectionType];
  if (v2 == 6 || v2 == 3)
  {
    v3 = objc_msgSend(a1, "cls_universalEndDate");
    v4 = objc_msgSend(a1, "cls_localEndDate");
    v5 = +[CLSCalendar dateComponentsWithUTCDate:v3 localDate:v4];
  }
  else
  {
    v5 = [a1 _legacyLocalEndDateComponents];
  }
  return v5;
}

- (id)cls_localStartDateComponents
{
  uint64_t v2 = [a1 assetCollectionType];
  if (v2 == 6 || v2 == 3)
  {
    v3 = objc_msgSend(a1, "cls_universalStartDate");
    v4 = objc_msgSend(a1, "cls_localStartDate");
    v5 = +[CLSCalendar dateComponentsWithUTCDate:v3 localDate:v4];
  }
  else
  {
    v5 = [a1 _legacyLocalStartDateComponents];
  }
  return v5;
}

@end