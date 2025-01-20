@interface VCBitrateRule
- (VCBitrateRule)initWithBitrate:(unsigned int)a3 connectionType:(int)a4 limitingRule:(id)a5;
- (VCVideoRule)limitingRule;
- (id)description;
- (int)connectionType;
- (int64_t)compare:(id)a3;
- (unsigned)bitrate;
- (void)dealloc;
- (void)setBitrate:(unsigned int)a3;
- (void)setConnectionType:(int)a3;
@end

@implementation VCBitrateRule

- (VCBitrateRule)initWithBitrate:(unsigned int)a3 connectionType:(int)a4 limitingRule:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCBitrateRule;
  v8 = [(VCBitrateRule *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_bitrate = a3;
    v8->_connectionType = a4;
    v8->limitingRule = (VCVideoRule *)a5;
  }
  return v9;
}

- (int64_t)compare:(id)a3
{
  unsigned int v4 = [(VCBitrateRule *)self bitrate];
  if (v4 > [a3 bitrate]) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Bitrate rule bitrate %u connection type %d limit %@", self->_bitrate, self->_connectionType, self->limitingRule];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCBitrateRule;
  [(VCBitrateRule *)&v3 dealloc];
}

- (unsigned)bitrate
{
  return self->_bitrate;
}

- (void)setBitrate:(unsigned int)a3
{
  self->_bitrate = a3;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int)a3
{
  self->_connectionType = a3;
}

- (VCVideoRule)limitingRule
{
  return self->limitingRule;
}

@end