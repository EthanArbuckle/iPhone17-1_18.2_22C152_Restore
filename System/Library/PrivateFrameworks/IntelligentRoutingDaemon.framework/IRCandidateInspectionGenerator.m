@interface IRCandidateInspectionGenerator
- (BOOL)sameSpaceBasedOnBLE;
- (BOOL)sameSpaceBasedOnBrokeredLOI;
- (BOOL)sameSpaceBasedOnHistory;
- (BOOL)sameSpaceBasedOnMiLo;
- (BOOL)sameSpaceBasedOnPDRFence;
- (BOOL)sameSpaceBasedOnUWB;
- (IRCandidate)candidate;
- (IRCandidateInspectionGenerator)initWithClassification:(int64_t)a3 ClassificationDescription:(id)a4 sameSpaceBasedOnMiLo:(BOOL)a5 sameSpaceBasedOnBrokeredLOI:(BOOL)a6 sameSpaceBasedOnPDRFence:(BOOL)a7 sameSpaceBasedOnUWB:(BOOL)a8 sameSpaceBasedOnBLE:(BOOL)a9 sameSpaceBasedOnHistory:(BOOL)a10 candidateSelectorReasons:(id)a11 forCandidate:(id)a12;
- (NSDictionary)candidateSelectorReasons;
- (NSString)classificationDescription;
- (id)exportCandidateInspectionAsDictionary;
- (id)initClassification:(int64_t)a3 andClassificationDescription:(id)a4 forCandidate:(id)a5;
- (int64_t)classification;
- (void)setSameSpaceBasedOnBLE:(BOOL)a3;
- (void)setSameSpaceBasedOnBrokeredLOI:(BOOL)a3;
- (void)setSameSpaceBasedOnHistory:(BOOL)a3;
- (void)setSameSpaceBasedOnMiLo:(BOOL)a3;
- (void)setSameSpaceBasedOnPDRFence:(BOOL)a3;
- (void)setSameSpaceBasedOnUWB:(BOOL)a3;
@end

@implementation IRCandidateInspectionGenerator

- (id)initClassification:(int64_t)a3 andClassificationDescription:(id)a4 forCandidate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IRCandidateInspectionGenerator;
  v11 = [(IRCandidateInspectionGenerator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_candidate, a5);
    v12->_classification = a3;
    objc_storeStrong((id *)&v12->_classificationDescription, a4);
  }

  return v12;
}

- (IRCandidateInspectionGenerator)initWithClassification:(int64_t)a3 ClassificationDescription:(id)a4 sameSpaceBasedOnMiLo:(BOOL)a5 sameSpaceBasedOnBrokeredLOI:(BOOL)a6 sameSpaceBasedOnPDRFence:(BOOL)a7 sameSpaceBasedOnUWB:(BOOL)a8 sameSpaceBasedOnBLE:(BOOL)a9 sameSpaceBasedOnHistory:(BOOL)a10 candidateSelectorReasons:(id)a11 forCandidate:(id)a12
{
  id v18 = a4;
  id v19 = a11;
  id v24 = a12;
  v25.receiver = self;
  v25.super_class = (Class)IRCandidateInspectionGenerator;
  v20 = [(IRCandidateInspectionGenerator *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_candidate, a12);
    v21->_classification = a3;
    objc_storeStrong((id *)&v21->_classificationDescription, a4);
    v21->_sameSpaceBasedOnMiLo = a5;
    v21->_sameSpaceBasedOnBrokeredLOI = a6;
    v21->_sameSpaceBasedOnPDRFence = a7;
    v21->_sameSpaceBasedOnUWB = a8;
    v21->_sameSpaceBasedOnBLE = a9;
    v21->_sameSpaceBasedOnHistory = a10;
    objc_storeStrong((id *)&v21->_candidateSelectorReasons, a11);
  }

  return v21;
}

- (id)exportCandidateInspectionAsDictionary
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([(IRCandidateInspectionGenerator *)self sameSpaceBasedOnMiLo]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [v3 setObject:v4 forKeyedSubscript:@"sameSpaceBasedOnMiLo"];
  if ([(IRCandidateInspectionGenerator *)self sameSpaceBasedOnBrokeredLOI]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 setObject:v5 forKeyedSubscript:@"sameSpaceBasedOnBrokeredLOI"];
  if ([(IRCandidateInspectionGenerator *)self sameSpaceBasedOnPDRFence]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 setObject:v6 forKeyedSubscript:@"sameSpaceBasedOnPDRFence"];
  if ([(IRCandidateInspectionGenerator *)self sameSpaceBasedOnUWB]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 setObject:v7 forKeyedSubscript:@"sameSpaceBasedOnUWB"];
  if ([(IRCandidateInspectionGenerator *)self sameSpaceBasedOnBLE]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 setObject:v8 forKeyedSubscript:@"sameSpaceBasedOnBLE"];
  if ([(IRCandidateInspectionGenerator *)self sameSpaceBasedOnHistory]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  [v3 setObject:v9 forKeyedSubscript:@"sameSpaceBasedOnHistory"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [(IRCandidateInspectionGenerator *)self candidateSelectorReasons];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v16 = [(IRCandidateInspectionGenerator *)self candidateSelectorReasons];
        v17 = [v16 objectForKeyedSubscript:v15];
        if (v17) {
          id v18 = @"YES";
        }
        else {
          id v18 = @"NO";
        }
        [v3 setObject:v18 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v3;
}

- (BOOL)sameSpaceBasedOnMiLo
{
  return self->_sameSpaceBasedOnMiLo;
}

- (void)setSameSpaceBasedOnMiLo:(BOOL)a3
{
  self->_sameSpaceBasedOnMiLo = a3;
}

- (BOOL)sameSpaceBasedOnBrokeredLOI
{
  return self->_sameSpaceBasedOnBrokeredLOI;
}

- (void)setSameSpaceBasedOnBrokeredLOI:(BOOL)a3
{
  self->_sameSpaceBasedOnBrokeredLOI = a3;
}

- (BOOL)sameSpaceBasedOnUWB
{
  return self->_sameSpaceBasedOnUWB;
}

- (void)setSameSpaceBasedOnUWB:(BOOL)a3
{
  self->_sameSpaceBasedOnUWB = a3;
}

- (BOOL)sameSpaceBasedOnBLE
{
  return self->_sameSpaceBasedOnBLE;
}

- (void)setSameSpaceBasedOnBLE:(BOOL)a3
{
  self->_sameSpaceBasedOnBLE = a3;
}

- (BOOL)sameSpaceBasedOnPDRFence
{
  return self->_sameSpaceBasedOnPDRFence;
}

- (void)setSameSpaceBasedOnPDRFence:(BOOL)a3
{
  self->_sameSpaceBasedOnPDRFence = a3;
}

- (BOOL)sameSpaceBasedOnHistory
{
  return self->_sameSpaceBasedOnHistory;
}

- (void)setSameSpaceBasedOnHistory:(BOOL)a3
{
  self->_sameSpaceBasedOnHistory = a3;
}

- (NSDictionary)candidateSelectorReasons
{
  return self->_candidateSelectorReasons;
}

- (IRCandidate)candidate
{
  return self->_candidate;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSString)classificationDescription
{
  return self->_classificationDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescription, 0);
  objc_storeStrong((id *)&self->_candidate, 0);

  objc_storeStrong((id *)&self->_candidateSelectorReasons, 0);
}

@end