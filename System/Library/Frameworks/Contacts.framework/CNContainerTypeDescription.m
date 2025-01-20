@interface CNContainerTypeDescription
- (BOOL)isConvertibleABValue:(void *)a3;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)isWritable;
- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerTypeDescription

- (id)key
{
  return @"type";
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  unint64_t v5 = [a3 integerValue];
  unint64_t v6 = v5;
  if (v5 >= 4 && v5 - 1002 >= 2 && *a4)
  {
    *a4 = +[CNErrorFactory errorWithCode:301 userInfo:0];
  }
  return v6 < 4 || (v6 & 0xFFFFFFFFFFFFFFFELL) == 1002;
}

- (id)CNValueForContainer:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 type];

  return (id)[v3 numberWithInteger:v4];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setType:", objc_msgSend(a3, "integerValue"));
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E60];
}

- (BOOL)isConvertibleABValue:(void *)a3
{
  unsigned int valuePtr = 0;
  int Value = CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr);
  if (Value)
  {
    BOOL v4 = valuePtr > 7 || ((1 << valuePtr) & 0x93) == 0;
    LOBYTE(Value) = !v4 || (valuePtr - 16777217 <= 3 ? (BOOL v5 = valuePtr == 16777218) : (BOOL v5 = 1), !v5);
  }
  return Value;
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CNiOSABConstantsMapping CNToABSourceTypeConstantsMapping];
  BOOL v5 = [v4 mappedConstant:v3];

  unint64_t v6 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v6) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (id)CNValueFromABValue:(void *)a3
{
  BOOL v4 = +[CNiOSABConstantsMapping ABToCNContainerTypeConstantsMapping];
  BOOL v5 = [v4 mappedConstant:a3];

  return v5;
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  if (!a3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CNContainerTypeDescription;
  return [(CNContainerPropertyDescription *)&v6 setABValue:a3 onABSource:a4 error:a5];
}

@end