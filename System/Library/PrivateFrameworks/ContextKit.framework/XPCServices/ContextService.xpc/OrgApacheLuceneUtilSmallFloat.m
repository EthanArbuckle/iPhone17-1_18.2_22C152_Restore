@interface OrgApacheLuceneUtilSmallFloat
+ (char)floatToByte315WithFloat:(float)a3;
+ (char)floatToByte52WithFloat:(float)a3;
+ (char)floatToByteWithFloat:(float)a3 withInt:(int)a4 withInt:(int)a5;
+ (float)byte315ToFloatWithByte:(char)a3;
+ (float)byte52ToFloatWithByte:(char)a3;
+ (float)byteToFloatWithByte:(char)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilSmallFloat

+ (char)floatToByteWithFloat:(float)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilSmallFloat_floatToByteWithFloat_withInt_withInt_(a4, a5, a3);
}

+ (float)byteToFloatWithByte:(char)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a3) {
    return JavaLangFloat_intBitsToFloatWithInt_((a3 << (24 - a4)) - (a5 << 24) + 1056964608);
  }
  else {
    return 0.0;
  }
}

+ (char)floatToByte315WithFloat:(float)a3
{
  int v3 = JavaLangFloat_floatToRawIntBitsWithFloat_(a3);
  if (v3 >> 28 <= 4) {
    unsigned int v4 = (v3 >> 21) ^ 0xFFFFFF80;
  }
  else {
    LOBYTE(v4) = -1;
  }
  if (v3 <= 807403519) {
    return v3 > 0;
  }
  else {
    return v4;
  }
}

+ (float)byte315ToFloatWithByte:(char)a3
{
  if (a3) {
    return JavaLangFloat_intBitsToFloatWithInt_((a3 << 21) + 805306368);
  }
  else {
    return 0.0;
  }
}

+ (char)floatToByte52WithFloat:(float)a3
{
  int v3 = JavaLangFloat_floatToRawIntBitsWithFloat_(a3);
  if (HIBYTE(v3) <= 0x44u) {
    int v4 = (v3 >> 19) + 96;
  }
  else {
    LOBYTE(v4) = -1;
  }
  if (v3 <= 1023934463) {
    return v3 > 0;
  }
  else {
    return v4;
  }
}

+ (float)byte52ToFloatWithByte:(char)a3
{
  if (a3) {
    return JavaLangFloat_intBitsToFloatWithInt_((a3 << 19) + 1023410176);
  }
  else {
    return 0.0;
  }
}

@end