@interface ABSAssistantManager
- (ABSAddressBook)addressBook;
- (ABSAssistantManager)init;
- (ABSAssistantManager)initWithAddressBook:(id)a3;
- (id)newSAPersonFromABPerson:(void *)a3;
@end

@implementation ABSAssistantManager

- (ABSAssistantManager)init
{
  v3 = objc_alloc_init(ABSAddressBook);
  v4 = [(ABSAssistantManager *)self initWithAddressBook:v3];

  return v4;
}

- (ABSAssistantManager)initWithAddressBook:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABSAssistantManager;
  v6 = [(ABSAssistantManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_addressBook, a3);
    v8 = v7;
  }

  return v7;
}

- (id)newSAPersonFromABPerson:(void *)a3
{
  v4 = [(objc_class *)getCNAssistantConversionClass() descriptorsForRequiredKeys];
  id v5 = +[ABSPublicABCNCompatibility contactFromPublicABPerson:a3 keysToFetch:v4];

  v6 = [(objc_class *)getCNAssistantConversionClass() createSAPersonFromCNContact:v5];

  return v6;
}

- (ABSAddressBook)addressBook
{
  return self->_addressBook;
}

- (void).cxx_destruct
{
}

@end