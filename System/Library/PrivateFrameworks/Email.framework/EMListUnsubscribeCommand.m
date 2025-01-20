@interface EMListUnsubscribeCommand
+ (BOOL)supportsSecureCoding;
+ (id)_accountWithIdentifier:(id)a3;
+ (id)accountFinderBlock;
+ (id)mailtoUnsubscribeCommandWithListID:(id)a3 address:(id)a4 sender:(id)a5 subject:(id)a6 body:(id)a7 account:(id)a8 headerUnsubscribeTypes:(int64_t)a9;
+ (id)oneClickUnsubscribeCommandWithListID:(id)a3 sender:(id)a4 URL:(id)a5 postContent:(id)a6 headerUnsubscribeTypes:(int64_t)a7;
+ (void)setAccountFinderBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMailtoOperation;
- (EMListUnsubscribeCommand)init;
- (EMListUnsubscribeCommand)initWithCoder:(id)a3;
- (EMListUnsubscribeCommand)initWithListID:(id)a3 sender:(id)a4 mailtoValues:(id)a5 postValues:(id)a6 headerUnsubscribeTypes:(int64_t)a7;
- (EMListUnsubscribeMailtoValues)mailtoValues;
- (EMListUnsubscribePostValues)postValues;
- (NSString)ef_publicDescription;
- (NSString)listID;
- (NSString)sender;
- (int64_t)headerUnsubscribeTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMListUnsubscribeCommand

- (EMListUnsubscribeCommand)init
{
}

+ (id)mailtoUnsubscribeCommandWithListID:(id)a3 address:(id)a4 sender:(id)a5 subject:(id)a6 body:(id)a7 account:(id)a8 headerUnsubscribeTypes:(int64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = [[EMListUnsubscribeMailtoValues alloc] initWithAddresss:v15 subject:v17 body:v18 account:v19];
  v21 = [[EMListUnsubscribeCommand alloc] initWithListID:v14 sender:v16 mailtoValues:v20 postValues:0 headerUnsubscribeTypes:a9];

  return v21;
}

+ (id)oneClickUnsubscribeCommandWithListID:(id)a3 sender:(id)a4 URL:(id)a5 postContent:(id)a6 headerUnsubscribeTypes:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [[EMListUnsubscribePostValues alloc] initWithURL:v13 postContent:v14];
  id v16 = [[EMListUnsubscribeCommand alloc] initWithListID:v11 sender:v12 mailtoValues:0 postValues:v15 headerUnsubscribeTypes:a7];

  return v16;
}

