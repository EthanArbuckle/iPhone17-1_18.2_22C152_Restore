@interface NSLayoutAnchor
+ (NSLayoutAnchor)anchorWithItem:(id)a3 attribute:(int64_t)a4;
+ (id)_anchorForItem:(id)a3 attribute:(int64_t)a4;
+ (id)anchorNamed:(id)a3 inItem:(id)a4;
+ (id)anchorNamed:(id)a3 inItem:(id)a4 symbolicAttribute:(int64_t)a5;
- (BOOL)hasAmbiguousLayout;
- (BOOL)isCompatibleWithAnchor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)nsli_lowerIntoExpression:(id)a3 withCoefficient:(double)a4 forConstraint:(id)a5;
- (BOOL)validateOtherAttribute:(int64_t)a3;
- (NSArray)constraintsAffectingLayout;
- (NSISVariable)_anchorVariable;
- (NSLayoutAnchor)anchorWithName:(id)a3;
- (NSLayoutAnchor)anchorWithName:(id)a3 referenceItem:(id)a4 symbolicAttribute:(int64_t)a5;
- (NSLayoutAnchor)init;
- (NSLayoutAnchor)initWithAnchor:(id)a3;
- (NSLayoutAnchor)initWithCoder:(id)a3;
- (NSLayoutAnchor)initWithIndependentVariableName:(id)a3 item:(id)a4 symbolicAttribute:(int64_t)a5;
- (NSLayoutAnchor)initWithItem:(id)a3 attribute:(int64_t)a4;
- (NSLayoutAnchor)initWithName:(id)a3 referenceItem:(id)a4 symbolicAttribute:(int64_t)a5;
- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutAnchor *)anchor;
- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor;
- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor;
- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c;
- (NSString)name;
- (double)_valueInEngine:(id)a3;
- (double)ruleEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5;
- (double)ruleGreaterThanOrEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5;
- (double)ruleLessThanOrEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5;
- (double)valueInItem:(id)a3;
- (id)_constituentAnchors;
- (id)_constraintItem;
- (id)_equationDescriptionInParent;
- (id)_equationDescriptionLegendEntries;
- (id)_expressionInContext:(id *)a3;
- (id)_expressionInDefaultContextWithEngine:(id)a3;
- (id)_nearestAncestorLayoutItem;
- (id)_proxiedItem;
- (id)_referenceItem;
- (id)_referencedLayoutItems;
- (id)_referencingConstraints;
- (id)_variableName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)equationDescription;
- (id)item;
- (id)observableValueInItem:(id)a3;
- (id)ruleEqualToAnchor:(id)a3;
- (id)ruleEqualToAnchor:(id)a3 constant:(double)a4;
- (id)ruleEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6;
- (id)ruleGreaterThanOrEqualToAnchor:(id)a3;
- (id)ruleGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4;
- (id)ruleGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6;
- (id)ruleLessThanOrEqualToAnchor:(id)a3;
- (id)ruleLessThanOrEqualToAnchor:(id)a3 constant:(double)a4;
- (id)ruleLessThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6;
- (int64_t)_anchorType;
- (int64_t)_constraintAttribute;
- (int64_t)_proxiedAttribute;
- (uint64_t)_isReferencedByConstraint:(uint64_t)result;
- (unint64_t)hash;
- (void)_accumulateReferenceLayoutItemsIntoTable:(id)a3;
- (void)_dependentVariables;
- (void)_expressionForValueInItem:(void *)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)rulesAffectingLayout;
@end

@implementation NSLayoutAnchor

- (int64_t)_constraintAttribute
{
  return self->_attr;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3))
  {
    return self;
  }
  else
  {
    id v4 = objc_alloc((Class)objc_opt_class());
    return (id)[v4 initWithAnchor:self];
  }
}

- (NSISVariable)_anchorVariable
{
  if (result)
  {
    v1 = result;
    if ([(NSISVariable *)result _anchorType] != 1) {
    result = (NSISVariable *)v1->_engines[0];
    }
    if (!result)
    {
      result = +[NSISVariable variableWithName:valueRestriction:shouldBeMinimized:valueIsUserObservable:](NSISVariable, "variableWithName:valueRestriction:shouldBeMinimized:valueIsUserObservable:", [NSString stringWithFormat:@"%@:%p", -[NSISVariable _equationDescriptionInParent](v1, "_equationDescriptionInParent"), v1], 0, 0, 1);
      v1->_engines[0] = (NSISEngine *)result;
    }
  }
  return result;
}

