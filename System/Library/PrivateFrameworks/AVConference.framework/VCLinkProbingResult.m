@interface VCLinkProbingResult
- (NSMutableArray)requestTimestampAndRTTList;
- (NSNumber)expMovMeanRTT;
- (NSNumber)plrEnvelopeValue;
- (NSNumber)plrTier;
- (VCLinkProbingResult)initWithProbingResults:(id)a3 linkProbingResultConfig:(id *)a4;
- (id)description;
- (unsigned)getPLRTierFromPLREnvelope:(double)a3;
- (unsigned)receivedResponseCount;
- (unsigned)reorderedPacketsCount;
- (unsigned)sentRequestCount;
- (void)dealloc;
- (void)mergeProbingResults:(id)a3;
- (void)updateLinkStatsWithArrivingNewValueMeanRTT:(double)a3 arrivingNewValuePLR:(double)a4;
- (void)updateProbingResult:(id)a3 initialResult:(BOOL)a4;
@end

@implementation VCLinkProbingResult

- (VCLinkProbingResult)initWithProbingResults:(id)a3 linkProbingResultConfig:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCLinkProbingResult;
  v6 = [(VCLinkProbingResult *)&v11 init];
  v7 = (VCLinkProbingResult *)v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)&a4->var0;
    long long v9 = *(_OWORD *)&a4->var3;
    *((void *)v6 + 11) = a4->var5;
    *(_OWORD *)(v6 + 72) = v9;
    *(_OWORD *)(v6 + 56) = v8;
    *((void *)v6 + 4) = [objc_alloc(NSNumber) initWithDouble:0.0];
    v7->_plrEnvelopeValue = (NSNumber *)[objc_alloc(NSNumber) initWithDouble:-1.0];
    v7->_plrTier = (NSNumber *)[objc_alloc(NSNumber) initWithUnsignedInt:0];
    [(VCLinkProbingResult *)v7 updateProbingResult:a3 initialResult:1];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCLinkProbingResult;
  [(VCLinkProbingResult *)&v3 dealloc];
}

- (void)mergeProbingResults:(id)a3
{
}

- (void)updateProbingResult:(id)a3 initialResult:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F6A750]), "unsignedIntValue");
  unsigned __int16 v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F6A758]), "unsignedIntValue");
  unsigned __int16 v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F6A748]), "unsignedIntValue");
  int v10 = v7;
  if (v4)
  {
    self->_sentRequestCount = v7;
    self->_receivedResponseCount = v8;
    self->_unsigned int reorderedPacketsCount = v9;
    self->_requestTimestampAndRTTList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else
  {
    unsigned int reorderedPacketsCount = self->_reorderedPacketsCount;
    unsigned int v12 = self->_receivedResponseCount + v8;
    self->_sentRequestCount += v7;
    self->_receivedResponseCount = v12;
    self->_unsigned int reorderedPacketsCount = reorderedPacketsCount + v9;
  }
  v13 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A7D8]];
  int v30 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F6A850]), "unsignedIntValue");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v32 count:16];
  double v15 = 0.0;
  if (v14)
  {
    uint64_t v16 = v14;
    int v28 = v10;
    unsigned __int16 v29 = v8;
    unsigned __int16 v17 = 0;
    unsigned __int16 v18 = 0;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v13);
        }
        v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        unsigned __int16 v22 = objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
        unsigned __int16 v23 = objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
        if ((unint64_t)[(NSMutableArray *)[(VCLinkProbingResult *)self requestTimestampAndRTTList] count] >= 0x3E8)[(NSMutableArray *)[(VCLinkProbingResult *)self requestTimestampAndRTTList] removeFirstObject]; {
        v24 = [(VCLinkProbingResult *)self requestTimestampAndRTTList];
        }
        v31[0] = [NSNumber numberWithUnsignedInt:v30 + v22];
        v31[1] = [NSNumber numberWithUnsignedShort:v23];
        -[NSMutableArray addObject:](v24, "addObject:", [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2]);
        if (v23 == 0xFFFF) {
          unsigned __int16 v25 = 0;
        }
        else {
          unsigned __int16 v25 = v23;
        }
        v17 += v25;
        if (v23 != 0xFFFF) {
          ++v18;
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v16);
    double v26 = (double)v17;
    int v10 = v28;
    unsigned __int16 v8 = v29;
  }
  else
  {
    unsigned __int16 v18 = 0;
    double v26 = 0.0;
  }
  if (self->_linkProbingResultConfig.linkProbingCapabilityVersion == 2) {
    double v15 = (double)(v10 - v8) / (double)v10;
  }
  if (v18) {
    double v27 = v26 / (double)v18;
  }
  else {
    double v27 = 0.0;
  }
  [(VCLinkProbingResult *)self updateLinkStatsWithArrivingNewValueMeanRTT:v27 arrivingNewValuePLR:v15];
}

