@interface ARTechnique
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
+ (id)colorForTechnique:(id)a3;
+ (id)techniqueMatchingPredicate:(id)a3 inArray:(id)a4;
+ (id)techniqueOfClass:(Class)a3 inArray:(id)a4;
- (ARTechnique)init;
- (ARTechnique)initWithParallelTechniques:(id)a3;
- (ARTechnique)initWithTechniques:(id)a3;
- (ARTechniqueDelegate)delegate;
- (ARTechniqueForwardingStrategy)splitTechniqueFowardingStrategy;
- (BOOL)deterministicMode;
- (BOOL)isEqual:(id)a3;
- (NSArray)splitTechniques;
- (NSNumber)traceKey;
- (NSString)description;
- (double)bonusLatency;
- (double)requiredTimeInterval;
- (id)_fullDescription;
- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4;
- (id)processData:(id)a3;
- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5;
- (id)resultDataClasses;
- (id)techniqueMatchingPredicate:(id)a3;
- (id)techniqueOfClass:(Class)a3;
- (id)techniques;
- (int64_t)captureBehavior;
- (unint64_t)hash;
- (unint64_t)optionalSensorDataTypes;
- (unint64_t)powerUsage;
- (unint64_t)requiredSensorDataTypes;
- (void)dotGraphWithLines:(id)a3;
- (void)reconfigureFrom:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setBonusLatency:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setPowerUsage:(unint64_t)a3;
- (void)setSplitTechniqueFowardingStrategy:(id)a3;
- (void)setSplitTechniques:(id)a3;
@end

@implementation ARTechnique

void __ARTechnique_Image_to_Result_Timestamp_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1258C78;
  v2[1] = &unk_1F1258CA8;
  v3[0] = &unk_1F1258C90;
  v3[1] = &unk_1F1258CC0;
  v2[2] = &unk_1F1258CD8;
  v2[3] = &unk_1F1258D08;
  v3[2] = &unk_1F1258CF0;
  v3[3] = &unk_1F1258D20;
  v2[4] = &unk_1F1258D38;
  v2[5] = &unk_1F1258D68;
  v3[4] = &unk_1F1258D50;
  v3[5] = &unk_1F1258D80;
  v2[6] = &unk_1F1258D98;
  v2[7] = &unk_1F1258DC8;
  v3[6] = &unk_1F1258DB0;
  v3[7] = &unk_1F1258DE0;
  v2[8] = &unk_1F1258DF8;
  v2[9] = &unk_1F1258E28;
  v3[8] = &unk_1F1258E10;
  v3[9] = &unk_1F1258E40;
  v2[10] = &unk_1F1258E58;
  v2[11] = &unk_1F1258E88;
  v3[10] = &unk_1F1258E70;
  v3[11] = &unk_1F1258EA0;
  v2[12] = &unk_1F1258EB8;
  v2[13] = &unk_1F1258EE8;
  v3[12] = &unk_1F1258ED0;
  v3[13] = &unk_1F1258F00;
  v2[14] = &unk_1F1258F18;
  v2[15] = &unk_1F1258F48;
  v3[14] = &unk_1F1258F30;
  v3[15] = &unk_1F1258F60;
  v2[16] = &unk_1F1258F78;
  v2[17] = &unk_1F1258FA8;
  v3[16] = &unk_1F1258F90;
  v3[17] = &unk_1F1258FC0;
  v2[18] = &unk_1F1258FD8;
  v2[19] = &unk_1F1259008;
  v3[18] = &unk_1F1258FF0;
  v3[19] = &unk_1F1259020;
  v2[20] = &unk_1F1259038;
  v2[21] = &unk_1F1259068;
  v3[20] = &unk_1F1259050;
  v3[21] = &unk_1F1259080;
  v2[22] = &unk_1F1259098;
  v2[23] = &unk_1F12590C8;
  v3[22] = &unk_1F12590B0;
  v3[23] = &unk_1F12590E0;
  v2[24] = &unk_1F12590F8;
  v2[25] = &unk_1F1259128;
  v3[24] = &unk_1F1259110;
  v3[25] = &unk_1F1259140;
  v2[26] = &unk_1F1259158;
  v2[27] = &unk_1F1259188;
  v3[26] = &unk_1F1259170;
  v3[27] = &unk_1F12591A0;
  v2[28] = &unk_1F12591B8;
  v2[29] = &unk_1F12591E8;
  v3[28] = &unk_1F12591D0;
  v3[29] = &unk_1F1259200;
  v2[30] = &unk_1F1259218;
  v2[31] = &unk_1F1259248;
  v3[30] = &unk_1F1259230;
  v3[31] = &unk_1F1259260;
  v2[32] = &unk_1F1259278;
  v2[33] = &unk_1F12592A8;
  v3[32] = &unk_1F1259290;
  v3[33] = &unk_1F12592C0;
  v2[34] = &unk_1F12592D8;
  v2[35] = &unk_1F1259308;
  v3[34] = &unk_1F12592F0;
  v3[35] = &unk_1F1259320;
  v2[36] = &unk_1F1259338;
  v3[36] = &unk_1F1259350;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Image_to_Result_Timestamp_keyToCode;
  ARTechnique_Image_to_Result_Timestamp_keyToCode = v0;
}

