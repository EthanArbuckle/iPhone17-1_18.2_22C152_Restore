@interface LNValueType
+ (BOOL)supportsSecureCoding;
+ (NSArray)objectClassesForCoding;
- (BOOL)objectIsMemberOfType:(id)a3;
- (BOOL)valueIsKindOfType:(id)a3;
- (Class)objectClass;
- (id)_init;
- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5;
@end

@implementation LNValueType

- (BOOL)objectIsMemberOfType:(id)a3
{
  id v4 = a3;
  [(LNValueType *)self objectClass];
  LOBYTE(self) = objc_opt_isKindOfClass();

  return self & 1;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)LNValueType;
  return [(LNValueType *)&v3 init];
}

- (BOOL)valueIsKindOfType:(id)a3
{
  id v4 = [a3 valueType];
  LOBYTE(self) = [(LNValueType *)self isEqual:v4];

  return (char)self;
}

- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = [v8 valueType];
  if ([v10 isEqual:self])
  {
    char v11 = [v12 isEqual:self];

    if (v11) {
      v9[2](v9, v8);
    }
  }
  else
  {
  }
}

- (Class)objectClass
{
  Class result = (Class)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[LNValueType objectClass] must be overridden"];
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSArray)objectClassesForCoding
{
  Class result = (NSArray *)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[LNValueType objectClassesForCoding] must be overridden"];
  __break(1u);
  return result;
}

@end