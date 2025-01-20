@interface MAAbstractNode
- (MAAbstractNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
@end

@implementation MAAbstractNode

- (MAAbstractNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)MAAbstractNode;
  v6 = -[MAConcreteNode initWithLabel:domain:weight:properties:](&v9, sel_initWithLabel_domain_weight_properties_, a3, a4, a6);
  if (v6)
  {
    v7 = [[MANodeLegacyImplementation alloc] initWithNode:v6];
    [(MANode *)v6 setImplementation:v7];
  }
  return v6;
}

@end