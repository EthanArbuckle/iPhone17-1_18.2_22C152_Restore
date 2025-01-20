@interface CNGroupIdentity
- (NSArray)contacts;
- (NSData)groupPhoto;
- (NSString)groupName;
- (NSString)identifier;
- (id)initGroupWithName:(id)a3 photo:(id)a4 contacts:(id)a5;
- (id)initGroupWithName:(id)a3 photo:(id)a4 contacts:(id)a5 identifier:(id)a6;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)numberOfContacts;
- (void)setContacts:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupPhoto:(id)a3;
@end

@implementation CNGroupIdentity

- (id)initGroupWithName:(id)a3 photo:(id)a4 contacts:(id)a5 identifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNGroupIdentity;
  v15 = [(CNGroupIdentity *)&v19 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_groupName, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    v17 = p_isa;
  }

  return p_isa;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSData)groupPhoto
{
  return self->_groupPhoto;
}

- (id)initGroupWithName:(id)a3 photo:(id)a4 contacts:(id)a5
{
  return [(CNGroupIdentity *)self initGroupWithName:a3 photo:a4 contacts:a5 identifier:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_groupPhoto, 0);

  objc_storeStrong((id *)&self->_groupName, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setContacts:(id)a3
{
}

- (void)setGroupPhoto:(id)a3
{
}

- (void)setGroupName:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (int64_t)numberOfContacts
{
  v2 = [(CNGroupIdentity *)self contacts];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CNGroupIdentity alloc];
  v5 = [(CNGroupIdentity *)self groupName];
  v6 = [(CNGroupIdentity *)self groupPhoto];
  v7 = [(CNGroupIdentity *)self contacts];
  v8 = [(CNGroupIdentity *)self identifier];
  id v9 = [(CNGroupIdentity *)v4 initGroupWithName:v5 photo:v6 contacts:v7 identifier:v8];

  return v9;
}

@end