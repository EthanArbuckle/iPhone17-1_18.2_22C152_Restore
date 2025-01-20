@interface VCAudioRule
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecondary;
- (BOOL)sbr;
- (VCAudioRule)init;
- (VCAudioRule)initWithPayload:(int)a3 isSecondary:(BOOL)a4 sbr:(BOOL)a5 samplesPerBlock:(unsigned int)a6;
- (id)description;
- (int)payload;
- (unint64_t)hash;
- (unsigned)samplesPerBlock;
@end

@implementation VCAudioRule

- (VCAudioRule)init
{
  return 0;
}

- (VCAudioRule)initWithPayload:(int)a3 isSecondary:(BOOL)a4 sbr:(BOOL)a5 samplesPerBlock:(unsigned int)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCAudioRule;
  result = [(VCAudioRule *)&v13 init];
  if (result)
  {
    result->_payload = a3;
    result->_isSecondary = v8;
    result->_sbr = v7;
    result->_samplesPerBlock = a6;
    if (v7) {
      int v11 = 0x10000;
    }
    else {
      int v11 = 0;
    }
    if (v8) {
      int v12 = 0x20000;
    }
    else {
      int v12 = 0;
    }
    result->_hash = v12 & 0xFFFF0000 | (unsigned __int16)a3 | v11 | (a6 << 18);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    int payload = self->_payload;
    if (payload == [a3 payload]
      && (int isSecondary = self->_isSecondary, isSecondary == [a3 isSecondary])
      && (int sbr = self->_sbr, sbr == [a3 sbr]))
    {
      unsigned int samplesPerBlock = self->_samplesPerBlock;
      LOBYTE(v5) = samplesPerBlock == [a3 samplesPerBlock];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  v6 = "yes";
  if (self->_isSecondary) {
    BOOL v7 = "yes";
  }
  else {
    BOOL v7 = "no";
  }
  if (!self->_sbr) {
    v6 = "no";
  }
  return (id)[v3 stringWithFormat:@"%@: payload=%u secondary=%s sbr=%s samplesPerBlock=%u", v5, self->_payload, v7, v6, self->_samplesPerBlock];
}

- (int)payload
{
  return self->_payload;
}

- (BOOL)isSecondary
{
  return self->_isSecondary;
}

- (BOOL)sbr
{
  return self->_sbr;
}

- (unsigned)samplesPerBlock
{
  return self->_samplesPerBlock;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end