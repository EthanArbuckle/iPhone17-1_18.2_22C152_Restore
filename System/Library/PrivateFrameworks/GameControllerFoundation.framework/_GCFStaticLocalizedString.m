@interface _GCFStaticLocalizedString
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (Class)classForCoder;
- (_GCFStaticLocalizedString)initWithCoder:(id)a3;
- (id)_realizedString;
- (id)bundle;
- (id)key;
- (id)table;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCFStaticLocalizedString

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)alloc
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_GCFStaticLocalizedString;
  [(_GCFStaticLocalizedString *)&v3 dealloc];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_GCFStaticLocalizedString)initWithCoder:(id)a3
{
  [(_GCFStaticLocalizedString *)self doesNotRecognizeSelector:a2];
  v6.receiver = self;
  v6.super_class = (Class)_GCFStaticLocalizedString;
  return [(GCFLocalizedString *)&v6 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  int v5 = [a3 allowsKeyedCoding];
  key = self->_key;
  if (v5)
  {
    [a3 encodeObject:key forKey:@"key"];
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(-[_GCFStaticLocalizedString bundle](self, "bundle"), "bundleURL"), @"bundle");
    id v7 = [(_GCFStaticLocalizedString *)self table];
    [a3 encodeObject:v7 forKey:@"table"];
  }
  else
  {
    [a3 encodeObject:key];
    objc_msgSend(a3, "encodeObject:", objc_msgSend(-[_GCFStaticLocalizedString bundle](self, "bundle"), "bundleURL"));
    id v8 = [(_GCFStaticLocalizedString *)self table];
    [a3 encodeObject:v8];
  }
}

- (id)_realizedString
{
  realizedString = self->__realizedString;
  if (!realizedString)
  {
    objc_sync_enter(self);
    realizedString = self->__realizedString;
    if (!realizedString)
    {
      realizedString = (NSString *)objc_msgSend(-[_GCFStaticLocalizedString bundle](self, "bundle"), "localizedStringForKey:value:table:", self->_key, 0, -[_GCFStaticLocalizedString table](self, "table"));
      self->__realizedString = (NSString *)[(NSString *)realizedString copy];
    }
    objc_sync_exit(self);
  }
  return realizedString;
}

- (id)key
{
  return self->_key;
}

- (id)bundle
{
  return +[NSBundle GameControllerFoundationBundle];
}

- (id)table
{
  return @"Localizable";
}

@end