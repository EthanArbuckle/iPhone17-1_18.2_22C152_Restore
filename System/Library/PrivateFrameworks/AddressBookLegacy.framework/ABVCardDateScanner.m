@interface ABVCardDateScanner
+ (id)scannerWithString:(id)a3;
- (ABVCardDateScanner)initWithString:(id)a3;
- (BOOL)isAtEnd;
- (BOOL)scanLeapMarker;
- (int64_t)scanCalendarUnit:(unint64_t)a3;
- (int64_t)scanComponentValueOfLength:(unint64_t)a3;
- (unint64_t)lengthOfCalendarUnit:(unint64_t)a3;
- (unint64_t)position;
- (unsigned)nextCharacter;
@end

@implementation ABVCardDateScanner

+ (id)scannerWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithString:a3];
  return v3;
}

- (ABVCardDateScanner)initWithString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ABVCardDateScanner;
  v4 = [(ABVCardDateScanner *)&v6 init];
  if (v4)
  {
    v4->_string = (NSString *)[a3 copy];
    v4->_position = 0;
  }
  return v4;
}

- (int64_t)scanComponentValueOfLength:(unint64_t)a3
{
  if ([(ABVCardDateScanner *)self isAtEnd]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v5 = [(ABVCardDateScanner *)self nextCharacter];
  unint64_t position = self->_position;
  if (v5 == 45)
  {
    self->_unint64_t position = position + 1;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = a3 + 1;
  do
    --v8;
  while (position + v8 > [(NSString *)self->_string length]);
  v9 = -[NSString substringWithRange:](self->_string, "substringWithRange:", position, v8);
  self->_position += v8;
  return [(NSString *)v9 integerValue];
}

- (int64_t)scanCalendarUnit:(unint64_t)a3
{
  unint64_t v4 = [(ABVCardDateScanner *)self lengthOfCalendarUnit:a3];
  return [(ABVCardDateScanner *)self scanComponentValueOfLength:v4];
}

- (unint64_t)lengthOfCalendarUnit:(unint64_t)a3
{
  *((void *)&v4 + 1) = a3;
  *(void *)&long long v4 = a3 - 2;
  unint64_t v3 = v4 >> 1;
  if (v3 > 7) {
    return 0;
  }
  else {
    return qword_19DD554B0[v3];
  }
}

- (BOOL)scanLeapMarker
{
  if ([(ABVCardDateScanner *)self isAtEnd]
    || [(ABVCardDateScanner *)self nextCharacter] != 76)
  {
    return 0;
  }
  ++self->_position;
  return 1;
}

- (BOOL)isAtEnd
{
  unint64_t position = self->_position;
  return position >= [(NSString *)self->_string length];
}

- (unsigned)nextCharacter
{
  return [(NSString *)self->_string characterAtIndex:self->_position];
}

- (unint64_t)position
{
  return self->_position;
}

@end