- (BOOL)nsli_lowerIntoExpression:(id)a3 withCoefficient:(double)a4 forConstraint:(id)a5
{
  uint64_t v9 = [a5 container];
  id v10 = [(NSLayoutAnchor *)self _nearestAncestorLayoutItem];
  if ((NSLayoutAnchor *)[a5 firstAnchor] == self) {
    v11 = (void *)[a5 secondAnchor];
  }
  else {
    v11 = (void *)[a5 firstAnchor];
  }
  v12 = v11;
  uint64_t v13 = [v11 _nearestAncestorLayoutItem];
  if (nsli_lowerIntoExpression_withCoefficient_forConstraint__once != -1) {
    dispatch_once(&nsli_lowerIntoExpression_withCoefficient_forConstraint__once, &__block_literal_global_7);
  }
  if (([v12 isCompatibleWithAnchor:self] & 1) == 0
    && ![(NSLayoutAnchor *)self isCompatibleWithAnchor:v12])
  {
    uint64_t v15 = [NSString stringWithFormat:@"Constraint improperly relates anchors of incompatible types: %@", a5];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidLayoutConstraintException" reason:v15 userInfo:0]);
  }
  if (v9) {
    v14 = (void *)v9;
  }
  else {
    v14 = v10;
  }
  objc_msgSend(v14, "nsli_engineToUserScalingCoefficients");
  double v17 = v16;
  if ([(NSLayoutAnchor *)self _anchorType] == 2)
  {
    id v18 = [(NSLayoutAnchor *)self _proxiedItem];
    int64_t v19 = [(NSLayoutAnchor *)self _proxiedAttribute];
    return objc_msgSend(v18, "nsli_lowerAttribute:intoExpression:withCoefficient:forConstraint:", v19, a3, a5, a4);
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v21 = (id)objc_msgSend(v10, "nsli_itemDescribingLayoutDirectionForConstraint:toItem:", a5, v13);
    }
    else {
      id v21 = +[NSLayoutConstraint _findCommonAncestorOfItem:v10 andItem:v13];
    }
    double v26 = 0.0;
    v25[0] = _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(self, v12, 0, v21, &v26);
    v25[1] = [a5 container];
    v25[2] = [a3 engine];
    id v22 = [(NSLayoutAnchor *)self _expressionInContext:v25];
    [v22 constant];
    double v24 = v23;
    [v22 incrementConstant:-v23];
    [a3 addExpression:v22 times:v17 * v26 * a4];
    [a3 incrementConstant:v24 * (v26 * a4)];
    return 1;
  }
}

- (id)_nearestAncestorLayoutItem
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSLayoutAnchor *)self _anchorType];
  if (!v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(NSLayoutAnchor *)self _referencedLayoutItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      char v9 = 0;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v5);
          }
          if (v9)
          {
            if (v8) {
              id v8 = +[NSLayoutConstraint _findCommonAncestorOfItem:v8 andItem:*(void *)(*((void *)&v12 + 1) + 8 * i)];
            }
          }
          else
          {
            id v8 = *(id *)(*((void *)&v12 + 1) + 8 * i);
          }
          char v9 = 1;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
      return v8;
    }
    return 0;
  }
  if (v3 != 1)
  {
    if (v3 == 2)
    {
      return [(NSLayoutAnchor *)self _proxiedItem];
    }
    return 0;
  }
  return [(NSLayoutAnchor *)self _referenceItem];
}

- (id)_proxiedItem
{
  if ([(NSLayoutAnchor *)self _anchorType] != 2) {
  return self->_referenceItem;
  }
}

- (int64_t)_anchorType
{
  return *((unsigned char *)self + 56) & 3;
}

- (int64_t)_proxiedAttribute
{
  if ([(NSLayoutAnchor *)self _anchorType] != 2) {
  return self->_attr;
  }
}

- (id)_referenceItem
{
  if ([(NSLayoutAnchor *)self _anchorType] != 1) {
  return self->_referenceItem;
  }
}

void __73__NSLayoutAnchor_nsli_lowerIntoExpression_withCoefficient_forConstraint___block_invoke()
{
  _CALSDKVersionInit();
  if ((_CAL_sdk_version_mask & 2) != 0)
  {
    unint64_t v0 = 3;
  }
  else if ((_CAL_sdk_version_mask & 4) != 0)
  {
    unint64_t v0 = 2;
  }
  else
  {
    unint64_t v0 = ((unint64_t)_CAL_sdk_version_mask >> 3) & 1;
  }
  nsli_lowerIntoExpression_withCoefficient_forConstraint__assertionLevel = v0;
}

