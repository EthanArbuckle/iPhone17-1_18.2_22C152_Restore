@interface CBDisplayModule
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (id)copyIdentifiers;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)copyPropertyInternalForKey:(id)a3;
@end

@implementation CBDisplayModule

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 1;
}

- (id)copyIdentifiers
{
  return 0;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  return 0;
}

@end