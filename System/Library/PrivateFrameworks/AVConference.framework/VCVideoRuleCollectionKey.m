@interface VCVideoRuleCollectionKey
- (BOOL)isEqual:(id)a3;
- (VCVideoRuleCollectionKey)initWithPayload:(int)a3 transportType:(unsigned __int8)a4 encodingType:(unsigned __int8)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)payload;
- (unint64_t)hash;
- (unsigned)encodingType;
- (unsigned)transportType;
@end

@implementation VCVideoRuleCollectionKey

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int payload = self->_payload;
  if (payload != [a3 payload]) {
    return 0;
  }
  int transportType = self->_transportType;
  if (transportType != [a3 transportType]) {
    return 0;
  }
  int encodingType = self->_encodingType;
  return encodingType == [a3 encodingType];
}

- (int)payload
{
  return self->_payload;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (unsigned)encodingType
{
  return self->_encodingType;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_encodingType - (unint64_t)self->_transportType + 32 * self->_transportType;
  return self->_payload - v2 + 32 * v2 + 29791;
}

- (VCVideoRuleCollectionKey)initWithPayload:(int)a3 transportType:(unsigned __int8)a4 encodingType:(unsigned __int8)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionKey;
  result = [(VCVideoRuleCollectionKey *)&v9 init];
  if (result)
  {
    result->_int payload = a3;
    result->_int transportType = a4;
    result->_int encodingType = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t payload = self->_payload;
  uint64_t transportType = self->_transportType;
  uint64_t encodingType = self->_encodingType;

  return (id)[v4 initWithPayload:payload transportType:transportType encodingType:encodingType];
}

- (id)description
{
  if (self->_transportType == 1) {
    unint64_t v2 = @"WiFi";
  }
  else {
    unint64_t v2 = @"Cellular";
  }
  v3 = @"decoding";
  if (self->_encodingType == 1) {
    v3 = @"encoding";
  }
  return (id)[NSString stringWithFormat:@"Payload:%d %@ %@ rules", self->_payload, v2, v3];
}

@end