- (id)_equationDescriptionInParent
{
  if ([(NSString *)[(NSLayoutAnchor *)self name] length])
  {
    if ([(NSLayoutAnchor *)self _constraintItem])
    {
      return (id)[NSString stringWithFormat:@"%@.%@", objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_description"), -[NSLayoutAnchor name](self, "name")];
    }
    else
    {
      return [(NSLayoutAnchor *)self name];
    }
  }
  else
  {
    id result = [(NSLayoutAnchor *)self equationDescription];
    if (!result)
    {
      return 0;
    }
  }
  return result;
}

- (id)_constraintItem
{
  return self->_referenceItem;
}

- (id)_referencedLayoutItems
{
  id cachedReferenceItems = self->_cachedReferenceItems;
  if (!cachedReferenceItems)
  {
    id cachedReferenceItems = (id)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:2 capacity:0];
    [(NSLayoutAnchor *)self _accumulateReferenceLayoutItemsIntoTable:cachedReferenceItems];
    self->_id cachedReferenceItems = cachedReferenceItems;
  }
  return cachedReferenceItems;
}

- (void)_accumulateReferenceLayoutItemsIntoTable:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t v6 = [(NSLayoutAnchor *)self _anchorType];
  if (v6)
  {
    if (v6 == 1)
    {
      id v7 = [(NSLayoutAnchor *)self _referenceItem];
    }
    else
    {
      if (v6 != 2) {
        return;
      }
      id v7 = [(NSLayoutAnchor *)self _proxiedItem];
    }
    [a3 addObject:v7];
  }
  else if (self->_cachedReferenceItems)
  {
    objc_msgSend(a3, "unionHashTable:");
  }
  else if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)[(NSLayoutAnchor *)self _childAnchors];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) _accumulateReferenceLayoutItemsIntoTable:a3];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  else
  {
  }
}

- (NSString)name
{
  id result = self->_name;
  if (!result)
  {
    if ([(NSLayoutAnchor *)self _constraintAttribute])
    {
      unsigned int v4 = [(NSLayoutAnchor *)self _constraintAttribute];
      if (v4 > 0x25) {
        id v5 = 0;
      }
      else {
        id v5 = (void *)qword_1E5C57578[v4];
      }
      id result = (NSString *)[v5 copy];
      self->_name = result;
    }
    else
    {
      id result = self->_name;
    }
  }
  if (!result) {
    return (NSString *)&stru_1EFB3B738;
  }
  return result;
}

+ (id)anchorNamed:(id)a3 inItem:(id)a4 symbolicAttribute:(int64_t)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSLayoutAnchor.m", 570, @"NSLayoutAnchor cannot be created without an name.");
    if (a4) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSLayoutAnchor.m", 571, @"NSLayoutAnchor cannot be created without an item.");
LABEL_3:
  uint64_t v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndependentVariableName:a3 item:a4 symbolicAttribute:a5];
  return v10;
}

- (NSLayoutAnchor)initWithIndependentVariableName:(id)a3 item:(id)a4 symbolicAttribute:(int64_t)a5
{
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(a4, "nsli_canHostIndependentVariableAnchor") & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutAnchor.m", 577, @"NSLayoutAnchor must be related to a view.");
  }
  if (![a3 length]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutAnchor.m", 578, @"NSLayoutAnchor should have a name describing the geometry it represents.");
  }
  id result = [(NSLayoutAnchor *)self initWithName:a3 referenceItem:a4 symbolicAttribute:a5];
  if (result) {
    *((unsigned char *)result + 56) = *((unsigned char *)result + 56) & 0xFC | 1;
  }
  return result;
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutAnchor *)anchor
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:0 toAnchor:anchor multiplier:1.0 constant:0.0];
}

+ (id)_anchorForItem:(id)a3 attribute:(int64_t)a4
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSLayoutAnchor.m", 415, @"Invalid parameter not satisfying: %@", @"item != nil");
  }
  if (((objc_opt_respondsToSelector() & 1) == 0
     || (id result = (id)objc_msgSend(a3, "nsli_layoutAnchorForAttribute:", a4)) == 0)
    && ((unint64_t)(a4 - 1) > 9
     || (uint64_t v7 = (uint64_t)*off_1E5C57528[a4 - 1]) == 0
     || (objc_opt_respondsToSelector() & 1) == 0
     || (id result = (id)[a3 performSelector:v7]) == 0))
  {
    id v8 = (void *)_AnchorClassForAttribute(a4);
    return (id)[v8 anchorWithItem:a3 attribute:a4];
  }
  return result;
}

- (NSLayoutAnchor)initWithItem:(id)a3 attribute:(int64_t)a4
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutAnchor.m", 540, @"NSLayoutAnchor cannot be created without an item.");
  }
  uint64_t v8 = objc_opt_class();
  if (v8 != _AnchorClassForAttribute(a4))
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = (objc_class *)objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"NSLayoutAnchor.m", 541, @"%@ cannot create anchor for proxy attribute %d with item %@", NSStringFromClass(v11), a4, a3 object file lineNumber description];
  }
  id result = [(NSLayoutAnchor *)self initWithName:0 referenceItem:a3 symbolicAttribute:a4];
  if (result) {
    *((unsigned char *)result + 56) = *((unsigned char *)result + 56) & 0xFC | 2;
  }
  return result;
}

