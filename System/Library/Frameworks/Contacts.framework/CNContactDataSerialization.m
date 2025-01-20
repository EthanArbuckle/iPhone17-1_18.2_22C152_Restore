@interface CNContactDataSerialization
+ (id)contactsFromData:(id)a3;
+ (id)dataWithContacts:(id)a3;
@end

@implementation CNContactDataSerialization

+ (id)dataWithContacts:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9B8] data];
  if (v3 && [v3 count])
  {

    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v5 encodeObject:v3 forKey:@"key"];
    [v5 finishEncoding];
    v4 = [v5 encodedData];
  }

  return v4;
}

+ (id)contactsFromData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v10 = 0;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v10];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v8 = [v4 decodeArrayOfObjectsOfClasses:v7 forKey:@"key"];

    [v4 finishDecoding];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

@end