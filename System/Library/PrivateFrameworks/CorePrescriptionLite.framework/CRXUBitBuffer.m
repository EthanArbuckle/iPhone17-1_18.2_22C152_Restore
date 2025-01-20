@interface CRXUBitBuffer
- (BOOL)readBool:(BOOL *)a3;
- (BOOL)readData:(id)a3 bitWidth:(unint64_t)a4;
- (BOOL)readUInteger:(unint64_t *)a3 bitWidth:(unint64_t)a4;
- (BOOL)skipBits:(unint64_t)a3;
- (BOOL)writeBool:(BOOL)a3;
- (BOOL)writeData:(id)a3 bitWidth:(unint64_t)a4;
- (BOOL)writeUInteger:(unint64_t)a3 bitWidth:(unint64_t)a4;
- (CRXUBitBuffer)initWithData:(id)a3;
- (CRXUBitBuffer)initWithMutableData:(id)a3;
- (unint64_t)bitCount;
- (unint64_t)byteCount;
- (void)nextByte;
- (void)rewind;
@end

@implementation CRXUBitBuffer

- (CRXUBitBuffer)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRXUBitBuffer;
  v6 = [(CRXUBitBuffer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputData, a3);
    v7->_byteCount = [(NSData *)v7->_inputData length];
    v7->_bitCount = 8 * [(NSData *)v7->_inputData length];
    uint64_t v8 = [(NSData *)v7->_inputData bytes];
    v7->_inputPtr = (const char *)v8;
    v7->_inputEndPtr = (const char *)(v8 + [(NSData *)v7->_inputData length]);
    v7->_curInputByte = *v7->_inputPtr;
    v7->_bitOffset = 0;
    v7->_bitOffsetInByte = 0;
  }

  return v7;
}

- (CRXUBitBuffer)initWithMutableData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRXUBitBuffer;
  v6 = [(CRXUBitBuffer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputData, a3);
    v7->_byteCount = [(NSMutableData *)v7->_outputData length];
    v7->_bitCount = 8 * [(NSMutableData *)v7->_outputData length];
    uint64_t v8 = [(NSMutableData *)v7->_outputData mutableBytes];
    v7->_outputPtr = v8;
    v7->_bitOffset = 0;
    v7->_bitOffsetInByte = 0;
    bzero(v8, [(NSMutableData *)v7->_outputData length]);
  }

  return v7;
}

- (void)rewind
{
  inputData = self->_inputData;
  if (inputData)
  {
    v4 = [(NSData *)inputData bytes];
    self->_inputPtr = v4;
    self->_curInputByte = *v4;
  }
  else
  {
    id v5 = [(NSMutableData *)self->_outputData mutableBytes];
    self->_outputPtr = v5;
    bzero(v5, [(NSMutableData *)self->_outputData length]);
  }
  self->_bitOffset = 0;
  self->_bitOffsetInByte = 0;
}

- (BOOL)skipBits:(unint64_t)a3
{
  unint64_t v4 = self->_bitCount - self->_bitOffset;
  if (a3 - 1 < v4)
  {
    unint64_t v6 = a3;
    do
    {
      unint64_t bitOffsetInByte = self->_bitOffsetInByte;
      if (8 - bitOffsetInByte >= v6) {
        unint64_t v8 = v6;
      }
      else {
        unint64_t v8 = 8 - bitOffsetInByte;
      }
      if (v8 == 8
        || (!self->_inputData
          ? (*self->_outputPtr = *(unsigned __int8 *)self->_outputPtr << v8, unint64_t bitOffsetInByte = self->_bitOffsetInByte)
          : (self->_curInputByte <<= v8),
            unint64_t v9 = bitOffsetInByte + v8,
            self->_unint64_t bitOffsetInByte = v9,
            v9 == 8))
      {
        [(CRXUBitBuffer *)self nextByte];
      }
      self->_bitOffset += v8;
      v6 -= v8;
    }
    while (v6);
  }
  return v4 >= a3;
}

- (unint64_t)bitCount
{
  return self->_bitCount;
}

- (unint64_t)byteCount
{
  return self->_byteCount;
}

- (BOOL)readBool:(BOOL *)a3
{
  if (!self->_inputData) {
    return 0;
  }
  unint64_t bitOffset = self->_bitOffset;
  if (bitOffset == self->_bitCount) {
    return 0;
  }
  *a3 = self->_curInputByte >> 7;
  self->_curInputByte *= 2;
  unint64_t v5 = self->_bitOffsetInByte + 1;
  self->_unint64_t bitOffset = bitOffset + 1;
  self->_unint64_t bitOffsetInByte = v5;
  if (v5 == 8) {
    [(CRXUBitBuffer *)self nextByte];
  }
  return 1;
}

- (BOOL)writeBool:(BOOL)a3
{
  if (!self->_outputData || self->_bitOffset == self->_bitCount) {
    return 0;
  }
  *self->_outputPtr *= 2;
  *self->_outputPtr |= a3;
  unint64_t v4 = self->_bitOffsetInByte + 1;
  ++self->_bitOffset;
  self->_unint64_t bitOffsetInByte = v4;
  if (v4 == 8) {
    [(CRXUBitBuffer *)self nextByte];
  }
  return 1;
}

