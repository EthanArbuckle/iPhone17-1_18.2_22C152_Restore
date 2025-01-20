@interface ACLSIPv6Range
- (ACLSIPv6Range)initWithFirst:(const in6_addr *)a3 andLast:(const in6_addr *)a4;
- (BOOL)containsAddress:(const in6_addr *)a3;
- (id)description;
- (in6_addr)first;
- (in6_addr)last;
- (void)setFirst:(in6_addr)a3;
- (void)setLast:(in6_addr)a3;
@end

@implementation ACLSIPv6Range

- (ACLSIPv6Range)initWithFirst:(const in6_addr *)a3 andLast:(const in6_addr *)a4
{
  unint64_t v6 = bswap64(*(void *)a3->__u6_addr8);
  unint64_t v7 = bswap64(*(void *)a4->__u6_addr8);
  if (v6 == v7
    && (unint64_t v6 = bswap64(*(void *)&a3->__u6_addr32[2]), v7 = bswap64(*(void *)&a4->__u6_addr32[2]), v6 == v7))
  {
    int v8 = 0;
  }
  else if (v6 < v7)
  {
    int v8 = -1;
  }
  else
  {
    int v8 = 1;
  }
  if (v8 <= 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)ACLSIPv6Range;
    v10 = [(ACLSIPv6Range *)&v13 init];
    v11 = v10;
    if (v10)
    {
      -[ACLSIPv6Range setFirst:](v10, "setFirst:", *(void *)a3->__u6_addr8, *(void *)&a3->__u6_addr32[2]);
      -[ACLSIPv6Range setLast:](v11, "setLast:", *(void *)a4->__u6_addr8, *(void *)&a4->__u6_addr32[2]);
    }
    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsAddress:(const in6_addr *)a3
{
  unint64_t v3 = bswap64(*(void *)self->_first.__u6_addr8);
  unint64_t v4 = bswap64(*(void *)a3->__u6_addr8);
  if (v3 == v4
    && (unint64_t v3 = bswap64(*(void *)&self->_first.__u6_addr32[2]), v4 = bswap64(*(void *)&a3->__u6_addr32[2]), v3 == v4))
  {
    int v5 = 0;
  }
  else if (v3 < v4)
  {
    int v5 = -1;
  }
  else
  {
    int v5 = 1;
  }
  if (v5 > 0) {
    return 0;
  }
  unint64_t v7 = bswap64(*(void *)a3->__u6_addr8);
  unint64_t v8 = bswap64(*(void *)self->_last.__u6_addr8);
  if (v7 == v8
    && (unint64_t v7 = bswap64(*(void *)&a3->__u6_addr32[2]), v8 = bswap64(*(void *)&self->_last.__u6_addr32[2]), v7 == v8))
  {
    int v9 = 0;
  }
  else if (v7 < v8)
  {
    int v9 = -1;
  }
  else
  {
    int v9 = 1;
  }
  return v9 < 1;
}

- (id)description
{
  p_last = &self->_last;
  BOOL v4 = *(void *)self->_first.__u6_addr8 != *(void *)self->_last.__u6_addr8
    || *(void *)&self->_first.__u6_addr32[2] != *(void *)&self->_last.__u6_addr32[2];
  uint64_t v5 = +[ACLSNetworkUtilities stringFromInaddr6:](ACLSNetworkUtilities, "stringFromInaddr6:");
  unint64_t v6 = (void *)v5;
  if (v4)
  {
    unint64_t v7 = +[ACLSNetworkUtilities stringFromInaddr6:p_last];
    unint64_t v8 = +[NSString stringWithFormat:@"%@-%@", v6, v7];
  }
  else
  {
    unint64_t v8 = +[NSString stringWithFormat:@"%@", v5];
  }

  return v8;
}

- (in6_addr)first
{
  objc_copyStruct(v4, &self->_first, 16, 1, 0);
  uint64_t v2 = v4[0];
  uint64_t v3 = v4[1];
  *(void *)&result.__u6_addr32[2] = v3;
  *(void *)result.__u6_addr8 = v2;
  return result;
}

- (void)setFirst:(in6_addr)a3
{
  in6_addr v3 = a3;
  objc_copyStruct(&self->_first, &v3, 16, 1, 0);
}

- (in6_addr)last
{
  objc_copyStruct(v4, &self->_last, 16, 1, 0);
  uint64_t v2 = v4[0];
  uint64_t v3 = v4[1];
  *(void *)&result.__u6_addr32[2] = v3;
  *(void *)result.__u6_addr8 = v2;
  return result;
}

- (void)setLast:(in6_addr)a3
{
  in6_addr v3 = a3;
  objc_copyStruct(&self->_last, &v3, 16, 1, 0);
}

@end