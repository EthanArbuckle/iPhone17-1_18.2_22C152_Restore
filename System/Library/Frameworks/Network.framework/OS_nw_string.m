@interface OS_nw_string
- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (unsigned)characterAtIndex:(unint64_t)a3;
@end

@implementation OS_nw_string

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  if (a6 == 4 || a6 == 1)
  {
    size_t v13 = 0;
    BOOL bytes = nw_string_get_bytes((uint64_t)self, a3, a4, a8.location, a8.length, &v13);
    if (bytes)
    {
      if (a5) {
        *a5 = v13;
      }
      if (a9)
      {
        NSUInteger v11 = a8.length - v13;
        a9->location = v13 + a8.location;
        a9->length = v11;
      }
    }
  }
  else
  {
    LOBYTE(bytes) = 0;
  }
  return bytes;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return nw_string_get_char_at_index((uint64_t)self, a3);
}

@end