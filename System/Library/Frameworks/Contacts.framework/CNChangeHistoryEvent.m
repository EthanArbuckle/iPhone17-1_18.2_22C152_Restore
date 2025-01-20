@interface CNChangeHistoryEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (CNChangeHistoryEvent)initWithCoder:(id)a3;
- (NSArray)contactIdentifiers;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)comparisonResultBetweenClasses:(id)a3;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (void)acceptEventVisitor:(id)visitor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryEvent

- (id)description
{
  v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)acceptEventVisitor:(id)visitor
{
  id v4 = visitor;
  v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (NSArray)contactIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNChangeHistoryEvent *)self comparisonResultBetweenClasses:v4];
  if (!v5) {
    int64_t v5 = [(CNChangeHistoryEvent *)self comparisonResultWithinSameClass:v4];
  }

  return v5;
}

- (int64_t)comparisonResultBetweenClasses:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [(id)objc_opt_class() instanceSortOrder];
  int64_t v5 = objc_opt_class();

  unint64_t v6 = [v5 instanceSortOrder];
  if (v4 < v6) {
    return -1;
  }
  else {
    return v4 > v6;
  }
}

+ (unint64_t)instanceSortOrder
{
  id v2 = a1;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  return 0;
}

@end