@interface DCPresentmentRequestedElement
+ (BOOL)supportsSecureCoding;
- (DCPresentmentRequestedElement)initWithCoder:(id)a3;
- (DCPresentmentRequestedElement)initWithElementIdentifier:(id)a3 intentToRetain:(unint64_t)a4;
- (NSString)elementIdentifier;
- (id)description;
- (unint64_t)intentToRetain;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCPresentmentRequestedElement

- (DCPresentmentRequestedElement)initWithElementIdentifier:(id)a3 intentToRetain:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)DCPresentmentRequestedElement;
  id v5 = a3;
  v6 = [(DCPresentmentRequestedElement *)&v10 init];
  uint64_t v7 = objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  elementIdentifier = v6->_elementIdentifier;
  v6->_elementIdentifier = (NSString *)v7;

  v6->_intentToRetain = a4;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  elementIdentifier = self->_elementIdentifier;
  id v5 = a3;
  [v5 encodeObject:elementIdentifier forKey:0x26C59B720];
  [v5 encodeInteger:self->_intentToRetain forKey:0x26C59B740];
}

- (DCPresentmentRequestedElement)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DCPresentmentRequestedElement;
  id v3 = a3;
  v4 = [(DCPresentmentRequestedElement *)&v9 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26C59B720, v9.receiver, v9.super_class);
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeIntegerForKey:0x26C59B740];
  v4->_intentToRetain = v7;
  return v4;
}

- (id)description
{
  v2 = NSString;
  elementIdentifier = self->_elementIdentifier;
  v4 = DCPresentmentElementRetentionIntentToString(self->_intentToRetain);
  uint64_t v5 = [v2 stringWithFormat:@"DCPresentmentRequestedElement elementIdentifier = %@, intentToRetain = %@", elementIdentifier, v4];

  return v5;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (unint64_t)intentToRetain
{
  return self->_intentToRetain;
}

- (void).cxx_destruct
{
}

@end