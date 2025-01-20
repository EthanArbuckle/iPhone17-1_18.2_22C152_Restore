@interface GVEdge
- (BOOL)reversed;
- (GVEdge)init;
- (GVEdge)initWithFromNode:(id)a3 to:(id)a4;
- (GVNode)from;
- (GVNode)to;
- (NSMutableArray)dummies;
- (id)description;
- (void)dealloc;
- (void)setDummies:(id)a3;
- (void)setReversed:(BOOL)a3;
@end

@implementation GVEdge

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GVEdge;
  [(GVEdge *)&v3 dealloc];
}

- (GVEdge)init
{
  v5.receiver = self;
  v5.super_class = (Class)GVEdge;
  v2 = [(GVEdge *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->reversed = 0;
    v2->from = 0;
    v2->to = 0;
    v2->dummies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v3;
}

- (GVEdge)initWithFromNode:(id)a3 to:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GVEdge;
  v6 = [(GVEdge *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->from = (GVNode *)a3;
    v6->to = (GVNode *)a4;
    v6->reversed = 0;
    v6->dummies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v7;
}

- (id)description
{
  if (self->reversed) {
    v2 = @" (r)";
  }
  else {
    v2 = &stru_1F38DF480;
  }
  return (id)[NSString stringWithFormat:@"%p [%p -> %p%@]", self, self->from, self->to, v2];
}

- (GVNode)from
{
  return self->from;
}

- (GVNode)to
{
  return self->to;
}

- (NSMutableArray)dummies
{
  return self->dummies;
}

- (void)setDummies:(id)a3
{
}

- (BOOL)reversed
{
  return self->reversed;
}

- (void)setReversed:(BOOL)a3
{
  self->reversed = a3;
}

@end