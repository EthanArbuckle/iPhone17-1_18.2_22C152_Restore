@interface _DPCMSSample
+ (id)cmsSampleWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6;
+ (id)convertToHexString:(id)a3;
+ (id)dataFor:(id)a3 hashAtIndex:(unint64_t)a4 privacyParameter:(double)a5 bitCount:(unint64_t)a6;
+ (id)jsonStringFrom:(id)a3 hashIndex:(unint64_t)a4;
+ (id)jsonStringFromSequence:(id)a3 sequenceHashIndex:(unsigned __int16)a4 fragment:(id)a5 fragmentHashIndex:(unsigned __int16)a6 fragmentPosition:(unsigned __int16)a7;
- (NSData)bitString;
- (_DPCMSSample)init;
- (_DPCMSSample)initWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6;
- (unint64_t)hashFunctionIndex;
@end

@implementation _DPCMSSample

- (_DPCMSSample)init
{
  return 0;
}

- (_DPCMSSample)initWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
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
    v16.super_class = (Class)_DPCMSSample;
    v11 = [(_DPCMSSample *)&v16 init];
    if (v11)
    {
      v11->_hashFunctionIndex = arc4random_uniform(v7);
      uint64_t v12 = [(id)objc_opt_class() dataFor:v10 hashAtIndex:v11->_hashFunctionIndex privacyParameter:a6 bitCount:a4];
      bitString = v11->_bitString;
      v11->_bitString = (NSData *)v12;
    }
    self = v11;
    v14 = self;
  }

  return v14;
}

+ (id)cmsSampleWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
{
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWith:v10 privacyParameter:a5 hashFunctionCount:a6 bitCount:a4];

  return v11;
}

+ (id)dataFor:(id)a3 hashAtIndex:(unint64_t)a4 privacyParameter:(double)a5 bitCount:(unint64_t)a6
{
  uint64_t v8 = uint32_from_string(a4, (const char *)[a3 UTF8String], a6);
  v9 = +[_DPBiasedCoin coinWithBias:(double)(1.0 / (exp(a5 * 0.5) + 1.0))];
  unint64_t v10 = a6 >> 3;
  v11 = malloc_type_malloc(a6 >> 3, 0xD596EE27uLL);
  bzero(v11, a6 >> 3);
  if (a6 >= 8)
  {
    if (v10 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a6 >> 3;
    }
    v13 = v11;
    do
    {
      *v13++ = [v9 generateByte];
      --v12;
    }
    while (v12);
  }
  set_bit(v8, (uint64_t)v11);
  v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:v10];

  return v14;
}

+ (id)convertToHexString:(id)a3
{
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 bytes];
  uint64_t v5 = [v3 length];
  v6 = (void *)MEMORY[0x1E019F810]();
  for (i = (void *)[&stru_1F3681BE0 mutableCopy]; v5; --v5)
  {
    unsigned int v8 = *v4++;
    objc_msgSend(i, "appendFormat:", @"%02X", v8);
  }

  return i;
}

+ (id)jsonStringFrom:(id)a3 hashIndex:(unint64_t)a4
{
  unsigned __int16 v4 = a4;
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E019F810]();
  uint32_t v7 = (void *)[&stru_1F3681BE0 mutableCopy];
  objc_msgSend(v7, "appendFormat:", @"\"%hu,", v4);
  unsigned int v8 = [(id)objc_opt_class() convertToHexString:v5];
  [v7 appendString:v8];

  [v7 appendString:@"\""];

  return v7;
}

+ (id)jsonStringFromSequence:(id)a3 sequenceHashIndex:(unsigned __int16)a4 fragment:(id)a5 fragmentHashIndex:(unsigned __int16)a6 fragmentPosition:(unsigned __int16)a7
{
  unsigned int v7 = a7;
  unsigned int v8 = a6;
  unsigned int v10 = a4;
  id v11 = a3;
  id v12 = a5;
  v13 = (void *)MEMORY[0x1E019F810]();
  v14 = (void *)[&stru_1F3681BE0 mutableCopy];
  objc_msgSend(v14, "appendFormat:", @"\"%hu,", v10);
  v15 = [(id)objc_opt_class() convertToHexString:v11];
  [v14 appendString:v15];

  objc_msgSend(v14, "appendFormat:", @",%ld,%hu,", v7, v8);
  objc_super v16 = [(id)objc_opt_class() convertToHexString:v12];
  [v14 appendString:v16];

  [v14 appendString:@"\""];

  return v14;
}

- (unint64_t)hashFunctionIndex
{
  return self->_hashFunctionIndex;
}

- (NSData)bitString
{
  return self->_bitString;
}

- (void).cxx_destruct
{
}

@end