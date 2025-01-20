@interface DUClientObjC
- (DUClientObjC)initWithIdentifier:(id)a3;
- (NSString)identifier;
@end

@implementation DUClientObjC

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend_identifier(self->_underlyingObject, a2, v2, v3, v4);
}

- (DUClientObjC)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DUClientObjC;
  v5 = [(DUClientObjC *)&v14 init];
  if (v5)
  {
    v6 = [_TtC21DocumentUnderstanding8DUClient alloc];
    uint64_t v10 = objc_msgSend_initWithIdentifier_(v6, v7, (uint64_t)v4, v8, v9);
    underlyingObject = v5->_underlyingObject;
    v5->_underlyingObject = (_TtC21DocumentUnderstanding8DUClient *)v10;

    v12 = v5;
  }

  return v5;
}

@end