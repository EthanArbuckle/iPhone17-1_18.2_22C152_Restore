@interface PHDCFUtilities
+ (BOOL)fileName:(id)a3 matchesRegex:(id)a4;
+ (BOOL)isRenderFileName:(id)a3;
+ (BOOL)isValidDCFFileName:(id)a3;
+ (id)convertHash:(unsigned int)a3 usingPlaceValues:(id)a4;
+ (id)dcfCompliantFileNameForFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5 filenameMarker:(id)a6;
+ (id)dcfCompliantFileNameFromFileNameHash:(unsigned int)a3;
+ (id)dcfRegex;
+ (id)dcfRegexForAuxiliaryResourceFilenameMarker:(id)a3;
+ (id)fileNameByInsertingAuxiliaryResourceTypeMarker:(id)a3 intoFileName:(id)a4;
+ (id)fileNameByRemovingRenderMarkerInFileName:(id)a3;
+ (id)makeDCFFileNameByHashingFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5;
+ (id)makeDCFFileNameFromFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5;
+ (id)placeValuesFromBases:(id)a3;
+ (id)renderDCFRegex;
+ (unsigned)hashForFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5;
+ (void)computeSHA256OfString:(id)a3 intoBuffer:(char *)a4;
@end

@implementation PHDCFUtilities

+ (id)placeValuesFromBases:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  int v5 = [v3 count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    uint64_t v7 = 1;
    do
    {
      v8 = [v3 objectAtIndexedSubscript:(v6 - 2)];
      v9 = [NSNumber numberWithUnsignedInteger:v7];
      [v4 addObject:v9];

      v7 *= [v8 unsignedIntegerValue];
      --v6;
    }
    while (v6 > 1);
  }

  return v4;
}

+ (id)convertHash:(unsigned int)a3 usingPlaceValues:(id)a4
{
  id v5 = a4;
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  int v7 = [v5 count];
  if (v7 >= 1)
  {
    unint64_t v8 = v7 + 1;
    do
    {
      v9 = [v5 objectAtIndexedSubscript:(v8 - 2)];
      [v9 doubleValue];
      v11 = [NSNumber numberWithUnsignedInteger:vcvtmd_u64_f64((double)a3 / v10)];
      [v6 addObject:v11];

      a3 %= (unint64_t)[v9 unsignedIntegerValue];
      --v8;
    }
    while (v8 > 1);
  }

  return v6;
}

+ (id)dcfCompliantFileNameFromFileNameHash:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  pl_dispatch_once();
  id v5 = [a1 convertHash:v3 usingPlaceValues:dcfCompliantFileNameFromFileNameHash__pl_once_object_17];
  v21 = NSString;
  v23 = [v5 objectAtIndexedSubscript:0];
  uint64_t v19 = [v23 unsignedIntValue] + 65;
  v22 = [v5 objectAtIndexedSubscript:1];
  uint64_t v18 = [v22 unsignedIntValue] + 65;
  v20 = [v5 objectAtIndexedSubscript:2];
  uint64_t v17 = [v20 unsignedIntValue] + 65;
  unint64_t v6 = [v5 objectAtIndexedSubscript:3];
  uint64_t v7 = [v6 unsignedIntValue] + 65;
  unint64_t v8 = [v5 objectAtIndexedSubscript:4];
  uint64_t v9 = [v8 unsignedIntValue] + 48;
  double v10 = [v5 objectAtIndexedSubscript:5];
  uint64_t v11 = [v10 unsignedIntValue] + 48;
  v12 = [v5 objectAtIndexedSubscript:6];
  uint64_t v13 = [v12 unsignedIntValue] + 48;
  v14 = [v5 objectAtIndexedSubscript:7];
  v15 = objc_msgSend(v21, "stringWithFormat:", @"%c%c%c%c%c%c%c%c", v19, v18, v17, v7, v9, v11, v13, objc_msgSend(v14, "unsignedIntValue") + 48);

  return v15;
}

void __55__PHDCFUtilities_dcfCompliantFileNameFromFileNameHash___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) placeValuesFromBases:&unk_1EEB26D60];
  uint64_t v1 = [v3 copy];
  v2 = (void *)dcfCompliantFileNameFromFileNameHash__pl_once_object_17;
  dcfCompliantFileNameFromFileNameHash__pl_once_object_17 = v1;
}

+ (void)computeSHA256OfString:(id)a3 intoBuffer:(char *)a4
{
  id v5 = (const char *)[a3 UTF8String];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  CC_LONG v6 = strlen(v5);
  CC_SHA256_Update(&v7, v5, v6);
  CC_SHA256_Final((unsigned __int8 *)a4, &v7);
}

