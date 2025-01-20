@interface HMMMRequestOptions
- (BOOL)oneWay;
- (HMMMRequestOptions)init;
- (HMMMRequestOptions)initWithTimeout:(id)a3 transportRestriction:(int64_t)a4;
- (NSNumber)timeout;
- (id)attributeDescriptions;
- (int64_t)transportRestriction;
- (void)setOneWay:(BOOL)a3;
@end

@implementation HMMMRequestOptions

- (void).cxx_destruct
{
}

- (void)setOneWay:(BOOL)a3
{
  self->_oneWay = a3;
}

- (BOOL)oneWay
{
  return self->_oneWay;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (int64_t)transportRestriction
{
  return self->_transportRestriction;
}

- (id)attributeDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v4 = [(HMMMRequestOptions *)self transportRestriction];
  if (v4 > 2) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_1E59402C8[v4];
  }
  v6 = (void *)[v3 initWithName:@"TransportRestriction" value:v5];
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (HMMMRequestOptions)initWithTimeout:(id)a3 transportRestriction:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMMMRequestOptions;
  v8 = [(HMMMRequestOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_timeout, a3);
    v9->_transportRestriction = a4;
    v9->_oneWay = 1;
  }

  return v9;
}

- (HMMMRequestOptions)init
{
  return [(HMMMRequestOptions *)self initWithTimeout:0 transportRestriction:2];
}

@end