- (NSLayoutAnchor)initWithName:(id)a3 referenceItem:(id)a4 symbolicAttribute:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NSLayoutAnchor;
  uint64_t v8 = [(NSLayoutAnchor *)&v10 init];
  if (v8)
  {
    v8->_name = (NSString *)[a3 copy];
    v8->_referenceItem = a4;
    v8->_attr = a5;
  }
  return v8;
}

+ (NSLayoutAnchor)anchorWithItem:(id)a3 attribute:(int64_t)a4
{
  unsigned int v4 = (void *)[objc_alloc((Class)a1) initWithItem:a3 attribute:a4];
  return (NSLayoutAnchor *)v4;
}

- (void)dealloc
{
  self->_referenceItem = 0;

  self->_variable = 0;
  self->_name = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutAnchor;
  [(NSLayoutAnchor *)&v3 dealloc];
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:0 toAnchor:anchor multiplier:1.0 constant:c];
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:1 toAnchor:anchor multiplier:1.0 constant:0.0];
}

+ (id)anchorNamed:(id)a3 inItem:(id)a4
{
  return (id)[a1 anchorNamed:a3 inItem:a4 symbolicAttribute:0];
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:-1 toAnchor:anchor multiplier:1.0 constant:0.0];
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:1 toAnchor:anchor multiplier:1.0 constant:c];
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:-1 toAnchor:anchor multiplier:1.0 constant:c];
}

- (id)_expressionInContext:(id *)a3
{
  int64_t v6 = [(NSLayoutAnchor *)self _anchorType];
  if (v6)
  {
    if (v6 == 1)
    {
      a2 = (SEL)+[NSISLinearExpression newExpressionWithCapacity:1 engine:a3->var2];
      [(id)a2 addVariable:-[NSLayoutAnchor _anchorVariable]((NSISVariable *)self) coefficient:1.0];
      id v19 = [(NSLayoutAnchor *)self _referenceItem];
      id var1 = a3->var1;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v19, "nsli_lowersExpressionRelativeToConstraintContainer"))
      {
        if (objc_opt_isKindOfClass())
        {
          if (v19 != var1)
          {
            do
            {
              id v21 = (id)objc_msgSend(v19, "nsli_superitem");
              if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v21, "nsli_isFlipped"))
              {
                objc_msgSend((id)a2, "addVariable:coefficient:", objc_msgSend(v21, "nsli_boundsHeightVariable"), 1.0);
                objc_msgSend((id)a2, "addVariable:coefficient:", objc_msgSend(v19, "nsli_minYVariable"), -1.0);
                uint64_t v22 = objc_msgSend(v19, "nsli_boundsHeightVariable");
                double v23 = -1.0;
              }
              else
              {
                uint64_t v22 = objc_msgSend(v19, "nsli_minYVariable");
                double v23 = 1.0;
              }
              [(id)a2 addVariable:v22 coefficient:v23];
              id v19 = v21;
            }
            while (v21 != var1);
          }
        }
        else if ((objc_opt_isKindOfClass() & 1) != 0 && v19 != var1)
        {
          do
          {
            objc_msgSend((id)a2, "addVariable:coefficient:", objc_msgSend(v19, "nsli_minXVariable"), 1.0);
            id v19 = (id)objc_msgSend(v19, "nsli_superitem");
          }
          while (v19 != var1);
        }
      }
    }
    else if (v6 == 2)
    {
      id v7 = [(NSLayoutAnchor *)self _proxiedItem];
      int64_t v8 = [(NSLayoutAnchor *)self _proxiedAttribute];
      id v9 = a3->var1;
      a2 = [[NSISLinearExpression alloc] initWithEngine:a3->var2];
      objc_super v10 = +[NSLayoutConstraint constraintWithItem:v7 attribute:v8 relatedBy:0 toItem:v7 attribute:v8];
      [(NSLayoutConstraint *)v10 setContainer:v9];
      double v11 = 1.0;
      objc_msgSend(v7, "nsli_lowerAttribute:intoExpression:withCoefficient:forConstraint:", v8, a2, v10, 1.0);
      id v12 = [(NSLayoutConstraint *)v10 container];
      if (!v12) {
        id v12 = v7;
      }
      objc_msgSend(v12, "nsli_engineToUserScalingCoefficients");
      double v14 = v13;
      double v16 = v15;
      if (objc_msgSend(v7, "nsli_isRTL") && (v8 - 5) <= 0xE) {
        double v11 = dbl_1A64B9570[(int)v8 - 5];
      }
      if ((v8 > 0x25) | (0x15FFEE62E6uLL >> v8) & 1) {
        double v16 = v14;
      }
      [(id)a2 constant];
      double v18 = v17;
      [(id)a2 incrementConstant:-v17];
      [(id)a2 scaleBy:v11 / v16];
      [(id)a2 incrementConstant:v18];
    }
  }
  else
  {
    return 0;
  }
  return (id)a2;
}