- (EMListUnsubscribeCommand)initWithListID:(id)a3 sender:(id)a4 mailtoValues:(id)a5 postValues:(id)a6 headerUnsubscribeTypes:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMListUnsubscribeCommand;
  id v16 = [(EMListUnsubscribeCommand *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    listID = v16->_listID;
    v16->_listID = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    sender = v16->_sender;
    v16->_sender = (NSString *)v19;

    objc_storeStrong((id *)&v16->_mailtoValues, a5);
    objc_storeStrong((id *)&v16->_postValues, a6);
    v16->_headerUnsubscribeTypes = a7;
  }

  return v16;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v16 = [(EMListUnsubscribeMailtoValues *)self->_mailtoValues address];
  uint64_t v5 = [v16 hash];
  id v15 = [(EMListUnsubscribeMailtoValues *)self->_mailtoValues subject];
  uint64_t v6 = [v15 hash];
  id v14 = [(EMListUnsubscribeMailtoValues *)self->_mailtoValues body];
  uint64_t v7 = [v14 hash];
  v8 = [(EMListUnsubscribePostValues *)self->_postValues oneClickURL];
  uint64_t v9 = [v8 hash];
  int64_t headerUnsubscribeTypes = self->_headerUnsubscribeTypes;
  id v11 = [(EMListUnsubscribePostValues *)self->_postValues postContent];
  id v12 = [v3 stringWithFormat:@"<%@ %p address: %lx, subject: %lx, body: %lx, url: %lx, availableUnsubscribeType: %lx, postContent: %@>", v4, self, v5, v6, v7, v9, headerUnsubscribeTypes, v11];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_listID hash];
  NSUInteger v4 = [(NSString *)self->_sender hash] ^ v3;
  unint64_t v5 = [(EMListUnsubscribeMailtoValues *)self->_mailtoValues hash];
  return v4 ^ v5 ^ [(EMListUnsubscribePostValues *)self->_postValues hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(EMListUnsubscribeCommand *)self headerUnsubscribeTypes];
    if (v6 == [v5 headerUnsubscribeTypes])
    {
      uint64_t v7 = [(EMListUnsubscribeCommand *)self listID];
      v8 = [v5 listID];
      if (EFObjectsAreEqual())
      {
        uint64_t v9 = [(EMListUnsubscribeCommand *)self sender];
        v10 = [v5 sender];
        if (EFObjectsAreEqual())
        {
          id v16 = [(EMListUnsubscribeCommand *)self mailtoValues];
          id v11 = [v5 mailtoValues];
          if (EFObjectsAreEqual())
          {
            id v15 = [(EMListUnsubscribeCommand *)self postValues];
            id v12 = [v5 postValues];
            char v13 = EFObjectsAreEqual();
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (id)accountFinderBlock
{
  v2 = (void *)MEMORY[0x1C18A2160](sAccountFinderBlock, a2);
  return v2;
}

+ (void)setAccountFinderBlock:(id)a3
{
  uint64_t v3 = MEMORY[0x1C18A2160](a3, a2);
  id v4 = (void *)sAccountFinderBlock;
  sAccountFinderBlock = v3;
}

+ (id)_accountWithIdentifier:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(id)objc_opt_class() accountFinderBlock];
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"EMListUnsubscribeCommand.m" lineNumber:190 description:@"accountFinderBlock is not set"];
  }
  uint64_t v7 = ((void (**)(void, id))v6)[2](v6, v5);
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"EMListUnsubscribeCommand.m" lineNumber:192 description:@"failed to find an account for identifier"];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMListUnsubscribeCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EMListUnsubscribeCommand;
  id v5 = [(EMListUnsubscribeCommand *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_listID"];
    listID = v5->_listID;
    v5->_listID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sender"];
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mailtoValues"];
    mailtoValues = v5->_mailtoValues;
    v5->_mailtoValues = (EMListUnsubscribeMailtoValues *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_postValues"];
    postValues = v5->_postValues;
    v5->_postValues = (EMListUnsubscribePostValues *)v12;

    v5->_int64_t headerUnsubscribeTypes = [v4 decodeIntegerForKey:@"EFPropertyKey_headerUnsubscribeTypes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(EMListUnsubscribeCommand *)self listID];
  [v8 encodeObject:v4 forKey:@"EFPropertyKey_listID"];

  id v5 = [(EMListUnsubscribeCommand *)self sender];
  [v8 encodeObject:v5 forKey:@"EFPropertyKey_sender"];

  uint64_t v6 = [(EMListUnsubscribeCommand *)self mailtoValues];
  [v8 encodeObject:v6 forKey:@"EFPropertyKey_mailtoValues"];

  uint64_t v7 = [(EMListUnsubscribeCommand *)self postValues];
  [v8 encodeObject:v7 forKey:@"EFPropertyKey_postValues"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[EMListUnsubscribeCommand headerUnsubscribeTypes](self, "headerUnsubscribeTypes"), @"EFPropertyKey_headerUnsubscribeTypes");
}

- (BOOL)isMailtoOperation
{
  return self->_mailtoValues != 0;
}

- (NSString)listID
{
  return self->_listID;
}

- (NSString)sender
{
  return self->_sender;
}

- (int64_t)headerUnsubscribeTypes
{
  return self->_headerUnsubscribeTypes;
}

- (EMListUnsubscribeMailtoValues)mailtoValues
{
  return self->_mailtoValues;
}

- (EMListUnsubscribePostValues)postValues
{
  return self->_postValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postValues, 0);
  objc_storeStrong((id *)&self->_mailtoValues, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_listID, 0);
}

@end