@interface objcCriterials
- (objcCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5;
- (objcCriterials)initWithSwiftCriterials:(id)a3;
@end

@implementation objcCriterials

- (objcCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_SwiftCriterials alloc] initWithInfo:v10 :v9 :v8];

  swiftCriterials = self->_swiftCriterials;
  self->_swiftCriterials = v11;

  return self;
}

- (objcCriterials)initWithSwiftCriterials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)objcCriterials;
  v6 = [(objcCriterials *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_swiftCriterials, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end