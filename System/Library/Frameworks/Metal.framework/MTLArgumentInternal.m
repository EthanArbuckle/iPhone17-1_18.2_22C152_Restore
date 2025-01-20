@interface MTLArgumentInternal
- (MTLArgumentInternal)initWithBinding:(id)a3;
- (void)dealloc;
@end

@implementation MTLArgumentInternal

- (MTLArgumentInternal)initWithBinding:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLArgumentInternal;
  v4 = [(MTLArgumentInternal *)&v6 init];
  v4->_binding = (MTLBindingInternal *)a3;
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLArgumentInternal;
  [(MTLArgumentInternal *)&v3 dealloc];
}

@end