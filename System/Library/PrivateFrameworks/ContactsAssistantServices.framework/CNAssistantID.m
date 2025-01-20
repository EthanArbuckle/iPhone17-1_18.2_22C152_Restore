@interface CNAssistantID
+ (id)assistantIDFromContact:(id)a3;
+ (id)assistantIDFromContactID:(id)a3;
+ (id)assistantIDFromContainer:(id)a3;
+ (id)assistantIDFromExternalIdentifier:(id)a3;
+ (id)assistantIDFromGroup:(id)a3;
+ (id)assistantIDOfType:(id)a3 recordID:(int)a4 databaseID:(id)a5 identifier:(id)a6;
+ (id)contactIDFromAssistantID:(id)a3;
+ (id)containerIDFromAssistantID:(id)a3;
+ (id)databaseID;
+ (id)externalIdentifierFromAssistantID:(id)a3;
+ (id)groupIDFromAssistantID:(id)a3;
@end

@implementation CNAssistantID

+ (id)assistantIDOfType:(id)a3 recordID:(int)a4 databaseID:(id)a5 identifier:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  v11 = (void *)MEMORY[0x263EFF980];
  id v12 = a3;
  v13 = [v11 array];
  if (v7)
  {
    v14 = [NSString stringWithFormat:@"%@=%d", @"recordID", v7];
    [v13 addObject:v14];
  }
  if ([v9 length])
  {
    v15 = [NSString stringWithFormat:@"%@=%@", @"databaseID", v9];
    [v13 addObject:v15];
  }
  if ([v10 length])
  {
    v16 = [NSString stringWithFormat:@"%@=%@", @"identifier", v10];
    [v13 addObject:v16];
  }
  v17 = [v13 componentsJoinedByString:@"&"];
  v18 = [NSString stringWithFormat:@"%@://%@", @"com.apple.contacts", v12];

  if ([v17 length])
  {
    v19 = [v18 stringByAppendingString:@"?"];

    v18 = [v19 stringByAppendingString:v17];
  }
  v20 = [NSURL URLWithString:v18];

  return v20;
}

+ (id)databaseID
{
  v2 = objc_opt_new();
  v3 = [v2 identifierWithError:0];

  return v3;
}

+ (id)assistantIDFromContactID:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[CNAssistantID databaseID];
  v5 = objc_opt_new();
  v11[0] = *MEMORY[0x263EFDFD8];
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  uint64_t v7 = [v5 unifiedContactWithIdentifier:v3 keysToFetch:v6 error:0];

  if (v7) {
    uint64_t v8 = [v7 iOSLegacyIdentifier];
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = +[CNAssistantID assistantIDOfType:@"contact" recordID:v8 databaseID:v4 identifier:v3];

  return v9;
}

+ (id)assistantIDFromContact:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isKeyAvailable:*MEMORY[0x263EFDFE0]])
  {
    v4 = [v3 identifier];
    v5 = +[CNAssistantID databaseID];
    uint64_t v6 = *MEMORY[0x263EFDFD8];
    if ([v3 isKeyAvailable:*MEMORY[0x263EFDFD8]])
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v9 = objc_opt_new();
      v13[0] = v6;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      v11 = [v9 unifiedContactWithIdentifier:v4 keysToFetch:v10 error:0];

      if (v11) {
        uint64_t v7 = [v11 iOSLegacyIdentifier];
      }
      else {
        uint64_t v7 = 0;
      }
    }
    uint64_t v8 = +[CNAssistantID assistantIDOfType:@"contact" recordID:v7 databaseID:v5 identifier:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)assistantIDFromContainer:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  uint64_t v5 = [v3 iOSLegacyIdentifier];

  uint64_t v6 = +[CNAssistantID databaseID];
  uint64_t v7 = +[CNAssistantID assistantIDOfType:@"container" recordID:v5 databaseID:v6 identifier:v4];

  return v7;
}

+ (id)assistantIDFromGroup:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  uint64_t v5 = [v3 iOSLegacyIdentifier];

  uint64_t v6 = +[CNAssistantID databaseID];
  uint64_t v7 = +[CNAssistantID assistantIDOfType:@"group" recordID:v5 databaseID:v6 identifier:v4];

  return v7;
}

+ (id)contactIDFromAssistantID:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  if (![v4 isEqualToString:@"com.apple.contacts"])
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 host];
  int v6 = [v5 isEqualToString:@"contact"];

  if (v6)
  {
    v4 = GetURLParameters(v3);
    uint64_t v7 = [v4 objectForKeyedSubscript:@"identifier"];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

+ (id)containerIDFromAssistantID:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  if (![v4 isEqualToString:@"com.apple.contacts"])
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 host];
  int v6 = [v5 isEqualToString:@"container"];

  if (v6)
  {
    v4 = GetURLParameters(v3);
    uint64_t v7 = [v4 objectForKeyedSubscript:@"identifier"];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

+ (id)groupIDFromAssistantID:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  if (![v4 isEqualToString:@"com.apple.contacts"])
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 host];
  int v6 = [v5 isEqualToString:@"group"];

  if (v6)
  {
    v4 = GetURLParameters(v3);
    uint64_t v7 = [v4 objectForKeyedSubscript:@"identifier"];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

+ (id)assistantIDFromExternalIdentifier:(id)a3
{
  id v3 = [NSString stringWithFormat:@"com.apple.contacts://externalPerson?externalIdentifier=%@", a3];
  v4 = [NSURL URLWithString:v3];

  return v4;
}

+ (id)externalIdentifierFromAssistantID:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"com.apple.contacts"];

  if (v5)
  {
    int v6 = GetURLParameters(v3);
    uint64_t v7 = [v6 objectForKeyedSubscript:@"externalIdentifier"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end