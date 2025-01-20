@interface objcPanicCriterials
- (id)getPanicCriterials;
- (objcPanicCriterials)initWithCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (objcPanicCriterials)initWithSwiftPanicCriterials:(id)a3;
@end

@implementation objcPanicCriterials

- (objcPanicCriterials)initWithCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[_SwiftPanicCriterials alloc] initWithCriterials:v13 :v12 :v11 :v10];

  swiftPanicCriterials = self->_swiftPanicCriterials;
  self->_swiftPanicCriterials = v14;

  return self;
}

- (objcPanicCriterials)initWithSwiftPanicCriterials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)objcPanicCriterials;
  v6 = [(objcPanicCriterials *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_swiftPanicCriterials, a3);
  }

  return v7;
}

- (id)getPanicCriterials
{
  return self->_swiftPanicCriterials;
}

- (void).cxx_destruct
{
}

@end