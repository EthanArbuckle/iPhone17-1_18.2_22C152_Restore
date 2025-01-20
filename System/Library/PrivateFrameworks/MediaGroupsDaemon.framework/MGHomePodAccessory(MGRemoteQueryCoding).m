@interface MGHomePodAccessory(MGRemoteQueryCoding)
+ (id)rq_decodedProperties:()MGRemoteQueryCoding;
- (id)rq_codedProperties;
@end

@implementation MGHomePodAccessory(MGRemoteQueryCoding)

- (id)rq_codedProperties
{
  v12.receiver = a1;
  v12.super_class = (Class)&off_26DD6FF98;
  v2 = objc_msgSendSuper2(&v12, sel_rq_codedProperties);
  v3 = (void *)[v2 mutableCopy];

  v4 = [a1 deviceIdentifier];
  v5 = objc_msgSend(v4, "rq_coded");
  [v3 setObject:v5 forKey:@"deviceIdentifier"];

  v6 = [a1 productColor];
  v7 = objc_msgSend(v6, "rq_coded");
  [v3 setObject:v7 forKey:@"productColor"];

  v8 = [a1 HomePodVariant];
  v9 = objc_msgSend(v8, "rq_coded");
  [v3 setObject:v9 forKey:@"HomePodVariant"];

  v10 = (void *)[v3 copy];
  return v10;
}

+ (id)rq_decodedProperties:()MGRemoteQueryCoding
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "rq_stringForKey:", @"deviceIdentifier");
  v6 = objc_msgSend(v4, "rq_numberForKey:", @"productColor");
  v7 = objc_msgSend(v4, "rq_numberForKey:", @"HomePodVariant");
  v8 = 0;
  if ([v5 length] && v6 && v7)
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_26DD6FE88;
    v9 = objc_msgSendSuper2(&v11, sel_rq_decodedProperties_, v4);
    v8 = (void *)[v9 mutableCopy];

    [v8 setObject:v5 forKey:@"deviceIdentifier"];
    [v8 setObject:v6 forKey:@"productColor"];
    [v8 setObject:v7 forKey:@"HomePodVariant"];
  }

  return v8;
}

@end