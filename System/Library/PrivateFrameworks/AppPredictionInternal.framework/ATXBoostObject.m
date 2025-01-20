@interface ATXBoostObject
- (ATXBoostObject)initWithDictionary:(id)a3;
- (double)gymBoost;
- (double)gymScale;
- (double)homeBoost;
- (double)homeScale;
- (double)schoolBoost;
- (double)schoolScale;
- (double)workBoost;
- (double)workScale;
@end

@implementation ATXBoostObject

- (ATXBoostObject)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ATXBoostObject;
  v5 = [(ATXBoostObject *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"Work"];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 objectForKeyedSubscript:@"boost"];
      [v8 doubleValue];
      v5->_workBoost = v9;

      v10 = [v7 objectForKeyedSubscript:@"scale"];
      [v10 doubleValue];
      v5->_workScale = v11;
    }
    v12 = [v4 objectForKeyedSubscript:@"Home"];

    if (v12)
    {
      v13 = [v12 objectForKeyedSubscript:@"boost"];
      [v13 doubleValue];
      v5->_homeBoost = v14;

      v15 = [v12 objectForKeyedSubscript:@"scale"];
      [v15 doubleValue];
      v5->_homeScale = v16;
    }
    v17 = [v4 objectForKeyedSubscript:@"Gym"];

    if (v17)
    {
      v18 = [v17 objectForKeyedSubscript:@"boost"];
      [v18 doubleValue];
      v5->_gymBoost = v19;

      v20 = [v17 objectForKeyedSubscript:@"scale"];
      [v20 doubleValue];
      v5->_gymScale = v21;
    }
    v22 = [v4 objectForKeyedSubscript:@"School"];

    if (v22)
    {
      v23 = [v22 objectForKeyedSubscript:@"boost"];
      [v23 doubleValue];
      v5->_schoolBoost = v24;

      v25 = [v22 objectForKeyedSubscript:@"scale"];
      [v25 doubleValue];
      v5->_schoolScale = v26;
    }
  }

  return v5;
}

- (double)workBoost
{
  return self->_workBoost;
}

- (double)workScale
{
  return self->_workScale;
}

- (double)homeBoost
{
  return self->_homeBoost;
}

- (double)homeScale
{
  return self->_homeScale;
}

- (double)gymBoost
{
  return self->_gymBoost;
}

- (double)gymScale
{
  return self->_gymScale;
}

- (double)schoolBoost
{
  return self->_schoolBoost;
}

- (double)schoolScale
{
  return self->_schoolScale;
}

@end