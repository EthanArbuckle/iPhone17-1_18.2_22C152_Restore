@interface GKUnifiedRecipient
+ (id)recipientForContact:(id)a3;
+ (id)recipientForHandle:(id)a3;
- (CNContact)contact;
- (NSString)fullName;
- (NSString)handle;
- (NSString)label;
- (NSString)nickName;
- (id)displayName;
- (void)setContact:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHandle:(id)a3;
- (void)setLabel:(id)a3;
- (void)setNickName:(id)a3;
@end

@implementation GKUnifiedRecipient

- (void)setContact:(id)a3
{
  v7 = (CNContact *)a3;
  if (self->_contact != v7)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    v5 = [MEMORY[0x1E4F1B910] stringFromContact:v7 style:0];
    [(GKUnifiedRecipient *)self setFullName:v5];

    v6 = [(CNContact *)v7 nickname];
    [(GKUnifiedRecipient *)self setNickName:v6];
  }
}

- (id)displayName
{
  v3 = [(GKUnifiedRecipient *)self fullName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GKUnifiedRecipient *)self handle];
  }
  v6 = v5;

  return v6;
}

+ (id)recipientForHandle:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = objc_alloc_init(GKUnifiedRecipient);
    [(GKUnifiedRecipient *)v4 setHandle:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)recipientForContact:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GKUnifiedRecipient);
  [(GKUnifiedRecipient *)v4 setContact:v3];
  id v5 = +[GKMessageUtilities messagesRecipientHandleForContact:v3];

  [(GKUnifiedRecipient *)v4 setHandle:v5];

  return v4;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)nickName
{
  return self->_nickName;
}

- (void)setNickName:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_fullName, 0);
}

@end