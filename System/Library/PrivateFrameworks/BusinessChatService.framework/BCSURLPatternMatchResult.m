@interface BCSURLPatternMatchResult
+ (BOOL)supportsSecureCoding;
- (BCSDateHelperProtocol)dateHelper;
- (BCSURLPatternMatchResult)initWithOriginalURL:(id)a3 extractedURL:(id)a4 totalConsecutivePrefixMatches:(unint64_t)a5 totalExactMatches:(unint64_t)a6 totalAnyMatches:(unint64_t)a7 bundleID:(id)a8 pattern:(id)a9 expirationDate:(id)a10 dateHelper:(id)a11;
- (BOOL)isExpired;
- (BOOL)matchFound;
- (NSDate)expirationDate;
- (NSString)bundleID;
- (NSString)debugDescription;
- (NSString)pattern;
- (NSURL)extractedURL;
- (NSURL)originalURL;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)totalAnyMatches;
- (unint64_t)totalConsecutivePrefixMatches;
- (unint64_t)totalExactMatches;
- (void)setExpirationDate:(id)a3;
@end

@implementation BCSURLPatternMatchResult

- (BCSURLPatternMatchResult)initWithOriginalURL:(id)a3 extractedURL:(id)a4 totalConsecutivePrefixMatches:(unint64_t)a5 totalExactMatches:(unint64_t)a6 totalAnyMatches:(unint64_t)a7 bundleID:(id)a8 pattern:(id)a9 expirationDate:(id)a10 dateHelper:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BCSURLPatternMatchResult;
  v20 = [(BCSURLPatternMatchResult *)&v31 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_originalURL, a3);
    objc_storeStrong((id *)&v21->_extractedURL, a4);
    v21->_totalConsecutivePrefixMatches = a5;
    v21->_totalExactMatches = a6;
    v21->_totalAnyMatches = a7;
    uint64_t v22 = [v16 copy];
    bundleID = v21->_bundleID;
    v21->_bundleID = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    pattern = v21->_pattern;
    v21->_pattern = (NSString *)v24;

    objc_storeStrong((id *)&v21->_expirationDate, a10);
    objc_storeStrong((id *)&v21->_dateHelper, a11);
  }

  return v21;
}

- (BOOL)isExpired
{
  v3 = [(BCSURLPatternMatchResult *)self expirationDate];
  v4 = [(BCSURLPatternMatchResult *)self dateHelper];
  v5 = [v4 currentDate];
  BOOL v6 = [v3 compare:v5] == -1;

  return v6;
}

- (BOOL)matchFound
{
  v2 = [(BCSURLPatternMatchResult *)self extractedURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)[(BCSURLPatternMatchResult *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BCSURLPatternMatchResult *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__BCSURLPatternMatchResult_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_264248948;
  id v4 = v3;
  id v8 = v4;
  v9 = self;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:v7];
  id v5 = v4;

  return v5;
}

void __54__BCSURLPatternMatchResult_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) extractedURL];
  id v4 = (id)[v2 appendObject:v3 withName:@"Extracted URL"];

  id v5 = *(void **)(a1 + 32);
  BOOL v6 = [*(id *)(a1 + 40) bundleID];
  id v7 = (id)[v5 appendObject:v6 withName:@"Most explicit matching bundleID" skipIfNil:1];

  id v8 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) pattern];
  id v9 = (id)[v8 appendObject:v10 withName:@"Pattern" skipIfNil:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(BCSURLPatternMatchResult *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(BCSURLPatternMatchResult *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__BCSURLPatternMatchResult_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_264248948;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __66__BCSURLPatternMatchResult_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "totalConsecutivePrefixMatches"), @"Total Consecutive Prefix Matches");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "totalExactMatches"), @"Total Exact Matches");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "totalAnyMatches"), @"Total Any Matches");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)extractedURL
{
  return self->_extractedURL;
}

- (NSString)pattern
{
  return self->_pattern;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)totalConsecutivePrefixMatches
{
  return self->_totalConsecutivePrefixMatches;
}

- (unint64_t)totalExactMatches
{
  return self->_totalExactMatches;
}

- (unint64_t)totalAnyMatches
{
  return self->_totalAnyMatches;
}

- (BCSDateHelperProtocol)dateHelper
{
  return self->_dateHelper;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_dateHelper, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_extractedURL, 0);

  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end