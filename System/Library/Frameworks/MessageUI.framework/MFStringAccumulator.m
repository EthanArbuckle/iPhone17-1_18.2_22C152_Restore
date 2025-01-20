@interface MFStringAccumulator
- (id)string;
- (void)appendString:(id)a3;
@end

@implementation MFStringAccumulator

- (void)appendString:(id)a3
{
  id v4 = a3;
  v5 = self->_mutable;
  id v10 = v4;
  if (v5)
  {
    [(NSMutableString *)v5 appendString:v4];
  }
  else
  {
    if (self->_immutable)
    {
      v6 = (NSMutableString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@%@", self->_immutable, v4];
      v7 = self->_mutable;
      self->_mutable = v6;

      v8 = 0;
    }
    else
    {
      v8 = (NSString *)v4;
    }
    immutable = self->_immutable;
    self->_immutable = v8;
  }
}

- (id)string
{
  immutable = (NSMutableString *)self->_immutable;
  if (!immutable) {
    immutable = self->_mutable;
  }
  return immutable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immutable, 0);

  objc_storeStrong((id *)&self->_mutable, 0);
}

@end