@interface DDMatchPhoneNumber
- (DDMatchPhoneNumber)initWithDDScannerResult:(id)a3;
- (NSString)label;
- (NSString)phoneNumber;
@end

@implementation DDMatchPhoneNumber

- (DDMatchPhoneNumber)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDMatchPhoneNumber;
  v5 = [(DDMatch *)&v14 initWithDDScannerResult:v4];
  if (v5)
  {
    id v12 = 0;
    id v13 = 0;
    int v6 = [v4 getPhoneValue:&v13 label:&v12];
    id v7 = v13;
    id v8 = v13;
    id v9 = v12;
    id v10 = v12;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_phoneNumber, v7);
      objc_storeStrong((id *)&v5->_label, v9);
    }
  }
  return v5;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end