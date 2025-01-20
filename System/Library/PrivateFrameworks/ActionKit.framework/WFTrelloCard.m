@interface WFTrelloCard
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)dueDateJSONTransformer;
- (NSDate)dueDate;
- (NSNumber)creationPosition;
- (NSString)itemDescription;
- (NSURL)URL;
@end

@implementation WFTrelloCard

+ (id)dueDateJSONTransformer
{
  v2 = (void *)MEMORY[0x263F08D50];
  v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  v4 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  v5 = objc_msgSend(v2, "mtl_dateTransformerWithDateFormat:calendar:locale:timeZone:defaultDate:", @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", 0, v3, v4, 0);

  return v5;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[4] = *MEMORY[0x263EF8340];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFTrelloCard;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"itemDescription";
  v7[1] = @"creationPosition";
  v8[0] = @"desc";
  v8[1] = @"pos";
  v7[2] = @"dueDate";
  v7[3] = @"URL";
  v8[2] = @"due";
  v8[3] = @"shortUrl";
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
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
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_creationPosition, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (NSNumber)creationPosition
{
  return self->_creationPosition;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

@end