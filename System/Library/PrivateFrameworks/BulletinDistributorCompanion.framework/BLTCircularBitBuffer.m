@interface BLTCircularBitBuffer
+ (unint64_t)actualCapacity:(unint64_t)a3;
- (BLTCircularBitBuffer)initWithCapacity:(unint64_t)a3;
- (BLTCircularBitBuffer)initWithData:(id)a3 andIndex:(unint64_t)a4;
- (id)bitVector;
- (unint64_t)beginIndex;
- (unint64_t)capacity;
- (unsigned)bitAtIndex:(unint64_t)a3;
- (void)_setBit:(BOOL)a3 atIndex:(unint64_t)a4;
- (void)clear;
- (void)setBit:(BOOL)a3 atIndex:(unint64_t)a4;
@end

@implementation BLTCircularBitBuffer

+ (unint64_t)actualCapacity:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
}

- (BLTCircularBitBuffer)initWithCapacity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BLTCircularBitBuffer;
  v4 = [(BLTCircularBitBuffer *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() actualCapacity:a3];
    v4->_beginIndex = 0;
    v4->_capacity = v5;
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v4->_capacity >> 3];
    bitVector = v4->_bitVector;
    v4->_bitVector = (NSMutableData *)v6;
  }
  return v4;
}

- (BLTCircularBitBuffer)initWithData:(id)a3 andIndex:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLTCircularBitBuffer;
  v7 = [(BLTCircularBitBuffer *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 length];
    v7->_beginIndex = a4;
    v7->_capacity = 8 * v8;
    uint64_t v9 = [MEMORY[0x263EFF990] dataWithData:v6];
    bitVector = v7->_bitVector;
    v7->_bitVector = (NSMutableData *)v9;
  }
  return v7;
}

- (void)_setBit:(BOOL)a3 atIndex:(unint64_t)a4
{
  char v4 = a4;
  BOOL v5 = a3;
  unint64_t v6 = a4 >> 3;
  uint64_t v7 = [(NSMutableData *)self->_bitVector bytes];
  int v8 = 1 << (v4 & 7);
  if (v5) {
    char v9 = *(unsigned char *)(v7 + v6) | v8;
  }
  else {
    char v9 = *(unsigned char *)(v7 + v6) & ~(_BYTE)v8;
  }
  *(unsigned char *)(v7 + v6) = v9;
}

- (void)setBit:(BOOL)a3 atIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  unint64_t beginIndex = self->_beginIndex;
  unint64_t capacity = self->_capacity;
  if (capacity - 1 + beginIndex >= a4)
  {
    if (beginIndex <= a4) {
      goto LABEL_20;
    }
    unint64_t v9 = a4;
    if (beginIndex - a4 < capacity)
    {
      unint64_t v10 = a4 + 1;
      unint64_t v9 = a4;
      goto LABEL_7;
    }
LABEL_18:
    self->_unint64_t beginIndex = v9;
    [(BLTCircularBitBuffer *)self clear];
    goto LABEL_20;
  }
  unint64_t v9 = a4 - (capacity - 1);
  if (v9 - beginIndex >= capacity) {
    goto LABEL_18;
  }
  unint64_t v10 = capacity + beginIndex;
  unint64_t beginIndex = a4;
LABEL_7:
  unint64_t v11 = beginIndex % capacity;
  unint64_t v12 = v10 % capacity;
  self->_unint64_t beginIndex = v9;
  if (v10 % capacity != beginIndex % capacity)
  {
    if ((v12 & 7) != 0) {
      unint64_t v13 = (v12 >> 3) + 1;
    }
    else {
      unint64_t v13 = v12 >> 3;
    }
    if (v11 >= v12) {
      unint64_t capacity = beginIndex % capacity;
    }
    unint64_t v14 = 8 * v13 >= capacity ? capacity : 8 * v13;
    while (v12 < v14)
      [(BLTCircularBitBuffer *)self _setBit:0 atIndex:v12++];
    if (v14 != v11)
    {
      if (v11 >> 3 < v13)
      {
        NSUInteger v16 = [(NSMutableData *)self->_bitVector length];
        bitVector = self->_bitVector;
        unint64_t v18 = [(NSMutableData *)bitVector length];
        if (v13 < v16)
        {
          -[NSMutableData resetBytesInRange:](bitVector, "resetBytesInRange:", v13, v18 - v13);
          v19 = self->_bitVector;
          unint64_t v20 = 0;
          unint64_t v21 = v11 >> 3;
          goto LABEL_28;
        }
        v13 %= v18;
      }
      v19 = self->_bitVector;
      unint64_t v21 = (v11 >> 3) - v13;
      unint64_t v20 = v13;
LABEL_28:
      -[NSMutableData resetBytesInRange:](v19, "resetBytesInRange:", v20, v21);
      for (unint64_t i = v11 & 0xFFFFFFFFFFFFFFF8; i < v11; ++i)
        [(BLTCircularBitBuffer *)self _setBit:0 atIndex:i];
    }
  }
LABEL_20:
  unint64_t v15 = a4 % self->_capacity;
  [(BLTCircularBitBuffer *)self _setBit:v5 atIndex:v15];
}

- (unsigned)bitAtIndex:(unint64_t)a3
{
  unint64_t capacity = self->_capacity;
  if (a3 - self->_beginIndex >= capacity)
  {
    LOBYTE(v5) = 2;
  }
  else
  {
    unint64_t v4 = a3 % capacity;
    return (*(unsigned __int8 *)([(NSMutableData *)self->_bitVector bytes] + (v4 >> 3)) >> (v4 & 7)) & 1;
  }
  return v5;
}

- (id)bitVector
{
  return self->_bitVector;
}

- (void)clear
{
  bitVector = self->_bitVector;
  uint64_t v3 = [(NSMutableData *)bitVector length];
  -[NSMutableData resetBytesInRange:](bitVector, "resetBytesInRange:", 0, v3);
}

- (unint64_t)beginIndex
{
  return self->_beginIndex;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void).cxx_destruct
{
}

@end