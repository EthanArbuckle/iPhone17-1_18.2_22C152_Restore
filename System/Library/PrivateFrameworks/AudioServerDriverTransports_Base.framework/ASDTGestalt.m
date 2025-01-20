@interface ASDTGestalt
+ (BOOL)runningOnInternalBuild;
+ (id)getAcousticID;
+ (int)getProductType;
@end

@implementation ASDTGestalt

+ (id)getAcousticID
{
  uint64_t v2 = MGGetSInt32Answer();
  if ((int)v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s%d", "AID", v2);
  }
  return v3;
}

+ (int)getProductType
{
  return MEMORY[0x270F95FD8](a1, a2);
}

+ (BOOL)runningOnInternalBuild
{
  return MGGetBoolAnswer();
}

@end