- (BOOL)isEqual:(id)a3
{
  if (_NSConstraintBasedLayoutAnchorEquivalence())
  {
    if (a3 == self)
    {
      return 1;
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 0;
      }
      id v5 = [(NSLayoutAnchor *)self _nearestAncestorLayoutItem];
      uint64_t v6 = [a3 _nearestAncestorLayoutItem];
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v5 == (id)v6)
        {
LABEL_15:
          int64_t v8 = objc_alloc_init(NSISEngine);
          uint64_t v9 = objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem"), "nsli_isRTL");
          uint64_t v13 = v9;
          uint64_t v14 = 0;
          double v15 = v8;
          id v10 = [(NSLayoutAnchor *)self _expressionInContext:&v13];
          uint64_t v13 = v9;
          uint64_t v14 = 0;
          double v15 = v8;
          char v7 = objc_msgSend(v10, "isEqual:", objc_msgSend(a3, "_expressionInContext:", &v13));

          return v7;
        }
        return 0;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 0;
      }
      char v7 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0 && v5 == (id)v6) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSLayoutAnchor;
    return [(NSLayoutAnchor *)&v12 isEqual:a3];
  }
  return v7;
}

- (id)ruleEqualToAnchor:(id)a3
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, 0.0);
}

- (double)ruleEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5
{
  if (result)
  {
    id v5 = -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:]([NSLayoutAnchorRule alloc], result, a2, 0, a3, a4, a5);
    return v5;
  }
  return result;
}

- (id)ruleGreaterThanOrEqualToAnchor:(id)a3
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, 0.0);
}

- (double)ruleGreaterThanOrEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5
{
  if (result)
  {
    id v5 = -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:]([NSLayoutAnchorRule alloc], result, a2, 1, a3, a4, a5);
    return v5;
  }
  return result;
}

- (id)ruleLessThanOrEqualToAnchor:(id)a3
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, 0.0);
}

- (double)ruleLessThanOrEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5
{
  if (result)
  {
    id v5 = -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:]([NSLayoutAnchorRule alloc], result, a2, -1, a3, a4, a5);
    return v5;
  }
  return result;
}

- (id)ruleEqualToAnchor:(id)a3 constant:(double)a4
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleLessThanOrEqualToAnchor:(id)a3 constant:(double)a4
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleLessThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (void)rulesAffectingLayout
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = objc_msgSend((id)objc_msgSend(a1, "constraintsAffectingLayout"), "valueForKey:", @"_ancestorRuleNodes");
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v1 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v1);
        }
        int64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v2 addObjectsFromArray:v8];
        if ((objc_msgSend(v3, "containsObject:", objc_msgSend(v8, "lastObject")) & 1) == 0) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v8, "lastObject"));
        }
      }
      uint64_t v5 = [v1 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F28E78] string];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v3);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __57__NSLayoutAnchor_NSLayoutRuleDebug__rulesAffectingLayout__block_invoke;
        v16[3] = &unk_1E5C571F8;
        v16[4] = v2;
        _NSRuleNodeAppendDebugDescription(v14, v9, 0, (uint64_t)v16);
      }
      uint64_t v11 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }
  return v9;
}

uint64_t __57__NSLayoutAnchor_NSLayoutRuleDebug__rulesAffectingLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (NSLayoutAnchor)init
{
  return [(NSLayoutAnchor *)self initWithName:0 referenceItem:0 symbolicAttribute:0];
}

