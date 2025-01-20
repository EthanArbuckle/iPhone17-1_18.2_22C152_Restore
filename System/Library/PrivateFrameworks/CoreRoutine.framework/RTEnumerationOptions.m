@interface RTEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)enumeratedType;
- (RTEnumerationOptions)initWithCoder:(id)a3;
- (id)description;
- (id)processingBlock;
- (unint64_t)batchSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTEnumerationOptions

- (Class)enumeratedType
{
  return 0;
}

- (id)processingBlock
{
  return 0;
}

- (unint64_t)batchSize
{
  return 0;
}

- (id)description
{
  return 0;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (RTEnumerationOptions)initWithCoder:(id)a3
{
  return 0;
}

@end