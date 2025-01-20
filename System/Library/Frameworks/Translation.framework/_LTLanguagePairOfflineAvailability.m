@interface _LTLanguagePairOfflineAvailability
+ (BOOL)supportsSecureCoding;
- (BOOL)needsUpdate;
- (NSString)mtState;
- (NSString)sourceASRState;
- (NSString)sourceTTSState;
- (NSString)targetASRState;
- (NSString)targetTTSState;
- (_LTLanguagePairOfflineAvailability)initWithCoder:(id)a3;
- (_LTLanguagePairOfflineAvailability)initWithLocales:(id)a3;
- (_LTLocalePair)pair;
- (id)description;
- (int64_t)pairState;
- (void)encodeWithCoder:(id)a3;
- (void)setMtState:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setPair:(id)a3;
- (void)setPairState:(int64_t)a3;
- (void)setSourceASRState:(id)a3;
- (void)setSourceTTSState:(id)a3;
- (void)setTargetASRState:(id)a3;
- (void)setTargetTTSState:(id)a3;
@end

@implementation _LTLanguagePairOfflineAvailability

- (_LTLanguagePairOfflineAvailability)initWithLocales:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_LTLanguagePairOfflineAvailability;
  v6 = [(_LTLanguagePairOfflineAvailability *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pair, a3);
    v7->_pairState = 3;
    sourceASRState = v7->_sourceASRState;
    v7->_sourceASRState = (NSString *)@"Unknown";

    targetASRState = v7->_targetASRState;
    v7->_targetASRState = (NSString *)@"Unknown";

    sourceTTSState = v7->_sourceTTSState;
    v7->_sourceTTSState = (NSString *)@"Unimplemented";

    targetTTSState = v7->_targetTTSState;
    v7->_targetTTSState = (NSString *)@"Unimplemented";

    mtState = v7->_mtState;
    v7->_mtState = (NSString *)@"Unknown";

    v7->_needsUpdate = 0;
  }

  return v7;
}

- (id)description
{
  v3 = [(_LTLanguagePairOfflineAvailability *)self pair];
  v4 = [v3 sourceLocale];
  id v5 = [v4 localeIdentifier];

  v6 = [(_LTLanguagePairOfflineAvailability *)self pair];
  v7 = [v6 targetLocale];
  v8 = [v7 localeIdentifier];

  unint64_t pairState = self->_pairState;
  if (pairState > 2) {
    v10 = @"Unknown";
  }
  else {
    v10 = off_2651DBD60[pairState];
  }
  if (self->_needsUpdate) {
    v11 = @"Update";
  }
  else {
    v11 = &stru_26FAADE68;
  }
  v12 = [NSString stringWithFormat:@"%@ <-> %@ | pair: %@ MT: %@ ASR-%@ : %@ ASR-%@: %@ %@", v5, v8, v10, self->_mtState, v5, self->_sourceASRState, v8, self->_targetASRState, v11];

  return v12;
}

- (_LTLanguagePairOfflineAvailability)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LTLanguagePairOfflineAvailability;
  id v5 = [(_LTLanguagePairOfflineAvailability *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pair"];
    pair = v5->_pair;
    v5->_pair = (_LTLocalePair *)v6;

    v5->_unint64_t pairState = [v4 decodeIntegerForKey:@"pairState"];
    uint64_t v8 = [v4 decodeObjectForKey:@"sourceASRState"];
    sourceASRState = v5->_sourceASRState;
    v5->_sourceASRState = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"targetASRState"];
    targetASRState = v5->_targetASRState;
    v5->_targetASRState = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"sourceTTSState"];
    sourceTTSState = v5->_sourceTTSState;
    v5->_sourceTTSState = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"targetTTSState"];
    targetTTSState = v5->_targetTTSState;
    v5->_targetTTSState = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"mtState"];
    mtState = v5->_mtState;
    v5->_mtState = (NSString *)v16;

    v5->_needsUpdate = [v4 decodeBoolForKey:@"needsUpdate"];
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pair = self->_pair;
  id v5 = a3;
  [v5 encodeObject:pair forKey:@"pair"];
  [v5 encodeInteger:self->_pairState forKey:@"pairState"];
  [v5 encodeObject:self->_sourceASRState forKey:@"sourceASRState"];
  [v5 encodeObject:self->_targetASRState forKey:@"targetASRState"];
  [v5 encodeObject:self->_sourceTTSState forKey:@"sourceTTSState"];
  [v5 encodeObject:self->_targetTTSState forKey:@"targetTTSState"];
  [v5 encodeObject:self->_mtState forKey:@"mtState"];
  [v5 encodeBool:self->_needsUpdate forKey:@"needsUpdate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pairState
{
  return self->_pairState;
}

- (void)setPairState:(int64_t)a3
{
  self->_unint64_t pairState = a3;
}

- (_LTLocalePair)pair
{
  return self->_pair;
}

- (void)setPair:(id)a3
{
}

- (NSString)sourceASRState
{
  return self->_sourceASRState;
}

- (void)setSourceASRState:(id)a3
{
}

- (NSString)targetASRState
{
  return self->_targetASRState;
}

- (void)setTargetASRState:(id)a3
{
}

- (NSString)mtState
{
  return self->_mtState;
}

- (void)setMtState:(id)a3
{
}

- (NSString)sourceTTSState
{
  return self->_sourceTTSState;
}

- (void)setSourceTTSState:(id)a3
{
}

- (NSString)targetTTSState
{
  return self->_targetTTSState;
}

- (void)setTargetTTSState:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetTTSState, 0);
  objc_storeStrong((id *)&self->_sourceTTSState, 0);
  objc_storeStrong((id *)&self->_mtState, 0);
  objc_storeStrong((id *)&self->_targetASRState, 0);
  objc_storeStrong((id *)&self->_sourceASRState, 0);

  objc_storeStrong((id *)&self->_pair, 0);
}

@end