void __ARTechnique_Image_to_Result_Frame_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1258C78;
  v2[1] = &unk_1F1258CA8;
  v3[0] = &unk_1F1259368;
  v3[1] = &unk_1F1259380;
  v2[2] = &unk_1F1258CD8;
  v2[3] = &unk_1F1258D08;
  v3[2] = &unk_1F1259398;
  v3[3] = &unk_1F12593B0;
  v2[4] = &unk_1F1258D38;
  v2[5] = &unk_1F1258D68;
  v3[4] = &unk_1F12593C8;
  v3[5] = &unk_1F12593E0;
  v2[6] = &unk_1F1258D98;
  v2[7] = &unk_1F1258DC8;
  v3[6] = &unk_1F12593F8;
  v3[7] = &unk_1F1259410;
  v2[8] = &unk_1F1258DF8;
  v2[9] = &unk_1F1258E28;
  v3[8] = &unk_1F1259428;
  v3[9] = &unk_1F1259440;
  v2[10] = &unk_1F1258E58;
  v2[11] = &unk_1F1258E88;
  v3[10] = &unk_1F1259458;
  v3[11] = &unk_1F1259470;
  v2[12] = &unk_1F1258EB8;
  v2[13] = &unk_1F1258EE8;
  v3[12] = &unk_1F1259488;
  v3[13] = &unk_1F12594A0;
  v2[14] = &unk_1F1258F18;
  v2[15] = &unk_1F1258F48;
  v3[14] = &unk_1F12594B8;
  v3[15] = &unk_1F12594D0;
  v2[16] = &unk_1F1258F78;
  v2[17] = &unk_1F1258FA8;
  v3[16] = &unk_1F12594E8;
  v3[17] = &unk_1F1259500;
  v2[18] = &unk_1F1258FD8;
  v2[19] = &unk_1F1259008;
  v3[18] = &unk_1F1259518;
  v3[19] = &unk_1F1259530;
  v2[20] = &unk_1F1259038;
  v2[21] = &unk_1F1259068;
  v3[20] = &unk_1F1259548;
  v3[21] = &unk_1F1259560;
  v2[22] = &unk_1F1259098;
  v2[23] = &unk_1F12590C8;
  v3[22] = &unk_1F1259578;
  v3[23] = &unk_1F1259590;
  v2[24] = &unk_1F12590F8;
  v2[25] = &unk_1F1259128;
  v3[24] = &unk_1F12595A8;
  v3[25] = &unk_1F12595C0;
  v2[26] = &unk_1F1259158;
  v2[27] = &unk_1F1259188;
  v3[26] = &unk_1F12595D8;
  v3[27] = &unk_1F12595F0;
  v2[28] = &unk_1F12591B8;
  v2[29] = &unk_1F12591E8;
  v3[28] = &unk_1F1259608;
  v3[29] = &unk_1F1259620;
  v2[30] = &unk_1F1259218;
  v2[31] = &unk_1F1259248;
  v3[30] = &unk_1F1259638;
  v3[31] = &unk_1F1259650;
  v2[32] = &unk_1F1259278;
  v2[33] = &unk_1F12592A8;
  v3[32] = &unk_1F1259668;
  v3[33] = &unk_1F1259680;
  v2[34] = &unk_1F12592D8;
  v2[35] = &unk_1F1259308;
  v3[34] = &unk_1F1259698;
  v3[35] = &unk_1F12596B0;
  v2[36] = &unk_1F1259338;
  v3[36] = &unk_1F12596C8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Image_to_Result_Frame_keyToCode;
  ARTechnique_Image_to_Result_Frame_keyToCode = v0;
}

void __ARTechnique_Image_to_Result_FrameEnd_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1258C78;
  v2[1] = &unk_1F1258CA8;
  v3[0] = &unk_1F12596E0;
  v3[1] = &unk_1F12596F8;
  v2[2] = &unk_1F1258CD8;
  v2[3] = &unk_1F1258D08;
  v3[2] = &unk_1F1259710;
  v3[3] = &unk_1F1259728;
  v2[4] = &unk_1F1258D38;
  v2[5] = &unk_1F1258D68;
  v3[4] = &unk_1F1259740;
  v3[5] = &unk_1F1259758;
  v2[6] = &unk_1F1258D98;
  v2[7] = &unk_1F1258DC8;
  v3[6] = &unk_1F1259770;
  v3[7] = &unk_1F1259788;
  v2[8] = &unk_1F1258DF8;
  v2[9] = &unk_1F1258E28;
  v3[8] = &unk_1F12597A0;
  v3[9] = &unk_1F12597B8;
  v2[10] = &unk_1F1258E58;
  v2[11] = &unk_1F1258E88;
  v3[10] = &unk_1F12597D0;
  v3[11] = &unk_1F12597E8;
  v2[12] = &unk_1F1258EB8;
  v2[13] = &unk_1F1258EE8;
  v3[12] = &unk_1F1259800;
  v3[13] = &unk_1F1259818;
  v2[14] = &unk_1F1258F18;
  v2[15] = &unk_1F1258F48;
  v3[14] = &unk_1F1259830;
  v3[15] = &unk_1F1259848;
  v2[16] = &unk_1F1258F78;
  v2[17] = &unk_1F1258FA8;
  v3[16] = &unk_1F1259860;
  v3[17] = &unk_1F1259878;
  v2[18] = &unk_1F1258FD8;
  v2[19] = &unk_1F1259008;
  v3[18] = &unk_1F1259890;
  v3[19] = &unk_1F12598A8;
  v2[20] = &unk_1F1259038;
  v2[21] = &unk_1F1259068;
  v3[20] = &unk_1F12598C0;
  v3[21] = &unk_1F12598D8;
  v2[22] = &unk_1F1259098;
  v2[23] = &unk_1F12590C8;
  v3[22] = &unk_1F12598F0;
  v3[23] = &unk_1F1259908;
  v2[24] = &unk_1F12590F8;
  v2[25] = &unk_1F1259128;
  v3[24] = &unk_1F1259920;
  v3[25] = &unk_1F1259938;
  v2[26] = &unk_1F1259158;
  v2[27] = &unk_1F1259188;
  v3[26] = &unk_1F1259950;
  v3[27] = &unk_1F1259968;
  v2[28] = &unk_1F12591B8;
  v2[29] = &unk_1F12591E8;
  v3[28] = &unk_1F1259980;
  v3[29] = &unk_1F1259998;
  v2[30] = &unk_1F1259218;
  v2[31] = &unk_1F1259248;
  v3[30] = &unk_1F12599B0;
  v3[31] = &unk_1F12599C8;
  v2[32] = &unk_1F1259278;
  v2[33] = &unk_1F12592A8;
  v3[32] = &unk_1F12599E0;
  v3[33] = &unk_1F12599F8;
  v2[34] = &unk_1F12592D8;
  v2[35] = &unk_1F1259308;
  v3[34] = &unk_1F1259A10;
  v3[35] = &unk_1F1259A28;
  v2[36] = &unk_1F1259338;
  v3[36] = &unk_1F1259A40;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Image_to_Result_FrameEnd_keyToCode;
  ARTechnique_Image_to_Result_FrameEnd_keyToCode = v0;
}

