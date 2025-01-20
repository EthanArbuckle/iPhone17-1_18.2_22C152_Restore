@interface _GCFFormattedLocalizedString
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (_GCFFormattedLocalizedString)initWithCoder:(id)a3;
- (_GCFFormattedLocalizedString)initWithFormat:(id)a3 arg:(id)a4;
- (id)_realizedString;
- (id)bundle;
- (id)key;
- (id)table;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCFFormattedLocalizedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCFFormattedLocalizedString)initWithFormat:(id)a3 arg:(id)a4
{
  if (!a3) {
    return 0;
  }
  v5 = self;
  self->_format = (GCFLocalizedString *)[a3 copy];
  v5->_arg = (GCFLocalizedString *)[a4 copy];
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_GCFFormattedLocalizedString;
  [(_GCFFormattedLocalizedString *)&v3 dealloc];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_GCFFormattedLocalizedString)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"arg"];
  }
  else
  {
    v5 = (void *)[a3 decodeObject];
    uint64_t v6 = [a3 decodeObject];
  }
  v7 = (void *)v6;
  self->_format = (GCFLocalizedString *)[v5 copy];
  self->_arg = (GCFLocalizedString *)[v7 copy];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int v5 = [a3 allowsKeyedCoding];
  format = self->_format;
  if (v5)
  {
    [a3 encodeObject:format forKey:@"format"];
    arg = self->_arg;
    [a3 encodeObject:arg forKey:@"arg"];
  }
  else
  {
    [a3 encodeObject:format];
    v8 = self->_arg;
    [a3 encodeObject:v8];
  }
}

- (id)key
{
  return self->_format;
}

- (id)bundle
{
  return [(GCFLocalizedString *)self->_format bundle];
}

- (id)table
{
  return [(GCFLocalizedString *)self->_format table];
}

- (id)_realizedString
{
  realizedString = (GCFLocalizedString *)self->__realizedString;
  if (!realizedString)
  {
    objc_sync_enter(self);
    realizedString = (GCFLocalizedString *)self->__realizedString;
    if (!realizedString)
    {
      unint64_t v5 = [(GCFLocalizedString *)self->_format length];
      realizedString = self->_format;
      if (v5)
      {
        if ([(NSString *)self->_format gc_countOfOccurrencesOfString:@"%@" options:0] != 1)objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](&off_26BEEA8F8, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, +[NSString stringWithFormat:@"Invalid resolved format string '%@'.", self->_format], 0)); {
        if (!self->_arg)
        }
          objc_exception_throw(+[NSException exceptionWithName:NSInvalidArgumentException reason:@"Missing argument string." userInfo:0]);
        realizedString = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", self->_format, self->_arg);
      }
      self->__realizedString = (NSString *)[(GCFLocalizedString *)realizedString copy];
    }
    objc_sync_exit(self);
  }
  return realizedString;
}

@end