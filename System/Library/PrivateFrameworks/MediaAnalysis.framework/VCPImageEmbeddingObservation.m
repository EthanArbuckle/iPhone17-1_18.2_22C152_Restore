@interface VCPImageEmbeddingObservation
- (NSArray)shape;
- (NSData)data;
- (unint64_t)count;
- (unint64_t)type;
- (unint64_t)version;
- (void)setCount:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setShape:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation VCPImageEmbeddingObservation

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end