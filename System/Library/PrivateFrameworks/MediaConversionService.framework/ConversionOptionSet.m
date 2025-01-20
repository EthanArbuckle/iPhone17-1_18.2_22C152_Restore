@interface ConversionOptionSet
+ (CGSize)sizeForImageAtPath:(id)a3;
+ (id)knownConversionTypes;
- (BOOL)processConversionOptionKey:(id)a3 valueString:(id)a4;
- (BOOL)replaceExistingOutput;
- (BOOL)verbose;
- (ConversionOptionSet)init;
- (NSMutableArray)conversionOptionInputKeyValuePairs;
- (NSMutableDictionary)conversionOptions;
- (NSString)conversionType;
- (NSString)destinationPath;
- (NSString)destinationPathVideoComplement;
- (NSString)presetName;
- (NSString)sourcePath;
- (NSString)sourcePathVideoComplement;
- (double)scaleFactorForInputSize:(CGSize)a3 sharedStreamsSizeSpecificationString:(id)a4;
- (id)arrayOfStringsForString:(id)a3;
- (id)cmTimeRangeDictionaryForString:(id)a3;
- (id)conversionOptionValueForString:(id)a3 valueType:(unint64_t)a4;
- (id)metadataPolicyForString:(id)a3;
- (id)pfVideoAdjustmentsDictionaryForString:(id)a3;
- (id)photosAdjustmentsDictionaryForAdjustmentsFileAtPath:(id)a3;
- (id)photosAdjustmentsDictionaryForString:(id)a3;
- (id)presetListForMapping:(id)a3;
- (id)presetNameToOptionsMappingForImageConversionOrVideoStillImageExtraction;
- (id)presetNameToOptionsMappingForVideoTranscoding;
- (int)checkDestinationExists;
- (int)validateAndProcess;
- (int64_t)repeatCount;
- (void)setConversionOptionInputKeyValuePairs:(id)a3;
- (void)setConversionOptions:(id)a3;
- (void)setConversionType:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setDestinationPathVideoComplement:(id)a3;
- (void)setPresetName:(id)a3;
- (void)setRepeatCount:(int64_t)a3;
- (void)setReplaceExistingOutput:(BOOL)a3;
- (void)setSourcePath:(id)a3;
- (void)setSourcePathVideoComplement:(id)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation ConversionOptionSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionOptions, 0);
  objc_storeStrong((id *)&self->_presetName, 0);
  objc_storeStrong((id *)&self->_conversionOptionInputKeyValuePairs, 0);
  objc_storeStrong((id *)&self->_destinationPathVideoComplement, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_sourcePathVideoComplement, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_conversionType, 0);
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setReplaceExistingOutput:(BOOL)a3
{
  self->_replaceExistingOutput = a3;
}

- (BOOL)replaceExistingOutput
{
  return self->_replaceExistingOutput;
}

- (void)setConversionOptions:(id)a3
{
}

- (NSMutableDictionary)conversionOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRepeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (void)setPresetName:(id)a3
{
}

- (NSString)presetName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConversionOptionInputKeyValuePairs:(id)a3
{
}

- (NSMutableArray)conversionOptionInputKeyValuePairs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDestinationPathVideoComplement:(id)a3
{
}

- (NSString)destinationPathVideoComplement
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDestinationPath:(id)a3
{
}

- (NSString)destinationPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSourcePathVideoComplement:(id)a3
{
}

- (NSString)sourcePathVideoComplement
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourcePath:(id)a3
{
}

- (NSString)sourcePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConversionType:(id)a3
{
}

