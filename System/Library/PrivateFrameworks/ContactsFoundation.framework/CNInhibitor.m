@interface CNInhibitor
+ (id)os_transactionInhibitorWithLabel:(id)a3;
+ (id)runningboardInhibitorWithExplanation:(id)a3;
+ (id)suddenTerminationInhibitor;
+ (id)suddenTerminationInhibitorWithProcessInfo:(id)a3;
- (BOOL)debugIsInhibiting;
- (void)dealloc;
- (void)setDebugIsInhibiting:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation CNInhibitor

- (void)setDebugIsInhibiting:(BOOL)a3
{
  self->_debugIsInhibiting = a3;
}

- (void)start
{
}

- (void)stop
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CNInhibitor;
  [(CNInhibitor *)&v2 dealloc];
}

+ (id)os_transactionInhibitorWithLabel:(id)a3
{
  id v3 = a3;
  v4 = [[_CNOSTransactionInhibitor alloc] initWithLabel:v3];

  return v4;
}

+ (id)suddenTerminationInhibitor
{
  objc_super v2 = objc_alloc_init(_CNSuddenTerminationInhibitor);

  return v2;
}

+ (id)suddenTerminationInhibitorWithProcessInfo:(id)a3
{
  id v3 = a3;
  v4 = [[_CNSuddenTerminationInhibitor alloc] initWithProcessInfo:v3];

  return v4;
}

+ (id)runningboardInhibitorWithExplanation:(id)a3
{
  id v3 = a3;
  v4 = [[_CNRunningBoardInhibitor alloc] initWithExplanation:v3];

  return v4;
}

- (BOOL)debugIsInhibiting
{
  return self->_debugIsInhibiting;
}

@end