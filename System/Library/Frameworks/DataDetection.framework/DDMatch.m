@interface DDMatch
+ (id)resultWithDDScannerResult:(id)a3;
+ (id)resultWithDDScannerResult:(id)a3 originalString:(id)a4;
- (DDMatch)initWithDDScannerResult:(id)a3;
- (DDMatch)initWithDDScannerResult:(id)a3 originalString:(id)a4;
- (NSString)matchedString;
- (_NSRange)matchedRange;
- (void)commonInitWithDDScannerResult:(id)a3 originalString:(id)a4;
@end

@implementation DDMatch

+ (id)resultWithDDScannerResult:(id)a3
{
  return (id)[a1 resultWithDDScannerResult:a3 originalString:0];
}

+ (id)resultWithDDScannerResult:(id)a3 originalString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    switch([v5 category])
    {
      case 1u:
        v7 = [v5 type];
        int v8 = [v7 isEqualToString:*MEMORY[0x263F39430]];
        v9 = off_264198908;
        if (!v8) {
          v9 = off_264198918;
        }
        goto LABEL_15;
      case 2u:
        v10 = DDMatchPhoneNumber;
        goto LABEL_12;
      case 3u:
        v10 = DDMatchPostalAddress;
        goto LABEL_12;
      case 4u:
        v10 = DDMatchCalendarEvent;
        goto LABEL_12;
      case 5u:
        v7 = [v5 type];
        if ([v7 isEqualToString:*MEMORY[0x263F39488]])
        {
          v9 = &off_264198938;
LABEL_15:
          v11 = (void *)[objc_alloc(*v9) initWithDDScannerResult:v5];

          goto LABEL_18;
        }
        if ([v7 isEqualToString:*MEMORY[0x263F39438]])
        {
          v9 = off_264198910;
          goto LABEL_15;
        }

        break;
      case 6u:
        v10 = DDMatchMoneyAmount;
LABEL_12:
        v11 = (void *)[[v10 alloc] initWithDDScannerResult:v5];
        goto LABEL_18;
      default:
        break;
    }
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (void)commonInitWithDDScannerResult:(id)a3 originalString:(id)a4
{
  id v5 = a3;
  NSUInteger v6 = [v5 urlificationRange];
  NSUInteger v8 = v7;
  self->_matchedRange.location = v6;
  self->_matchedRange.length = v7;
  NSUInteger v9 = v6 - [v5 range];
  [v5 matchedString];
  if (v9)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "substringWithRange:", v9, v8);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    matchedString = self->_matchedString;
    self->_matchedString = v12;

    v11 = (NSString *)v14;
  }
  else
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    v11 = self->_matchedString;
    self->_matchedString = v10;
  }
}

- (DDMatch)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DDMatch;
  id v5 = [(DDMatch *)&v8 init];
  NSUInteger v6 = v5;
  if (v5) {
    [(DDMatch *)v5 commonInitWithDDScannerResult:v4 originalString:0];
  }

  return v6;
}

- (DDMatch)initWithDDScannerResult:(id)a3 originalString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DDMatch;
  objc_super v8 = [(DDMatch *)&v11 init];
  NSUInteger v9 = v8;
  if (v8) {
    [(DDMatch *)v8 commonInitWithDDScannerResult:v6 originalString:v7];
  }

  return v9;
}

- (NSString)matchedString
{
  return self->_matchedString;
}

- (_NSRange)matchedRange
{
  NSUInteger length = self->_matchedRange.length;
  NSUInteger location = self->_matchedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end