- (NSString)conversionType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)photosAdjustmentsDictionaryForAdjustmentsFileAtPath:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  id v16 = 0;
  v6 = [v4 dictionaryWithContentsOfURL:v5 error:&v16];
  id v7 = v16;

  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8CE90]];
    v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8CEA0]];
    uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8CE80]];
    v11 = (void *)v10;
    if (v8) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12 || v10 == 0)
    {
      +[MediaConversionServiceCommandLineDriver outputError:@"Unable to parse photos adjustment option string. Interpreted as file path, but some expected information is missing in file %@\n", v3];
      v14 = 0;
    }
    else
    {
      v17[0] = @"PAMediaConversionServiceAdjustmentFormatIdentifierKey";
      v17[1] = @"PAMediaConversionServiceAdjustmentFormatVersionKey";
      v18[0] = v8;
      v18[1] = v9;
      v17[2] = @"PAMediaConversionServiceAdjustmentDataKey";
      v18[2] = v10;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    }
  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:@"Unable to parse photos adjustment option string. Interpreted as file path, but unable to read adjustment plist file: %@\n", v7];
    v14 = 0;
  }

  return v14;
}

- (id)pfVideoAdjustmentsDictionaryForString:(id)a3
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 componentsSeparatedByString:@":"];
  if ([v3 count] == 5)
  {
    v4 = [v3 objectAtIndexedSubscript:0];
    v5 = [v3 objectAtIndexedSubscript:1];
    v6 = [v3 objectAtIndexedSubscript:2];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
    if (v7)
    {
      v8 = [v3 objectAtIndexedSubscript:3];
      uint64_t v9 = [v8 integerValue];

      uint64_t v10 = [v3 objectAtIndexedSubscript:4];
      uint64_t v11 = [v10 integerValue];

      v16[0] = @"adjustmentFormatIdentifier";
      v16[1] = @"adjustmentFormatVersion";
      v17[0] = v4;
      v17[1] = v5;
      v17[2] = v7;
      v16[2] = @"adjustmentData";
      v16[3] = @"adjustmentBaseVersion";
      BOOL v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
      void v17[3] = v12;
      v16[4] = @"adjustmentRenderTypes";
      v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:v11];
      v17[4] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:@"Unable to parse photos adjustment option string. Unable to decode base64 encoded adjustment data\n"];
      v14 = 0;
    }
  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:@"Unable to parse photos adjustment option string. Expected format is a colon-separated tuple of <format-identifier>:<format-version>:<base64 encoded adjustment data>:<adjustment-base-version>:<adjustment-render-types>\n"];
    v14 = 0;
  }

  return v14;
}

- (id)photosAdjustmentsDictionaryForString:(id)a3
{
  void v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 stringByExpandingTildeInPath];
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    v8 = [(ConversionOptionSet *)self photosAdjustmentsDictionaryForAdjustmentsFileAtPath:v5];
  }
  else
  {
    uint64_t v9 = [v4 componentsSeparatedByString:@":"];
    if ([v9 count] == 3)
    {
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];
      uint64_t v11 = [v9 objectAtIndexedSubscript:1];
      BOOL v12 = [v9 objectAtIndexedSubscript:2];
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
      v14 = (void *)v13;
      if (v13)
      {
        v16[0] = @"PAMediaConversionServiceAdjustmentFormatIdentifierKey";
        v16[1] = @"PAMediaConversionServiceAdjustmentFormatVersionKey";
        v17[0] = v10;
        v17[1] = v11;
        v16[2] = @"PAMediaConversionServiceAdjustmentDataKey";
        v17[2] = v13;
        v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
      }
      else
      {
        +[MediaConversionServiceCommandLineDriver outputError:@"Unable to parse photos adjustment option string. Unable to decode base64 encoded adjustment data\n"];
        v8 = 0;
      }
    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:@"Unable to parse photos adjustment option string. Expected format is a path to an existing adjustment plist file or a colon-separated tuple of <format-identifier>:<format-version>:<base64 encoded adjustment data>\n"];
      v8 = 0;
    }
  }
  return v8;
}

