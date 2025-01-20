@interface SFSingleCreditCardData
+ (BOOL)supportsSecureCoding;
- (NSString)displayText;
- (NSString)headerText;
- (SFSingleCreditCardData)initWithCoder:(id)a3;
- (SFSingleCreditCardData)initWithHeaderText:(id)a3 displayText:(id)a4 type:(int64_t)a5 value:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFSingleCreditCardData

- (SFSingleCreditCardData)initWithHeaderText:(id)a3 displayText:(id)a4 type:(int64_t)a5 value:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFSingleCreditCardData;
  v13 = [(WBSSingleCreditCardData *)&v17 initWithValue:a6 type:a5];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_headerText, a3);
    objc_storeStrong((id *)&v14->_displayText, a4);
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSingleCreditCardData;
  id v4 = a3;
  [(WBSSingleCreditCardData *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_headerText, @"headerText", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_displayText forKey:@"displayText"];
}

- (SFSingleCreditCardData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFSingleCreditCardData;
  objc_super v5 = [(WBSSingleCreditCardData *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headerText"];
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayText"];
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);

  objc_storeStrong((id *)&self->_headerText, 0);
}

@end