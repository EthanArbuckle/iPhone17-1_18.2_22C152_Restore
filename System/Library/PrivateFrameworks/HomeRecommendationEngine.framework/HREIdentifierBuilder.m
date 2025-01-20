@interface HREIdentifierBuilder
- (HREIdentifierBuilder)initWithBaseIdentifier:(id)a3;
- (NSMutableDictionary)keyValues;
- (NSString)baseIdentifier;
- (NSString)composedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)makeComposedString;
- (void)setBaseIdentifier:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation HREIdentifierBuilder

- (HREIdentifierBuilder)initWithBaseIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HREIdentifierBuilder;
  v5 = [(HREIdentifierBuilder *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    baseIdentifier = v5->_baseIdentifier;
    v5->_baseIdentifier = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    keyValues = v5->_keyValues;
    v5->_keyValues = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(HREIdentifierBuilder *)self keyValues];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  char v9 = [v8 isEqualToString:v12];

  if ((v9 & 1) == 0)
  {
    v10 = [(HREIdentifierBuilder *)self keyValues];
    [v10 setObject:v12 forKeyedSubscript:v6];

    composedString = self->_composedString;
    self->_composedString = 0;
  }
}

- (void)setBaseIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_baseIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_baseIdentifier, a3);
    composedString = self->_composedString;
    self->_composedString = 0;
  }
}

- (NSString)composedString
{
  composedString = self->_composedString;
  if (!composedString)
  {
    id v4 = [(HREIdentifierBuilder *)self makeComposedString];
    v5 = self->_composedString;
    self->_composedString = v4;

    composedString = self->_composedString;
  }

  return composedString;
}

- (id)makeComposedString
{
  v3 = [(HREIdentifierBuilder *)self keyValues];
  id v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_3];

  if ([v5 count])
  {
    id v6 = [MEMORY[0x263F089D8] string];
    if ([v5 count])
    {
      unint64_t v7 = 0;
      do
      {
        if (_MergedGlobals_20 != -1) {
          dispatch_once(&_MergedGlobals_20, &__block_literal_global_7_1);
        }
        id v8 = (id)qword_268944B98;
        if (!v7)
        {
          if (qword_268944BA0 != -1) {
            dispatch_once(&qword_268944BA0, &__block_literal_global_12_0);
          }
          id v9 = (id)qword_268944BA8;

          id v8 = v9;
        }
        v10 = [v5 objectAtIndexedSubscript:v7];
        objc_super v11 = [(HREIdentifierBuilder *)self keyValues];
        id v12 = [v11 objectForKeyedSubscript:v10];
        [v6 appendFormat:@"%@%@:%@", v8, v10, v12];

        ++v7;
      }
      while (v7 < [v5 count]);
    }
    v13 = NSString;
    v14 = [(HREIdentifierBuilder *)self baseIdentifier];
    v15 = [v13 stringWithFormat:@"%@=%@", v14, v6];
  }
  else
  {
    v15 = [(HREIdentifierBuilder *)self baseIdentifier];
  }

  return v15;
}

uint64_t __42__HREIdentifierBuilder_makeComposedString__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __42__HREIdentifierBuilder_makeComposedString__block_invoke_3()
{
  v0 = (void *)qword_268944B98;
  qword_268944B98 = @"-";
}

void __42__HREIdentifierBuilder_makeComposedString__block_invoke_5()
{
  v0 = (void *)qword_268944BA8;
  qword_268944BA8 = (uint64_t)&stru_26EAB1AB0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HREIdentifierBuilder *)self baseIdentifier];
  id v6 = (void *)[v4 initWithBaseIdentifier:v5];

  unint64_t v7 = [(HREIdentifierBuilder *)self keyValues];
  uint64_t v8 = [v7 mutableCopy];
  id v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (NSMutableDictionary)keyValues
{
  return self->_keyValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValues, 0);
  objc_storeStrong((id *)&self->_baseIdentifier, 0);

  objc_storeStrong((id *)&self->_composedString, 0);
}

@end