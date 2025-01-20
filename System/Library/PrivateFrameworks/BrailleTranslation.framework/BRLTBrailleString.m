@interface BRLTBrailleString
+ (BOOL)isValidBRF:(id)a3;
+ (id)brfTable;
+ (id)brfToUnicode:(id)a3;
+ (id)dinToUnicode:(id)a3;
+ (id)unicodeToBestEffortBrf:(id)a3;
+ (id)unicodeToDin:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBrailleString:(id)a3;
- (BRLTBrailleString)init;
- (BRLTBrailleString)initWithBrailleChars:(id)a3;
- (BRLTBrailleString)initWithBrf:(id)a3;
- (BRLTBrailleString)initWithUnicode:(id)a3;
- (NSArray)brailleChars;
- (NSString)unicode;
- (id)bestEffortBrf;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
@end

@implementation BRLTBrailleString

- (BRLTBrailleString)init
{
  return [(BRLTBrailleString *)self initWithBrailleChars:0];
}

- (BRLTBrailleString)initWithBrailleChars:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTBrailleString;
  v5 = [(BRLTBrailleString *)&v9 init];
  if (v4)
  {
    uint64_t v6 = [v4 mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
  }
  brailleChars = v5->_brailleChars;
  v5->_brailleChars = (NSMutableArray *)v6;

  return v5;
}

- (BRLTBrailleString)initWithUnicode:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  if ([v4 length])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = +[BRLTBrailleChar charWithUnichar:](BRLTBrailleChar, "charWithUnichar:", [v4 characterAtIndex:v6]);
      [v5 addObject:v7];

      ++v6;
    }
    while (v6 < [v4 length]);
  }
  v8 = [(BRLTBrailleString *)self initWithBrailleChars:v5];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[BRLTBrailleString allocWithZone:a3];
  brailleChars = self->_brailleChars;
  return [(BRLTBrailleString *)v4 initWithBrailleChars:brailleChars];
}

- (NSString)unicode
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_brailleChars;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unicode", (void)v11);
        [v3 appendString:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (BRLTBrailleString)initWithBrf:(id)a3
{
  id v4 = [a3 uppercaseString];
  uint64_t v5 = +[BRLTBrailleString brfToUnicode:v4];
  uint64_t v6 = [(BRLTBrailleString *)self initWithUnicode:v5];

  return v6;
}

- (NSArray)brailleChars
{
  v2 = (void *)[(NSMutableArray *)self->_brailleChars copy];
  return (NSArray *)v2;
}

+ (id)dinToUnicode:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unint64_t v4 = 0;
    uint64_t v5 = &stru_26CCBD108;
    do
    {
      int v6 = [v3 characterAtIndex:v4];
      if (v6 == 32)
      {
        LOWORD(v7) = 10240;
      }
      else
      {
        unint64_t v8 = qword_21C58C340[v6];
        int v7 = 10240;
        do
        {
          v7 += 1 << (~(10 * (v8 / 0xA)) + v8);
          BOOL v9 = v8 > 9;
          v8 /= 0xAuLL;
        }
        while (v9);
      }
      __int16 v13 = v7;
      v10 = [NSString stringWithCharacters:&v13 length:1];
      long long v11 = [(__CFString *)v5 stringByAppendingString:v10];

      ++v4;
      uint64_t v5 = v11;
    }
    while ([v3 length] > v4);
  }
  else
  {
    long long v11 = &stru_26CCBD108;
  }

  return v11;
}

+ (id)unicodeToDin:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = v3;
  for (uint64_t i = 0; i != 256; ++i)
  {
    if (i == 32)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      unint64_t v7 = qword_21C58C340[i];
      do
      {
        v6 += (1 << (~(10 * (v7 / 0xA)) + v7));
        BOOL v8 = v7 > 9;
        v7 /= 0xAuLL;
      }
      while (v8);
    }
    v15[v6] = i;
  }
  if ([v3 length])
  {
    unint64_t v9 = 0;
    v10 = &stru_26CCBD108;
    do
    {
      __int16 v11 = [v4 characterAtIndex:v9];
      long long v12 = [NSString stringWithCharacters:&v15[(unsigned __int16)(v11 - 10240)] length:1];
      __int16 v13 = [(__CFString *)v10 stringByAppendingString:v12];

      ++v9;
      v10 = v13;
    }
    while ([v4 length] > v9);
  }
  else
  {
    __int16 v13 = &stru_26CCBD108;
  }

  return v13;
}

