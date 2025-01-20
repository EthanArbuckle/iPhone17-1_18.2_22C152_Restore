@interface CHClientCalculateDocumentProvider
- (CHClientCalculateDocumentProvider)initWithDeclaredVariables:(id)a3;
- (CHClientCalculateDocumentProvider)initWithDeclaredVariables:(id)a3 recognizedExpressions:(id)a4;
- (NSArray)recognizedExpressions;
- (NSSet)declaredVariables;
@end

@implementation CHClientCalculateDocumentProvider

- (CHClientCalculateDocumentProvider)initWithDeclaredVariables:(id)a3
{
  return (CHClientCalculateDocumentProvider *)((uint64_t (*)(CHClientCalculateDocumentProvider *, char *, id, void))MEMORY[0x1F4181798])(self, sel_initWithDeclaredVariables_recognizedExpressions_, a3, MEMORY[0x1E4F1CBF0]);
}

- (CHClientCalculateDocumentProvider)initWithDeclaredVariables:(id)a3 recognizedExpressions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHClientCalculateDocumentProvider;
  v9 = [(CHClientCalculateDocumentProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_declaredVariables, a3);
    objc_storeStrong((id *)&v10->_recognizedExpressions, a4);
  }

  return v10;
}

- (NSSet)declaredVariables
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)recognizedExpressions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedExpressions, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
}

@end