- (NSLayoutAnchor)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutAnchor.m", 190, @"NSLayoutAnchor decoding requires keyed coding");
  }
  if ([a3 containsValueForKey:@"NSLayoutAnchor_type"]) {
    uint64_t v6 = [a3 decodeIntegerForKey:@"NSLayoutAnchor_type"];
  }
  else {
    uint64_t v6 = 2;
  }
  *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xFC | v6 & 3;
  char v7 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_name"];
  uint64_t v8 = [a3 decodeObjectForKey:@"NSLayoutAnchor_referenceView"];
  if ([a3 containsValueForKey:@"NSLayoutAnchor_attr"])
  {
    uint64_t v9 = [a3 decodeIntegerForKey:@"NSLayoutAnchor_attr"];
    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v6)
    {
LABEL_8:
      if (v6 == 1)
      {
        if (!v8)
        {
LABEL_22:
          uint64_t v13 = @"An anchor's reference view was not included in the archive.";
LABEL_24:

          objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4865, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E4F28568])));
          return 0;
        }
        if (!v7)
        {
          uint64_t v13 = @"An anchor's name was not included in the archive.";
          goto LABEL_24;
        }
        self = [(NSLayoutAnchor *)self initWithIndependentVariableName:v7 item:v8 symbolicAttribute:v9];
        uint64_t v12 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_variable"];
        if (v12)
        {
          if (!self->_variable)
          {
            self->_variable = (NSISVariable *)v12;
            return self;
          }
          uint64_t v13 = @"Can't decode anchor from corrupt archive.";
          goto LABEL_24;
        }
      }
      else if (v6 == 2)
      {
        if (v8)
        {
          uint64_t v10 = [(NSLayoutAnchor *)self initWithItem:v8 attribute:v9];
          self = v10;
          if (v7)
          {

            self->_name = (NSString *)[v7 copy];
          }
          return self;
        }
        goto LABEL_22;
      }
      return self;
    }
  }
  return [(NSLayoutAnchor *)self initWithName:v7 referenceItem:v8 symbolicAttribute:v9];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutAnchor.m", 250, @"NSLayoutAnchor encoding requires keyed coding");
  }
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSLayoutAnchor _anchorType](self, "_anchorType"), @"NSLayoutAnchor_type");
  [a3 encodeConditionalObject:self->_referenceItem forKey:@"NSLayoutAnchor_referenceView"];
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"NSLayoutAnchor_name"];
  }
  int64_t attr = self->_attr;
  if (attr) {
    [a3 encodeInteger:attr forKey:@"NSLayoutAnchor_attr"];
  }
  if (self->_variable)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (unint64_t)hash
{
  if (_NSConstraintBasedLayoutAnchorEquivalence())
  {
    objc_super v3 = objc_alloc_init(NSISEngine);
    v7[0] = objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem"), "nsli_isRTL");
    v7[1] = 0;
    v7[2] = v3;
    unint64_t v4 = objc_msgSend(-[NSLayoutAnchor _expressionInContext:](self, "_expressionInContext:", v7), "hash");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSLayoutAnchor;
    return [(NSLayoutAnchor *)&v6 hash];
  }
  return v4;
}

- (NSLayoutAnchor)initWithAnchor:(id)a3
{
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class()) {
  char v7 = [(NSLayoutAnchor *)self initWithName:*((void *)a3 + 4) referenceItem:*((void *)a3 + 1) symbolicAttribute:*((void *)a3 + 2)];
  }
  uint64_t v8 = v7;
  if (v7)
  {
    char v9 = *((unsigned char *)a3 + 56);
    *((unsigned char *)v7 + 56) = *((unsigned char *)v7 + 56) & 0xFC | v9 & 3;
    if ((v9 & 3) == 1) {
      v7->_variable = -[NSLayoutAnchor _anchorVariable]((NSISVariable *)a3);
    }
  }
  return v8;
}

- (id)_constituentAnchors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id AssociatedObject = objc_getAssociatedObject(self, sel__constituentAnchors);
  if (!AssociatedObject)
  {
    id AssociatedObject = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    if (objc_opt_respondsToSelector())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      unint64_t v4 = (void *)[(NSLayoutAnchor *)self _childAnchors];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            [AssociatedObject addObject:v9];
            uint64_t v10 = [v9 _constituentAnchors];
            if (v10) {
              [AssociatedObject addObjectsFromArray:v10];
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
    }
    objc_setAssociatedObject(self, sel__constituentAnchors, AssociatedObject, (void *)0x303);
  }
  return AssociatedObject;
}

- (id)_expressionInDefaultContextWithEngine:(id)a3
{
  v4[0] = 0;
  v4[1] = 0;
  v4[2] = a3;
  return [(NSLayoutAnchor *)self _expressionInContext:v4];
}

- (NSLayoutAnchor)anchorWithName:(id)a3 referenceItem:(id)a4 symbolicAttribute:(int64_t)a5
{
  uint64_t v8 = [objc_alloc((Class)objc_opt_class()) initWithAnchor:self];

  *(void *)(v8 + 32) = [a3 copy];
  *(void *)(v8 + 8) = a4;
  *(void *)(v8 + 16) = a5;
  return (NSLayoutAnchor *)(id)v8;
}

- (NSLayoutAnchor)anchorWithName:(id)a3
{
  id v5 = [(NSLayoutAnchor *)self _constraintItem];
  int64_t v6 = [(NSLayoutAnchor *)self _constraintAttribute];
  return [(NSLayoutAnchor *)self anchorWithName:a3 referenceItem:v5 symbolicAttribute:v6];
}

