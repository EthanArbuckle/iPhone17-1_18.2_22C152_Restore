@interface DESExceptionCatchingEvaluator
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (DESExceptionCatchingEvaluator)initWithEvaluator:(id)a3;
- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 binaryResult:(id *)a5 error:(id *)a6;
- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 error:(id *)a5;
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
- (id)serverSafeRecordInfoWithRecordInfo:(id)a3;
- (id)telemetryWithRecordSet:(id)a3;
- (void)performEvaluation:(id)a3;
@end

@implementation DESExceptionCatchingEvaluator

- (DESExceptionCatchingEvaluator)initWithEvaluator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DESExceptionCatchingEvaluator;
  v6 = [(DESExceptionCatchingEvaluator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_evaluator, a3);
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [(DESRecipeEvaluation *)self->_evaluator evaluateRecipe:v12 recordInfo:v13 recordData:v14 attachments:v15 error:a7];

  return v16;
}

- (id)telemetryWithRecordSet:(id)a3
{
  return (id)[(DESRecipeEvaluation *)self->_evaluator telemetryWithRecordSet:a3];
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return [(DESRecipeEvaluation *)self->_evaluator shouldDownloadAttachmentWithURL:a3 recipe:a4 recordInfo:a5];
}

- (id)serverSafeRecordInfoWithRecordInfo:(id)a3
{
  return (id)[(DESRecipeEvaluation *)self->_evaluator serverSafeRecordInfoWithRecordInfo:a3];
}

- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(DESRecipeEvaluation *)self->_evaluator evaluateRecipe:v8 matchingRecordSet:v9 error:a5];

  return v10;
}

- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 binaryResult:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(DESRecipeEvaluation *)self->_evaluator evaluateRecipe:v10 matchingRecordSet:v11 binaryResult:a5 error:a6];

  return v12;
}

- (void)performEvaluation:(id)a3
{
  id v4 = a3;
  [(DESRecipeEvaluation *)self->_evaluator performEvaluation:v4];
}

- (void).cxx_destruct
{
}

@end