+ (unsigned)hashForFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CC_LONG v6 = [NSString stringWithFormat:@"%@%@%llu", a3, a4, a5];
  [a1 computeSHA256OfString:v6 intoBuffer:buf];
  LODWORD(a1) = crc32(0, buf, 0x20u);

  return a1;
}

+ (id)fileNameByInsertingAuxiliaryResourceTypeMarker:(id)a3 intoFileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CC_SHA256_CTX v7 = [v5 substringToIndex:4];
  unint64_t v8 = [v5 substringFromIndex:4];

  uint64_t v9 = [NSString stringWithFormat:@"%@%@%@", v7, v6, v8];

  return v9;
}

+ (id)makeDCFFileNameByHashingFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = objc_msgSend(a1, "dcfCompliantFileNameFromFileNameHash:", objc_msgSend(a1, "hashForFileName:createDate:fileSize:", v8, a4, a5));
  double v10 = [v8 pathExtension];

  uint64_t v11 = [v10 uppercaseString];
  v12 = (void *)v11;
  uint64_t v13 = &stru_1EEAC1950;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  v14 = v13;

  v15 = [v9 stringByAppendingPathExtension:v14];

  return v15;
}

+ (id)makeDCFFileNameFromFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  if ([a1 isValidDCFFileName:v9]) {
    [v9 uppercaseString];
  }
  else {
  double v10 = [a1 makeDCFFileNameByHashingFileName:v9 createDate:v8 fileSize:a5];
  }

  return v10;
}

+ (BOOL)fileName:(id)a3 matchesRegex:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v7 == 1;
}

+ (id)fileNameByRemovingRenderMarkerInFileName:(id)a3
{
  id v4 = a3;
  if ([a1 isRenderFileName:v4])
  {
    id v5 = NSString;
    id v6 = [v4 substringToIndex:4];
    uint64_t v7 = [v4 substringFromIndex:5];
    id v8 = [v5 stringWithFormat:@"%@%@", v6, v7];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

+ (BOOL)isRenderFileName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 renderDCFRegex];
  LOBYTE(a1) = [a1 fileName:v4 matchesRegex:v5];

  return (char)a1;
}

+ (id)renderDCFRegex
{
  return (id)[a1 dcfRegexForAuxiliaryResourceFilenameMarker:PHAuxiliaryResourceFilenameMarkerRender];
}

+ (id)dcfRegexForAuxiliaryResourceFilenameMarker:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PHDCFUtilities.m", 71, @"Invalid parameter not satisfying: %@", @"marker" object file lineNumber description];
  }
  pl_dispatch_once();
  id v6 = [(id)dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PHDCFUtilities.m", 91, @"Unknown auxiliary resource type marker: %@", v5 object file lineNumber description];
  }

  return v6;
}

void __61__PHDCFUtilities_dcfRegexForAuxiliaryResourceFilenameMarker___block_invoke()
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = (void *)dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap;
  dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap = v0;

  v15[0] = PHAuxiliaryResourceFilenameMarkerRender;
  v15[1] = PHAuxiliaryResourceFilenameMarkerAdjustmentBase;
  v15[2] = PHAuxiliaryResourceFilenameMarkerOriginalAdjustment;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [NSString stringWithFormat:@"^ [[A-Z][_][0-9]]{4}     (?# alphanumeric + '_' x4)%@                       (?# render marker)[0-9]{4}                 (?# digit x4)\\.[[A-Z][0-9]]{3,4} $   (?# alphanumeric x3 or x4)", v7];
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v8 options:3 error:0];
        [(id)dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap setObject:v9 forKeyedSubscript:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

+ (id)dcfCompliantFileNameForFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5 filenameMarker:(id)a6
{
  id v10 = a6;
  long long v11 = [a1 makeDCFFileNameFromFileName:a3 createDate:a4 fileSize:a5];
  if (v10)
  {
    uint64_t v12 = [a1 fileNameByInsertingAuxiliaryResourceTypeMarker:v10 intoFileName:v11];

    long long v11 = (void *)v12;
  }

  return v11;
}

+ (BOOL)isValidDCFFileName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 dcfRegex];
  LOBYTE(a1) = [a1 fileName:v4 matchesRegex:v5];

  return (char)a1;
}

+ (id)dcfRegex
{
  pl_dispatch_once();
  id v2 = (void *)dcfRegex_regex;

  return v2;
}

void __26__PHDCFUtilities_dcfRegex__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^ [[A-Z][_][0-9]]{4}   (?# alphanumeric + '_' x4)[0-9]{4}               (?# digit x4)\\.[[A-Z][0-9]]{3,4} $ (?# alphanumeric x3 or x4)" options:3 error:0];
  uint64_t v1 = (void *)dcfRegex_regex;
  dcfRegex_regex = v0;
}

@end