void __ARTechnique_Image_to_Result_TimestampEnd_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1258C78;
  v2[1] = &unk_1F1258CA8;
  v3[0] = &unk_1F1259A58;
  v3[1] = &unk_1F1259A70;
  v2[2] = &unk_1F1258CD8;
  v2[3] = &unk_1F1258D08;
  v3[2] = &unk_1F1259A88;
  v3[3] = &unk_1F1259AA0;
  v2[4] = &unk_1F1258D38;
  v2[5] = &unk_1F1258D68;
  v3[4] = &unk_1F1259AB8;
  v3[5] = &unk_1F1259AD0;
  v2[6] = &unk_1F1258D98;
  v2[7] = &unk_1F1258DC8;
  v3[6] = &unk_1F1259AE8;
  v3[7] = &unk_1F1259B00;
  v2[8] = &unk_1F1258DF8;
  v2[9] = &unk_1F1258E28;
  v3[8] = &unk_1F1259B18;
  v3[9] = &unk_1F1259B30;
  v2[10] = &unk_1F1258E58;
  v2[11] = &unk_1F1258E88;
  v3[10] = &unk_1F1259B48;
  v3[11] = &unk_1F1259B60;
  v2[12] = &unk_1F1258EB8;
  v2[13] = &unk_1F1258EE8;
  v3[12] = &unk_1F1259B78;
  v3[13] = &unk_1F1259B90;
  v2[14] = &unk_1F1258F18;
  v2[15] = &unk_1F1258F48;
  v3[14] = &unk_1F1259BA8;
  v3[15] = &unk_1F1259BC0;
  v2[16] = &unk_1F1258F78;
  v2[17] = &unk_1F1258FA8;
  v3[16] = &unk_1F1259BD8;
  v3[17] = &unk_1F1259BF0;
  v2[18] = &unk_1F1258FD8;
  v2[19] = &unk_1F1259008;
  v3[18] = &unk_1F1259C08;
  v3[19] = &unk_1F1259C20;
  v2[20] = &unk_1F1259038;
  v2[21] = &unk_1F1259068;
  v3[20] = &unk_1F1259C38;
  v3[21] = &unk_1F1259C50;
  v2[22] = &unk_1F1259098;
  v2[23] = &unk_1F12590C8;
  v3[22] = &unk_1F1259C68;
  v3[23] = &unk_1F1259C80;
  v2[24] = &unk_1F12590F8;
  v2[25] = &unk_1F1259128;
  v3[24] = &unk_1F1259C98;
  v3[25] = &unk_1F1259CB0;
  v2[26] = &unk_1F1259158;
  v2[27] = &unk_1F1259188;
  v3[26] = &unk_1F1259CC8;
  v3[27] = &unk_1F1259CE0;
  v2[28] = &unk_1F12591B8;
  v2[29] = &unk_1F12591E8;
  v3[28] = &unk_1F1259CF8;
  v3[29] = &unk_1F1259D10;
  v2[30] = &unk_1F1259218;
  v2[31] = &unk_1F1259248;
  v3[30] = &unk_1F1259D28;
  v3[31] = &unk_1F1259D40;
  v2[32] = &unk_1F1259278;
  v2[33] = &unk_1F12592A8;
  v3[32] = &unk_1F1259D58;
  v3[33] = &unk_1F1259D70;
  v2[34] = &unk_1F12592D8;
  v2[35] = &unk_1F1259308;
  v3[34] = &unk_1F1259D88;
  v3[35] = &unk_1F1259DA0;
  v2[36] = &unk_1F1259338;
  v3[36] = &unk_1F1259DB8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Image_to_Result_TimestampEnd_keyToCode;
  ARTechnique_Image_to_Result_TimestampEnd_keyToCode = v0;
}

+ (id)colorForTechnique:(id)a3
{
  id v3 = a3;
  if (colorForTechnique__dotColorsOnceToken != -1) {
    dispatch_once(&colorForTechnique__dotColorsOnceToken, &__block_literal_global_29);
  }
  if (colorForTechnique__onceToken != -1) {
    dispatch_once(&colorForTechnique__onceToken, &__block_literal_global_45);
  }
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(id)colorForTechnique__colorForTechnique objectForKeyedSubscript:v5];

  if (!v6)
  {
    v7 = (void *)colorForTechnique__dotColors;
    id v8 = v5;
    unint64_t v9 = [v8 length];
    if (v9)
    {
      int v10 = 0;
      for (uint64_t i = 0; i != v9; ++i)
        int v10 = [v8 characterAtIndex:i] + 263 * v10;
      unint64_t v9 = v10 & 0x1FFF;
    }

    v12 = objc_msgSend(v7, "objectAtIndexedSubscript:", v9 % objc_msgSend((id)colorForTechnique__dotColors, "count"));
    [(id)colorForTechnique__colorForTechnique setObject:v12 forKeyedSubscript:v8];
  }
  v13 = [(id)colorForTechnique__colorForTechnique objectForKeyedSubscript:v5];

  return v13;
}

void __43__ARTechnique_DotGraph__colorForTechnique___block_invoke()
{
  uint64_t v0 = (void *)colorForTechnique__dotColors;
  colorForTechnique__dotColors = (uint64_t)&unk_1F125BCC0;
}

void __43__ARTechnique_DotGraph__colorForTechnique___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)colorForTechnique__colorForTechnique;
  colorForTechnique__colorForTechnique = v0;
}

