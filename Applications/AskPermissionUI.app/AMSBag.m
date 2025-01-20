@interface AMSBag
+ (id)sharedBag;
- (AMSBagValue)countryCode;
- (AMSBagValue)localeIdentifier;
- (AMSBagValue)retrieveRequestURL;
- (AMSBagValue)updateRequestURL;
@end

@implementation AMSBag

+ (id)sharedBag
{
  return +[AMSBag bagForProfile:@"AskPermission" profileVersion:@"1"];
}

- (AMSBagValue)countryCode
{
  return (AMSBagValue *)[(AMSBag *)self stringForKey:@"countryCode"];
}

- (AMSBagValue)localeIdentifier
{
  return (AMSBagValue *)[(AMSBag *)self stringForKey:@"language-tag"];
}

- (AMSBagValue)retrieveRequestURL
{
  return (AMSBagValue *)[(AMSBag *)self URLForKey:@"familyPermissionGetRequestInfoSrv"];
}

- (AMSBagValue)updateRequestURL
{
  return (AMSBagValue *)[(AMSBag *)self URLForKey:@"familyPermissionUpdateRequestSrv"];
}

@end