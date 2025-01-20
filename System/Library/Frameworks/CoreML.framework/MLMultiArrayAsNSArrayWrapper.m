@interface MLMultiArrayAsNSArrayWrapper
- (MLMultiArray)multiArray;
- (id)initWrappingMultiArray:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)setMultiArray:(id)a3;
@end

@implementation MLMultiArrayAsNSArrayWrapper

- (void).cxx_destruct
{
}

- (void)setMultiArray:(id)a3
{
}

- (MLMultiArray)multiArray
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(MLMultiArray *)self->_multiArray objectAtIndexedSubscript:a3];
}

- (unint64_t)count
{
  return [(MLMultiArray *)self->_multiArray count];
}

- (id)initWrappingMultiArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLMultiArrayAsNSArrayWrapper;
  v6 = [(MLMultiArrayAsNSArrayWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_multiArray, a3);
  }

  return v7;
}

@end