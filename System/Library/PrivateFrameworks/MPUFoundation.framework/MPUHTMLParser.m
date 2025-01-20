@interface MPUHTMLParser
+ (id)attributedSanitizedStringFromHTMLString:(id)a3 defaultAttributes:(id)a4;
+ (id)displayDelegateWithDefaultAttributes:(id)a3;
+ (id)parser;
+ (id)parserWithDefaultAttributes:(id)a3;
+ (id)sanitizedHTMLString:(id)a3;
- (MPUHTMLParserDelegate)delegate;
- (id)attributedStringForHTMLString:(id)a3 error:(id *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MPUHTMLParser

+ (id)attributedSanitizedStringFromHTMLString:(id)a3 defaultAttributes:(id)a4
{
  id v6 = a4;
  v7 = [a1 sanitizedHTMLString:a3];
  v8 = +[MPUHTMLParser parser];
  v9 = [a1 displayDelegateWithDefaultAttributes:v6];
  [v8 setDelegate:v9];
  uint64_t v14 = 0;
  v10 = [v8 attributedStringForHTMLString:v7 error:&v14];
  if (v10) {
    BOOL v11 = v14 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v6];

    v10 = (void *)v12;
  }

  return v10;
}

+ (id)parser
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)parserWithDefaultAttributes:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  id v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(_MPUHTMLDefaultDelegate);
    [(_MPUHTMLDefaultDelegate *)v7 setDefaultAttributes:v4];
    v8 = (void *)v6[1];
    v6[1] = v7;
    v9 = v7;

    [v6 setDelegate:v9];
  }

  return v6;
}

+ (id)displayDelegateWithDefaultAttributes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_MPUHTMLDefaultDelegate);
  [(_MPUHTMLDefaultDelegate *)v4 setDefaultAttributes:v3];

  return v4;
}

+ (id)sanitizedHTMLString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];
  id v6 = [MEMORY[0x263F08B08] scannerWithString:v5];
  [v6 setCharactersToBeSkipped:0];
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (([v6 isAtEnd] & 1) == 0)
  {
    id v8 = 0;
    do
    {
      v9 = v8;
      id v12 = v8;
      int v10 = [v6 scanUpToCharactersFromSet:v4 intoString:&v12];
      id v8 = v12;

      if (v10)
      {
        [v7 appendString:v8];
        if ([v6 scanCharactersFromSet:v4 intoString:0]) {
          [v7 appendString:@" "];
        }
      }
    }
    while (![v6 isAtEnd]);
  }

  return v7;
}

- (id)attributedStringForHTMLString:(id)a3 error:(id *)a4
{
  id v6 = [a3 dataUsingEncoding:4];
  id v7 = [[_MPUHTMLParserState alloc] initWithParser:self data:v6];
  [(_MPUHTMLParserState *)v7 parse:a4];
  id v8 = [(_MPUHTMLParserState *)v7 attributedString];

  return v8;
}

- (MPUHTMLParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPUHTMLParserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_defaultDelegate, 0);
}

@end