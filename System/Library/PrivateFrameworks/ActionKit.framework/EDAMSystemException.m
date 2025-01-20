@interface EDAMSystemException
+ (id)structFields;
+ (id)structName;
- (NSNumber)errorCode;
- (NSNumber)rateLimitDuration;
- (NSString)message;
- (void)setErrorCode:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRateLimitDuration:(id)a3;
@end

@implementation EDAMSystemException

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_27_35769;
  if (!structFields_structFields_27_35769)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"errorCode"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"message", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"rateLimitDuration"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_27_35769;
    structFields_structFields_27_35769 = v6;

    v2 = (void *)structFields_structFields_27_35769;
  }
  return v2;
}

+ (id)structName
{
  return @"EDAMSystemException";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitDuration, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

- (void)setRateLimitDuration:(id)a3
{
}

- (NSNumber)rateLimitDuration
{
  return self->_rateLimitDuration;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setErrorCode:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

@end