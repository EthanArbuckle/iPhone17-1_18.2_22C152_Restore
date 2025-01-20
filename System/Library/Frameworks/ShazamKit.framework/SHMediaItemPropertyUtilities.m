@interface SHMediaItemPropertyUtilities
+ (BOOL)isShazamKitDefinedMediaItemProperty:(id)a3;
+ (Class)jsonRepresentationTypeForProperty:(id)a3;
+ (Class)typeForShazamKitProperty:(id)a3;
+ (int64_t)categoryForShazamKitProperty:(id)a3;
+ (void)buildPropertySets;
@end

@implementation SHMediaItemPropertyUtilities

+ (int64_t)categoryForShazamKitProperty:(id)a3
{
  id v4 = a3;
  [a1 buildPropertySets];
  if ([(id)stringProperties containsObject:v4])
  {
    int64_t v5 = 0;
  }
  else if ([(id)URLProperties containsObject:v4])
  {
    int64_t v5 = 4;
  }
  else if ([(id)dateProperties containsObject:v4])
  {
    int64_t v5 = 3;
  }
  else if ([(id)numberProperties containsObject:v4])
  {
    int64_t v5 = 1;
  }
  else if ([(id)stringArrayProperties containsObject:v4])
  {
    int64_t v5 = 5;
  }
  else if ([(id)rangeArrayProperties containsObject:v4])
  {
    int64_t v5 = 6;
  }
  else if ([(id)BOOLeanProperties containsObject:v4])
  {
    int64_t v5 = 2;
  }
  else if ([(id)uuidProperties containsObject:v4])
  {
    int64_t v5 = 7;
  }
  else if ([(id)signatureAlignmentArrayProperties containsObject:v4])
  {
    int64_t v5 = 8;
  }
  else if ([(id)locationProperties containsObject:v4])
  {
    int64_t v5 = 9;
  }
  else
  {
    int64_t v5 = 10;
  }

  return v5;
}

+ (BOOL)isShazamKitDefinedMediaItemProperty:(id)a3
{
  id v4 = a3;
  [a1 buildPropertySets];
  LOBYTE(a1) = [(id)allProperties containsObject:v4];

  return (char)a1;
}

+ (Class)jsonRepresentationTypeForProperty:(id)a3
{
  v3 = (void *)[a1 typeForShazamKitProperty:a3];
  if (v3 == objc_opt_class() || v3 == objc_opt_class() || v3 == objc_opt_class())
  {
    objc_opt_class();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }

  return (Class)v4;
}

+ (Class)typeForShazamKitProperty:(id)a3
{
  id v4 = a3;
  switch([a1 categoryForShazamKitProperty:v4])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      objc_opt_class();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      v6 = (void *)MEMORY[0x263EFF940];
      uint64_t v7 = *MEMORY[0x263EFF4A0];
      v8 = [NSString stringWithFormat:@"Encountered ShazamKit property that we did know the type of: %@", v4];
      id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];

      objc_exception_throw(v9);
    default:
      break;
  }

  return (Class)a1;
}

+ (void)buildPropertySets
{
  if (buildPropertySets_onceToken != -1) {
    dispatch_once(&buildPropertySets_onceToken, &__block_literal_global_1);
  }
}

void __49__SHMediaItemPropertyUtilities_buildPropertySets__block_invoke()
{
  v52[10] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v52[0] = @"sh_lyricsSnippet";
  v52[1] = @"sh_albumName";
  v52[2] = @"sh_isrc";
  v52[3] = @"sh_appleMusicID";
  v52[4] = @"sh_artist";
  v52[5] = @"sh_subtitle";
  v52[6] = @"sh_title";
  v52[7] = @"sh_shazamID";
  v52[8] = @"sh_syncedLyricsSnippet";
  v52[9] = @"sh_providerIdentifier";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)stringProperties;
  stringProperties = v2;

  id v4 = (void *)MEMORY[0x263EFFA08];
  v51[0] = @"sh_webURL";
  v51[1] = @"sh_appleMusicURL";
  v51[2] = @"sh_artworkURL";
  v51[3] = @"sh_videoURL";
  int64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];
  uint64_t v6 = [v4 setWithArray:v5];
  uint64_t v7 = (void *)URLProperties;
  URLProperties = v6;

  v8 = (void *)MEMORY[0x263EFFA08];
  v50[0] = @"sh_releaseDate";
  v50[1] = @"sh_audioStartDate";
  v50[2] = @"sh_creationDate";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:3];
  uint64_t v10 = [v8 setWithArray:v9];
  v11 = (void *)dateProperties;
  dateProperties = v10;

  v12 = (void *)MEMORY[0x263EFFA08];
  v49[0] = @"sh_matchOffset";
  v49[1] = @"sh_speedSkew";
  v49[2] = @"sh_frequencySkew";
  v49[3] = @"sh_score";
  v49[4] = @"sh_shazamCount";
  v49[5] = @"sh_duration";
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:6];
  uint64_t v14 = [v12 setWithArray:v13];
  v15 = (void *)numberProperties;
  numberProperties = v14;

  v16 = (void *)MEMORY[0x263EFFA08];
  v48[0] = @"sh_genres";
  v48[1] = @"sh_staticLyricLines";
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
  uint64_t v18 = [v16 setWithArray:v17];
  v19 = (void *)stringArrayProperties;
  stringArrayProperties = v18;

  v20 = (void *)MEMORY[0x263EFFA08];
  v47[0] = @"sh_timeRanges";
  v47[1] = @"sh_timeRanges_Swift";
  v47[2] = @"sh_frequencySkewRanges";
  v47[3] = @"sh_frequencySkewRanges_Swift";
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
  uint64_t v22 = [v20 setWithArray:v21];
  v23 = (void *)rangeArrayProperties;
  rangeArrayProperties = v22;

  v24 = (void *)MEMORY[0x263EFFA08];
  v46 = @"sh_signatureAlignments";
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  uint64_t v26 = [v24 setWithArray:v25];
  v27 = (void *)signatureAlignmentArrayProperties;
  signatureAlignmentArrayProperties = v26;

  v28 = (void *)MEMORY[0x263EFFA08];
  v45 = @"sh_explicitContent";
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  uint64_t v30 = [v28 setWithArray:v29];
  v31 = (void *)BOOLeanProperties;
  BOOLeanProperties = v30;

  v32 = (void *)MEMORY[0x263EFFA08];
  v44 = @"sh_identifier";
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  uint64_t v34 = [v32 setWithArray:v33];
  v35 = (void *)uuidProperties;
  uuidProperties = v34;

  v36 = (void *)MEMORY[0x263EFFA08];
  v43 = @"sh_matchLocation";
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  uint64_t v38 = [v36 setWithArray:v37];
  v39 = (void *)locationProperties;
  locationProperties = v38;

  v40 = [MEMORY[0x263EFF9C0] set];
  [v40 unionSet:stringProperties];
  [v40 unionSet:URLProperties];
  [v40 unionSet:dateProperties];
  [v40 unionSet:numberProperties];
  [v40 unionSet:stringArrayProperties];
  [v40 unionSet:rangeArrayProperties];
  [v40 unionSet:signatureAlignmentArrayProperties];
  [v40 unionSet:BOOLeanProperties];
  [v40 unionSet:uuidProperties];
  [v40 unionSet:locationProperties];
  uint64_t v41 = [v40 copy];
  v42 = (void *)allProperties;
  allProperties = v41;
}

@end