- (id)cmTimeRangeDictionaryForString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(\\d+)/(\\d+):(\\d+)/(\\d+)$" options:0 error:0];
  v5 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v6 = v5;
  if (v5)
  {
    memset(&v28, 0, sizeof(v28));
    uint64_t v7 = [v5 rangeAtIndex:1];
    uint64_t v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
    int64_t v10 = [v9 integerValue];
    uint64_t v11 = [v6 rangeAtIndex:2];
    uint64_t v13 = objc_msgSend(v3, "substringWithRange:", v11, v12);
    CMTimeMake(&v28, v10, [v13 integerValue]);

    memset(&v27, 0, sizeof(v27));
    uint64_t v14 = [v6 rangeAtIndex:3];
    id v16 = objc_msgSend(v3, "substringWithRange:", v14, v15);
    int64_t v17 = [v16 integerValue];
    uint64_t v18 = [v6 rangeAtIndex:4];
    v20 = objc_msgSend(v3, "substringWithRange:", v18, v19);
    CMTimeMake(&v27, v17, [v20 integerValue]);

    memset(&v26, 0, sizeof(v26));
    start.CMTimeRange start = v28;
    CMTime duration = v27;
    CMTimeRangeMake(&v26, &start.start, &duration);
    CMTimeRange start = v26;
    CFDictionaryRef v21 = CMTimeRangeCopyAsDictionary(&start, 0);
    v22 = CFAutorelease(v21);
  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:@"Unable to parse string %@ as a CMTimeRange. Expected format is <value>/<timescale>:<value>/<timescale>, the first pair is the start time, the second pair is the duration.\n", v3];
    v22 = 0;
  }

  return v22;
}

- (id)metadataPolicyForString:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"default"])
  {
    id v4 = +[PAMediaConversionServiceDefaultImageMetadataPolicy standardPolicy];
    v10[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v6 = +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:v5];
LABEL_5:
    uint64_t v8 = (void *)v6;

    goto LABEL_7;
  }
  if ([v3 hasPrefix:@"set-livephoto-id:"])
  {
    uint64_t v7 = [v3 componentsSeparatedByString:@":"];
    id v4 = [v7 lastObject];

    v5 = [MEMORY[0x1E4F8CC48] livePhotoPairingIdentifierMetadataKey];
    uint64_t v6 = +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:v5 value:v4];
    goto LABEL_5;
  }
  +[MediaConversionServiceCommandLineDriver outputError:@"metadata policy %@ is not supported\n", v3];
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)arrayOfStringsForString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 substringToIndex:1];
  v5 = [v3 componentsSeparatedByString:v4];

  uint64_t v6 = [v5 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __47__ConversionOptionSet_arrayOfStringsForString___block_invoke;
  v10[3] = &__block_descriptor_40_e25_B32__0__NSString_8Q16_B24l;
  v10[4] = v6 - 1;
  uint64_t v7 = [v5 indexesOfObjectsPassingTest:v10];
  uint64_t v8 = [v5 objectsAtIndexes:v7];

  return v8;
}

uint64_t __47__ConversionOptionSet_arrayOfStringsForString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3) {
    a3 = *(void *)(a1 + 32) != a3 || [v5 length];
  }

  return a3;
}

- (id)conversionOptionValueForString:(id)a3 valueType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  [v7 setNumberStyle:1];
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = v8;
  switch(a4)
  {
    case 0uLL:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unable to create value from string %@ for unknown value type", v6 format];
      goto LABEL_4;
    case 1uLL:
      id v12 = v6;
      goto LABEL_13;
    case 2uLL:
      id v12 = [v7 numberFromString:v6];
      goto LABEL_13;
    case 3uLL:
      id v12 = [v8 dateFromString:v6];
      goto LABEL_13;
    case 4uLL:
      id v12 = [(ConversionOptionSet *)self pfVideoAdjustmentsDictionaryForString:v6];
      goto LABEL_13;
    case 5uLL:
      id v12 = [(ConversionOptionSet *)self cmTimeRangeDictionaryForString:v6];
      goto LABEL_13;
    case 6uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      int64_t v10 = off_1E6CFE638[a4];
      +[MediaConversionServiceCommandLineDriver outputError:@"Value type %@ is not supported\n", v10];

      goto LABEL_4;
    case 7uLL:
      id v12 = [(ConversionOptionSet *)self arrayOfStringsForString:v6];
      goto LABEL_13;
    case 8uLL:
      id v12 = [(ConversionOptionSet *)self metadataPolicyForString:v6];
      goto LABEL_13;
    case 9uLL:
      id v12 = [(ConversionOptionSet *)self photosAdjustmentsDictionaryForString:v6];
LABEL_13:
      uint64_t v11 = v12;
      break;
    default:
LABEL_4:
      uint64_t v11 = 0;
      break;
  }

  return v11;
}

