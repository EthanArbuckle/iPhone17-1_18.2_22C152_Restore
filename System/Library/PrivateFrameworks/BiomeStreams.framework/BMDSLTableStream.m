@interface BMDSLTableStream
+ (BOOL)supportsSecureCoding;
- (BMDSL)upstream;
- (BMDSLTableStream)initWithCoder:(id)a3;
- (BMDSLTableStream)initWithUpstream:(id)a3 expression:(id)a4;
- (BMDSLTableStream)initWithUpstream:(id)a3 expression:(id)a4 name:(id)a5 version:(unsigned int)a6;
- (BMTableQueryExpression)expression;
- (id)bpsPublisher;
- (id)select:(id)a3;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
- (void)setExpression:(id)a3;
- (void)setUpstream:(id)a3;
@end

@implementation BMDSLTableStream

- (BMDSLTableStream)initWithUpstream:(id)a3 expression:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMDSLTableStream;
  v13 = [(BMDSLBaseCodable *)&v16 initWithName:a5 version:v6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_upstream, a3);
    objc_storeStrong((id *)&v14->_expression, a4);
  }

  return v14;
}

- (BMDSLTableStream)initWithUpstream:(id)a3 expression:(id)a4
{
  return [(BMDSLTableStream *)self initWithUpstream:a3 expression:a4 name:@"tableStream" version:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BMDSLTableStream;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v7 encodeWithCoder:v4];
  v5 = [(BMDSLTableStream *)self upstream];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F4FA70]];

  uint64_t v6 = [(BMDSLTableStream *)self expression];
  [v4 encodeObject:v6 forKey:@"queryExpression"];
}

- (BMDSLTableStream)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLTableStream;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F4FA28] allowed];
    objc_super v7 = [v4 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1E4F4FA70]];

    v8 = [MEMORY[0x1E4F4FA28] allowed];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"queryExpression"];

    v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLTableStream *)v5 initWithUpstream:v7 expression:v9 name:v10 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLTableStream *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)bpsPublisher
{
  id v4 = [(BMDSLTableStream *)self upstream];
  v5 = [v4 bpsPublisher];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__BMDSLTableStream_bpsPublisher__block_invoke;
  v8[3] = &unk_1E55D7AB8;
  v8[4] = self;
  v8[5] = a2;
  uint64_t v6 = [v5 mapWithTransform:v8];

  return v6;
}

id __32__BMDSLTableStream_bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"BMDSLTableStream.m", 73, @"Invalid parameter not satisfying: %@", @"[input isKindOfClass:[BMTable class]]" object file lineNumber description];
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = [v4 expression];
  objc_super v7 = [v6 queryTable:v5];

  return v7;
}

- (id)select:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BMDSLTableStream *)self expression];
  if (v5)
  {
    uint64_t v6 = [(BMDSLTableStream *)self expression];
    v11[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F4FA90]) initWithChildren:v7 columnNames:v4];
  v9 = [[BMDSLTableStream alloc] initWithUpstream:self expression:v8];

  return v9;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void)setUpstream:(id)a3
{
}

- (BMTableQueryExpression)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);

  objc_storeStrong((id *)&self->_upstream, 0);
}

@end