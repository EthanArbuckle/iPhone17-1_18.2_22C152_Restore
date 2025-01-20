@interface FBKRequestRecord
- (NSAttributedString)attrRequestBody;
- (NSAttributedString)attrRequestHeader;
- (NSAttributedString)attrResponseBody;
- (NSAttributedString)attrResponseHeader;
- (UIColor)displayColor;
- (id)attributedStringAttributes;
- (id)description;
@end

@implementation FBKRequestRecord

- (NSAttributedString)attrRequestBody
{
  v3 = [(DEDRequestRecord *)self requestBody];

  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  v5 = v4;
  if (v3)
  {
    v6 = [(DEDRequestRecord *)self requestBody];
    v7 = [(FBKRequestRecord *)self attributedStringAttributes];
    v8 = (void *)[v5 initWithString:v6 attributes:v7];
  }
  else
  {
    v8 = (void *)[v4 initWithString:&stru_26DDF6A30 attributes:0];
  }

  return (NSAttributedString *)v8;
}

- (NSAttributedString)attrRequestHeader
{
  v3 = [(DEDRequestRecord *)self requestHeader];

  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  v5 = v4;
  if (v3)
  {
    v6 = [(DEDRequestRecord *)self requestHeader];
    v7 = [(FBKRequestRecord *)self attributedStringAttributes];
    v8 = (void *)[v5 initWithString:v6 attributes:v7];
  }
  else
  {
    v8 = (void *)[v4 initWithString:&stru_26DDF6A30 attributes:0];
  }

  return (NSAttributedString *)v8;
}

- (NSAttributedString)attrResponseHeader
{
  v3 = [(DEDRequestRecord *)self responseHeader];

  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  v5 = v4;
  if (v3)
  {
    v6 = [(DEDRequestRecord *)self responseHeader];
    v7 = [(FBKRequestRecord *)self attributedStringAttributes];
    v8 = (void *)[v5 initWithString:v6 attributes:v7];
  }
  else
  {
    v8 = (void *)[v4 initWithString:&stru_26DDF6A30 attributes:0];
  }

  return (NSAttributedString *)v8;
}

- (NSAttributedString)attrResponseBody
{
  v3 = [(DEDRequestRecord *)self responseBody];

  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  v5 = v4;
  if (v3)
  {
    v6 = [(DEDRequestRecord *)self responseBody];
    v7 = [(FBKRequestRecord *)self attributedStringAttributes];
    v8 = (void *)[v5 initWithString:v6 attributes:v7];
  }
  else
  {
    v8 = (void *)[v4 initWithString:&stru_26DDF6A30 attributes:0];
  }

  return (NSAttributedString *)v8;
}

- (id)attributedStringAttributes
{
  if (attributedStringAttributes_onceToken != -1) {
    dispatch_once(&attributedStringAttributes_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)attributedStringAttributes__attr;

  return v2;
}

void __46__FBKRequestRecord_attributedStringAttributes__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F81500];
  v0 = [MEMORY[0x263F825C8] labelColor];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)attributedStringAttributes__attr;
  attributedStringAttributes__attr = v1;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(DEDRequestRecord *)self method];
  v5 = [(DEDRequestRecord *)self URL];
  v6 = [(DEDRequestRecord *)self requestHeader];
  v7 = [v3 stringWithFormat:@"%@: %@\n%@", v4, v5, v6];

  return v7;
}

- (UIColor)displayColor
{
  if ([(DEDRequestRecord *)self isFailure]) {
    [MEMORY[0x263F825C8] systemRedColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] labelColor];
  }

  return (UIColor *)v2;
}

@end