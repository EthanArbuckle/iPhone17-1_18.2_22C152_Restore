@interface WFContentItemChangeTransaction
- (NSString)mode;
- (WFContentItem)contentItem;
- (WFContentItemChangeTransaction)initWithContentItem:(id)a3;
- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4;
- (void)setMode:(id)a3;
@end

@implementation WFContentItemChangeTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setMode:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
}

- (WFContentItemChangeTransaction)initWithContentItem:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFContentItemChangeTransaction.m", 21, @"Invalid parameter not satisfying: %@", @"contentItem" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFContentItemChangeTransaction;
  v7 = [(WFContentItemChangeTransaction *)&v13 init];
  v8 = v7;
  if (v7)
  {
    mode = v7->_mode;
    v7->_mode = (NSString *)@"Set";

    objc_storeStrong((id *)&v8->_contentItem, a3);
    v10 = v8;
  }

  return v8;
}

@end