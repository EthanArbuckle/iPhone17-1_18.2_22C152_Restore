@interface WFTrelloBoard
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)closedJSONTransformer;
- (BOOL)closed;
- (NSString)itemDescription;
- (NSURL)URL;
@end

@implementation WFTrelloBoard

+ (id)closedJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x263F08D50], "mtl_BOOLeanValueTransformer");
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[3] = *MEMORY[0x263EF8340];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFTrelloBoard;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"itemDescription";
  v7[1] = @"URL";
  v8[0] = @"desc";
  v8[1] = @"url";
  v7[2] = @"closed";
  v8[2] = @"closed";
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
}

- (BOOL)closed
{
  return self->_closed;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

@end