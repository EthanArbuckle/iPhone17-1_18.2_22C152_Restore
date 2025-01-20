@interface SNNullRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)graphIsDeadEnded;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldThrowException;
- (SNNullRequest)init;
- (SNNullRequest)initWithCoder:(id)a3;
- (double)computationalDutyCycle;
- (double)sampleRate;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (unsigned)blockSize;
- (void)encodeWithCoder:(id)a3;
- (void)setBlockSize:(unsigned int)a3;
- (void)setComputationalDutyCycle:(double)a3;
- (void)setGraphIsDeadEnded:(BOOL)a3;
- (void)setSampleRate:(double)a3;
- (void)setShouldThrowException:(BOOL)a3;
@end

@implementation SNNullRequest

- (double)sampleRate
{
  return sub_1DC8A01B0();
}

- (void)setSampleRate:(double)a3
{
}

- (unsigned)blockSize
{
  return sub_1DC8A0218();
}

- (void)setBlockSize:(unsigned int)a3
{
}

- (double)computationalDutyCycle
{
  return sub_1DC8A028C();
}

- (void)setComputationalDutyCycle:(double)a3
{
}

- (BOOL)graphIsDeadEnded
{
  return sub_1DC8A0300() & 1;
}

- (void)setGraphIsDeadEnded:(BOOL)a3
{
}

- (BOOL)shouldThrowException
{
  return sub_1DC8A0378() & 1;
}

- (void)setShouldThrowException:(BOOL)a3
{
}

- (SNNullRequest)init
{
  return (SNNullRequest *)sub_1DC8A043C();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNNullRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNNullRequest.hash.getter();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = SNNullRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNNullRequest)initWithCoder:(id)a3
{
  return (SNNullRequest *)SNNullRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNNullRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end