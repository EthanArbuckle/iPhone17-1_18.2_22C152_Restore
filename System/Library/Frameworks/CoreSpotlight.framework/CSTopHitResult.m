@interface CSTopHitResult
- (CSSearchableItem)resultItem;
- (CSTopHitResult)initWithRankingItem:(id)a3 resultItem:(id)a4;
- (id)description;
@end

@implementation CSTopHitResult

- (CSTopHitResult)initWithRankingItem:(id)a3 resultItem:(id)a4
{
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CSTopHitResult;
  v8 = [(TopHitResult *)&v24 initWithRankingItem:a3];
  if (v8)
  {
    v9 = [v7 attributeSet];
    v10 = [v9 attributeDictionary];
    v11 = [v10 objectForKey:@"kMDQueryResultNewMatchedExtraQueriesField"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v11 length] == 16)
    {
      v12 = (uint64_t *)[v11 bytes];
      uint64_t v13 = *v12;
      uint64_t v14 = v12[1];
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    -[TopHitResult setScore:](v8, "setScore:", v13, v14);
    v15 = [v10 objectForKeyedSubscript:@"kMDQueryResultScoreL1"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v17 = 0.0;
    if (isKindOfClass) {
      objc_msgSend(v15, "floatValue", 0.0);
    }
    [(TopHitResult *)v8 setScoreL1:v17];
    v18 = [v10 objectForKeyedSubscript:@"_kMDItemBundleID"];
    [(TopHitResult *)v8 setBundleID:v18];

    v19 = [v10 objectForKeyedSubscript:@"_kMDItemExternalID"];
    [(TopHitResult *)v8 setIdentifier:v19];

    v20 = [v7 protection];
    [(TopHitResult *)v8 setDataclass:v20];

    v21 = [v10 objectForKeyedSubscript:@"kMDItemContentCreationDate"];
    [(TopHitResult *)v8 setInterestingDate:v21];

    v22 = [v10 objectForKeyedSubscript:@"kMDItemEmailConversationID"];
    [(TopHitResult *)v8 setThreadId:v22];

    objc_storeStrong((id *)&v8->_resultItem, a4);
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)CSTopHitResult;
  v4 = [(CSTopHitResult *)&v18 description];
  v5 = [(TopHitResult *)self bundleID];
  v6 = [(TopHitResult *)self identifier];
  id v7 = [v6 stringByPaddingToLength:10 withString:@" " startingAtIndex:0];
  v8 = [(CSTopHitResult *)self resultItem];
  v9 = [v8 attributeSet];
  v10 = [v9 attributeDictionary];
  v11 = [v10 objectForKeyedSubscript:@"_kMDItemExternalID"];
  [(TopHitResult *)self scoreL1];
  double v13 = v12;
  uint64_t v14 = [(TopHitResult *)self rankingItem];
  [v14 l2Score];
  v16 = [v3 stringWithFormat:@"%@ bid = %@ uid = %@ resultItem-uid = %@ L1 = %.04f, L2 = %.04f", v4, v5, v7, v11, *(void *)&v13, v15];

  return v16;
}

- (CSSearchableItem)resultItem
{
  return self->_resultItem;
}

- (void).cxx_destruct
{
}

@end