@interface SMTDataSourceInference
- (SMTDataSourceInference)init;
- (SMTDataSourceInference)initWithLength:(unint64_t)a3 contextKey:(id)a4 targetKey:(id)a5;
- (id).cxx_construct;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
- (void)setVectorsWithProcessor:(id)a3;
@end

@implementation SMTDataSourceInference

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetKey, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  p_targetData = &self->_targetData;
  sub_100022794((void ***)&p_targetData);
  p_targetData = &self->_contextData;
  sub_100022794((void ***)&p_targetData);
}

- (unint64_t)numberOfDataPoints
{
  return 0xAAAAAAAAAAAAAAABLL * (((char *)self->_contextData.__end_ - (char *)self->_contextData.__begin_) >> 3);
}

- (void)setVectorsWithProcessor:(id)a3
{
  id v14 = a3;
  v4 = [v14 textSequence];
  v5 = [v4 firstObject];
  v6 = [v5 sequence];

  v7 = [v14 textSequence];
  v8 = [v7 firstObject];
  v9 = [v8 target];

  for (unint64_t i = 0; i < (unint64_t)[v6 count]; ++i)
  {
    v11 = [v6 objectAtIndexedSubscript:i];
    [v11 floatValue];
    *(_DWORD *)(*(void *)self->_contextData.__begin_ + 4 * i) = v12;
  }
  [v9 floatValue];
  **(_DWORD **)self->_targetData.__begin_ = v13;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  v5 = objc_opt_new();
  v21[0] = &off_10003F268;
  v21[1] = &off_10003F268;
  v21[2] = &off_10003F268;
  v21[3] = &off_10003F268;
  v6 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v21[4] = v6;
  v19 = +[NSArray arrayWithObjects:v21 count:5];

  v7 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[0] = v7;
  v8 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[1] = v8;
  v9 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[2] = v9;
  v10 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v20[3] = v10;
  v20[4] = &off_10003F268;
  v11 = +[NSArray arrayWithObjects:v20 count:5];

  id v12 = [objc_alloc((Class)ETDataTensor) initWithData:*(void *)self->_contextData.__begin_ type:2 shape:v19 strides:v11];
  [v5 setObject:v12 forKeyedSubscript:self->_contextKey];

  int v13 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  id v14 = [v5 objectForKeyedSubscript:self->_contextKey];
  [v14 setMaxNumberOfElements:v13];

  id v15 = [objc_alloc((Class)ETDataTensor) initWithData:*(void *)self->_targetData.__begin_ type:2 shape:&off_10003F348 strides:&off_10003F360];
  [v5 setObject:v15 forKeyedSubscript:self->_targetKey];

  v16 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
  v17 = [v5 objectForKeyedSubscript:self->_targetKey];
  [v17 setMaxNumberOfElements:v16];

  return v5;
}

- (SMTDataSourceInference)initWithLength:(unint64_t)a3 contextKey:(id)a4 targetKey:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SMTDataSourceInference;
  v11 = [(SMTDataSourceInference *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    sub_100022DEC((uint64_t)&v11->_contextData, 1uLL);
    sub_100022DEC((uint64_t)&v12->_targetData, 1uLL);
    sub_100023008((char **)v12->_contextData.__begin_, a3);
    sub_100023008((char **)v12->_targetData.__begin_, a3);
    v12->_sequenceLength = a3;
    objc_storeStrong((id *)&v12->_contextKey, a4);
    objc_storeStrong((id *)&v12->_targetKey, a5);
  }

  return v12;
}

- (SMTDataSourceInference)init
{
  return 0;
}

@end