@interface LSPropertyList
+ (LSPropertyList)new;
+ (LSPropertyList)propertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (LSPropertyList)propertyListWithData:(id)a3;
+ (LSPropertyList)propertyListWithDictionary:(id)a3;
- (LSPropertyList)init;
- (NSDictionary)_expensiveDictionaryRepresentation;
- (NSString)_applicationIdentifier;
- (id)_init;
- (id)debugDescription;
- (id)description;
- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)objectsForKeys:(id)a3;
@end

@implementation LSPropertyList

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)LSPropertyList;
  return [(LSPropertyList *)&v3 init];
}

- (NSString)_applicationIdentifier
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(LSPropertyList *)self objectForKey:@"application-identifier" ofClass:v3];
}

+ (LSPropertyList)propertyListWithDictionary:(id)a3
{
  return (LSPropertyList *)+[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, a3);
}

- (LSPropertyList)init
{
}

+ (LSPropertyList)new
{
}

+ (LSPropertyList)propertyListWithData:(id)a3
{
  uint64_t v3 = (void *)[a3 copy];
  v4 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListData:]((uint64_t)_LSLazyPropertyList, v3);

  return (LSPropertyList *)v4;
}

+ (LSPropertyList)propertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (LSPropertyList *)+[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:options:error:]((uint64_t)_LSLazyPropertyList, a3, a4, (uint64_t)a5);
}

- (id)objectsForKeys:(id)a3
{
  v4 = [LSBundleInfoCachedValues alloc];
  id v5 = [(LSBundleInfoCachedValues *)v4 _initWithKeys:a3 forDictionary:MEMORY[0x1E4F1CC08]];

  return v5;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return 0;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  return 0;
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  return 0;
}

- (NSDictionary)_expensiveDictionaryRepresentation
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p>", objc_opt_class(), self];

  return v2;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(LSPropertyList *)self _expensiveDictionaryRepresentation];
  v6 = (void *)[v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

@end