@interface SHShazamResponseItem
- (NSArray)songRelationIDs;
- (NSDictionary)shazamItemDictionary;
- (NSNumber)frequencySkew;
- (NSNumber)matchOffset;
- (NSNumber)shazamCount;
- (NSNumber)speedSkew;
- (NSString)artistName;
- (NSString)shazamID;
- (NSString)title;
- (NSURL)artworkURL;
- (NSURL)shazamURL;
- (SHShazamResponseItem)initWithShazamItemDictionary:(id)a3;
- (id)extractIDsFromRelation:(id)a3;
- (void)setShazamItemDictionary:(id)a3;
@end

@implementation SHShazamResponseItem

- (SHShazamResponseItem)initWithShazamItemDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHShazamResponseItem;
  v6 = [(SHShazamResponseItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shazamItemDictionary, a3);
  }

  return v7;
}

- (NSString)shazamID
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"id"];

  return (NSString *)v3;
}

- (NSURL)shazamURL
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"shazamUrl"];

  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSString)title
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"name"];

  return (NSString *)v4;
}

- (NSString)artistName
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"artistName"];

  return (NSString *)v4;
}

- (NSNumber)shazamCount
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"shazamCount"];

  return (NSNumber *)v4;
}

- (NSURL)artworkURL
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"artwork"];

  id v5 = [v4 objectForKeyedSubscript:@"url"];
  v6 = [v4 objectForKeyedSubscript:@"width"];
  v7 = [v4 objectForKeyedSubscript:@"height"];
  if (v5)
  {
    v8 = +[NSString stringWithFormat:@"%@", v6];
    objc_super v9 = [v5 stringByReplacingOccurrencesOfString:@"{w}" withString:v8];

    v10 = +[NSString stringWithFormat:@"%@", v7];
    v11 = [v9 stringByReplacingOccurrencesOfString:@"{h}" withString:v10];

    id v5 = +[NSURL URLWithString:v11];
  }

  return (NSURL *)v5;
}

- (NSNumber)matchOffset
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"meta"];
  v4 = [v3 objectForKeyedSubscript:@"matchOffset"];

  return (NSNumber *)v4;
}

- (NSNumber)speedSkew
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"meta"];
  v4 = [v3 objectForKeyedSubscript:@"speedSkew"];

  return (NSNumber *)v4;
}

- (NSNumber)frequencySkew
{
  v2 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v3 = [v2 objectForKeyedSubscript:@"meta"];
  v4 = [v3 objectForKeyedSubscript:@"frequencySkew"];

  return (NSNumber *)v4;
}

- (NSArray)songRelationIDs
{
  v3 = [(SHShazamResponseItem *)self shazamItemDictionary];
  v4 = [v3 objectForKeyedSubscript:@"relationships"];
  id v5 = [v4 objectForKeyedSubscript:@"songs"];

  v6 = [(SHShazamResponseItem *)self extractIDsFromRelation:v5];

  return (NSArray *)v6;
}

- (id)extractIDsFromRelation:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"data"];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"id", (void)v15);

        if (v11)
        {
          v12 = [v10 objectForKeyedSubscript:@"id"];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (NSDictionary)shazamItemDictionary
{
  return self->_shazamItemDictionary;
}

- (void)setShazamItemDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end