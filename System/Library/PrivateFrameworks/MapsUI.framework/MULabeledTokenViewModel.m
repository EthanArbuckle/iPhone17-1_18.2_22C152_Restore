@interface MULabeledTokenViewModel
- (MULabeledTokenViewModel)initWithLabelValue:(id)a3 tokenValue:(id)a4;
- (NSString)labelValue;
- (NSString)tokenValue;
- (NSString)unalteredLabelValue;
- (NSString)unalteredTokenValue;
@end

@implementation MULabeledTokenViewModel

- (MULabeledTokenViewModel)initWithLabelValue:(id)a3 tokenValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MULabeledTokenViewModel;
  v9 = [(MULabeledTokenViewModel *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unalteredLabelValue, a3);
    objc_storeStrong((id *)&v10->_unalteredTokenValue, a4);
    v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v12 = [v7 stringByTrimmingCharactersInSet:v11];
    labelValue = v10->_labelValue;
    v10->_labelValue = (NSString *)v12;

    v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v15 = [v8 stringByTrimmingCharactersInSet:v14];
    tokenValue = v10->_tokenValue;
    v10->_tokenValue = (NSString *)v15;
  }
  return v10;
}

- (NSString)labelValue
{
  return self->_labelValue;
}

- (NSString)tokenValue
{
  return self->_tokenValue;
}

- (NSString)unalteredLabelValue
{
  return self->_unalteredLabelValue;
}

- (NSString)unalteredTokenValue
{
  return self->_unalteredTokenValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unalteredTokenValue, 0);
  objc_storeStrong((id *)&self->_unalteredLabelValue, 0);
  objc_storeStrong((id *)&self->_tokenValue, 0);
  objc_storeStrong((id *)&self->_labelValue, 0);
}

@end