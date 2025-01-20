@interface MSParsecSearchSessionTopHit
+ (id)topHitWithIdentifier:(id)a3 date:(id)a4 mailRankingSignals:(id)a5;
- (MSParsecSearchSessionTopHit)initWithIdentifier:(id)a3 date:(id)a4 mailRankingSignals:(id)a5;
- (SFMailRankingSignals)mailRankingSignals;
- (id)feedbackResult;
@end

@implementation MSParsecSearchSessionTopHit

+ (id)topHitWithIdentifier:(id)a3 date:(id)a4 mailRankingSignals:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v8 date:v9 mailRankingSignals:v10];

  return v11;
}

- (MSParsecSearchSessionTopHit)initWithIdentifier:(id)a3 date:(id)a4 mailRankingSignals:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MSParsecSearchSessionTopHit;
  id v10 = [(MSParsecSearchSessionMessageResult *)&v13 initResultWithIdentifier:a3 date:a4];
  v11 = (MSParsecSearchSessionTopHit *)v10;
  if (v10) {
    objc_storeStrong(v10 + 3, a5);
  }

  return v11;
}

- (id)feedbackResult
{
  v5.receiver = self;
  v5.super_class = (Class)MSParsecSearchSessionTopHit;
  v3 = [(MSParsecSearchSessionMessageResult *)&v5 feedbackResult];
  [v3 setTopHit:2];
  [v3 setResultBundleId:@"com.apple.mail.search.tophit"];
  [v3 setSectionBundleIdentifier:@"tophit"];
  [v3 setMailRankingSignals:self->_mailRankingSignals];
  return v3;
}

- (SFMailRankingSignals)mailRankingSignals
{
  return self->_mailRankingSignals;
}

- (void).cxx_destruct
{
}

@end