- (void)dotGraphWithLines:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  v60 = self;
  v4 = [(ARTechnique *)self delegate];
  if (v4)
  {
    v5 = [(ARTechnique *)self delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = NSString;
      id v8 = [(ARTechnique *)self delegate];
      unint64_t v9 = [(ARTechnique *)self delegate];
      int v10 = +[ARTechnique colorForTechnique:v9];
      v11 = [v7 stringWithFormat:@"\"(%p)\"[style=filled fillcolor=%@]", v8, v10];
      [v59 addObject:v11];

      v12 = NSString;
      v13 = [(ARTechnique *)self delegate];
      v14 = objc_msgSend(v12, "stringWithFormat:", @"\"(%p)\" -> \"(%p)\"[arrowhead=\"empty\" style=dotted]", self, v13);
      [v59 addObject:v14];
    }
  }
  v15 = (void *)MEMORY[0x1E4F28E78];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v58 = [v15 stringWithFormat:@"\"(%p)\"[label=\"{%@|(%p)", self, v17, self];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = objc_initWeak(&location, self);
    [(ARTechnique *)self imageSize];
    double v20 = v19;
    id v21 = objc_loadWeakRetained(&location);
    [v21 imageSize];
    objc_msgSend(v58, "appendFormat:", @"|(%d x %d)", (int)v20, (int)v22);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = objc_initWeak(&location, self);
      [(ARTechnique *)self networkInputScaleBeforeRotation];
      double v25 = v24;
      id v26 = objc_loadWeakRetained(&location);
      [v26 networkInputScaleBeforeRotation];
      objc_msgSend(v58, "appendFormat:", @"|(%d x %d)", (int)v25, (int)v27);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = objc_initWeak(&location, self);
        int v29 = [(ARTechnique *)self isParallel];
        v30 = @"Sequential";
        if (v29) {
          v30 = @"Parallel";
        }
        [v58 appendFormat:@"|%@", v30];

        objc_destroyWeak(&location);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_initWeak(&location, self);
          [v58 appendString:@"|{ℹ"];
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v31 = objc_loadWeakRetained(&location);
          v32 = [v31 synchronizedResultDataClasses];

          uint64_t v33 = [v32 countByEnumeratingWithState:&v69 objects:v76 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v70;
            do
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v70 != v34) {
                  objc_enumerationMutation(v32);
                }
                v36 = NSStringFromClass(*(Class *)(*((void *)&v69 + 1) + 8 * i));
                [v58 appendFormat:@"|%@", v36];
              }
              uint64_t v33 = [v32 countByEnumeratingWithState:&v69 objects:v76 count:16];
            }
            while (v33);
          }

          [v58 appendString:@"}"];
          objc_destroyWeak(&location);
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(ARTechnique *)v60 performSelector:sel_shouldOperateOnHighResolutionImages])
  {
    [v58 appendString:@"|HighResOnly"];
  }
  [(ARTechnique *)v60 requiredTimeInterval];
  if (v37 > 0.0)
  {
    [(ARTechnique *)v60 requiredTimeInterval];
    objc_msgSend(v58, "appendFormat:", @"|Required time interval: %dms", (int)(v38 * 1000.0));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = [(ARTechnique *)v60 resultDataClasses];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      [v58 appendString:@"|{ℹ"];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v41 = [(ARTechnique *)v60 resultDataClasses];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v66 != v43) {
              objc_enumerationMutation(v41);
            }
            v45 = NSStringFromClass(*(Class *)(*((void *)&v65 + 1) + 8 * j));
            [v58 appendFormat:@"|%@", v45];
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }
        while (v42);
      }

      [v58 appendString:@"}"];
    }
  }
  [v58 appendString:@"}\"]"];
  v46 = NSString;
  objc_opt_class();
  char v47 = objc_opt_isKindOfClass();
  if (v47)
  {
    v48 = @"lightgray";
  }
  else
  {
    v48 = +[ARTechnique colorForTechnique:v60];
  }
  v49 = [v46 stringWithFormat:@"%@[style=filled fillcolor=%@]", v58, v48];
  [v59 addObject:v49];

  if ((v47 & 1) == 0) {
  long long v63 = 0u;
  }
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v50 = [(ARTechnique *)v60 splitTechniques];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v62 != v52) {
          objc_enumerationMutation(v50);
        }
        v54 = *(void **)(*((void *)&v61 + 1) + 8 * k);
        v55 = NSString;
        objc_opt_class();
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v56 = @"[shape=square]";
        }
        else {
          v56 = &stru_1F120C8F0;
        }
        v57 = [v55 stringWithFormat:@"\"(%p)\"%@ -> \"(%p)\"[style=dashed penwidth=5]", v60, v56, v54];
        [v59 addObject:v57];

        [v54 dotGraphWithLines:v59];
      }
      uint64_t v51 = [v50 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v51);
  }
}

- (ARTechnique)init
{
  v15.receiver = self;
  v15.super_class = (Class)ARTechnique;
  v2 = [(ARTechnique *)&v15 init];
  if (v2)
  {
    id v3 = NSNumber;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = [v5 length];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      for (uint64_t i = 0; i != v7; ++i)
        int v8 = [v5 characterAtIndex:i] + 263 * v8;
      uint64_t v10 = v8 & 0x1FFF;
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [v3 numberWithUnsignedShort:v10];
    traceKey = v2->_traceKey;
    v2->_traceKey = (NSNumber *)v11;

    splitTechniques = v2->_splitTechniques;
    v2->_splitTechniques = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (unint64_t)requiredSensorDataTypes
{
  return 0;
}

- (unint64_t)optionalSensorDataTypes
{
  return 0;
}

- (double)requiredTimeInterval
{
  return 0.0;
}

- (int64_t)captureBehavior
{
  return 0;
}

- (BOOL)deterministicMode
{
  return 0;
}

- (id)resultDataClasses
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (void)reconfigureFrom:(id)a3
{
  id v4 = a3;
  v5 = [v4 splitTechniques];
  [(ARTechnique *)self setSplitTechniques:v5];

  id v6 = [v4 splitTechniqueFowardingStrategy];

  [(ARTechnique *)self setSplitTechniqueFowardingStrategy:v6];
}

- (id)processData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(ARTechnique *)self splitTechniques];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v7 = v4;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    uint64_t v7 = v4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [(ARTechnique *)self splitTechniqueFowardingStrategy];

        if (v12)
        {
          v13 = [(ARTechnique *)self splitTechniqueFowardingStrategy];
          int v14 = [v13 shouldProcessData:v7];

          if (!v14) {
            continue;
          }
        }
        uint64_t v15 = [v11 processData:v7];

        uint64_t v7 = (void *)v15;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v7;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v9 = a4;
  uint64_t v6 = [(ARTechnique *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(ARTechnique *)self delegate];
    [v8 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v9 context:a3];
  }
}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v5 = a3;
  return v5;
}