- (id)item
{
  return self->_referenceItem;
}

- (id)_variableName
{
  if ([(NSLayoutAnchor *)self _anchorType] != 1) {
  unint64_t v4 = self->_name;
  }
  return v4;
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  return 0;
}

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  return 0;
}

- (id)equationDescription
{
  return 0;
}

- (id)_equationDescriptionLegendEntries
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)[(NSLayoutAnchor *)self name] length]
    && [(NSLayoutAnchor *)self _constraintItem])
  {
    char v3 = objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_descriptionIncludesPointer");
    unint64_t v4 = (void *)MEMORY[0x1E4F1CAA0];
    if (v3)
    {
      id v5 = (void *)MEMORY[0x1E4F1CAA0];
LABEL_18:
      return (id)[v5 orderedSet];
    }
    uint64_t v14 = objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_description"), "stringByAppendingFormat:", @":%p", -[NSLayoutAnchor _constraintItem](self, "_constraintItem"));
    return (id)[v4 orderedSetWithObject:v14];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v5 = (void *)MEMORY[0x1E4F1CAA0];
      goto LABEL_18;
    }
    int64_t v6 = (void *)[(NSLayoutAnchor *)self _childAnchors];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v6, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "name"), "length")) {
            objc_msgSend(v7, "addObject:", objc_msgSend((id)objc_msgSend(v12, "_equationDescriptionInParent"), "stringByAppendingFormat:", @":%p", v12));
          }
          else {
            objc_msgSend(v7, "unionOrderedSet:", objc_msgSend(v12, "_equationDescriptionLegendEntries"));
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    return v7;
  }
}

- (double)_valueInEngine:(id)a3
{
  int64_t v6 = [(NSLayoutAnchor *)self _anchorType];
  if (!v6)
  {
    return 0.0;
  }
  if (v6 != 1)
  {
    if (v6 == 2)
    {
      goto LABEL_5;
    }
    return 0.0;
  }
LABEL_5:
  uint64_t v7 = -[NSLayoutAnchor _anchorVariable]((NSISVariable *)self);
  [a3 valueForVariable:v7];
  return result;
}

- (void)_dependentVariables
{
  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(NSISEngine);
    uint64_t v3 = objc_msgSend((id)objc_msgSend(v1, "_expressionInDefaultContextWithEngine:", v2), "variablesArray");

    return (void *)v3;
  }
  return result;
}

- (BOOL)hasAmbiguousLayout
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = -[NSLayoutAnchor _dependentVariables](self);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v3);
      }
      if (v6) {
        char v6 = 1;
      }
      else {
        char v6 = objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem", (void)v10), "nsli_layoutEngine"), "valueOfVariableIsAmbiguous:", *(void *)(*((void *)&v10 + 1) + 8 * i));
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (NSArray)constraintsAffectingLayout
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = -[NSLayoutAnchor _dependentVariables](self);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem", (void)v11), "nsli_layoutEngine"), "constraintsAffectingValueOfVariable:", *(void *)(*((void *)&v11 + 1) + 8 * i));
        if (v6) {
          char v6 = [(NSArray *)v6 arrayByAddingObjectsFromArray:v9];
        }
        else {
          char v6 = (NSArray *)v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }
  if (v6) {
    return v6;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (uint64_t)_isReferencedByConstraint:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ((objc_msgSend((id)objc_msgSend(a2, "firstAnchor"), "isEqual:", result) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a2, "secondAnchor"), "isEqual:", v3) & 1) != 0
      || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "firstAnchor"), "_constituentAnchors"), "containsObject:", v3) & 1) != 0)
    {
      return 1;
    }
    else
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "secondAnchor"), "_constituentAnchors");
      return [v4 containsObject:v3];
    }
  }
  return result;
}

