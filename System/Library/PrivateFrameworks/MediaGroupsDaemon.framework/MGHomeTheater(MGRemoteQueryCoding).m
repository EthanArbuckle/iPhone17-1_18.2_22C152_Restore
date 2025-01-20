@interface MGHomeTheater(MGRemoteQueryCoding)
+ (id)rq_decodedProperties:()MGRemoteQueryCoding;
- (id)rq_codedProperties;
@end

@implementation MGHomeTheater(MGRemoteQueryCoding)

- (id)rq_codedProperties
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_26DD70240;
  v2 = objc_msgSendSuper2(&v8, sel_rq_codedProperties);
  v3 = (void *)[v2 mutableCopy];

  v4 = [a1 audioEntityRouteID];
  v5 = objc_msgSend(v4, "rq_coded");
  [v3 setObject:v5 forKey:@"audioDestinationIdentifier"];

  v6 = (void *)[v3 copy];
  return v6;
}

+ (id)rq_decodedProperties:()MGRemoteQueryCoding
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "rq_stringForKey:", @"audioDestinationIdentifier");
  if ([v5 length])
  {
    v9.receiver = a1;
    v9.super_class = (Class)&off_26DD70188;
    v6 = objc_msgSendSuper2(&v9, sel_rq_decodedProperties_, v4);
    v7 = (void *)[v6 mutableCopy];

    [v7 setObject:v5 forKey:@"audioDestinationIdentifier"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end