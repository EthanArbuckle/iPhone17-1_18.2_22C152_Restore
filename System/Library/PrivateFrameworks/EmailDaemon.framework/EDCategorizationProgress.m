@interface EDCategorizationProgress
- (EDCategorizationProgress)initWithTotalMessagesToCategorize:(unint64_t)a3 categorizedMessages:(unint64_t)a4;
- (unint64_t)categorizedMessages;
- (unint64_t)totalMessagesToCategorize;
@end

@implementation EDCategorizationProgress

- (EDCategorizationProgress)initWithTotalMessagesToCategorize:(unint64_t)a3 categorizedMessages:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EDCategorizationProgress;
  result = [(EDCategorizationProgress *)&v7 init];
  if (result)
  {
    result->_totalMessagesToCategorize = a3;
    result->_categorizedMessages = a4;
  }
  return result;
}

- (unint64_t)totalMessagesToCategorize
{
  return self->_totalMessagesToCategorize;
}

- (unint64_t)categorizedMessages
{
  return self->_categorizedMessages;
}

@end