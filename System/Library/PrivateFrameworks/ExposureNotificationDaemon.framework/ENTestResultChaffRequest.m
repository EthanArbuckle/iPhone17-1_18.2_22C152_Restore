@interface ENTestResultChaffRequest
- (NSString)chaffValue;
- (id)additionalRequestHeaders;
- (void)setChaffValue:(id)a3;
@end

@implementation ENTestResultChaffRequest

- (id)additionalRequestHeaders
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_chaffValue) {
    chaffValue = (__CFString *)self->_chaffValue;
  }
  else {
    chaffValue = @"extra";
  }
  v5 = @"X-Chaff";
  v6[0] = chaffValue;
  v3 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (NSString)chaffValue
{
  return self->_chaffValue;
}

- (void)setChaffValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end