- (double)scaleFactorForInputSize:(CGSize)a3 sharedStreamsSizeSpecificationString:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  uint64_t v7 = [v6 componentsSeparatedByString:@":"];
  if ([v7 count] == 3)
  {
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    [v8 doubleValue];
    double v10 = v9;

    uint64_t v11 = [v7 objectAtIndexedSubscript:1];
    [v11 doubleValue];
    double v13 = v12;

    uint64_t v14 = [v7 objectAtIndexedSubscript:2];
    [v14 doubleValue];
    double v16 = v15;

    if (width >= height) {
      double v17 = height;
    }
    else {
      double v17 = width;
    }
    if (width >= height) {
      double v18 = width;
    }
    else {
      double v18 = height;
    }
    double v19 = v10 / v17;
    double v20 = floor(v18 * v19);
    if (v20 >= v13)
    {
      if (v20 > v16) {
        double v19 = v16 / v18;
      }
    }
    else
    {
      double v19 = v13 / v18;
    }
    if (v19 <= 1.0) {
      double v21 = v19;
    }
    else {
      double v21 = 1.0;
    }
  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:@"Unable to get values from size specification string %@\n", v6];
    double v21 = 0.0;
  }

  return v21;
}

- (BOOL)processConversionOptionKey:(id)a3 valueString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_conversionOptions)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    conversionOptions = self->_conversionOptions;
    self->_conversionOptions = v8;
  }
  if (processConversionOptionKey_valueString__onceToken != -1) {
    dispatch_once(&processConversionOptionKey_valueString__onceToken, &__block_literal_global_827);
  }
  if (![v6 isEqualToString:@"SharedStreamsDimensions"])
  {
    double v16 = [NSString stringWithFormat:@"PAMediaConversionServiceOption%@Key", v6];
    double v17 = [(id)processConversionOptionKey_valueString__knownConversionOptions objectForKeyedSubscript:v16];
    if (v17)
    {
      double v18 = [(NSMutableDictionary *)self->_conversionOptions objectForKeyedSubscript:v16];

      if (!v18)
      {
        unint64_t v20 = [v17 integerValue];
        double v21 = [(ConversionOptionSet *)self conversionOptionValueForString:v7 valueType:v20];
        BOOL v15 = v21 != 0;
        if (v21)
        {
          [(NSMutableDictionary *)self->_conversionOptions setObject:v21 forKeyedSubscript:v16];
        }
        else
        {
          if (v20 > 0xC) {
            v22 = 0;
          }
          else {
            v22 = off_1E6CFE638[v20];
          }
          v23 = v22;
          +[MediaConversionServiceCommandLineDriver outputError:@"Unable to create value of type %@ from string '%@' for option '%@'\n", v23, v7, v6];
        }
        goto LABEL_30;
      }
      +[MediaConversionServiceCommandLineDriver outputError:@"Conversion option '%@' passed more than once, must be unique\n", v6];
    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:@"Unknown conversion option '%@'\n", v6];
    }
    LOBYTE(v15) = 0;
