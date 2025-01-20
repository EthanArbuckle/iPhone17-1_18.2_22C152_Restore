@interface NSKnownKeysMappingStrategy
+ (BOOL)supportsSecureCoding;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (NSKnownKeysMappingStrategy)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForKeys:(id *)a3 count:(unint64_t)a4;
- (id)initForKeys:(id)a3;
- (id)keys;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)fastIndexForKnownKey:(id)a3;
- (unint64_t)indexForKey:(id)a3;
- (unint64_t)length;
@end

@implementation NSKnownKeysMappingStrategy

+ (id)alloc
{
  v2 = (objc_class *)objc_opt_class();

  return _PFAllocateObject(v2, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();

  return _PFAllocateObject(v3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (id)initForKeys:(id *)a3 count:(unint64_t)a4
{
  return 0;
}

- (id)initForKeys:(id)a3
{
  return 0;
}

- (unint64_t)indexForKey:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)fastIndexForKnownKey:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)keys
{
  return 0;
}

- (unint64_t)length
{
  return 0;
}

- (NSKnownKeysMappingStrategy)initWithCoder:(id)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end