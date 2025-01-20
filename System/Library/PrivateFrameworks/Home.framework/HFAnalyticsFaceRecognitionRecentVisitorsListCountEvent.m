@interface HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent
- (HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent)initWithData:(id)a3;
- (NSNumber)clusteredNoNamePersonCount;
- (NSNumber)faceCropCount;
- (NSNumber)unknownFaceCropCount;
- (NSNumber)unknownPersonCountTotal;
- (id)payload;
- (void)setClusteredNoNamePersonCount:(id)a3;
- (void)setFaceCropCount:(id)a3;
- (void)setUnknownFaceCropCount:(id)a3;
- (void)setUnknownPersonCountTotal:(id)a3;
@end

@implementation HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent

- (HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"faceCropCount"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_ErrorObjectFor.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"clusteredNoNamePersonCount"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    NSLog(&cfstr_ErrorObjectFor_0.isa);
  }
  objc_opt_class();
  v11 = [v4 objectForKeyedSubscript:@"unknownFaceCropCount"];
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    NSLog(&cfstr_ErrorObjectFor_1.isa);
  }
  v19.receiver = self;
  v19.super_class = (Class)HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent;
  v14 = [(HFAnalyticsEvent *)&v19 initWithEventType:7];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_faceCropCount, v6);
    objc_storeStrong((id *)&v15->_clusteredNoNamePersonCount, v9);
    objc_storeStrong((id *)&v15->_unknownFaceCropCount, v12);
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") + objc_msgSend(v10, "unsignedIntegerValue"));
    unknownPersonCountTotal = v15->_unknownPersonCountTotal;
    v15->_unknownPersonCountTotal = (NSNumber *)v16;
  }
  return v15;
}

- (id)payload
{
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent;
  v3 = [(HFAnalyticsEvent *)&v10 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent *)self faceCropCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"faceCropCount");

  v6 = [(HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent *)self clusteredNoNamePersonCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"clusteredNoNamePersonCount");

  id v7 = [(HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent *)self unknownFaceCropCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"unknownFaceCropCount");

  v8 = [(HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent *)self unknownPersonCountTotal];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"unknownCountIdentityTotal");

  return v4;
}

- (NSNumber)faceCropCount
{
  return self->_faceCropCount;
}

- (void)setFaceCropCount:(id)a3
{
}

- (NSNumber)clusteredNoNamePersonCount
{
  return self->_clusteredNoNamePersonCount;
}

- (void)setClusteredNoNamePersonCount:(id)a3
{
}

- (NSNumber)unknownFaceCropCount
{
  return self->_unknownFaceCropCount;
}

- (void)setUnknownFaceCropCount:(id)a3
{
}

- (NSNumber)unknownPersonCountTotal
{
  return self->_unknownPersonCountTotal;
}

- (void)setUnknownPersonCountTotal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownPersonCountTotal, 0);
  objc_storeStrong((id *)&self->_unknownFaceCropCount, 0);
  objc_storeStrong((id *)&self->_clusteredNoNamePersonCount, 0);
  objc_storeStrong((id *)&self->_faceCropCount, 0);
}

@end