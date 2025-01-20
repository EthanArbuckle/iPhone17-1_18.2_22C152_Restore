@interface CHMathResultWithContext
- (CHMathResultWithContext)initWithResult:(id)a3 declaredVariables:(id)a4;
- (CHTokenizedMathResult)result;
- (NSSet)declaredVariables;
- (void)setResult:(id)a3;
@end

@implementation CHMathResultWithContext

- (CHMathResultWithContext)initWithResult:(id)a3 declaredVariables:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CHMathResultWithContext;
  v13 = [(CHMathResultWithContext *)&v17 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
    v15 = v13->_result;
    v13->_result = (CHTokenizedMathResult *)v14;

    objc_storeStrong((id *)&v13->_declaredVariables, a4);
  }

  return v13;
}

- (CHTokenizedMathResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end