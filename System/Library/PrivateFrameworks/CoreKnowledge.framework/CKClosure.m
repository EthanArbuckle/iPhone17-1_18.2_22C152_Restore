@interface CKClosure
- (CKClosure)init;
- (CKClosure)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKClosure

- (CKClosure)initWithCoder:(id)a3
{
  return (CKClosure *)CKClosure.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A77F90D0(v4);
}

- (CKClosure)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKClosure_entity);
}

@end