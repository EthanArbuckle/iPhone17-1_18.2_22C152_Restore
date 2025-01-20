@interface CKAssistantPerson
- (NSString)internalGUID;
- (NSString)label;
- (void)setInternalGUID:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CKAssistantPerson

- (NSString)internalGUID
{
  return self->_internalGUID;
}

- (void)setInternalGUID:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_internalGUID, 0);
}

@end