@interface GEOAPFuzzers
+ (double)dayResolution:(double)a3;
+ (double)fuzzTime:(double)a3 bySeconds:(unsigned int)a4;
+ (id)twoDecimalLocation:(id)a3;
+ (unsigned)bucket1800:(unsigned int)a3;
+ (unsigned)bucket21:(unsigned int)a3;
+ (unsigned)fuzzDailyCount:(unsigned int)a3 forDailyUsageType:(unsigned int)a4;
+ (unsigned)fuzzMonthlyCount:(unsigned int)a3 forDailyUsageType:(unsigned int)a4;
+ (unsigned)max11:(unsigned int)a3;
+ (unsigned)max1:(unsigned int)a3;
+ (unsigned)max2:(unsigned int)a3;
+ (unsigned)max6:(unsigned int)a3;
@end

@implementation GEOAPFuzzers

+ (double)fuzzTime:(double)a3 bySeconds:(unsigned int)a4
{
  return (double)((unint64_t)a3 / a4 * a4);
}

+ (id)twoDecimalLocation:(id)a3
{
  if (a3)
  {
    [a3 coordinate];
    GEOCoordinateWithReducedPrecision();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263F417B8]), "initWithCoordinate:", v4, v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (double)dayResolution:(double)a3
{
  +[GEOAPFuzzers fuzzTime:86400 bySeconds:a3];
  return result;
}

+ (unsigned)max1:(unsigned int)a3
{
  return a3 != 0;
}

+ (unsigned)max2:(unsigned int)a3
{
  if (a3 >= 2) {
    return 2;
  }
  else {
    return a3;
  }
}

+ (unsigned)max6:(unsigned int)a3
{
  if (a3 >= 6) {
    return 6;
  }
  else {
    return a3;
  }
}

+ (unsigned)max11:(unsigned int)a3
{
  if (a3 >= 0xB) {
    return 11;
  }
  else {
    return a3;
  }
}

+ (unsigned)bucket21:(unsigned int)a3
{
  if (a3 >= 0x15) {
    int v3 = 21;
  }
  else {
    int v3 = 16;
  }
  if (a3 >= 0x10) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 11;
  }
  if (a3 >= 0xB) {
    return v4;
  }
  else {
    return a3;
  }
}

+ (unsigned)bucket1800:(unsigned int)a3
{
  if (a3 < 7) {
    return 0;
  }
  if (a3 < 0x1F) {
    return 6;
  }
  if (a3 < 0x3D) {
    return 30;
  }
  if (a3 < 0x79) {
    return 60;
  }
  if (a3 < 0xB5) {
    return 120;
  }
  if (a3 < 0xF1) {
    return 180;
  }
  if (a3 < 0x12D) {
    return 240;
  }
  if (a3 < 0x169) {
    return 300;
  }
  if (a3 < 0x1A5) {
    return 360;
  }
  if (a3 < 0x1E1) {
    return 420;
  }
  if (a3 < 0x21D) {
    return 480;
  }
  if (a3 < 0x259) {
    return 540;
  }
  if (a3 < 0x385) {
    return 600;
  }
  if (a3 < 0x4B1) {
    return 900;
  }
  if (a3 < 0x5DD) {
    return 1200;
  }
  if (a3 <= 0x708) {
    return 1500;
  }
  return 1800;
}

+ (unsigned)fuzzDailyCount:(unsigned int)a3 forDailyUsageType:(unsigned int)a4
{
  switch(a4)
  {
    case 3u:
    case 0x14u:
    case 0x15u:
    case 0x17u:
    case 0x18u:
    case 0x1Bu:
    case 0x20u:
    case 0x22u:
    case 0x2Fu:
    case 0x30u:
    case 0x33u:
    case 0x36u:
    case 0x4Cu:
    case 0x61u:
    case 0x62u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x92u:
    case 0x93u:
    case 0xB0u:
    case 0xB7u:
    case 0xB8u:
    case 0xB9u:
    case 0xBAu:
    case 0xBBu:
    case 0xBCu:
    case 0xBDu:
    case 0xC9u:
    case 0xCAu:
    case 0xCBu:
    case 0xCCu:
    case 0xCDu:
    case 0xD7u:
    case 0xD8u:
    case 0xE1u:
    case 0xE3u:
    case 0xE4u:
    case 0xE5u:
    case 0xE6u:
    case 0xE7u:
    case 0xE8u:
    case 0xE9u:
    case 0xEAu:
    case 0xEBu:
    case 0xECu:
    case 0xEDu:
      unsigned int result = +[GEOAPFuzzers max1:*(void *)&a3];
      break;
    case 0x16u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x7Cu:
    case 0x7Fu:
      unsigned int result = +[GEOAPFuzzers max11:*(void *)&a3];
      break;
    case 0x19u:
    case 0x1Au:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x21u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x31u:
    case 0x32u:
    case 0x35u:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x46u:
    case 0x47u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Du:
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x67u:
    case 0x68u:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x70u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x94u:
    case 0x9Du:
    case 0xA2u:
    case 0xA7u:
    case 0xA8u:
    case 0xA9u:
    case 0xAAu:
    case 0xABu:
    case 0xACu:
    case 0xADu:
    case 0xAEu:
    case 0xAFu:
    case 0xB1u:
    case 0xB2u:
    case 0xB3u:
    case 0xB4u:
    case 0xB5u:
    case 0xB6u:
    case 0xC7u:
    case 0xC8u:
    case 0xCEu:
    case 0xD0u:
    case 0xD2u:
    case 0xD3u:
    case 0xD4u:
    case 0xD5u:
    case 0xD6u:
    case 0xD9u:
    case 0xDAu:
    case 0xDBu:
    case 0xDCu:
    case 0xDDu:
    case 0xDEu:
    case 0xDFu:
    case 0xE0u:
    case 0xE2u:
      unsigned int result = +[GEOAPFuzzers max6:*(void *)&a3];
      break;
    case 0x7Du:
    case 0x7Eu:
    case 0xC6u:
      unsigned int result = +[GEOAPFuzzers bucket21:*(void *)&a3];
      break;
    case 0x97u:
    case 0xA6u:
      unsigned int result = +[GEOAPFuzzers bucket1800:*(void *)&a3];
      break;
    default:
      unsigned int result = a3;
      break;
  }
  return result;
}

+ (unsigned)fuzzMonthlyCount:(unsigned int)a3 forDailyUsageType:(unsigned int)a4
{
  if (a4 - 191 > 6)
  {
    if (a4 == 83) {
      return +[GEOAPFuzzers max2:*(void *)&a3];
    }
    return a3;
  }
  else
  {
    if (((1 << (a4 + 65)) & 0x79) != 0) {
      return +[GEOAPFuzzers max2:*(void *)&a3];
    }
    return +[GEOAPFuzzers max1:*(void *)&a3];
  }
}

@end