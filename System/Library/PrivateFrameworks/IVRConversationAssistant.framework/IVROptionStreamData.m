@interface IVROptionStreamData
- (IVROptionStreamData)init;
- (NSDictionary)optionStreamData;
- (int64_t)type;
- (void)setOptionStreamData:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IVROptionStreamData

- (IVROptionStreamData)init
{
  v5.receiver = self;
  v5.super_class = (Class)IVROptionStreamData;
  v2 = [(IVROptionStreamData *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(NSDictionary);
    [(IVROptionStreamData *)v2 setOptionStreamData:v3];

    [(IVROptionStreamData *)v2 setType:4];
  }
  return v2;
}

- (NSDictionary)optionStreamData
{
  return self->_optionStreamData;
}

- (void)setOptionStreamData:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end