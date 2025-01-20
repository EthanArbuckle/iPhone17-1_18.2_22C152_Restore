@interface _NSLayoutRuleNode
- (NSLayoutRule)representedRule;
- (_NSLayoutRuleNode)initWithRule:(id)a3;
- (_NSLayoutRuleNodeParent)parentNode;
- (id)description;
- (void)dealloc;
- (void)setParentNode:(id)a3;
- (void)setRepresentedRule:(id)a3;
@end

@implementation _NSLayoutRuleNode

- (_NSLayoutRuleNode)initWithRule:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSLayoutRuleNode;
  v4 = [(_NSLayoutRuleNode *)&v6 init];
  if (v4) {
    v4->_representedRule = (NSLayoutRule *)[a3 copyWithZone:0];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSLayoutRuleNode;
  [(_NSLayoutRuleNode *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v4), self, -[NSLayoutRule description](self->_representedRule, "description")];
}

- (NSLayoutRule)representedRule
{
  return (NSLayoutRule *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRepresentedRule:(id)a3
{
}

- (_NSLayoutRuleNodeParent)parentNode
{
  return self->_parentNode;
}

- (void)setParentNode:(id)a3
{
  self->_parentNode = (_NSLayoutRuleNodeParent *)a3;
}

@end