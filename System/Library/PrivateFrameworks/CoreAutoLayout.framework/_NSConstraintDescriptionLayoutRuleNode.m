@interface _NSConstraintDescriptionLayoutRuleNode
- (NSLayoutConstraint)ownedConstraint;
- (void)dealloc;
- (void)setOwnedConstraint:(id)a3;
@end

@implementation _NSConstraintDescriptionLayoutRuleNode

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSConstraintDescriptionLayoutRuleNode;
  [(_NSLayoutRuleNode *)&v3 dealloc];
}

- (NSLayoutConstraint)ownedConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOwnedConstraint:(id)a3
{
}

@end