@interface NSInputStream
- (int)vcp_readBuffer:(void *)a3 ofLength:(unint64_t)a4;
- (int)vcp_readUint32:(unsigned int *)a3;
@end

@implementation NSInputStream

- (int)vcp_readBuffer:(void *)a3 ofLength:(unint64_t)a4
{
  if (-[NSInputStream read:maxLength:](self, "read:maxLength:", a3) == a4) {
    return 0;
  }
  else {
    return -19;
  }
}

- (int)vcp_readUint32:(unsigned int *)a3
{
  int result = [(NSInputStream *)self vcp_readBuffer:a3 ofLength:4];
  if (!result) {
    *a3 = bswap32(*a3);
  }
  return result;
}

@end