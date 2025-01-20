@interface _DPHCMSSample
+ (id)convertDataToString:(id)a3;
+ (id)dataFor:(id)a3 hashAtIndex:(unint64_t)a4 epsilon:(double)a5 bitCount:(unint64_t)a6 bitIndex:(unint64_t)a7;
+ (id)hcmsSampleWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6;
+ (id)jsonStringFrom:(id)a3 hashIndex:(unint64_t)a4 bitIndex:(unint64_t)a5;
+ (id)jsonStringFromSequence:(id)a3 sequenceHashIndex:(unsigned __int16)a4 sequencebitIndex:(unint64_t)a5 fragment:(id)a6 fragmentHashIndex:(unsigned __int16)a7 fragmentbitIndex:(unint64_t)a8 fragmentPosition:(unsigned __int16)a9;
- (NSData)bitString;
- (_DPHCMSSample)init;
- (_DPHCMSSample)initWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6;
- (unint64_t)bitIndex;
- (unint64_t)hashFunctionIndex;
@end

@implementation _DPHCMSSample

- (_DPHCMSSample)init
{
  return 0;
}

- (_DPHCMSSample)initWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
{
  uint32_t v7 = a5;
  id v10 = a3;
  if (isInvalidEpsilon(a4) || !isNonZeroPowerOfTwo(a6))
  {
    v14 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)_DPHCMSSample;
    v11 = [(_DPHCMSSample *)&v16 init];
    if (v11)
    {
      v11->_hashFunctionIndex = arc4random_uniform(v7);
      v11->_bitIndex = arc4random_uniform(a6);
      uint64_t v12 = [(id)objc_opt_class() dataFor:v10 hashAtIndex:v11->_hashFunctionIndex epsilon:a6 bitCount:v11->_bitIndex bitIndex:a4];
      bitString = v11->_bitString;
      v11->_bitString = (NSData *)v12;
    }
    self = v11;
    v14 = self;
  }

  return v14;
}

+ (id)hcmsSampleWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
{
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWith:v10 privacyParameter:a5 hashFunctionCount:a6 bitCount:a4];

  return v11;
}

+ (id)dataFor:(id)a3 hashAtIndex:(unint64_t)a4 epsilon:(double)a5 bitCount:(unint64_t)a6 bitIndex:(unint64_t)a7
{
  int v7 = a7;
  int v9 = uint32_from_string(a4, (const char *)[a3 UTF8String], a6);
  id v10 = +[_DPBiasedCoin coinWithBias:(double)(1.0 / (exp(a5) + 1.0))];
  v11 = v10;
  v12.i32[0] = v9 & v7;
  char v13 = vaddlv_u8((uint8x8_t)vcnt_s8(v12));
  if (v13) {
    char v14 = -1;
  }
  else {
    char v14 = 1;
  }
  char v18 = v14;
  if ([v10 flip])
  {
    if (v13) {
      char v15 = 1;
    }
    else {
      char v15 = -1;
    }
    char v18 = v15;
  }
  objc_super v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v18 length:1];

  return v16;
}

+ (id)convertDataToString:(id)a3
{
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 bytes];
  uint64_t v5 = [v3 length];

  id result = &stru_1F3681BE0;
  if (v5)
  {
    int v7 = *v4;
    v8 = @"-1";
    if (v7 != 255) {
      v8 = &stru_1F3681BE0;
    }
    if (v7 == 1) {
      return @"+1";
    }
    else {
      return v8;
    }
  }
  return result;
}

+ (id)jsonStringFrom:(id)a3 hashIndex:(unint64_t)a4 bitIndex:(unint64_t)a5
{
  unsigned __int16 v6 = a4;
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E019F810]();
  int v9 = (void *)[&stru_1F3681BE0 mutableCopy];
  objc_msgSend(v9, "appendFormat:", @"\"%hu,", v6);
  objc_msgSend(v9, "appendFormat:", @"%ld,", a5);
  id v10 = [(id)objc_opt_class() convertDataToString:v7];
  [v9 appendString:v10];

  [v9 appendString:@"\""];

  return v9;
}

+ (id)jsonStringFromSequence:(id)a3 sequenceHashIndex:(unsigned __int16)a4 sequencebitIndex:(unint64_t)a5 fragment:(id)a6 fragmentHashIndex:(unsigned __int16)a7 fragmentbitIndex:(unint64_t)a8 fragmentPosition:(unsigned __int16)a9
{
  unsigned int v10 = a7;
  unsigned int v13 = a4;
  id v14 = a3;
  id v15 = a6;
  objc_super v16 = (void *)MEMORY[0x1E019F810]();
  v17 = (void *)[&stru_1F3681BE0 mutableCopy];
  objc_msgSend(v17, "appendFormat:", @"\"%hu,", v13);
  objc_msgSend(v17, "appendFormat:", @"%ld,", a5);
  char v18 = [(id)objc_opt_class() convertDataToString:v14];
  [v17 appendString:v18];

  objc_msgSend(v17, "appendFormat:", @",%ld,%hu,%ld,", a9, v10, a8);
  v19 = [(id)objc_opt_class() convertDataToString:v15];
  [v17 appendString:v19];

  [v17 appendString:@"\""];

  return v17;
}

- (unint64_t)hashFunctionIndex
{
  return self->_hashFunctionIndex;
}

- (unint64_t)bitIndex
{
  return self->_bitIndex;
}

- (NSData)bitString
{
  return self->_bitString;
}

- (void).cxx_destruct
{
}

@end