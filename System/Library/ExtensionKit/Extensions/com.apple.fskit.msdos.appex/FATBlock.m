@interface FATBlock
- (FATBlock)init;
- (FATBlock)initWithOffset:(unint64_t)a3;
- (FATBlock)initWithOffset:(unint64_t)a3 andLength:(unint64_t)a4;
- (NSMutableData)data;
- (unint64_t)startOffset;
- (void)setData:(id)a3;
- (void)setStartOffset:(unint64_t)a3;
@end

@implementation FATBlock

- (FATBlock)init
{
  v6.receiver = self;
  v6.super_class = (Class)FATBlock;
  v2 = [(FATBlock *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:12288];
    data = v2->_data;
    v2->_data = v3;
  }
  return v2;
}

- (FATBlock)initWithOffset:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FATBlock;
  v4 = [(FATBlock *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:12288];
    data = v4->_data;
    v4->_data = v5;

    v4->_startOffset = a3;
  }
  return v4;
}

- (FATBlock)initWithOffset:(unint64_t)a3 andLength:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)FATBlock;
  objc_super v6 = [(FATBlock *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:a4];
    data = v6->_data;
    v6->_data = v7;

    v6->_startOffset = a3;
  }
  return v6;
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (unint64_t)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(unint64_t)a3
{
  self->_startOffset = a3;
}

- (void).cxx_destruct
{
}

@end