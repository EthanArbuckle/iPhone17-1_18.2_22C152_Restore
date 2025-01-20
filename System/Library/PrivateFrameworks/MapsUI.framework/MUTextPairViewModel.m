@interface MUTextPairViewModel
+ (id)textPairViewModelsFromStrings:(id)a3;
- (NSString)leftText;
- (NSString)rightText;
- (void)setLeftText:(id)a3;
- (void)setRightText:(id)a3;
@end

@implementation MUTextPairViewModel

+ (id)textPairViewModelsFromStrings:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = objc_alloc_init(MUTextPairViewModel);
      v7 = [v3 objectAtIndexedSubscript:v5];
      [(MUTextPairViewModel *)v6 setLeftText:v7];

      if ([v3 count] <= v5 + 1)
      {
        [(MUTextPairViewModel *)v6 setRightText:0];
      }
      else
      {
        v8 = objc_msgSend(v3, "objectAtIndexedSubscript:");
        [(MUTextPairViewModel *)v6 setRightText:v8];
      }
      [v4 addObject:v6];

      v5 += 2;
    }
    while (v5 < [v3 count]);
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (NSString)leftText
{
  return self->_leftText;
}

- (void)setLeftText:(id)a3
{
}

- (NSString)rightText
{
  return self->_rightText;
}

- (void)setRightText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightText, 0);
  objc_storeStrong((id *)&self->_leftText, 0);
}

@end