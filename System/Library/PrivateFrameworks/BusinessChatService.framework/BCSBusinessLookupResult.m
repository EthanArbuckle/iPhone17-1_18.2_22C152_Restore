@interface BCSBusinessLookupResult
- (BCSBusinessConfig)config;
- (BCSBusinessLookupResult)initWithFilterMatchResult:(id)a3 config:(id)a4;
- (BCSBusinessLookupResult)initWithHasBusiness:(BOOL)a3 matchingTruncatedHash:(int64_t)a4 config:(id)a5;
- (BCSItemIdentifying)itemIdentifier;
- (BOOL)hasBusiness;
- (id)initForMatchWithTruncatedHash:(int64_t)a3;
- (id)initForMatchWithTruncatedHash:(int64_t)a3 config:(id)a4;
- (id)initForNoMatch;
- (id)initForNoMatchWithConfig:(id)a3;
- (int64_t)matchingTruncatedHash;
- (void)setConfig:(id)a3;
- (void)setHasBusiness:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setMatchingTruncatedHash:(int64_t)a3;
@end

@implementation BCSBusinessLookupResult

- (BCSBusinessLookupResult)initWithHasBusiness:(BOOL)a3 matchingTruncatedHash:(int64_t)a4 config:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessLookupResult;
  v10 = [(BCSBusinessLookupResult *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_hasBusiness = a3;
    v10->_matchingTruncatedHash = a4;
    objc_storeStrong((id *)&v10->_config, a5);
  }

  return v11;
}

- (BCSBusinessLookupResult)initWithFilterMatchResult:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCSBusinessLookupResult;
  v8 = [(BCSBusinessLookupResult *)&v12 init];
  if (v8)
  {
    v8->_hasBusiness = [v6 hasMatch];
    uint64_t v9 = [v6 itemIdentifier];
    itemIdentifier = v8->_itemIdentifier;
    v8->_itemIdentifier = (BCSItemIdentifying *)v9;

    v8->_matchingTruncatedHash = [v6 matchingTruncatedHash];
    objc_storeStrong((id *)&v8->_config, a4);
  }

  return v8;
}

- (id)initForMatchWithTruncatedHash:(int64_t)a3
{
  return [(BCSBusinessLookupResult *)self initWithHasBusiness:1 matchingTruncatedHash:a3 config:0];
}

- (id)initForMatchWithTruncatedHash:(int64_t)a3 config:(id)a4
{
  return [(BCSBusinessLookupResult *)self initWithHasBusiness:1 matchingTruncatedHash:a3 config:a4];
}

- (id)initForNoMatch
{
  return [(BCSBusinessLookupResult *)self initWithHasBusiness:0 matchingTruncatedHash:0 config:0];
}

- (id)initForNoMatchWithConfig:(id)a3
{
  return [(BCSBusinessLookupResult *)self initWithHasBusiness:0 matchingTruncatedHash:0 config:a3];
}

- (BOOL)hasBusiness
{
  return self->_hasBusiness;
}

- (void)setHasBusiness:(BOOL)a3
{
  self->_hasBusiness = a3;
}

- (int64_t)matchingTruncatedHash
{
  return self->_matchingTruncatedHash;
}

- (void)setMatchingTruncatedHash:(int64_t)a3
{
  self->_matchingTruncatedHash = a3;
}

- (BCSBusinessConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BCSItemIdentifying)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end