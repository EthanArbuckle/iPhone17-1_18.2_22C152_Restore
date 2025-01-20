@interface NSHTTPURLResponse(AuthKit)
- (id)_ak_dataForEncodedHeaderWithKey:()AuthKit;
- (id)ak_acceptedTermsInfo;
- (id)ak_stringForEncodedHeaderWithKey:()AuthKit;
@end

@implementation NSHTTPURLResponse(AuthKit)

- (id)ak_stringForEncodedHeaderWithKey:()AuthKit
{
  v1 = objc_msgSend(a1, "_ak_dataForEncodedHeaderWithKey:");
  v2 = (void *)[[NSString alloc] initWithData:v1 encoding:4];

  return v2;
}

- (id)ak_acceptedTermsInfo
{
  v1 = objc_msgSend(a1, "_ak_dataForEncodedHeaderWithKey:", @"X-Apple-I-Accepted-Terms");
  v2 = [MEMORY[0x1E4F47000] dictionaryFromObject:v1 ofType:@"application/json"];

  return v2;
}

- (id)_ak_dataForEncodedHeaderWithKey:()AuthKit
{
  v1 = objc_msgSend(a1, "valueForHTTPHeaderField:");
  if (v1) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v1 options:0];
  }
  else {
    v2 = 0;
  }

  return v2;
}

@end