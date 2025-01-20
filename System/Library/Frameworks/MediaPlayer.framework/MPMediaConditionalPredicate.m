@interface MPMediaConditionalPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5;
- (MPMediaConditionalPredicate)initWithCoder:(id)a3;
- (MPMediaConditionalPredicate)initWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5;
- (MPMediaConditionalPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4;
- (MPMediaPredicate)conditionPredicate;
- (MPMediaPredicate)elsePredicate;
- (MPMediaPredicate)thenPredicate;
- (id)ML3PredicateForContainer;
- (id)ML3PredicateForTrack;
- (id)_ML3PredicateForEntityTypeSelector:(SEL)a3;
- (id)protobufferEncodableObjectFromLibrary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMediaConditionalPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elsePredicate, 0);
  objc_storeStrong((id *)&self->_thenPredicate, 0);

  objc_storeStrong((id *)&self->_conditionPredicate, 0);
}

- (MPMediaPredicate)elsePredicate
{
  return self->_elsePredicate;
}

- (MPMediaPredicate)thenPredicate
{
  return self->_thenPredicate;
}

- (MPMediaPredicate)conditionPredicate
{
  return self->_conditionPredicate;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPPConditionalPredicate);
  v6 = [(MPMediaPredicate *)self->_conditionPredicate protobufferEncodableObjectFromLibrary:v4];
  [(MPPConditionalPredicate *)v5 setConditionalPredicate:v6];

  v7 = [(MPMediaPredicate *)self->_thenPredicate protobufferEncodableObjectFromLibrary:v4];
  [(MPPConditionalPredicate *)v5 setThenPredicate:v7];

  v8 = [(MPMediaPredicate *)self->_elsePredicate protobufferEncodableObjectFromLibrary:v4];

  [(MPPConditionalPredicate *)v5 setElsePredicate:v8];
  v9 = objc_alloc_init(MPPMediaPredicate);
  [(MPPMediaPredicate *)v9 setType:3];
  [(MPPMediaPredicate *)v9 setConditionalPredicate:v5];

  return v9;
}

- (MPMediaConditionalPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MPMediaQuery.m", 1557, @"Cannot decode object of type %@", objc_opt_class() object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)MPMediaConditionalPredicate;
  v9 = [(MPMediaConditionalPredicate *)&v22 init];
  if (v9)
  {
    v10 = [v7 conditionalPredicate];
    if ([v10 hasConditionalPredicate])
    {
      v11 = [v10 conditionalPredicate];
      uint64_t v12 = MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(v11, v8);
      conditionPredicate = v9->_conditionPredicate;
      v9->_conditionPredicate = (MPMediaPredicate *)v12;
    }
    if ([v10 hasThenPredicate])
    {
      v14 = [v10 thenPredicate];
      uint64_t v15 = MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(v14, v8);
      thenPredicate = v9->_thenPredicate;
      v9->_thenPredicate = (MPMediaPredicate *)v15;
    }
    if ([v10 hasElsePredicate])
    {
      v17 = [v10 elsePredicate];
      uint64_t v18 = MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(v17, v8);
      elsePredicate = v9->_elsePredicate;
      v9->_elsePredicate = (MPMediaPredicate *)v18;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  conditionPredicate = self->_conditionPredicate;
  id v5 = a3;
  [v5 encodeObject:conditionPredicate forKey:@"conditionPredicate"];
  [v5 encodeObject:self->_thenPredicate forKey:@"thenPredicate"];
  [v5 encodeObject:self->_elsePredicate forKey:@"elsePredicate"];
}

- (MPMediaConditionalPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPMediaConditionalPredicate;
  id v5 = [(MPMediaConditionalPredicate *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conditionPredicate"];
    conditionPredicate = v5->_conditionPredicate;
    v5->_conditionPredicate = (MPMediaPredicate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thenPredicate"];
    thenPredicate = v5->_thenPredicate;
    v5->_thenPredicate = (MPMediaPredicate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"elsePredicate"];
    elsePredicate = v5->_elsePredicate;
    v5->_elsePredicate = (MPMediaPredicate *)v10;
  }
  return v5;
}

- (MPMediaConditionalPredicate)initWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaConditionalPredicate;
  uint64_t v12 = [(MPMediaConditionalPredicate *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conditionPredicate, a3);
    objc_storeStrong((id *)&v13->_thenPredicate, a4);
    objc_storeStrong((id *)&v13->_elsePredicate, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConditionPredicate:v9 thenPredicate:v8 elsePredicate:v7];

  return v10;
}

- (id)ML3PredicateForContainer
{
  return [(MPMediaConditionalPredicate *)self _ML3PredicateForEntityTypeSelector:a2];
}

- (id)ML3PredicateForTrack
{
  return [(MPMediaConditionalPredicate *)self _ML3PredicateForEntityTypeSelector:a2];
}

- (id)_ML3PredicateForEntityTypeSelector:(SEL)a3
{
  id v5 = (void *)MEMORY[0x1E4F79AB0];
  uint64_t v6 = [(MPMediaConditionalPredicate *)self conditionPredicate];
  id v7 = __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(a3, v6);
  id v8 = [(MPMediaConditionalPredicate *)self thenPredicate];
  id v9 = __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(a3, v8);
  id v10 = [(MPMediaConditionalPredicate *)self elsePredicate];
  id v11 = __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(a3, v10);
  uint64_t v12 = [v5 predicateWithConditionPredicate:v7 thenPredicate:v9 elsePredicate:v11];

  return v12;
}

id __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(const char *a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = NSStringFromSelector(a1);
    id v5 = [v3 valueForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end