LABEL_30:

    goto LABEL_31;
  }
  if (![(NSString *)self->_conversionType isEqualToString:@"image"])
  {
    double v19 = @"Conversion option SharedStreamsDimensions is only valid for images\n";
LABEL_23:
    +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", v19, v25);
    goto LABEL_24;
  }
  [(id)objc_opt_class() sizeForImageAtPath:self->_sourcePath];
  if (v11 == *MEMORY[0x1E4F1DB30] && v10 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    +[MediaConversionServiceCommandLineDriver outputError:@"Unable to determine input image size for %@\n", self->_sourcePath];
LABEL_24:
    LOBYTE(v15) = 0;
    goto LABEL_31;
  }
  -[ConversionOptionSet scaleFactorForInputSize:sharedStreamsSizeSpecificationString:](self, "scaleFactorForInputSize:sharedStreamsSizeSpecificationString:", v7);
  if (v13 == 0.0)
  {
    double v19 = @"Unable to determine scale factor\n";
    goto LABEL_23;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  [(NSMutableDictionary *)self->_conversionOptions setObject:v14 forKeyedSubscript:@"PAMediaConversionServiceOptionScaleFactorKey"];

  LOBYTE(v15) = 1;
LABEL_31:

  return v15;
}

void __62__ConversionOptionSet_processConversionOptionKey_valueString___block_invoke()
{
}

- (id)presetNameToOptionsMappingForImageConversionOrVideoStillImageExtraction
{
  return &unk_1F394C058;
}

- (id)presetNameToOptionsMappingForVideoTranscoding
{
  v42[9] = *MEMORY[0x1E4F143B8];
  v41[0] = @"CPLResourceTypeVideoLargeSize";
  v31 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F15718]];
  v40[0] = v31;
  uint64_t v2 = *MEMORY[0x1E4F15AB0];
  v30 = [NSString stringWithFormat:@"OutputFileType=%@", *MEMORY[0x1E4F15AB0]];
  v40[1] = v30;
  v40[2] = @"AVIncludeMetadata=1";
  v40[3] = @"AVMetadataIncludeLocation=1";
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  v42[0] = v29;
  v41[1] = @"CPLResourceTypeVideoMediumSize";
  CMTime v28 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F15708]];
  v39[0] = v28;
  uint64_t v3 = *MEMORY[0x1E4F15AA8];
  CMTime v27 = [NSString stringWithFormat:@"OutputFileType=%@", *MEMORY[0x1E4F15AA8]];
  v39[1] = v27;
  v39[2] = @"AVIncludeMetadata=1";
  v39[3] = @"AVMetadataIncludeLocation=1";
  CMTimeRange v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  v42[1] = v26;
  v41[2] = @"CPLResourceTypeVideoMediumSize+LivePhoto";
  uint64_t v25 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F15700]];
  v38[0] = v25;
  v24 = [NSString stringWithFormat:@"OutputFileType=%@", v2];
  v38[1] = v24;
  v38[2] = @"AVIncludeMetadata=1";
  v38[3] = @"AVMetadataIncludeLocation=1";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  v42[2] = v23;
  v41[3] = @"CPLResourceTypeVideoMediumSize+HDR";
  v22 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F15710]];
  v37[0] = v22;
  double v21 = [NSString stringWithFormat:@"OutputFileType=%@", v2];
  v37[1] = v21;
  v37[2] = @"AVIncludeMetadata=1";
  v37[3] = @"AVMetadataIncludeLocation=1";
  unint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  v42[3] = v20;
  v41[4] = @"CPLResourceTypeVideoSmallSize";
  double v19 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F156F0]];
  v36[0] = v19;
  double v18 = [NSString stringWithFormat:@"OutputFileType=%@", v3];
  v36[1] = v18;
  v36[2] = @"AVIncludeMetadata=1";
  v36[3] = @"AVMetadataIncludeLocation=1";
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  v42[4] = v17;
  v41[5] = @"CPLResourceTypeVideoMetaData";
  v35[0] = @"IsVideoMetadataTrackExtraction=1";
  double v16 = [NSString stringWithFormat:@"OutputFileType=%@", v2];
  v35[1] = v16;
  BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v42[5] = v15;
  v41[6] = @"CPLResourceTypeVideoSmallSize+LivePhoto";
  id v4 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F156F8]];
  v34[0] = v4;
  id v5 = [NSString stringWithFormat:@"OutputFileType=%@", v2];
  v34[1] = v5;
  v34[2] = @"AVIncludeMetadata=1";
  v34[3] = @"AVMetadataIncludeLocation=1";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  v42[6] = v6;
  v41[7] = @"PhotostreamSmall";
  id v7 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F15760]];
  v33[0] = v7;
  uint64_t v8 = [NSString stringWithFormat:@"OutputFileType=%@", v3];
  v33[1] = v8;
  v33[2] = @"AVIncludeMetadata=1";
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v42[7] = v9;
  v41[8] = @"Photostream";
  double v10 = [NSString stringWithFormat:@"ExportPresetName=%@", *MEMORY[0x1E4F15768]];
  v32[0] = v10;
  double v11 = [NSString stringWithFormat:@"OutputFileType=%@", v3];
  v32[1] = v11;
  v32[2] = @"AVIncludeMetadata=1";
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v42[8] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:9];

  return v13;
}

