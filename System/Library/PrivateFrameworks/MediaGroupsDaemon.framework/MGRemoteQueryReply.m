@interface MGRemoteQueryReply
+ (id)replyWithError:(id)a3;
+ (id)replyWithGroups:(id)a3;
+ (id)rq_instanceFromCoded:(id)a3;
- (NSArray)groups;
- (NSError)error;
- (NSString)description;
- (id)_initWithGroups:(id)a3 error:(id)a4;
- (id)rq_coded;
@end

@implementation MGRemoteQueryReply

- (id)_initWithGroups:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MGRemoteQueryReply;
  v8 = [(MGRemoteQueryReply *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    groups = v8->_groups;
    v8->_groups = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    error = v8->_error;
    v8->_error = (NSError *)v11;
  }
  return v8;
}

+ (id)replyWithGroups:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithGroups:v4 error:0];

  return v5;
}

+ (id)replyWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithGroups:0 error:v4];

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MGRemoteQueryReply *)self groups];
  uint64_t v7 = [v6 count];
  v8 = [(MGRemoteQueryReply *)self error];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, _groups=%lu, _error=%@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (NSArray)groups
{
  return self->_groups;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (id)rq_coded
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(MGRemoteQueryReply *)self groups];
  v5 = objc_msgSend(v4, "rq_coded");

  id v6 = [(MGRemoteQueryReply *)self error];
  uint64_t v7 = objc_msgSend(v6, "rq_coded");

  if (v5) {
    [v3 setObject:v5 forKey:0x26DD645F8];
  }
  if (v7) {
    [v3 setObject:v7 forKey:0x26DD64618];
  }

  return v3;
}

+ (id)rq_instanceFromCoded:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = objc_msgSend(v4, "rq_arrayOfDecodedClass:forKey:", objc_opt_class(), 0x26DD645F8);
  uint64_t v6 = objc_msgSend(v4, "rq_decodedObjectOfClass:forKey:", objc_opt_class(), 0x26DD64618);
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    uint64_t v8 = +[MGRemoteQueryReply replyWithGroups:v5];
LABEL_8:
    uint64_t v9 = (void *)v8;
    goto LABEL_9;
  }
  if (v6)
  {
    uint64_t v8 = +[MGRemoteQueryReply replyWithError:v6];
    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

@end