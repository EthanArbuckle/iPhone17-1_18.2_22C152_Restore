@interface MTRAccountLoginClusterLoggedOutEvent
- (MTRAccountLoginClusterLoggedOutEvent)init;
- (NSNumber)node;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNode:(id)a3;
@end

@implementation MTRAccountLoginClusterLoggedOutEvent

- (MTRAccountLoginClusterLoggedOutEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRAccountLoginClusterLoggedOutEvent;
  v2 = [(MTRAccountLoginClusterLoggedOutEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    node = v2->_node;
    v2->_node = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccountLoginClusterLoggedOutEvent);
  v7 = objc_msgSend_node(self, v5, v6);
  objc_msgSend_setNode_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: node:%@ >", v5, self->_node);;

  return v7;
}

- (NSNumber)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end