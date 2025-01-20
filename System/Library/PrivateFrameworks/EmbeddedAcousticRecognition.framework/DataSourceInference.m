@interface DataSourceInference
- (DataSourceInference)init;
- (DataSourceInference)initWithLength:(unint64_t)a3 contextKey:(id)a4 targetKey:(id)a5;
- (id).cxx_construct;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
- (void)setVectorsWithProcessor:(id)a3;
@end

@implementation DataSourceInference

- (DataSourceInference)init
{
  return 0;
}

- (DataSourceInference)initWithLength:(unint64_t)a3 contextKey:(id)a4 targetKey:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DataSourceInference;
  id v11 = [(DataSourceInference *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    std::vector<std::vector<float>>::resize((uint64_t *)v11 + 1, 1uLL);
    std::vector<std::vector<float>>::resize((uint64_t *)v12 + 4, 1uLL);
    std::vector<float>::resize(*((void *)v12 + 1), a3);
    std::vector<float>::resize(*((void *)v12 + 4), a3);
    *((void *)v12 + 7) = a3;
    objc_storeStrong((id *)v12 + 8, a4);
    objc_storeStrong((id *)v12 + 9, a5);
  }

  return (DataSourceInference *)v12;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  v21[0] = &unk_1F0A740E8;
  v21[1] = &unk_1F0A740E8;
  v21[2] = &unk_1F0A740E8;
  v21[3] = &unk_1F0A740E8;
  v6 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v21[4] = v6;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];

  v7 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[0] = v7;
  v8 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[1] = v8;
  id v9 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[2] = v9;
  id v10 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[3] = v10;
  v20[4] = &unk_1F0A740E8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F61198]) initWithData:*(void *)self->_contextData.__begin_ type:2 shape:v19 strides:v11];
  [v5 setObject:v12 forKeyedSubscript:self->_contextKey];

  v13 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  objc_super v14 = [v5 objectForKeyedSubscript:self->_contextKey];
  [v14 setMaxNumberOfElements:v13];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F61198]) initWithData:*(void *)self->_targetData.__begin_ type:2 shape:&unk_1F0A741C8 strides:&unk_1F0A741E0];
  [v5 setObject:v15 forKeyedSubscript:self->_targetKey];

  v16 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v17 = [v5 objectForKeyedSubscript:self->_targetKey];
  [v17 setMaxNumberOfElements:v16];

  return v5;
}

- (void)setVectorsWithProcessor:(id)a3
{
  id v14 = a3;
  v4 = [v14 textSequence];
  v5 = [v4 firstObject];
  v6 = [v5 sequence];

  v7 = [v14 textSequence];
  v8 = [v7 firstObject];
  id v9 = [v8 target];

  for (unint64_t i = 0; i < [v6 count]; ++i)
  {
    id v11 = [v6 objectAtIndexedSubscript:i];
    [v11 floatValue];
    *(_DWORD *)(*(void *)self->_contextData.__begin_ + 4 * i) = v12;
  }
  [v9 floatValue];
  **(_DWORD **)self->_targetData.__begin_ = v13;
}

- (unint64_t)numberOfDataPoints
{
  return 0xAAAAAAAAAAAAAAABLL * (((char *)self->_contextData.__end_ - (char *)self->_contextData.__begin_) >> 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetKey, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  p_targetData = &self->_targetData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_targetData);
  p_targetData = &self->_contextData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_targetData);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end