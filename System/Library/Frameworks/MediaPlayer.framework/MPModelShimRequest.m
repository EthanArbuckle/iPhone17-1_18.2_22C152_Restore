@interface MPModelShimRequest
+ (Class)responseClass;
- (MPModelRequest)modelRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)middlewareClasses;
- (void)setModelRequest:(id)a3;
@end

@implementation MPModelShimRequest

- (id)middlewareClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPModelShimRequest;
  v4 = [(MPRequest *)&v8 copyWithZone:a3];
  uint64_t v5 = [(MPModelRequest *)self->_modelRequest copy];
  v6 = (void *)v4[9];
  v4[9] = v5;

  return v4;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelShimRequest;
  v3 = [(MPRequest *)&v7 description];
  v4 = [NSString stringWithFormat:@" modelRequest=%@", self->_modelRequest];
  uint64_t v5 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 0, v4);

  return v5;
}

- (void)setModelRequest:(id)a3
{
}

- (MPModelRequest)modelRequest
{
  return self->_modelRequest;
}

- (void).cxx_destruct
{
}

@end