- (id)_referencingConstraints
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSLayoutAnchor *)self _nearestAncestorLayoutItem];
  for (i = objc_alloc_init(MEMORY[0x1E4F1CA48]); v3; id v3 = (id)objc_msgSend(v3, "nsli_superitem"))
  {
    uint64_t v5 = objc_msgSend(v3, "nsli_installedConstraints");
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * j);
          if (-[NSLayoutAnchor _isReferencedByConstraint:]((uint64_t)self, v10)) {
            [i addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return i;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"<%s:%p", class_getName(v4), self);
  if ([(NSString *)[(NSLayoutAnchor *)self name] length])
  {
    [v5 appendString:@" \""];
    if ([(NSLayoutAnchor *)self _constraintItem])
    {
      objc_msgSend(v5, "appendString:", objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_description"));
      [v5 appendString:@"."];
    }
    objc_msgSend(v5, "appendString:", -[NSLayoutAnchor name](self, "name"));
    [v5 appendString:@"\""];
  }
  id v6 = [(NSLayoutAnchor *)self equationDescription];
  if (v6)
  {
    id v7 = v6;
    if ([v6 length])
    {
      [v5 appendString:v7];
    }
  }
  id v8 = [(NSLayoutAnchor *)self _equationDescriptionLegendEntries];
  if (v8)
  {
    uint64_t v9 = v8;
    if ([v8 count])
    {
      objc_msgSend(v5, "appendString:", @" (names: ");
      [v5 appendString:objc_msgSend((id)objc_msgSend(v9, "array"), "componentsJoinedByString:", @", ")];
      [v5 appendString:@""]);
    }
  }
  return (id)[v5 stringByAppendingString:@">"];
}

- (void)_expressionForValueInItem:(void *)a1
{
  v2 = a1;
  if (!a1) {
    return v2;
  }
  if (!a2) {
  uint64_t v4 = (void *)[v2 _nearestAncestorLayoutItem];
  }
  if (v4) {
    id v5 = +[NSLayoutConstraint _findCommonAncestorOfItem:v4 andItem:a2];
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = objc_msgSend(v4, "nsli_layoutEngine");
  if (!v6) {
  if (v6 == objc_msgSend(a2, "nsli_layoutEngine"))
  }
  {
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__expressionForValueInItem_, v2, @"NSLayoutAnchor.m", 1190, @"Expected anchors (%@)'s ancestor item (%@) and provided item (%@) to be in same layout engine.", v2, v4, a2);
    if (v5) {
      goto LABEL_11;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__expressionForValueInItem_, v2, @"NSLayoutAnchor.m", 1191, @"Expected common ancestor between anchor (%@)'s ancestor item (%@) and provided item (%@)", v2, v4, a2);
LABEL_11:
  objc_msgSend(a2, "nsli_engineToUserScalingCoefficients");
  double v8 = v7;
  double v10 = v9;
  if (objc_opt_isKindOfClass())
  {
    id v11 = +[NSLayoutAnchor _anchorForItem:a2 attribute:1];
  }
  else
  {
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend(a2, "nsli_isFlipped"))
      {
        id v11 = +[NSLayoutAnchor _anchorForItem:a2 attribute:3];
        double v12 = 1.0;
        double v8 = v10;
      }
      else
      {
        double v8 = -v10;
        id v11 = +[NSLayoutAnchor _anchorForItem:a2 attribute:4];
        double v12 = -1.0;
      }
      goto LABEL_21;
    }
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__expressionForValueInItem_, v2, @"NSLayoutAnchor.m", 1217, @"Unexpected anchor type (%@) is not able to be compared", v2);
      id v11 = 0;
      double v8 = 1.0;
    }
  }
  double v12 = 1.0;
LABEL_21:
  uint64_t v13 = _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(v2, 0, 0, v5, 0);
  uint64_t v17 = v13;
  id v18 = v5;
  uint64_t v19 = v6;
  v2 = (void *)[v2 _expressionInContext:&v17];
  if (v11)
  {
    uint64_t v17 = v13;
    id v18 = v5;
    uint64_t v19 = v6;
    objc_msgSend(v2, "addExpression:times:", objc_msgSend(v11, "_expressionInContext:", &v17), -1.0);
  }
  [v2 constant];
  double v15 = v14;
  [v2 incrementConstant:-v14];
  [v2 scaleBy:v8];
  [v2 incrementConstant:v12 * v15];
  return v2;
}

- (double)valueInItem:(id)a3
{
  if (!a3) {
  uint64_t v6 = objc_msgSend(a3, "nsli_layoutEngine");
  }
  if (!v6) {
  double v7 = -[NSLayoutAnchor _expressionForValueInItem:](self, a3);
  }
  [v6 valueForExpression:v7];
  return result;
}

- (id)observableValueInItem:(id)a3
{
  uint64_t v6 = objc_msgSend(a3, "nsli_layoutEngine");
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutAnchor.m", 1249, @"Requires layout item to have layout engine");
  }
  double v7 = -[NSLayoutAnchor _expressionForValueInItem:](self, a3);
  if ([v7 variableCount])
  {
    return +[_NSISLinearExpressionObservable observableForExpression:v7 inEngine:v6];
  }
  else
  {
    id result = (id)observableValueInItem__nullObservationSource;
    if (!observableValueInItem__nullObservationSource)
    {
      id result = (id)objc_opt_new();
      observableValueInItem__nullObservationSource = (uint64_t)result;
    }
  }
  return result;
}

@end