- (id)techniqueOfClass:(Class)a3
{
  if (objc_opt_isKindOfClass()) {
    id v4 = self;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

+ (id)techniqueOfClass:(Class)a3 inArray:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      uint64_t v17 = 0;
      long long v18 = &v17;
      uint64_t v19 = 0x3032000000;
      long long v20 = __Block_byref_object_copy_;
      id v21 = __Block_byref_object_dispose_;
      id v22 = [v10 techniqueOfClass:a3];
      uint64_t v11 = (void *)v18[5];
      if (v11) {
        goto LABEL_8;
      }
      v12 = [v10 splitTechniques];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __40__ARTechnique_techniqueOfClass_inArray___block_invoke;
      v16[3] = &unk_1E6186498;
      v16[4] = &v17;
      v16[5] = a3;
      [v12 enumerateObjectsUsingBlock:v16];

      uint64_t v11 = (void *)v18[5];
      if (v11)
      {
LABEL_8:
        id v4 = v11;
        int v13 = 0;
      }
      else
      {
        int v13 = 1;
      }
      _Block_object_dispose(&v17, 8);

      if (!v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v14 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v7 = v14;
        if (v14) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    id v4 = 0;
  }

  return v4;
}

void __40__ARTechnique_techniqueOfClass_inArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 techniqueOfClass:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)techniqueMatchingPredicate:(id)a3
{
  if ([a3 evaluateWithObject:self]) {
    id v4 = self;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

+ (id)techniqueMatchingPredicate:(id)a3 inArray:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
      uint64_t v20 = 0;
      id v21 = &v20;
      uint64_t v22 = 0x3032000000;
      long long v23 = __Block_byref_object_copy_;
      long long v24 = __Block_byref_object_dispose_;
      id v25 = [v11 techniqueMatchingPredicate:v6];
      v12 = (void *)v21[5];
      if (v12)
      {
        id v4 = v12;
        int v13 = 1;
      }
      else
      {
        uint64_t v14 = [v11 splitTechniques];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __50__ARTechnique_techniqueMatchingPredicate_inArray___block_invoke;
        v17[3] = &unk_1E61864C0;
        uint64_t v19 = &v20;
        id v18 = v6;
        [v14 enumerateObjectsUsingBlock:v17];

        uint64_t v15 = (void *)v21[5];
        if (v15)
        {
          id v4 = v15;
          int v13 = 1;
        }
        else
        {
          int v13 = 0;
        }
      }
      _Block_object_dispose(&v20, 8);

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    id v4 = 0;
  }

  return v4;
}

void __50__ARTechnique_techniqueMatchingPredicate_inArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 techniqueMatchingPredicate:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return 0;
}

- (id)techniques
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@(%p)>", v5, self];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(ARTechnique *)self splitTechniques];
    uint64_t v7 = [v5 splitTechniques];
    if (v6 == v7)
    {
      uint64_t v9 = [(ARTechnique *)self splitTechniqueFowardingStrategy];
      uint64_t v10 = [v5 splitTechniqueFowardingStrategy];
      BOOL v8 = v9 == v10;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_fullDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(ARTechnique *)self description];
  id v5 = [v3 stringWithFormat:@"%@", v4];

  [(ARTechnique *)self requiredTimeInterval];
  objc_msgSend(v5, "appendFormat:", @" time: %lfs", v6);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(ARTechnique *)self performSelector:sel_isBusy];
    BOOL v8 = @"Busy";
    if (!v7) {
      BOOL v8 = @"NotBusy";
    }
    [v5 appendFormat:@" %@", v8];
  }
  BOOL v9 = [(ARTechnique *)self deterministicMode];
  uint64_t v10 = @"Non-Deterministic";
  if (v9) {
    uint64_t v10 = @"Deterministic";
  }
  [v5 appendFormat:@" %@", v10];
  splitTechniqueFowardingStrategy = self->_splitTechniqueFowardingStrategy;
  if (splitTechniqueFowardingStrategy)
  {
    v12 = [(ARTechniqueForwardingStrategy *)splitTechniqueFowardingStrategy description];
    [v5 appendFormat:@"\nForwarding Strategy: %@", v12];
  }
  if ([(NSArray *)self->_splitTechniques count])
  {
    int v13 = v5;
    [v5 appendFormat:@"\nSplit Techniques:"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obuint64_t j = self->_splitTechniques;
    uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = [*(id *)(*((void *)&v23 + 1) + 8 * i) _fullDescription];
          uint64_t v19 = [v18 description];
          uint64_t v20 = [v19 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t|\t"];
          [v13 appendFormat:@"\n\t| - %@", v20];
        }
        uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    id v5 = v13;
  }
  return v5;
}

- (ARTechnique)initWithTechniques:(id)a3
{
  id v4 = a3;
  id v5 = [[ARParentTechnique alloc] initWithTechniques:v4];

  return &v5->super;
}

- (ARTechnique)initWithParallelTechniques:(id)a3
{
  id v4 = a3;
  id v5 = [[ARParentTechnique alloc] initWithParallelTechniques:v4];

  return &v5->super;
}

- (double)bonusLatency
{
  return self->_bonusLatency;
}

- (void)setBonusLatency:(double)a3
{
  self->_bonusLatency = a3;
}

