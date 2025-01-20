@interface CKAtomBatchEnumerationOptions
+ (id)optionsWithAtomType:(unint64_t)a3;
+ (id)optionsWithSiteIdentifierModifier:(id)a3;
- (NSData)siteIdentifierModifier;
- (NSNumber)atomType;
- (void)setAtomType:(id)a3;
- (void)setSiteIdentifierModifier:(id)a3;
@end

@implementation CKAtomBatchEnumerationOptions

+ (id)optionsWithAtomType:(unint64_t)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  v6 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v5, a3);
  objc_msgSend_setAtomType_(v4, v7, (uint64_t)v6);

  return v4;
}

+ (id)optionsWithSiteIdentifierModifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = objc_opt_new();
  objc_msgSend_setSiteIdentifierModifier_(v4, v5, (uint64_t)v3);

  return v4;
}

- (NSNumber)atomType
{
  return self->_atomType;
}

- (void)setAtomType:(id)a3
{
  self->_atomType = (NSNumber *)a3;
}

- (NSData)siteIdentifierModifier
{
  return self->_siteIdentifierModifier;
}

- (void)setSiteIdentifierModifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end