@interface CalCalendarMigrationExchangePrincipal
- (BOOL)addressIsAccountOwner:(id)a3;
- (BOOL)addressURLIsAccountOwner:(id)a3;
- (BOOL)isDelegate;
- (CalCalendarMigrationExchangePrincipal)initWithUid:(id)a3 mailbox:(id)a4;
- (NSString)mailbox;
- (NSString)name;
- (NSString)ownerUid;
- (NSString)title;
- (NSString)uid;
- (id)dictionaryForAccountProperties;
- (void)setDelegate:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOwnerUid:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CalCalendarMigrationExchangePrincipal

- (CalCalendarMigrationExchangePrincipal)initWithUid:(id)a3 mailbox:(id)a4
{
  if (self)
  {
    id v6 = a4;
    v7 = (NSString *)[a3 copy];
    uid = self->_uid;
    self->_uid = v7;

    v9 = (NSString *)[v6 copy];
    mailbox = self->_mailbox;
    self->_mailbox = v9;
  }
  return self;
}

- (id)dictionaryForAccountProperties
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v4 = [(CalCalendarMigrationExchangePrincipal *)self mailbox];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F30138]];

  v5 = [(CalCalendarMigrationExchangePrincipal *)self name];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F30140]];

  id v6 = [(CalCalendarMigrationExchangePrincipal *)self title];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F30148]];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CalCalendarMigrationExchangePrincipal isDelegate](self, "isDelegate"));
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F30130]];

  v8 = (void *)[v3 copy];
  return v8;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 stringRemovingMailto];
  v5 = [(CalCalendarMigrationExchangePrincipal *)self mailbox];
  id v6 = [v5 stringRemovingMailto];
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  v4 = [a3 absoluteString];
  LOBYTE(self) = [(CalCalendarMigrationExchangePrincipal *)self addressIsAccountOwner:v4];

  return (char)self;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)mailbox
{
  return self->_mailbox;
}

- (NSString)ownerUid
{
  return self->_ownerUid;
}

- (void)setOwnerUid:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isDelegate
{
  return self->_delegate;
}

- (void)setDelegate:(BOOL)a3
{
  self->_delegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ownerUid, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end