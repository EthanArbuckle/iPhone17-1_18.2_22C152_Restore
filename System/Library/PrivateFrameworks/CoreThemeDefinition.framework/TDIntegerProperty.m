@interface TDIntegerProperty
- (int64_t)integerValue;
- (void)addToDictionary:(id)a3;
- (void)dealloc;
- (void)setIntegerValue:(int64_t)a3;
@end

@implementation TDIntegerProperty

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TDIntegerProperty;
  [(TDProperty *)&v2 dealloc];
}

- (int64_t)integerValue
{
  [(TDIntegerProperty *)self willAccessValueForKey:@"integerValue"];
  int64_t integerValue = self->_integerValue;
  [(TDIntegerProperty *)self didAccessValueForKey:@"integerValue"];
  return integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  [(TDIntegerProperty *)self willChangeValueForKey:@"integerValue"];
  self->_int64_t integerValue = a3;

  [(TDIntegerProperty *)self didChangeValueForKey:@"integerValue"];
}

- (void)addToDictionary:(id)a3
{
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[TDIntegerProperty integerValue](self, "integerValue"));
  v6 = [(TDProperty *)self name];

  [a3 setObject:v5 forKey:v6];
}

@end