- (id)presetListForMapping:(id)a3
{
  uint64_t v3 = [a3 allKeys];
  id v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

- (int)checkDestinationExists
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if (self->_destinationPath && objc_msgSend(v3, "fileExistsAtPath:")) {
    [v4 addObject:self->_destinationPath];
  }
  if (self->_destinationPathVideoComplement && objc_msgSend(v3, "fileExistsAtPath:")) {
    [v4 addObject:self->_destinationPathVideoComplement];
  }
  if (![v4 count])
  {
LABEL_18:
    int v14 = 0;
    goto LABEL_22;
  }
  if (self->_replaceExistingOutput)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v17 = 0;
          char v11 = [v3 removeItemAtPath:v10 error:&v17];
          id v12 = v17;
          double v13 = v12;
          if ((v11 & 1) == 0)
          {
            +[MediaConversionServiceCommandLineDriver outputError:@"Unable to remove existing item at %@: %@\n", v10, v12];

            goto LABEL_21;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    goto LABEL_18;
  }
  BOOL v15 = [v4 componentsJoinedByString:@","];
  +[MediaConversionServiceCommandLineDriver outputError:@"Destination path(s) already exist(s): %@. Use --replace option to overwrite existing output files.\n", v15];

LABEL_21:
  int v14 = 73;
LABEL_22:

  return v14;
}

