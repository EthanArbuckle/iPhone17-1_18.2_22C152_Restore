@interface RandomSubtree
- (PHASESoundEventNodeDefinition)subtree;
- (double)weight;
- (void)setSubtree:(id)a3;
- (void)setWeight:(double)a3;
@end

@implementation RandomSubtree

- (PHASESoundEventNodeDefinition)subtree
{
  return self->_subtree;
}

- (void)setSubtree:(id)a3
{
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
}

@end