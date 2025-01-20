@interface AVCRTCPSourceDescription
- (AVCRTCPSourceDescription)initWithRTCPPacket:(tagRTCPPACKET *)a3;
- (NSString)text;
- (id)description;
- (unsigned)type;
- (void)dealloc;
- (void)setText:(id)a3;
- (void)setType:(unsigned __int8)a3;
@end

@implementation AVCRTCPSourceDescription

- (AVCRTCPSourceDescription)initWithRTCPPacket:(tagRTCPPACKET *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)AVCRTCPSourceDescription;
  v4 = -[AVCRTCPPacket initWithRTCPPacket:](&v7, sel_initWithRTCPPacket_);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3->var1.var2.var1.var0;
    v4->_text = (NSString *)[[NSString alloc] initWithBytes:(char *)&a3->var1.var5.var0.var1 + 2 length:a3->var1.var2.var1.var1 encoding:1];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSourceDescription;
  [(AVCRTCPSourceDescription *)&v3 dealloc];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSourceDescription;
  return (id)[NSString stringWithFormat:@"%@, type:%u, text:%@", -[AVCRTCPPacket description](&v3, sel_description), -[AVCRTCPSourceDescription type](self, "type"), -[AVCRTCPSourceDescription text](self, "text")];
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

@end