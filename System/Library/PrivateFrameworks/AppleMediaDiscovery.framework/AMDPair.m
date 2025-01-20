@interface AMDPair
- (AMDPair)initWith:(id)a3 and:(id)a4;
- (id)first;
- (id)firstElement;
- (id)second;
- (id)secondElement;
- (void)setFirstElement:(id)a3;
- (void)setSecondElement:(id)a3;
@end

@implementation AMDPair

- (AMDPair)initWith:(id)a3 and:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [(AMDPair *)v9 setFirstElement:location[0]];
  [(AMDPair *)v9 setSecondElement:v7];
  v6 = v9;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (id)first
{
  return [(AMDPair *)self firstElement];
}

- (id)second
{
  return [(AMDPair *)self secondElement];
}

- (id)firstElement
{
  return self->_firstElement;
}

- (void)setFirstElement:(id)a3
{
}

- (id)secondElement
{
  return self->_secondElement;
}

- (void)setSecondElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end