- (NSNumber)traceKey
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (ARTechniqueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARTechniqueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (void)setPowerUsage:(unint64_t)a3
{
  self->_powerUsage = a3;
}

- (ARTechniqueForwardingStrategy)splitTechniqueFowardingStrategy
{
  return (ARTechniqueForwardingStrategy *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSplitTechniqueFowardingStrategy:(id)a3
{
}

- (NSArray)splitTechniques
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSplitTechniques:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitTechniques, 0);
  objc_storeStrong((id *)&self->_splitTechniqueFowardingStrategy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traceKey, 0);
}

void __ARTechnique_Request_to_Result_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1259E60;
  v2[1] = &unk_1F1259E90;
  v3[0] = &unk_1F1259E78;
  v3[1] = &unk_1F1259EA8;
  v2[2] = &unk_1F1259EC0;
  v2[3] = &unk_1F1259EF0;
  v3[2] = &unk_1F1259ED8;
  v3[3] = &unk_1F1259F08;
  v2[4] = &unk_1F1259F20;
  v2[5] = &unk_1F1259F50;
  v3[4] = &unk_1F1259F38;
  v3[5] = &unk_1F1259F68;
  v2[6] = &unk_1F1259F80;
  v2[7] = &unk_1F1259FB0;
  v3[6] = &unk_1F1259F98;
  v3[7] = &unk_1F1259FC8;
  v2[8] = &unk_1F1259FE0;
  v2[9] = &unk_1F125A010;
  v3[8] = &unk_1F1259FF8;
  v3[9] = &unk_1F125A028;
  v2[10] = &unk_1F125A040;
  v2[11] = &unk_1F125A070;
  v3[10] = &unk_1F125A058;
  v3[11] = &unk_1F125A088;
  v2[12] = &unk_1F125A0A0;
  v2[13] = &unk_1F125A0D0;
  v3[12] = &unk_1F125A0B8;
  v3[13] = &unk_1F125A0E8;
  v2[14] = &unk_1F125A100;
  v2[15] = &unk_1F125A130;
  v3[14] = &unk_1F125A118;
  v3[15] = &unk_1F125A148;
  v2[16] = &unk_1F125A160;
  v2[17] = &unk_1F125A190;
  v3[16] = &unk_1F125A178;
  v3[17] = &unk_1F125A1A8;
  v2[18] = &unk_1F125A1C0;
  v2[19] = &unk_1F125A1F0;
  v3[18] = &unk_1F125A1D8;
  v3[19] = &unk_1F125A208;
  v2[20] = &unk_1F125A220;
  v2[21] = &unk_1F125A250;
  v3[20] = &unk_1F125A238;
  v3[21] = &unk_1F125A268;
  v2[22] = &unk_1F125A280;
  v2[23] = &unk_1F125A2B0;
  v3[22] = &unk_1F125A298;
  v3[23] = &unk_1F125A2C8;
  v2[24] = &unk_1F125A2E0;
  v2[25] = &unk_1F125A310;
  v3[24] = &unk_1F125A2F8;
  v3[25] = &unk_1F125A328;
  v2[26] = &unk_1F125A340;
  v2[27] = &unk_1F125A370;
  v3[26] = &unk_1F125A358;
  v3[27] = &unk_1F125A388;
  v2[28] = &unk_1F125A3A0;
  v2[29] = &unk_1F125A3D0;
  v3[28] = &unk_1F125A3B8;
  v3[29] = &unk_1F125A3E8;
  v2[30] = &unk_1F125A400;
  v2[31] = &unk_1F125A430;
  v3[30] = &unk_1F125A418;
  v3[31] = &unk_1F125A448;
  v2[32] = &unk_1F125A460;
  v2[33] = &unk_1F125A490;
  v3[32] = &unk_1F125A478;
  v3[33] = &unk_1F125A4A8;
  v2[34] = &unk_1F125A4C0;
  v2[35] = &unk_1F125A4F0;
  v3[34] = &unk_1F125A4D8;
  v3[35] = &unk_1F125A508;
  v2[36] = &unk_1F125A520;
  v3[36] = &unk_1F125A538;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Request_to_Result_keyToCode;
  ARTechnique_Request_to_Result_keyToCode = v0;
}

void __ARTechnique_Request_begin_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1259E60;
  v2[1] = &unk_1F1259E90;
  v3[0] = &unk_1F125A550;
  v3[1] = &unk_1F125A568;
  v2[2] = &unk_1F1259EC0;
  v2[3] = &unk_1F1259EF0;
  v3[2] = &unk_1F125A580;
  v3[3] = &unk_1F125A598;
  v2[4] = &unk_1F1259F20;
  v2[5] = &unk_1F1259F50;
  v3[4] = &unk_1F125A5B0;
  v3[5] = &unk_1F125A5C8;
  v2[6] = &unk_1F1259F80;
  v2[7] = &unk_1F1259FB0;
  v3[6] = &unk_1F125A5E0;
  v3[7] = &unk_1F125A5F8;
  v2[8] = &unk_1F1259FE0;
  v2[9] = &unk_1F125A010;
  v3[8] = &unk_1F125A610;
  v3[9] = &unk_1F125A628;
  v2[10] = &unk_1F125A040;
  v2[11] = &unk_1F125A070;
  v3[10] = &unk_1F125A640;
  v3[11] = &unk_1F125A658;
  v2[12] = &unk_1F125A0A0;
  v2[13] = &unk_1F125A0D0;
  v3[12] = &unk_1F125A670;
  v3[13] = &unk_1F125A688;
  v2[14] = &unk_1F125A100;
  v2[15] = &unk_1F125A130;
  v3[14] = &unk_1F125A6A0;
  v3[15] = &unk_1F125A6B8;
  v2[16] = &unk_1F125A160;
  v2[17] = &unk_1F125A190;
  v3[16] = &unk_1F125A6D0;
  v3[17] = &unk_1F125A6E8;
  v2[18] = &unk_1F125A1C0;
  v2[19] = &unk_1F125A1F0;
  v3[18] = &unk_1F125A700;
  v3[19] = &unk_1F125A718;
  v2[20] = &unk_1F125A220;
  v2[21] = &unk_1F125A250;
  v3[20] = &unk_1F125A730;
  v3[21] = &unk_1F125A748;
  v2[22] = &unk_1F125A280;
  v2[23] = &unk_1F125A2B0;
  v3[22] = &unk_1F125A760;
  v3[23] = &unk_1F125A778;
  v2[24] = &unk_1F125A2E0;
  v2[25] = &unk_1F125A310;
  v3[24] = &unk_1F125A790;
  v3[25] = &unk_1F125A7A8;
  v2[26] = &unk_1F125A340;
  v2[27] = &unk_1F125A370;
  v3[26] = &unk_1F125A7C0;
  v3[27] = &unk_1F125A7D8;
  v2[28] = &unk_1F125A3A0;
  v2[29] = &unk_1F125A3D0;
  v3[28] = &unk_1F125A7F0;
  v3[29] = &unk_1F125A808;
  v2[30] = &unk_1F125A400;
  v2[31] = &unk_1F125A430;
  v3[30] = &unk_1F125A820;
  v3[31] = &unk_1F125A838;
  v2[32] = &unk_1F125A460;
  v2[33] = &unk_1F125A490;
  v3[32] = &unk_1F125A850;
  v3[33] = &unk_1F125A868;
  v2[34] = &unk_1F125A4C0;
  v2[35] = &unk_1F125A4F0;
  v3[34] = &unk_1F125A880;
  v3[35] = &unk_1F125A898;
  v2[36] = &unk_1F125A520;
  v3[36] = &unk_1F125A8B0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Request_begin_keyToCode;
  ARTechnique_Request_begin_keyToCode = v0;
}