- (int)validateAndProcess
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)objc_opt_class() knownConversionTypes];
  char v4 = [v3 containsObject:self->_conversionType];

  if (v4)
  {
    if (self->_presetName)
    {
      if ([(NSString *)self->_conversionType isEqualToString:@"video"]) {
        [(ConversionOptionSet *)self presetNameToOptionsMappingForVideoTranscoding];
      }
      else {
      uint64_t v8 = [(ConversionOptionSet *)self presetNameToOptionsMappingForImageConversionOrVideoStillImageExtraction];
      }
      uint64_t v9 = [v8 objectForKeyedSubscript:self->_presetName];
      if (!v9)
      {
        conversionType = self->_conversionType;
        double v13 = [(ConversionOptionSet *)self presetListForMapping:v8];
        +[MediaConversionServiceCommandLineDriver outputError:@"Valid preset names for conversion type %@: %@\n", conversionType, v13];

        goto LABEL_19;
      }
      uint64_t v10 = (void *)v9;
      [(NSMutableArray *)self->_conversionOptionInputKeyValuePairs addObjectsFromArray:v9];
    }
    BOOL v11 = ![(NSString *)self->_conversionType isEqualToString:@"still"]
       && [(NSMutableArray *)self->_conversionOptionInputKeyValuePairs count] == 0;
    if (!self->_sourcePath || !self->_destinationPath) {
      goto LABEL_17;
    }
    if (!self->_conversionType) {
      BOOL v11 = 1;
    }
    if (v11)
    {
LABEL_17:
      uint64_t v8 = +[MediaConversionServiceCommandLineDriver usage];
      +[MediaConversionServiceCommandLineDriver output:@"%@\n", v8];
LABEL_19:

      return 64;
    }
    BOOL v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v15 fileExistsAtPath:self->_sourcePath])
    {
      int v7 = [(ConversionOptionSet *)self checkDestinationExists];
      if (!v7)
      {
        double v16 = [MEMORY[0x1E4F1CA60] dictionary];
        conversionOptions = self->_conversionOptions;
        self->_conversionOptions = v16;

        [(NSMutableDictionary *)self->_conversionOptions setObject:@"photosctl media-conversion" forKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v18 = self->_conversionOptionInputKeyValuePairs;
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v32 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v24 = [v23 rangeOfString:@"="];
              if (v24) {
                BOOL v25 = v24 == 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                BOOL v25 = 1;
              }
              if (v25 || (uint64_t v26 = v24, v24 == [v23 length] - 1))
              {
                +[MediaConversionServiceCommandLineDriver outputError:@"Invalid conversion option '%@', expecting 'key=value' format\n", v23];
LABEL_45:

                goto LABEL_49;
              }
              CMTime v27 = objc_msgSend(v23, "substringWithRange:", 0, v26);
              CMTime v28 = objc_msgSend(v23, "substringWithRange:", v26 + 1, objc_msgSend(v23, "length") + ~v26);
              BOOL v29 = [(ConversionOptionSet *)self processConversionOptionKey:v27 valueString:v28];

              if (!v29) {
                goto LABEL_45;
              }
            }
            uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        if (!self->_sourcePathVideoComplement && !self->_destinationPathVideoComplement) {
          goto LABEL_40;
        }
        if ([(NSString *)self->_conversionType isEqual:@"image"])
        {
          if (self->_sourcePathVideoComplement)
          {
LABEL_40:
            if (self->_verbose) {
              +[MediaConversionServiceCommandLineDriver output:@"Conversion options: %@\n", self->_conversionOptions];
            }
            int v7 = 0;
            goto LABEL_50;
          }
          v30 = @"--source-video-complement is required if --destination-video-complement is given\n";
        }
        else
        {
          v30 = @"--source-video-complement and --destination-video-complement are only valid for image conversions\n";
        }
        +[MediaConversionServiceCommandLineDriver outputError:v30];
LABEL_49:
        int v7 = 65;
      }
    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:@"Source path does not exist: %@\n", self->_sourcePath];
      int v7 = 66;
    }
LABEL_50:

    return v7;
  }
  id v5 = [(id)objc_opt_class() knownConversionTypes];
  uint64_t v6 = [v5 componentsJoinedByString:@", "];
  +[MediaConversionServiceCommandLineDriver output:@"Please specify a valid conversion type: %@\n", v6];

  return 65;
}

- (ConversionOptionSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)ConversionOptionSet;
  uint64_t v2 = [(ConversionOptionSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    conversionOptionInputKeyValuePairs = v2->_conversionOptionInputKeyValuePairs;
    v2->_conversionOptionInputKeyValuePairs = (NSMutableArray *)v3;

    v2->_repeatCount = 1;
  }
  return v2;
}

+ (CGSize)sizeForImageAtPath:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  char v4 = +[PAMediaConversionServiceImagingUtilities primaryImagePropertiesForFileAtURL:v3];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
  double v6 = (double)[v5 integerValue];
  int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
  double v8 = (double)[v7 integerValue];

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (id)knownConversionTypes
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"image";
  v4[1] = @"video";
  v4[2] = @"still";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

@end