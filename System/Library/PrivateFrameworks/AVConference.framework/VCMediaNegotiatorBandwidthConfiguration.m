@interface VCMediaNegotiatorBandwidthConfiguration
- (BOOL)isDefaultMode;
- (BOOL)isEqual:(id)a3;
- (VCMediaNegotiatorBandwidthConfiguration)initWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4 maxBandwidth:(unsigned int)a5;
- (VCMediaNegotiatorBandwidthConfiguration)initWithConnectionType:(int)a3 maxBandwidth:(unsigned int)a4;
- (int)connectionType;
- (unsigned)maxBandwidth;
- (unsigned)mode;
- (void)setConnectionType:(int)a3;
- (void)setIsDefaultMode:(BOOL)a3;
- (void)setMaxBandwidth:(unsigned int)a3;
- (void)setMode:(unsigned __int8)a3;
@end

@implementation VCMediaNegotiatorBandwidthConfiguration

- (VCMediaNegotiatorBandwidthConfiguration)initWithConnectionType:(int)a3 maxBandwidth:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiatorBandwidthConfiguration;
  result = [(VCMediaNegotiatorBandwidthConfiguration *)&v7 init];
  if (result)
  {
    result->_arbiterMode = 0;
    result->_isDefaultMode = 1;
    result->_connectionType = a3;
    result->_maxBandwidth = a4;
  }
  return result;
}

- (VCMediaNegotiatorBandwidthConfiguration)initWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4 maxBandwidth:(unsigned int)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCMediaNegotiatorBandwidthConfiguration;
  result = [(VCMediaNegotiatorBandwidthConfiguration *)&v9 init];
  if (result)
  {
    result->_arbiterMode = a3;
    result->_connectionType = a4;
    result->_maxBandwidth = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int arbiterMode = self->_arbiterMode;
  if (arbiterMode != [a3 mode]) {
    return 0;
  }
  unsigned int maxBandwidth = self->_maxBandwidth;
  if (maxBandwidth != [a3 maxBandwidth]) {
    return 0;
  }
  int connectionType = self->_connectionType;
  if (connectionType != [a3 connectionType]) {
    return 0;
  }
  int isDefaultMode = self->_isDefaultMode;
  return isDefaultMode == [a3 isDefaultMode];
}

- (unsigned)mode
{
  return self->_arbiterMode;
}

- (void)setMode:(unsigned __int8)a3
{
  self->_int arbiterMode = a3;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int)a3
{
  self->_int connectionType = a3;
}

- (unsigned)maxBandwidth
{
  return self->_maxBandwidth;
}

- (void)setMaxBandwidth:(unsigned int)a3
{
  self->_unsigned int maxBandwidth = a3;
}

- (BOOL)isDefaultMode
{
  return self->_isDefaultMode;
}

- (void)setIsDefaultMode:(BOOL)a3
{
  self->_int isDefaultMode = a3;
}

@end