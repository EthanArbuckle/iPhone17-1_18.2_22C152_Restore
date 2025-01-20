@interface MGGroup(MGRemoteQueryCoding)
+ (id)rq_decodedProperties:()MGRemoteQueryCoding;
+ (id)rq_instanceFromCoded:()MGRemoteQueryCoding;
- (id)rq_coded;
- (id)rq_codedProperties;
@end

@implementation MGGroup(MGRemoteQueryCoding)

- (id)rq_codedProperties
{
  id v0 = objc_alloc_init(NSDictionary);
  return v0;
}

+ (id)rq_decodedProperties:()MGRemoteQueryCoding
{
  id v0 = objc_alloc_init(NSDictionary);
  return v0;
}

- (id)rq_coded
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = [a1 identifier];
  v4 = objc_msgSend(v3, "rq_coded");

  v5 = [a1 name];
  v6 = objc_msgSend(v5, "rq_coded");

  v7 = [a1 type];
  v8 = objc_msgSend(v7, "rq_coded");

  v9 = [a1 memberIdentifiers];
  v10 = objc_msgSend(v9, "rq_coded");

  v11 = objc_msgSend(a1, "rq_codedProperties");
  [v2 setObject:v4 forKey:@"identifier"];
  if (v6) {
    [v2 setObject:v6 forKey:@"name"];
  }
  [v2 setObject:v8 forKey:@"type"];
  [v2 setObject:v10 forKey:@"member_identifiers"];
  [v2 setObject:v11 forKey:@"properties"];

  return v2;
}

+ (id)rq_instanceFromCoded:()MGRemoteQueryCoding
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = objc_msgSend(v4, "rq_stringForKey:", @"type");
  if ([v5 length])
  {
    id v6 = MGClassForMGGroupType(v5);
    if (v6)
    {
      v7 = objc_msgSend(v4, "rq_decodedObjectOfClass:forKey:", objc_opt_class(), @"identifier");
      v8 = objc_msgSend(v4, "rq_stringForKey:", @"name");
      v9 = objc_msgSend(v4, "rq_arrayOfDecodedClass:forKey:", objc_opt_class(), @"member_identifiers");
      id v10 = [v4 objectForKey:@"properties"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }

      if (v11)
      {
        v12 = objc_msgSend(v6, "rq_decodedProperties:", v11);
        v13 = 0;
        if (v7 && v9 && v12) {
          v13 = (void *)[objc_alloc((Class)v6) initWithConnectionProvider:0 type:v5 identifier:v7 name:v8 properties:v12 memberIdentifiers:v9];
        }
      }
      else
      {
        v12 = 0;
        v13 = 0;
      }
      id v6 = v13;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end