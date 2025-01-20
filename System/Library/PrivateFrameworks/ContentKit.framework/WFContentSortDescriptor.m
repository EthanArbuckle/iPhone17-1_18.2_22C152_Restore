@interface WFContentSortDescriptor
+ (id)randomSortDescriptor;
+ (id)sortDescriptorWithProperty:(id)a3 ascending:(BOOL)a4 comparator:(id)a5;
- (BOOL)ascending;
- (NSSet)containedProperties;
- (WFContentProperty)property;
- (WFContentSortDescriptor)initWithProperty:(id)a3 ascending:(BOOL)a4 comparator:(id)a5;
- (id)comparator;
- (id)description;
@end

@implementation WFContentSortDescriptor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (id)comparator
{
  return self->_comparator;
}

- (WFContentProperty)property
{
  return self->_property;
}

- (NSSet)containedProperties
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(WFContentSortDescriptor *)self property];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return (NSSet *)v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFContentSortDescriptor *)self property];
  if ([(WFContentSortDescriptor *)self ascending]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [(WFContentSortDescriptor *)self comparator];
  if (v8)
  {
    v9 = NSString;
    v10 = [(WFContentSortDescriptor *)self comparator];
    v11 = _Block_copy(v10);
    v12 = [v9 stringWithFormat:@", comparator: %@", v11];
    v13 = [v3 stringWithFormat:@"<%@: %p, property: %@, ascending: %@%@>", v5, self, v6, v7, v12];
  }
  else
  {
    v13 = [v3 stringWithFormat:@"<%@: %p, property: %@, ascending: %@%@>", v5, self, v6, v7, &stru_26C71CE08];
  }

  return v13;
}

- (WFContentSortDescriptor)initWithProperty:(id)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (v10 && ([v10 isSortable] & 1) == 0)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFContentSortDescriptor.m", 33, @"Invalid parameter not satisfying: %@", @"!property || property.sortable" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFContentSortDescriptor;
  v12 = [(WFContentSortDescriptor *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_property, a3);
    v13->_ascending = a4;
    uint64_t v14 = [v11 copy];
    id comparator = v13->_comparator;
    v13->_id comparator = (id)v14;
  }
  return v13;
}

+ (id)randomSortDescriptor
{
  if (randomSortDescriptor_onceToken != -1) {
    dispatch_once(&randomSortDescriptor_onceToken, &__block_literal_global_22356);
  }
  v2 = (void *)randomSortDescriptor_randomSortDescriptor;
  return v2;
}

uint64_t __47__WFContentSortDescriptor_randomSortDescriptor__block_invoke()
{
  randomSortDescriptor_randomSortDescriptor = +[WFContentSortDescriptor sortDescriptorWithProperty:0 ascending:1 comparator:&__block_literal_global_10_22359];
  return MEMORY[0x270F9A758]();
}

uint64_t __47__WFContentSortDescriptor_randomSortDescriptor__block_invoke_2()
{
  return 0;
}

+ (id)sortDescriptorWithProperty:(id)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithProperty:v9 ascending:v5 comparator:v8];

  return v10;
}

@end