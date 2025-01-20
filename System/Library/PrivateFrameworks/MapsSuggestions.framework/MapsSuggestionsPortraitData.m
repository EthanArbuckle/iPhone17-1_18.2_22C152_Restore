@interface MapsSuggestionsPortraitData
- (MapsSuggestionsPortraitData)initWithName:(id)a3 lastInteractionTime:(id)a4;
- (NSDate)lastInteractionTime;
- (NSString)name;
- (void)setLastInteractionTime:(id)a3;
- (void)setName:(id)a3;
@end

@implementation MapsSuggestionsPortraitData

- (MapsSuggestionsPortraitData)initWithName:(id)a3 lastInteractionTime:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsPortraitData;
  v9 = [(MapsSuggestionsPortraitData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_lastInteractionTime, a4);
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)lastInteractionTime
{
  return self->_lastInteractionTime;
}

- (void)setLastInteractionTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInteractionTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end