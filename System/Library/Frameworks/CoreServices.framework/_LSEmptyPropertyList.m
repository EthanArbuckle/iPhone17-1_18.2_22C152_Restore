@interface _LSEmptyPropertyList
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSEmptyPropertyList)initWithCoder:(id)a3;
- (id)uncheckedObjectsForKeys:(id)a3;
@end

@implementation _LSEmptyPropertyList

+ (id)sharedInstance
{
  if (+[_LSEmptyPropertyList sharedInstance]::once != -1) {
    dispatch_once(&+[_LSEmptyPropertyList sharedInstance]::once, &__block_literal_global_47);
  }
  v2 = (void *)+[_LSEmptyPropertyList sharedInstance]::result;

  return v2;
}

- (BOOL)_getPropertyList:(id *)a3
{
  *a3 = (id)MEMORY[0x1E4F1CC08];
  return 1;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  *a3 = 0;
  return 0;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSEmptyPropertyList)initWithCoder:(id)a3
{
  v4 = +[_LSEmptyPropertyList sharedInstance];

  return v4;
}

@end