@interface PaymentSheetRequest
+ (BOOL)supportsSecureCoding;
- (PaymentSheetRequest)init;
- (PaymentSheetRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PaymentSheetRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PaymentSheetRequest)initWithCoder:(id)a3
{
  return (PaymentSheetRequest *)sub_100171724(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001718CC(v4);
}

- (PaymentSheetRequest)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PaymentSheetRequest_purchaseInfo);
}

@end