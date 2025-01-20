@interface TDMEvaluation
- (NSData)evaluatedElement;
- (NSData)proof;
- (TDMEvaluation)initWithEvaluatedElement:(id)a3 proof:(id)a4;
@end

@implementation TDMEvaluation

- (TDMEvaluation)initWithEvaluatedElement:(id)a3 proof:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TDMEvaluation;
  v9 = [(TDMEvaluation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_evaluatedElement, a3);
    objc_storeStrong((id *)&v10->_proof, a4);
  }

  return v10;
}

- (NSData)evaluatedElement
{
  return self->_evaluatedElement;
}

- (NSData)proof
{
  return self->_proof;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proof, 0);
  objc_storeStrong((id *)&self->_evaluatedElement, 0);
}

@end