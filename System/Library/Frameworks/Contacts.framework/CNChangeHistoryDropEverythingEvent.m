@interface CNChangeHistoryDropEverythingEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
@end

@implementation CNChangeHistoryDropEverythingEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();

  return [v3 isEqual:v4];
}

- (unint64_t)hash
{
  return 42;
}

- (id)description
{
  v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v3 = [v2 build];

  return v3;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitDropEverythingEvent:self];
}

+ (unint64_t)instanceSortOrder
{
  return 0;
}

@end