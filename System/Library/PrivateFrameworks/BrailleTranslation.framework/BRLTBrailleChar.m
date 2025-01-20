@interface BRLTBrailleChar
+ (id)charWithBits:(unsigned __int8)a3;
+ (id)charWithBrf:(id)a3;
+ (id)charWithUnichar:(unsigned __int16)a3;
+ (id)charWithUnicode:(id)a3;
- (BOOL)_dotUp:(int)a3;
- (BOOL)dot1;
- (BOOL)dot2;
- (BOOL)dot3;
- (BOOL)dot4;
- (BOOL)dot5;
- (BOOL)dot6;
- (BOOL)dot7;
- (BOOL)dot8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBrailleChar:(id)a3;
- (BRLTBrailleChar)initWithBits:(unsigned __int8)a3;
- (BRLTBrailleChar)initWithBrf:(id)a3;
- (BRLTBrailleChar)initWithUnichar:(unsigned __int16)a3;
- (BRLTBrailleChar)initWithUnicode:(id)a3;
- (NSString)unicode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)bits;
- (void)_setDot:(int)a3 up:(BOOL)a4;
- (void)setDot1:(BOOL)a3;
- (void)setDot2:(BOOL)a3;
- (void)setDot3:(BOOL)a3;
- (void)setDot4:(BOOL)a3;
- (void)setDot5:(BOOL)a3;
- (void)setDot6:(BOOL)a3;
- (void)setDot7:(BOOL)a3;
- (void)setDot8:(BOOL)a3;
@end

@implementation BRLTBrailleChar

- (BRLTBrailleChar)initWithBits:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRLTBrailleChar;
  result = [(BRLTBrailleChar *)&v5 init];
  result->_bits = a3;
  return result;
}

- (BRLTBrailleChar)initWithUnicode:(id)a3
{
  uint64_t v4 = [a3 characterAtIndex:0];
  return [(BRLTBrailleChar *)self initWithUnichar:v4];
}

- (BRLTBrailleChar)initWithUnichar:(unsigned __int16)a3
{
  return [(BRLTBrailleChar *)self initWithBits:a3];
}

- (BRLTBrailleChar)initWithBrf:(id)a3
{
  uint64_t v4 = +[BRLTBrailleString brfToUnicode:a3];
  objc_super v5 = [(BRLTBrailleChar *)self initWithUnicode:v4];

  return v5;
}

+ (id)charWithBits:(unsigned __int8)a3
{
  v3 = [[BRLTBrailleChar alloc] initWithBits:a3];
  return v3;
}

+ (id)charWithUnicode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[BRLTBrailleChar alloc] initWithUnicode:v3];

  return v4;
}

+ (id)charWithUnichar:(unsigned __int16)a3
{
  id v3 = [[BRLTBrailleChar alloc] initWithUnichar:a3];
  return v3;
}

+ (id)charWithBrf:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[BRLTBrailleChar alloc] initWithBrf:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[BRLTBrailleChar allocWithZone:a3];
  uint64_t bits = self->_bits;
  return [(BRLTBrailleChar *)v4 initWithBits:bits];
}

- (NSString)unicode
{
  __int16 v4 = self->_bits | 0x2800;
  v2 = [NSString stringWithCharacters:&v4 length:1];
  return (NSString *)v2;
}

- (unsigned)bits
{
  return self->_bits;
}

- (void)setDot1:(BOOL)a3
{
}

- (BOOL)dot1
{
  return [(BRLTBrailleChar *)self _dotUp:1];
}

- (void)setDot2:(BOOL)a3
{
}

- (BOOL)dot2
{
  return [(BRLTBrailleChar *)self _dotUp:2];
}

- (void)setDot3:(BOOL)a3
{
}

- (BOOL)dot3
{
  return [(BRLTBrailleChar *)self _dotUp:3];
}

- (void)setDot4:(BOOL)a3
{
}

- (BOOL)dot4
{
  return [(BRLTBrailleChar *)self _dotUp:4];
}

- (void)setDot5:(BOOL)a3
{
}

- (BOOL)dot5
{
  return [(BRLTBrailleChar *)self _dotUp:5];
}

- (void)setDot6:(BOOL)a3
{
}

- (BOOL)dot6
{
  return [(BRLTBrailleChar *)self _dotUp:6];
}

- (void)setDot7:(BOOL)a3
{
}

- (BOOL)dot7
{
  return [(BRLTBrailleChar *)self _dotUp:7];
}

- (void)setDot8:(BOOL)a3
{
}

- (BOOL)dot8
{
  return [(BRLTBrailleChar *)self _dotUp:8];
}

- (void)_setDot:(int)a3 up:(BOOL)a4
{
  int v4 = 1 << (a3 - 1);
  unsigned __int8 bits = self->_bits;
  unsigned __int8 v6 = bits & ~(_BYTE)v4;
  unsigned __int8 v7 = bits | v4;
  if (!a4) {
    unsigned __int8 v7 = v6;
  }
  self->_unsigned __int8 bits = v7;
}

- (BOOL)_dotUp:(int)a3
{
  return (self->_bits >> (a3 - 1)) & 1;
}

- (BOOL)isEqualToBrailleChar:(id)a3
{
  int bits = self->_bits;
  return bits == [a3 bits];
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (BRLTBrailleChar *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRLTBrailleChar *)self isEqualToBrailleChar:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_bits;
}

- (id)description
{
  v2 = [(BRLTBrailleChar *)self unicode];
  id v3 = +[BRLTBrailleString unicodeToBestEffortBrf:v2];

  return v3;
}

@end