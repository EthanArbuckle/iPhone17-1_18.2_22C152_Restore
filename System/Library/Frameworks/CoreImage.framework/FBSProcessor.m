@interface FBSProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)skipFormatChecks;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation FBSProcessor

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3 >= 3) {
    +[FBSProcessor formatForInputAtIndex:]();
  }
  return *off_1E5771850[a3];
}

+ (int)outputFormat
{
  return 2053;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"fullROI", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

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

+ (void)formatForInputAtIndex:.cold.1()
{
}

@end