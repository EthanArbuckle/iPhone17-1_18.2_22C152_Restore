@interface PFFBSProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)skipFormatChecks;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation PFFBSProcessor

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3 >= 3) {
    sub_4BA18();
  }
  return *(_DWORD *)*(&off_74D28 + a3);
}

+ (int)outputFormat
{
  return kCIFormatRh;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"fullROI", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)skipFormatChecks
{
  return 1;
}

@end