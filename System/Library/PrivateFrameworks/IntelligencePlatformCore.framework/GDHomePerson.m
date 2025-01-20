@interface GDHomePerson
- (GDHomePerson)initWithHMPerson:(id)a3;
- (NSString)name;
- (NSUUID)uuid;
@end

@implementation GDHomePerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  return self->_name;
}

- (GDHomePerson)initWithHMPerson:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GDHomePerson;
  v8 = [(GDHomePerson *)&v17 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_name(v4, v5, v6, v7);
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v14 = objc_msgSend_UUID(v4, v11, v12, v13);
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v14;
  }
  return v8;
}

@end