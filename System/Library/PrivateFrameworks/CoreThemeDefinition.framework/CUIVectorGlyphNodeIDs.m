@interface CUIVectorGlyphNodeIDs
@end

@implementation CUIVectorGlyphNodeIDs

id ____CUIVectorGlyphNodeIDs_block_invoke()
{
  v1[27] = *MEMORY[0x263EF8340];
  v1[0] = @"Ultralight-L";
  v1[1] = @"Ultralight-M";
  v1[2] = @"Ultralight-S";
  v1[3] = @"Thin-L";
  v1[4] = @"Thin-M";
  v1[5] = @"Thin-S";
  v1[6] = @"Light-L";
  v1[7] = @"Light-M";
  v1[8] = @"Light-S";
  v1[9] = @"Regular-L";
  v1[10] = @"Regular-M";
  v1[11] = @"Regular-S";
  v1[12] = @"Medium-L";
  v1[13] = @"Medium-M";
  v1[14] = @"Medium-S";
  v1[15] = @"Semibold-L";
  v1[16] = @"Semibold-M";
  v1[17] = @"Semibold-S";
  v1[18] = @"Bold-L";
  v1[19] = @"Bold-M";
  v1[20] = @"Bold-S";
  v1[21] = @"Heavy-L";
  v1[22] = @"Heavy-M";
  v1[23] = @"Heavy-S";
  v1[24] = @"Black-L";
  v1[25] = @"Black-M";
  v1[26] = @"Black-S";
  id result = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v1 count:27];
  __CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs = (uint64_t)result;
  return result;
}

@end