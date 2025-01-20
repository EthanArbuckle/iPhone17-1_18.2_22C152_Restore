@interface _BRSuffixToTypeMapping
- (BOOL)appliesToType:(id)a3;
- (NSString)suffix;
- (NSString)type;
- (void)setSuffix:(id)a3;
- (void)setType:(id)a3;
@end

@implementation _BRSuffixToTypeMapping

- (BOOL)appliesToType:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [(_BRSuffixToTypeMapping *)self type];
  int v6 = UTTypeConformsTo(v4, v5);

  return v6 != 0;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_suffix, 0);
}

@end