- (void)updateLinkStatsWithArrivingNewValueMeanRTT:(double)a3 arrivingNewValuePLR:(double)a4
{
  [(NSNumber *)self->_plrEnvelopeValue doubleValue];
  uint64_t v7 = 80;
  if (v8 < a4) {
    uint64_t v7 = 72;
  }
  double v9 = *(double *)((char *)&self->super.isa + v7);
  [(NSNumber *)self->_plrEnvelopeValue doubleValue];
  if (v10 != -1.0)
  {
    [(NSNumber *)self->_plrEnvelopeValue doubleValue];
    a4 = (1.0 - v9) * v11 + a4 * v9;
  }

  self->_plrEnvelopeValue = (NSNumber *)[objc_alloc(NSNumber) initWithDouble:a4];
  id v12 = objc_alloc(NSNumber);
  [(NSNumber *)self->_plrEnvelopeValue doubleValue];
  self->_plrTier = (NSNumber *)objc_msgSend(v12, "initWithUnsignedInt:", -[VCLinkProbingResult getPLRTierFromPLREnvelope:](self, "getPLRTierFromPLREnvelope:"));
  if (a3 > 0.0)
  {
    [(NSNumber *)self->_expMovMeanRTT doubleValue];
    if (v13 != 0.0)
    {
      double expMovMeanFactor = self->_linkProbingResultConfig.expMovMeanFactor;
      [(NSNumber *)self->_expMovMeanRTT doubleValue];
      a3 = v15 * (1.0 - self->_linkProbingResultConfig.expMovMeanFactor) + a3 * expMovMeanFactor;
    }

    self->_expMovMeanRTT = (NSNumber *)[objc_alloc(NSNumber) initWithDouble:a3];
  }
}

- (unsigned)getPLRTierFromPLREnvelope:(double)a3
{
  if (![(NSArray *)self->_linkProbingResultConfig.plrBuckets count]) {
    return 0;
  }
  uint64_t v5 = 0;
  unsigned __int8 v6 = 0;
  double v7 = a3 * 100.0;
  do
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_linkProbingResultConfig.plrBuckets, "objectAtIndexedSubscript:", v5), "doubleValue");
    if (v7 < v8) {
      break;
    }
    uint64_t v5 = ++v6;
  }
  while ([(NSArray *)self->_linkProbingResultConfig.plrBuckets count] > v6);
  return v6;
}

- (id)description
{
  objc_super v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@[%p][CUMULATIVE] reorderedPacketsCount[%d] sentRequestCount[%d] receivedResponseCount[%d] ExpMovMeanRTT[%@] plrEnvelopeValue[%@] plrTier[%@]", NSStringFromClass(v4), self, self->_reorderedPacketsCount, self->_sentRequestCount, self->_receivedResponseCount, self->_expMovMeanRTT, self->_plrEnvelopeValue, self->_plrTier];
}

- (unsigned)reorderedPacketsCount
{
  return self->_reorderedPacketsCount;
}

- (unsigned)sentRequestCount
{
  return self->_sentRequestCount;
}

- (unsigned)receivedResponseCount
{
  return self->_receivedResponseCount;
}

- (NSMutableArray)requestTimestampAndRTTList
{
  return self->_requestTimestampAndRTTList;
}

- (NSNumber)expMovMeanRTT
{
  return self->_expMovMeanRTT;
}

- (NSNumber)plrEnvelopeValue
{
  return self->_plrEnvelopeValue;
}

- (NSNumber)plrTier
{
  return self->_plrTier;
}

@end