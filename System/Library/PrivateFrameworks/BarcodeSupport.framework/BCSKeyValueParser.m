@interface BCSKeyValueParser
- (BCSKeyValueParser)initWithString:(id)a3 startIndex:(unint64_t)a4;
- (BOOL)_parseNextKeyValuePair;
- (NSDictionary)keyValuePairs;
- (unint64_t)_indexOfDelimiter:(id)a3 range:(_NSRange)a4;
- (unint64_t)_numberOfPreviousBackSlashesFromIndex:(unint64_t)a3 withinRange:(_NSRange)a4;
@end

@implementation BCSKeyValueParser

- (BCSKeyValueParser)initWithString:(id)a3 startIndex:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSKeyValueParser;
  v7 = [(BCSKeyValueParser *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    string = v7->_string;
    v7->_string = (NSString *)v8;

    v7->_currentIndex = a4;
    v7->_stringLength = [v6 length];
    v10 = v7;
  }

  return v7;
}

- (NSDictionary)keyValuePairs
{
  keyValuePairs = self->_keyValuePairs;
  if (!keyValuePairs)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = self->_keyValuePairs;
    self->_keyValuePairs = v4;

    while ([(BCSKeyValueParser *)self _parseNextKeyValuePair])
      ;
    keyValuePairs = self->_keyValuePairs;
  }
  id v6 = keyValuePairs;
  return (NSDictionary *)v6;
}

- (BOOL)_parseNextKeyValuePair
{
  unint64_t v3 = -[BCSKeyValueParser _indexOfDelimiter:range:](self, "_indexOfDelimiter:range:", @";",
         self->_currentIndex,
         self->_stringLength - self->_currentIndex);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v4 = v3;
  if (v3 == self->_currentIndex) {
    return 0;
  }
  unint64_t v5 = -[BCSKeyValueParser _indexOfDelimiter:range:](self, "_indexOfDelimiter:range:", @":");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v8 = v5;
  v9 = -[NSString substringWithRange:](self->_string, "substringWithRange:", self->_currentIndex, v5 - self->_currentIndex);
  v10 = objc_msgSend(v9, "_bcs_trimmedString");

  v11 = objc_msgSend(v10, "_bcs_unescapedString");

  uint64_t v12 = [v11 length];
  BOOL v6 = v12 != 0;
  if (v12)
  {
    v13 = -[NSString substringWithRange:](self->_string, "substringWithRange:", v8 + 1, v4 + ~v8);
    v14 = objc_msgSend(v13, "_bcs_unescapedString");

    [(NSMutableDictionary *)self->_keyValuePairs setObject:v14 forKeyedSubscript:v11];
    self->_currentIndex = v4 + 1;
  }
  return v6;
}

- (unint64_t)_indexOfDelimiter:(id)a3 range:(_NSRange)a4
{
  NSUInteger v4 = a4.location + a4.length;
  if (a4.location < a4.location + a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    NSUInteger v9 = a4.location;
    do
    {
      uint64_t v10 = -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", a3, 0, v9, v4 - v9);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v11 = v10;
      if (v10 == v9) {
        return v9;
      }
      NSUInteger v9 = v10;
      if ((-[BCSKeyValueParser _numberOfPreviousBackSlashesFromIndex:withinRange:](self, "_numberOfPreviousBackSlashesFromIndex:withinRange:", v10, location, length) & 1) == 0)return v9; {
      NSUInteger v9 = v11 + 1;
      }
    }
    while (v11 + 1 < v4);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_numberOfPreviousBackSlashesFromIndex:(unint64_t)a3 withinRange:(_NSRange)a4
{
  unint64_t v4 = a3;
  if (a3 >= a4.location) {
    unint64_t v6 = a3 - a4.location;
  }
  else {
    unint64_t v6 = 0;
  }
  if (a4.location >= a3) {
    unint64_t location = a3;
  }
  else {
    unint64_t location = a4.location;
  }
  unint64_t v8 = -1;
  while (location != v4)
  {
    --v4;
    ++v8;
    if ([(NSString *)self->_string characterAtIndex:v4] != 92) {
      return v8;
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end