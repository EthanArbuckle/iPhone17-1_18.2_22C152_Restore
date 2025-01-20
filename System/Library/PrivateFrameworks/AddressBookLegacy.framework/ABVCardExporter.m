@interface ABVCardExporter
+ (id)_vCard21RepresentationOfRecords:(id)a3;
+ (id)_vCard30RepresentationOfRecords:(id)a3;
+ (id)vCardRepresentationOfRecord:(void *)a3 mode:(int)a4;
+ (id)vCardRepresentationOfRecords:(id)a3 mode:(int)a4;
@end

@implementation ABVCardExporter

+ (id)_vCard21RepresentationOfRecords:(id)a3
{
  v3 = (void *)[a3 objectEnumerator];
  v4 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v5 = [v3 nextObject];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      v7 = [[ABVCardRecord alloc] initWithRecord:v6];
      objc_msgSend(v4, "appendData:", -[ABVCardRecord _21vCardRepresentationAsData](v7, "_21vCardRepresentationAsData"));

      uint64_t v6 = [v3 nextObject];
    }
    while (v6);
  }
  return v4;
}

+ (id)_vCard30RepresentationOfRecords:(id)a3
{
  v3 = (void *)[a3 objectEnumerator];
  v4 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v5 = [v3 nextObject];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      v7 = [[ABVCardRecord alloc] initWithRecord:v6];
      id v8 = [(ABVCardRecord *)v7 _copyVCardRepresentationAsStringIncludeExternalProperties:0 withPhoto:0 extraPhotoParameters:0 includePrivateData:0 includeWallpaper:0];
      [v4 appendString:v8];

      uint64_t v6 = [v3 nextObject];
    }
    while (v6);
  }
  v9 = (void *)[v4 copyABVCardDataRepresentation];
  ABRegulatoryLogReadTransmitContactsData();
  return v9;
}

+ (id)vCardRepresentationOfRecords:(id)a3 mode:(int)a4
{
  if (a4 == 1) {
    return +[ABVCardExporter _vCard30RepresentationOfRecords:a3];
  }
  if (a4) {
    return 0;
  }
  return +[ABVCardExporter _vCard21RepresentationOfRecords:a3];
}

+ (id)vCardRepresentationOfRecord:(void *)a3 mode:(int)a4
{
  uint64_t v5 = [[ABVCardRecord alloc] initWithRecord:a3];
  uint64_t v6 = v5;
  if (a4 == 1)
  {
    id v8 = [(ABVCardRecord *)v5 _copyVCardRepresentationAsStringIncludeExternalProperties:0 withPhoto:0 extraPhotoParameters:0 includePrivateData:0 includeWallpaper:0];
    id v7 = (id)[v8 copyABVCardDataRepresentation];
    ABRegulatoryLogReadTransmitContactsData();
  }
  else if (a4)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(ABVCardRecord *)v5 _21vCardRepresentationAsData];
  }

  return v7;
}

@end