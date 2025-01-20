@interface NSArray
- (BOOL)sr_prefersUTF8StringRepresentation;
- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3;
@end

@implementation NSArray

- (BOOL)sr_prefersUTF8StringRepresentation
{
  id v2 = [(NSArray *)self firstObject];
  unsigned int v3 = [v2 conformsToProtocol:&OBJC_PROTOCOL___SRSampleDirectExporting];
  if (v3)
  {
    LOBYTE(v3) = objc_msgSend(v2, "sr_prefersUTF8StringRepresentation");
  }
  return v3;
}

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  v5 = (char *)[a3 write:"[" maxLength:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(NSArray *)self countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    char v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(self);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        if ((v9 & 1) == 0) {
          v5 = &v5[(void)[a3 write:",\n" maxLength:2]];
        }
        char v9 = 0;
        v5 = &v5[(void)objc_msgSend(v11, "sr_writeUTF8RepresentationToOutputStream:", a3)];
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [(NSArray *)self countByEnumeratingWithState:&v13 objects:v17 count:16];
      char v9 = 0;
    }
    while (v7);
  }
  return (int64_t)&v5[(void)[a3 write:"]" maxLength:1]];
}

@end