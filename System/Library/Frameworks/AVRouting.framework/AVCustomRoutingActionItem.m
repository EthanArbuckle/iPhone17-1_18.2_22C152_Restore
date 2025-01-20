@interface AVCustomRoutingActionItem
- (AVCustomRoutingActionItem)init;
- (NSString)overrideTitle;
- (UTType)type;
- (id)identifier;
- (void)dealloc;
- (void)setIdentifier:(id)a3;
- (void)setOverrideTitle:(NSString *)overrideTitle;
- (void)setType:(UTType *)type;
@end

@implementation AVCustomRoutingActionItem

- (AVCustomRoutingActionItem)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCustomRoutingActionItem;
  v2 = [(AVCustomRoutingActionItem *)&v4 init];
  if (v2) {
    v2->_identifier = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
  }
  return v2;
}

- (void)dealloc
{
  self->_type = 0;
  self->_overrideTitle = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingActionItem;
  [(AVCustomRoutingActionItem *)&v3 dealloc];
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)a3;
}

- (UTType)type
{
  return self->_type;
}

- (void)setType:(UTType *)type
{
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (void)setOverrideTitle:(NSString *)overrideTitle
{
}

@end