void __ARTechnique_Request_to_ResultEnd_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1259E60;
  v2[1] = &unk_1F1259E90;
  v3[0] = &unk_1F125A8C8;
  v3[1] = &unk_1F125A8E0;
  v2[2] = &unk_1F1259EC0;
  v2[3] = &unk_1F1259EF0;
  v3[2] = &unk_1F125A8F8;
  v3[3] = &unk_1F125A910;
  v2[4] = &unk_1F1259F20;
  v2[5] = &unk_1F1259F50;
  v3[4] = &unk_1F125A928;
  v3[5] = &unk_1F125A940;
  v2[6] = &unk_1F1259F80;
  v2[7] = &unk_1F1259FB0;
  v3[6] = &unk_1F125A958;
  v3[7] = &unk_1F125A970;
  v2[8] = &unk_1F1259FE0;
  v2[9] = &unk_1F125A010;
  v3[8] = &unk_1F125A988;
  v3[9] = &unk_1F125A9A0;
  v2[10] = &unk_1F125A040;
  v2[11] = &unk_1F125A070;
  v3[10] = &unk_1F125A9B8;
  v3[11] = &unk_1F125A9D0;
  v2[12] = &unk_1F125A0A0;
  v2[13] = &unk_1F125A0D0;
  v3[12] = &unk_1F125A9E8;
  v3[13] = &unk_1F125AA00;
  v2[14] = &unk_1F125A100;
  v2[15] = &unk_1F125A130;
  v3[14] = &unk_1F125AA18;
  v3[15] = &unk_1F125AA30;
  v2[16] = &unk_1F125A160;
  v2[17] = &unk_1F125A190;
  v3[16] = &unk_1F125AA48;
  v3[17] = &unk_1F125AA60;
  v2[18] = &unk_1F125A1C0;
  v2[19] = &unk_1F125A1F0;
  v3[18] = &unk_1F125AA78;
  v3[19] = &unk_1F125AA90;
  v2[20] = &unk_1F125A220;
  v2[21] = &unk_1F125A250;
  v3[20] = &unk_1F125AAA8;
  v3[21] = &unk_1F125AAC0;
  v2[22] = &unk_1F125A280;
  v2[23] = &unk_1F125A2B0;
  v3[22] = &unk_1F125AAD8;
  v3[23] = &unk_1F125AAF0;
  v2[24] = &unk_1F125A2E0;
  v2[25] = &unk_1F125A310;
  v3[24] = &unk_1F125AB08;
  v3[25] = &unk_1F125AB20;
  v2[26] = &unk_1F125A340;
  v2[27] = &unk_1F125A370;
  v3[26] = &unk_1F125AB38;
  v3[27] = &unk_1F125AB50;
  v2[28] = &unk_1F125A3A0;
  v2[29] = &unk_1F125A3D0;
  v3[28] = &unk_1F125AB68;
  v3[29] = &unk_1F125AB80;
  v2[30] = &unk_1F125A400;
  v2[31] = &unk_1F125A430;
  v3[30] = &unk_1F125AB98;
  v3[31] = &unk_1F125ABB0;
  v2[32] = &unk_1F125A460;
  v2[33] = &unk_1F125A490;
  v3[32] = &unk_1F125ABC8;
  v3[33] = &unk_1F125ABE0;
  v2[34] = &unk_1F125A4C0;
  v2[35] = &unk_1F125A4F0;
  v3[34] = &unk_1F125ABF8;
  v3[35] = &unk_1F125AC10;
  v2[36] = &unk_1F125A520;
  v3[36] = &unk_1F125AC28;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Request_to_ResultEnd_keyToCode;
  ARTechnique_Request_to_ResultEnd_keyToCode = v0;
}

