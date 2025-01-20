@interface CATActiveIDSServiceConnectionContentRetransmit
+ (id)instanceWithDictionary:(id)a3;
- (CATActiveIDSServiceConnectionContentRetransmit)initWithSequenceNumbers:(id)a3;
- (NSArray)sequenceNumbers;
- (NSDictionary)dictionaryValue;
- (int64_t)contentType;
@end

@implementation CATActiveIDSServiceConnectionContentRetransmit

- (CATActiveIDSServiceConnectionContentRetransmit)initWithSequenceNumbers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATActiveIDSServiceConnectionContentRetransmit;
  v5 = [(CATActiveIDSServiceConnectionContentRetransmit *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sequenceNumbers = v5->_sequenceNumbers;
    v5->_sequenceNumbers = (NSArray *)v6;
  }
  return v5;
}

- (int64_t)contentType
{
  return 6;
}

- (NSDictionary)dictionaryValue
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"SequenceNumbers";
  v2 = [(CATActiveIDSServiceConnectionContentRetransmit *)self sequenceNumbers];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"SequenceNumbers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    v7 = (void *)[objc_alloc((Class)a1) initWithSequenceNumbers:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (NSArray)sequenceNumbers
{
  return self->_sequenceNumbers;
}

- (void).cxx_destruct
{
}

@end