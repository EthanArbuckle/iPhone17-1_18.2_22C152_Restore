@interface BPSWindowerInput
- (BPSWindowMetadata)metadata;
- (BPSWindowerInput)initWithAggregate:(id)a3 key:(id)a4 metadata:(id)a5;
- (NSCopying)key;
- (id)aggregate;
@end

@implementation BPSWindowerInput

- (BPSWindowerInput)initWithAggregate:(id)a3 key:(id)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BPSWindowerInput;
  v12 = [(BPSWindowerInput *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_aggregate, a3);
    objc_storeStrong((id *)&v13->_key, a4);
    objc_storeStrong((id *)&v13->_metadata, a5);
  }

  return v13;
}

- (id)aggregate
{
  return self->_aggregate;
}

- (NSCopying)key
{
  return self->_key;
}

- (BPSWindowMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong(&self->_aggregate, 0);
}

@end