+ (id)brfTable
{
  return @" A1B'K2L@CIF/MSP\"E3H9O6R^DJG>NTQ,*5<-U8V.%[$+X!&;:4\\0Z7(_?W]#Y)=";
}

+ (id)brfToUnicode:(id)a3
{
  unint64_t v4 = [a3 uppercaseString];
  uint64_t v5 = [a1 brfTable];
  uint64_t v6 = malloc_type_malloc(2 * [v4 length], 0x1000040BDFB0063uLL);
  if ([v4 length])
  {
    unint64_t v7 = 0;
    do
    {
      BOOL v8 = objc_msgSend(v4, "substringWithRange:", v7, 1);
      v6[v7] = [v5 rangeOfString:v8] + 10240;

      ++v7;
    }
    while ([v4 length] > v7);
  }
  unint64_t v9 = objc_msgSend(NSString, "stringWithCharacters:length:", v6, objc_msgSend(v4, "length"));
  free(v6);

  return v9;
}

+ (BOOL)isValidBRF:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__BRLTBrailleString_isValidBRF___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = isValidBRF__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isValidBRF__onceToken, block);
  }
  uint64_t v5 = [v4 uppercaseString];

  BOOL v6 = [v5 rangeOfCharacterFromSet:isValidBRF__nonBrfSet] == 0x7FFFFFFFFFFFFFFFLL;
  return v6;
}

void __32__BRLTBrailleString_isValidBRF___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) brfTable];
  uint64_t v1 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v5];
  v2 = (void *)isValidBRF__brfSet;
  isValidBRF__brfSet = v1;

  uint64_t v3 = [(id)isValidBRF__brfSet invertedSet];
  id v4 = (void *)isValidBRF__nonBrfSet;
  isValidBRF__nonBrfSet = v3;
}

+ (id)unicodeToBestEffortBrf:(id)a3
{
  id v3 = a3;
  if (unicodeToBestEffortBrf__onceToken != -1) {
    dispatch_once(&unicodeToBestEffortBrf__onceToken, &__block_literal_global_3);
  }
  id v4 = [MEMORY[0x263F089D8] string];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    do
    {
      unsigned int v6 = [v3 characterAtIndex:v5];
      unint64_t v7 = v6 - 10240;
      if (v7 >= 0x40) {
        uint64_t v8 = v5;
      }
      else {
        uint64_t v8 = v6 - 10240;
      }
      if (v7 >= 0x40) {
        unint64_t v9 = v3;
      }
      else {
        unint64_t v9 = (void *)unicodeToBestEffortBrf__brfTable;
      }
      v10 = objc_msgSend(v9, "substringWithRange:", v8, 1);
      [v4 appendString:v10];

      ++v5;
    }
    while (v5 < [v3 length]);
  }

  return v4;
}

uint64_t __44__BRLTBrailleString_unicodeToBestEffortBrf___block_invoke()
{
  v0 = (void *)unicodeToBestEffortBrf__brfTable;
  unicodeToBestEffortBrf__brfTable = @" A1B'K2L@CIF/MSP\"E3H9O6R^DJG>NTQ,*5<-U8V.%[$+X!&;:4\\0Z7(_?W]#Y)=";

  uint64_t v1 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" A1B'K2L@CIF/MSP\"E3H9O6R^DJG>NTQ,*5<-U8V.%[$+X!&:4\\0Z7(_?W]#Y)="];;
  v2 = (void *)unicodeToBestEffortBrf__brfSet;
  unicodeToBestEffortBrf__brfSet = v1;

  unicodeToBestEffortBrf__nonBrfSet = [(id)unicodeToBestEffortBrf__brfSet invertedSet];
  return MEMORY[0x270F9A758]();
}

- (id)bestEffortBrf
{
  v2 = [(BRLTBrailleString *)self unicode];
  id v3 = +[BRLTBrailleString unicodeToBestEffortBrf:v2];

  return v3;
}

- (BOOL)isEqualToBrailleString:(id)a3
{
  brailleChars = self->_brailleChars;
  id v4 = [a3 brailleChars];
  LOBYTE(brailleChars) = [(NSMutableArray *)brailleChars isEqualToArray:v4];

  return (char)brailleChars;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRLTBrailleString *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRLTBrailleString *)self isEqualToBrailleString:v4];
  }

  return v5;
}

- (unint64_t)length
{
  return [(NSMutableArray *)self->_brailleChars count];
}

- (void).cxx_destruct
{
}

@end