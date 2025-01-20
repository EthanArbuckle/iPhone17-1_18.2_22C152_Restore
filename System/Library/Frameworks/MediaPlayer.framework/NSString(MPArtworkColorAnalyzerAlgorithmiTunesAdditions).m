@interface NSString(MPArtworkColorAnalyzerAlgorithmiTunesAdditions)
+ (id)MP_hexStringFromColor:()MPArtworkColorAnalyzerAlgorithmiTunesAdditions;
- (id)MP_colorFromHexString;
@end

@implementation NSString(MPArtworkColorAnalyzerAlgorithmiTunesAdditions)

- (id)MP_colorFromHexString
{
  if ([a1 length] != 7 || (objc_msgSend(a1, "hasPrefix:", @"#") & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"NSString+MPArtworkColorAnalyzerAlgorithmiTunesAdditions.m" lineNumber:14 description:@"Hex string is expected to begin with # and contain 6 digits"];
  }
  int v8 = 0;
  v4 = [MEMORY[0x1E4F28FE8] scannerWithString:a1];
  [v4 setScanLocation:1];
  [v4 scanHexInt:&v8];
  v5 = [MEMORY[0x1E4FB1618] colorWithRed:(double)BYTE2(v8) / 255.0 green:(double)BYTE1(v8) / 255.0 blue:(double)v8 / 255.0 alpha:1.0];

  return v5;
}

+ (id)MP_hexStringFromColor:()MPArtworkColorAnalyzerAlgorithmiTunesAdditions
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  uint64_t v5 = 0;
  [a3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", (int)(v8 * 255.0), (int)(v7 * 255.0), (int)(v6 * 255.0));

  return v3;
}

@end