- (BOOL)readUInteger:(unint64_t *)a3 bitWidth:(unint64_t)a4
{
  BOOL result = 0;
  if (a4 <= 0x40 && self->_inputData)
  {
    unint64_t v6 = a4;
    if (self->_bitCount - self->_bitOffset >= a4)
    {
      *a3 = 0;
      if (a4)
      {
        do
        {
          if (8 - self->_bitOffsetInByte >= v6) {
            unint64_t v8 = v6;
          }
          else {
            unint64_t v8 = 8 - self->_bitOffsetInByte;
          }
          unint64_t v9 = *a3 << v8;
          *a3 = v9;
          *a3 = v9 | (self->_curInputByte >> (8 - v8));
          self->_curInputByte <<= v8;
          unint64_t v10 = self->_bitOffsetInByte + v8;
          self->_bitOffset += v8;
          self->_unint64_t bitOffsetInByte = v10;
          if (v10 == 8) {
            [(CRXUBitBuffer *)self nextByte];
          }
          v6 -= v8;
        }
        while (v6);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)writeUInteger:(unint64_t)a3 bitWidth:(unint64_t)a4
{
  BOOL result = 0;
  if (a4 <= 0x40 && self->_outputData)
  {
    unint64_t v6 = a4;
    if (self->_bitCount - self->_bitOffset >= a4)
    {
      if (a4)
      {
        unint64_t v7 = (0xFFFFFFFFFFFFFFFFLL >> -(char)a4) & a3;
        unint64_t v8 = a4;
        do
        {
          if (8 - self->_bitOffsetInByte >= v6) {
            unint64_t v9 = v6;
          }
          else {
            unint64_t v9 = 8 - self->_bitOffsetInByte;
          }
          *self->_outputPtr = *(unsigned __int8 *)self->_outputPtr << v9;
          v8 -= v9;
          *self->_outputPtr |= v7 >> v8;
          unint64_t v10 = self->_bitOffsetInByte + v9;
          self->_unint64_t bitOffsetInByte = v10;
          if (v10 == 8) {
            [(CRXUBitBuffer *)self nextByte];
          }
          self->_bitOffset += v9;
          v6 -= v9;
        }
        while (v6);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)readData:(id)a3 bitWidth:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (self->_inputData
    && ((bitCount = self->_bitCount, bitOffset = self->_bitOffset, unint64_t v10 = 8 * [v6 length], v10 >= a4)
      ? (BOOL v11 = bitCount - bitOffset >= a4)
      : (BOOL v11 = 0),
        v11))
  {
    uint64_t v13 = [v7 mutableBytes];
    if (a4)
    {
      v14 = (unsigned char *)v13;
      unint64_t v15 = v10 - a4;
      if (v10 < a4) {
        unint64_t v15 = 0;
      }
      do
      {
        uint64_t v21 = 0;
        if (v15 <= 7)
        {
          if (a4 >= 8) {
            unint64_t v18 = 8;
          }
          else {
            unint64_t v18 = a4;
          }
          unint64_t v19 = 8 - v15;
          if (8 - v15 >= a4) {
            unint64_t v19 = a4;
          }
          if (v15) {
            unint64_t v17 = v19;
          }
          else {
            unint64_t v17 = v18;
          }
          [(CRXUBitBuffer *)self readUInteger:&v21 bitWidth:v17];
          unint64_t v15 = 0;
          char v16 = v21;
        }
        else
        {
          char v16 = 0;
          unint64_t v17 = 0;
          v15 -= 8;
        }
        *v14++ = v16;
        a4 -= v17;
      }
      while (a4);
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)writeData:(id)a3 bitWidth:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (self->_outputData)
  {
    unint64_t bitCount = self->_bitCount;
    unint64_t bitOffset = self->_bitOffset;
    BOOL v10 = 0;
    if (a4 <= 8 * [v6 length] && bitCount - bitOffset >= a4)
    {
      uint64_t v11 = [v7 bytes];
      if (a4)
      {
        BOOL v12 = (unsigned __int8 *)v11;
        if ((a4 & 7) != 0) {
          unint64_t v13 = a4 & 7;
        }
        else {
          unint64_t v13 = 8;
        }
        do
        {
          unsigned int v14 = *v12++;
          [(CRXUBitBuffer *)self writeUInteger:v14 bitWidth:v13];
          a4 -= v13;
          unint64_t v13 = 8;
        }
        while (a4);
      }
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)nextByte
{
  if (self->_inputData)
  {
    inputEndPtr = self->_inputEndPtr;
    v3 = self->_inputPtr + 1;
    self->_inputPtr = v3;
    if (v3 < inputEndPtr) {
      self->_curInputByte = *v3;
    }
  }
  else
  {
    ++self->_outputPtr;
  }
  self->_unint64_t bitOffsetInByte = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
}

@end