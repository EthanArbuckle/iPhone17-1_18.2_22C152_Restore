@interface MLSequnceAsFeatureValueArray
- (MLSequence)sequence;
- (id)initWrappingSequence:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation MLSequnceAsFeatureValueArray

- (void).cxx_destruct
{
}

- (MLSequence)sequence
{
  return self->_sequence;
}

- (id)objectAtIndex:(unint64_t)a3
{
  MLFeatureType v5 = [(MLSequence *)self->_sequence type];
  v6 = [(MLSequence *)self->_sequence values];
  v7 = [v6 objectAtIndexedSubscript:a3];
  v8 = +[MLFeatureValue featureValueOfType:v5 fromObject:v7 error:0];

  return v8;
}

- (unint64_t)count
{
  v2 = [(MLSequence *)self->_sequence values];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)initWrappingSequence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLSequnceAsFeatureValueArray;
  v6 = [(MLSequnceAsFeatureValueArray *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sequence, a3);
  }

  return v7;
}

@end