@interface VCCaptionTaskInfo
- (VCCaptionTaskInfo)initWithTask:(id)a3 token:(int64_t)a4 utteranceNumber:(unsigned int)a5;
- (id)description;
- (id)task;
- (int64_t)token;
- (unsigned)updateNumber;
- (unsigned)utteranceNumber;
- (void)dealloc;
- (void)setUpdateNumber:(unsigned int)a3;
@end

@implementation VCCaptionTaskInfo

- (VCCaptionTaskInfo)initWithTask:(id)a3 token:(int64_t)a4 utteranceNumber:(unsigned int)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCCaptionTaskInfo;
  v8 = [(VCCaptionTaskInfo *)&v10 init];
  if (v8)
  {
    v8->_task = a3;
    v8->_token = a4;
    v8->_updateNumber = 0;
    v8->_utteranceNumber = a5;
    v8->_hostTime = NAN;
  }
  return v8;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionTaskInfo;
  return (id)[NSString stringWithFormat:@"%@ token=%ld updateNumber=%u utteranceNumber=%u hostTime=%f", -[VCCaptionTaskInfo description](&v3, sel_description), self->_token, self->_updateNumber, self->_utteranceNumber, *(void *)&self->_hostTime];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionTaskInfo;
  [(VCCaptionTaskInfo *)&v3 dealloc];
}

- (id)task
{
  return self->_task;
}

- (int64_t)token
{
  return self->_token;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (void)setUpdateNumber:(unsigned int)a3
{
  self->_updateNumber = a3;
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

@end