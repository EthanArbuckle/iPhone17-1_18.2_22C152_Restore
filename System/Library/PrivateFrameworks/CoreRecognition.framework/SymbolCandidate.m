@interface SymbolCandidate
- (NSString)description;
- (double)logProbability;
- (double)probability;
- (unsigned)symbol;
- (void)setLogProbability:(double)a3;
- (void)setProbability:(double)a3;
- (void)setSymbol:(unsigned __int16)a3;
@end

@implementation SymbolCandidate

- (NSString)description
{
  v3 = NSString;
  unsigned int v4 = [(SymbolCandidate *)self symbol];
  [(SymbolCandidate *)self probability];
  uint64_t v6 = v5;
  [(SymbolCandidate *)self logProbability];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"%C : %f (%f)", v4, v6, v7);
}

- (unsigned)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(unsigned __int16)a3
{
  self->_symbol = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)logProbability
{
  return self->_logProbability;
}

- (void)setLogProbability:(double)a3
{
  self->_logProbability = a3;
}

@end