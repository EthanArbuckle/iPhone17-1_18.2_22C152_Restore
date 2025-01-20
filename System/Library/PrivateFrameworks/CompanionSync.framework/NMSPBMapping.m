@interface NMSPBMapping
- (Class)requestClass;
- (Class)responseClass;
- (id)description;
- (void)setRequestClass:(Class)a3;
- (void)setResponseClass:(Class)a3;
@end

@implementation NMSPBMapping

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)NMSPBMapping;
  v4 = [(NMSPBMapping *)&v9 description];
  v5 = NSStringFromClass([(NMSPBMapping *)self requestClass]);
  if ([(NMSPBMapping *)self responseClass])
  {
    v6 = NSStringFromClass([(NMSPBMapping *)self responseClass]);
    v7 = [v3 stringWithFormat:@"%@: {Request=%@, Response=%@}", v4, v5, v6];
  }
  else
  {
    v7 = [v3 stringWithFormat:@"%@: {Request=%@, Response=%@}", v4, v5, @"(Nil)"];
  }

  return v7;
}

- (Class)requestClass
{
  return self->_requestClass;
}

- (void)setRequestClass:(Class)a3
{
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (void)setResponseClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong((id *)&self->_requestClass, 0);
}

@end