void __ARTechnique_Request_fulfilled_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1259E60;
  v2[1] = &unk_1F1259E90;
  v3[0] = &unk_1F125AC40;
  v3[1] = &unk_1F125AC58;
  v2[2] = &unk_1F1259EC0;
  v2[3] = &unk_1F1259EF0;
  v3[2] = &unk_1F125AC70;
  v3[3] = &unk_1F125AC88;
  v2[4] = &unk_1F1259F20;
  v2[5] = &unk_1F1259F50;
  v3[4] = &unk_1F125ACA0;
  v3[5] = &unk_1F125ACB8;
  v2[6] = &unk_1F1259F80;
  v2[7] = &unk_1F1259FB0;
  v3[6] = &unk_1F125ACD0;
  v3[7] = &unk_1F125ACE8;
  v2[8] = &unk_1F1259FE0;
  v2[9] = &unk_1F125A010;
  v3[8] = &unk_1F125AD00;
  v3[9] = &unk_1F125AD18;
  v2[10] = &unk_1F125A040;
  v2[11] = &unk_1F125A070;
  v3[10] = &unk_1F125AD30;
  v3[11] = &unk_1F125AD48;
  v2[12] = &unk_1F125A0A0;
  v2[13] = &unk_1F125A0D0;
  v3[12] = &unk_1F125AD60;
  v3[13] = &unk_1F125AD78;
  v2[14] = &unk_1F125A100;
  v2[15] = &unk_1F125A130;
  v3[14] = &unk_1F125AD90;
  v3[15] = &unk_1F125ADA8;
  v2[16] = &unk_1F125A160;
  v2[17] = &unk_1F125A190;
  v3[16] = &unk_1F125ADC0;
  v3[17] = &unk_1F125ADD8;
  v2[18] = &unk_1F125A1C0;
  v2[19] = &unk_1F125A1F0;
  v3[18] = &unk_1F125ADF0;
  v3[19] = &unk_1F125AE08;
  v2[20] = &unk_1F125A220;
  v2[21] = &unk_1F125A250;
  v3[20] = &unk_1F125AE20;
  v3[21] = &unk_1F125AE38;
  v2[22] = &unk_1F125A280;
  v2[23] = &unk_1F125A2B0;
  v3[22] = &unk_1F125AE50;
  v3[23] = &unk_1F125AE68;
  v2[24] = &unk_1F125A2E0;
  v2[25] = &unk_1F125A310;
  v3[24] = &unk_1F125AE80;
  v3[25] = &unk_1F125AE98;
  v2[26] = &unk_1F125A340;
  v2[27] = &unk_1F125A370;
  v3[26] = &unk_1F125AEB0;
  v3[27] = &unk_1F125AEC8;
  v2[28] = &unk_1F125A3A0;
  v2[29] = &unk_1F125A3D0;
  v3[28] = &unk_1F125AEE0;
  v3[29] = &unk_1F125AEF8;
  v2[30] = &unk_1F125A400;
  v2[31] = &unk_1F125A430;
  v3[30] = &unk_1F125AF10;
  v3[31] = &unk_1F125AF28;
  v2[32] = &unk_1F125A460;
  v2[33] = &unk_1F125A490;
  v3[32] = &unk_1F125AF40;
  v3[33] = &unk_1F125AF58;
  v2[34] = &unk_1F125A4C0;
  v2[35] = &unk_1F125A4F0;
  v3[34] = &unk_1F125AF70;
  v3[35] = &unk_1F125AF88;
  v2[36] = &unk_1F125A520;
  v3[36] = &unk_1F125AFA0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Request_fulfilled_keyToCode;
  ARTechnique_Request_fulfilled_keyToCode = v0;
}

void __ARTechnique_Result_Drop_block_invoke()
{
  v3[37] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F125B198;
  v2[1] = &unk_1F125B1C8;
  v3[0] = &unk_1F125B1B0;
  v3[1] = &unk_1F125B1E0;
  v2[2] = &unk_1F125B1F8;
  v2[3] = &unk_1F125B228;
  v3[2] = &unk_1F125B210;
  v3[3] = &unk_1F125B240;
  v2[4] = &unk_1F125B258;
  v2[5] = &unk_1F125B288;
  v3[4] = &unk_1F125B270;
  v3[5] = &unk_1F125B2A0;
  v2[6] = &unk_1F125B2B8;
  v2[7] = &unk_1F125B2E8;
  v3[6] = &unk_1F125B2D0;
  v3[7] = &unk_1F125B300;
  v2[8] = &unk_1F125B318;
  v2[9] = &unk_1F125B348;
  v3[8] = &unk_1F125B330;
  v3[9] = &unk_1F125B360;
  v2[10] = &unk_1F125B378;
  v2[11] = &unk_1F125B3A8;
  v3[10] = &unk_1F125B390;
  v3[11] = &unk_1F125B3C0;
  v2[12] = &unk_1F125B3D8;
  v2[13] = &unk_1F125B408;
  v3[12] = &unk_1F125B3F0;
  v3[13] = &unk_1F125B420;
  v2[14] = &unk_1F125B438;
  v2[15] = &unk_1F125B468;
  v3[14] = &unk_1F125B450;
  v3[15] = &unk_1F125B480;
  v2[16] = &unk_1F125B498;
  v2[17] = &unk_1F125B4C8;
  v3[16] = &unk_1F125B4B0;
  v3[17] = &unk_1F125B4E0;
  v2[18] = &unk_1F125B4F8;
  v2[19] = &unk_1F125B528;
  v3[18] = &unk_1F125B510;
  v3[19] = &unk_1F125B540;
  v2[20] = &unk_1F125B558;
  v2[21] = &unk_1F125B588;
  v3[20] = &unk_1F125B570;
  v3[21] = &unk_1F125B5A0;
  v2[22] = &unk_1F125B5B8;
  v2[23] = &unk_1F125B5E8;
  v3[22] = &unk_1F125B5D0;
  v3[23] = &unk_1F125B600;
  v2[24] = &unk_1F125B618;
  v2[25] = &unk_1F125B648;
  v3[24] = &unk_1F125B630;
  v3[25] = &unk_1F125B660;
  v2[26] = &unk_1F125B678;
  v2[27] = &unk_1F125B6A8;
  v3[26] = &unk_1F125B690;
  v3[27] = &unk_1F125B6C0;
  v2[28] = &unk_1F125B6D8;
  v2[29] = &unk_1F125B708;
  v3[28] = &unk_1F125B6F0;
  v3[29] = &unk_1F125B720;
  v2[30] = &unk_1F125B738;
  v2[31] = &unk_1F125B768;
  v3[30] = &unk_1F125B750;
  v3[31] = &unk_1F125B780;
  v2[32] = &unk_1F125B798;
  v2[33] = &unk_1F125B7B0;
  v3[32] = &unk_1F125B798;
  v3[33] = &unk_1F125B7C8;
  v2[34] = &unk_1F125B7E0;
  v2[35] = &unk_1F125B810;
  v3[34] = &unk_1F125B7F8;
  v3[35] = &unk_1F125B828;
  v2[36] = &unk_1F125B840;
  v3[36] = &unk_1F125B858;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:37];
  v1 = (void *)ARTechnique_Result_Drop_keyToCode;
  ARTechnique_Result_Drop_keyToCode = v0;
}

@end