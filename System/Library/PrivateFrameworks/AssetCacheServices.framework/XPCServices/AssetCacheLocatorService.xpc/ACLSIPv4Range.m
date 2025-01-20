@interface ACLSIPv4Range
- (ACLSIPv4Range)initWithFirst:(const in_addr *)a3 andLast:(const in_addr *)a4;
- (BOOL)containsAddress:(const in_addr *)a3;
- (id)description;
- (in_addr)first;
- (in_addr)last;
- (void)setFirst:(in_addr)a3;
- (void)setLast:(in_addr)a3;
@end

@implementation ACLSIPv4Range

- (ACLSIPv4Range)initWithFirst:(const in_addr *)a3 andLast:(const in_addr *)a4
{
  unsigned int v4 = bswap32(a3->s_addr);
  unsigned int v5 = bswap32(a4->s_addr);
  BOOL v6 = v4 >= v5;
  BOOL v7 = v4 > v5;
  int v8 = !v6;
  if (v7 - v8 <= 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)ACLSIPv4Range;
    v12 = [(ACLSIPv4Range *)&v15 init];
    v13 = v12;
    if (v12)
    {
      [(ACLSIPv4Range *)v12 setFirst:a3->s_addr];
      [(ACLSIPv4Range *)v13 setLast:a4->s_addr];
    }
    self = v13;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsAddress:(const in_addr *)a3
{
  unsigned int v3 = bswap32(self->_first.s_addr);
  unsigned int v4 = bswap32(a3->s_addr);
  BOOL v5 = v3 >= v4;
  BOOL v6 = v3 > v4;
  int v7 = !v5;
  if (v6 - v7 > 0) {
    return 0;
  }
  unsigned int v9 = bswap32(a3->s_addr);
  unsigned int v10 = bswap32(self->_last.s_addr);
  BOOL v5 = v9 >= v10;
  BOOL v11 = v9 > v10;
  int v12 = !v5;
  return v11 - v12 < 1;
}

- (id)description
{
  in_addr_t s_addr = self->_first.s_addr;
  p_last = &self->_last;
  in_addr_t v4 = self->_last.s_addr;
  uint64_t v5 = +[ACLSNetworkUtilities stringFromInaddr4:](ACLSNetworkUtilities, "stringFromInaddr4:");
  BOOL v6 = (void *)v5;
  if (s_addr == v4)
  {
    int v8 = +[NSString stringWithFormat:@"%@", v5];
  }
  else
  {
    int v7 = +[ACLSNetworkUtilities stringFromInaddr4:p_last];
    int v8 = +[NSString stringWithFormat:@"%@-%@", v6, v7];
  }

  return v8;
}

- (in_addr)first
{
  return self->_first;
}

- (void)setFirst:(in_addr)a3
{
  self->_first = a3;
}

- (in_addr)last
{
  return self->_last;
}

- (void)setLast:(in_addr)a3
{
  self->_last = a3;
}

@end