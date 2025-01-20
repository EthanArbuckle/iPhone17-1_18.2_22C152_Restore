@interface NSOutputStream
- (int)vcp_writeBuffer:(const void *)a3 ofLength:(unint64_t)a4;
- (int)vcp_writeUint32:(unsigned int)a3;
@end

@implementation NSOutputStream

- (int)vcp_writeBuffer:(const void *)a3 ofLength:(unint64_t)a4
{
  if (-[NSOutputStream write:maxLength:](self, "write:maxLength:", a3) == a4) {
    return 0;
  }
  else {
    return -20;
  }
}

- (int)vcp_writeUint32:(unsigned int)a3
{
  unsigned int v4 = bswap32(a3);
  return [(NSOutputStream *)self vcp_writeBuffer:&v4 ofLength:4];
}

@end