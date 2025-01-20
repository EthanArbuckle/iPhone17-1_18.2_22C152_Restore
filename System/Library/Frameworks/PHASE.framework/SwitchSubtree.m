@interface SwitchSubtree
- (NSString)switchValue;
- (PHASESoundEventNodeDefinition)subtree;
- (void)setSubtree:(id)a3;
- (void)setSwitchValue:(id)a3;
@end

@implementation SwitchSubtree

- (PHASESoundEventNodeDefinition)subtree
{
  return self->_subtree;
}

- (void)setSubtree:(id)a3
{
}

- (NSString)switchValue
{
  return self->_switchValue;
}

- (void)setSwitchValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchValue, 0);

  objc_storeStrong((id *)&self->_subtree, 0);
}

@end