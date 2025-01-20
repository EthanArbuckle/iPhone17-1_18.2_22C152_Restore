@interface LibcoreIoOsConstants
+ (BOOL)S_ISBLKWithInt:(int)a3;
+ (BOOL)S_ISCHRWithInt:(int)a3;
+ (BOOL)S_ISDIRWithInt:(int)a3;
+ (BOOL)S_ISFIFOWithInt:(int)a3;
+ (BOOL)S_ISLNKWithInt:(int)a3;
+ (BOOL)S_ISREGWithInt:(int)a3;
+ (BOOL)S_ISSOCKWithInt:(int)a3;
+ (BOOL)WCOREDUMPWithInt:(int)a3;
+ (BOOL)WIFEXITEDWithInt:(int)a3;
+ (BOOL)WIFSIGNALEDWithInt:(int)a3;
+ (BOOL)WIFSTOPPEDWithInt:(int)a3;
+ (const)__metadata;
+ (id)errnoNameWithInt:(int)a3;
+ (id)gaiNameWithInt:(int)a3;
+ (int)WEXITSTATUSWithInt:(int)a3;
+ (int)WSTOPSIGWithInt:(int)a3;
+ (int)WTERMSIGWithInt:(int)a3;
@end

@implementation LibcoreIoOsConstants

+ (BOOL)S_ISBLKWithInt:(int)a3
{
  return (a3 & 0xF000) == 24576;
}

+ (BOOL)S_ISCHRWithInt:(int)a3
{
  return (a3 & 0xF000) == 0x2000;
}

+ (BOOL)S_ISDIRWithInt:(int)a3
{
  return (a3 & 0xF000) == 0x4000;
}

+ (BOOL)S_ISFIFOWithInt:(int)a3
{
  return (a3 & 0xF000) == 4096;
}

+ (BOOL)S_ISREGWithInt:(int)a3
{
  return (a3 & 0xF000) == 0x8000;
}

+ (BOOL)S_ISLNKWithInt:(int)a3
{
  return (a3 & 0xF000) == 40960;
}

+ (BOOL)S_ISSOCKWithInt:(int)a3
{
  return (a3 & 0xF000) == 49152;
}

+ (int)WEXITSTATUSWithInt:(int)a3
{
  return BYTE1(a3);
}

+ (BOOL)WCOREDUMPWithInt:(int)a3
{
  return (a3 >> 7) & 1;
}

+ (int)WTERMSIGWithInt:(int)a3
{
  return a3 & 0x7F;
}

+ (int)WSTOPSIGWithInt:(int)a3
{
  return BYTE1(a3);
}

+ (BOOL)WIFEXITEDWithInt:(int)a3
{
  return (a3 & 0x7F) == 0;
}

+ (BOOL)WIFSTOPPEDWithInt:(int)a3
{
  return (~a3 & 0x7F) == 0;
}

+ (BOOL)WIFSIGNALEDWithInt:(int)a3
{
  return (((_BYTE)a3 + 1) & 0x7E) != 0;
}

+ (id)gaiNameWithInt:(int)a3
{
  return LibcoreIoOsConstants_gaiNameWithInt_(a3);
}

+ (id)errnoNameWithInt:(int)a3
{
  return LibcoreIoOsConstants_errnoNameWithInt_(a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100413678;
}

@end