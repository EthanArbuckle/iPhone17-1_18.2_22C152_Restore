@interface AAMobileMeOfferResponse
- (NSNumber)identifier;
- (NSString)classicMessage;
- (NSString)classicTitle;
- (NSString)message;
- (NSString)title;
@end

@implementation AAMobileMeOfferResponse

- (NSNumber)identifier
{
  return (NSNumber *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"identifier"];
}

- (NSString)title
{
  return (NSString *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"title"];
}

- (NSString)message
{
  return (NSString *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"message"];
}

- (NSString)classicTitle
{
  return (NSString *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"classicTitle"];
}

- (NSString)classicMessage
{
  return (NSString *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"classicMessage"];
}

@end