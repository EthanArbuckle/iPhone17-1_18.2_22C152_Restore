@interface MLWrappedModel
- (MLModel)innerModel;
- (MLWrappedModel)initWithInnerModel:(id)a3;
- (NSString)reason;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 error:(id *)a4;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (void)clearInnerModelWithReason:(id)a3;
- (void)setInnerModel:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation MLWrappedModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_innerModel, 0);
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setInnerModel:(id)a3
{
}

- (MLModel)innerModel
{
  return (MLModel *)objc_getProperty(self, a2, 80, 1);
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLWrappedModel *)self innerModel];

  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    v12 = [(MLWrappedModel *)self reason];
    id v13 = [v11 exceptionWithName:@"IllegalOperation" reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  v8 = [(MLWrappedModel *)self innerModel];
  v9 = [v8 parameterValueForKey:v6 error:a4];

  return v9;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MLWrappedModel *)self innerModel];

  if (!v10)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    v15 = [(MLWrappedModel *)self reason];
    id v16 = [v14 exceptionWithName:@"IllegalOperation" reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
  v11 = [(MLWrappedModel *)self innerModel];
  v12 = [v11 predictionsFromBatch:v8 options:v9 error:a5];

  return v12;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLWrappedModel *)self innerModel];

  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    v12 = [(MLWrappedModel *)self reason];
    id v13 = [v11 exceptionWithName:@"IllegalOperation" reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  id v8 = [(MLWrappedModel *)self innerModel];
  id v9 = [v8 predictionsFromBatch:v6 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MLWrappedModel *)self innerModel];

  if (!v10)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    v15 = [(MLWrappedModel *)self reason];
    id v16 = [v14 exceptionWithName:@"IllegalOperation" reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
  v11 = [(MLWrappedModel *)self innerModel];
  v12 = [v11 predictionFromFeatures:v8 options:v9 error:a5];

  return v12;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLWrappedModel *)self innerModel];

  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    v12 = [(MLWrappedModel *)self reason];
    id v13 = [v11 exceptionWithName:@"IllegalOperation" reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  id v8 = [(MLWrappedModel *)self innerModel];
  id v9 = [v8 predictionFromFeatures:v6 error:a4];

  return v9;
}

- (void)clearInnerModelWithReason:(id)a3
{
  id v4 = a3;
  [(MLWrappedModel *)self setInnerModel:0];
  [(MLWrappedModel *)self setReason:v4];
}

- (MLWrappedModel)initWithInnerModel:(id)a3
{
  id v5 = a3;
  id v6 = [v5 modelDescription];
  v7 = [v5 configuration];
  v10.receiver = self;
  v10.super_class = (Class)MLWrappedModel;
  id v8 = [(MLModel *)&v10 initWithDescription:v6 configuration:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_innerModel, a3);
  }

  return v8;
}

@end