@interface NSMutableURLRequest(WFFormEncoding)
- (void)wf_setBodyWithQueryItems:()WFFormEncoding;
@end

@implementation NSMutableURLRequest(WFFormEncoding)

- (void)wf_setBodyWithQueryItems:()WFFormEncoding
{
  id v4 = a3;
  [a1 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  WFHTTPBodyFromQueryItems(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [a1 setHTTPBody:v5];
}

@end