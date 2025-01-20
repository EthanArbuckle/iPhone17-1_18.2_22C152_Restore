@interface _BKGraphStructureNode
- (_BKGraphStructureNode)init;
@end

@implementation _BKGraphStructureNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_subnodes, 0);

  objc_storeStrong((id *)&self->_supernode, 0);
}

- (_BKGraphStructureNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)_BKGraphStructureNode;
  v2 = [(_BKGraphStructureNode *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subnodes = v2->_subnodes;
    v2->_subnodes = v3;
  }
  return v2;
}

@end