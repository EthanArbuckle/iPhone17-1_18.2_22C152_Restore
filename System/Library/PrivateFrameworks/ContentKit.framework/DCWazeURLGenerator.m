@interface DCWazeURLGenerator
- (id)host;
- (id)path;
- (id)scheme;
- (void)populateQueryDictionary;
@end

@implementation DCWazeURLGenerator

- (void)populateQueryDictionary
{
  id v13 = [(DCMapsURLGenerator *)self queryDictionary];
  v3 = [(DCMapsURLGenerator *)self mapsLink];
  v4 = [v3 searchQuery];
  v5 = [v3 centerLocation];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v7 = [v3 searchLocation];
  }
  v8 = v7;

  v9 = [v3 destinationAddress];
  if (v9)
  {
    [v13 setObject:v9 forKey:@"q"];
    v10 = @"yes";
    v11 = @"navigate";
    v12 = v13;
  }
  else if (v4)
  {
    v11 = @"q";
    v12 = v13;
    v10 = v4;
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    v11 = @"ll";
    v12 = v13;
    v10 = v8;
  }
  [v12 setObject:v10 forKey:v11];
LABEL_11:
}

- (id)path
{
  return 0;
}

- (id)host
{
  return 0;
}

- (id)scheme
{
  v2 = @"waze";
  return @"waze";
}

@end