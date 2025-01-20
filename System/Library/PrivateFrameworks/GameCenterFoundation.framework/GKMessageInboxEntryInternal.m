@interface GKMessageInboxEntryInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (NSDate)timestamp;
- (NSString)contactID;
- (NSString)contactName;
- (NSString)friendCode;
- (NSString)senderAlias;
- (NSString)senderDisplayName;
- (NSString)senderHandle;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContactID:(id)a3;
- (void)setContactName:(id)a3;
- (void)setFriendCode:(id)a3;
- (void)setSenderAlias:(id)a3;
- (void)setSenderHandle:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation GKMessageInboxEntryInternal

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(GKMessageInboxEntryInternal *)self url];
  [v4 setUrl:v5];

  v6 = [(GKMessageInboxEntryInternal *)self senderHandle];
  [v4 setSenderHandle:v6];

  v7 = [(GKMessageInboxEntryInternal *)self senderAlias];
  [v4 setSenderAlias:v7];

  v8 = [(GKMessageInboxEntryInternal *)self contactID];
  [v4 setContactID:v8];

  v9 = [(GKMessageInboxEntryInternal *)self contactName];
  [v4 setContactName:v9];

  v10 = [(GKMessageInboxEntryInternal *)self friendCode];
  [v4 setFriendCode:v10];

  v11 = [(GKMessageInboxEntryInternal *)self timestamp];
  [v4 setTimestamp:v11];

  return v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_10 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_10, &__block_literal_global_40);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_10;

  return v2;
}

void __54__GKMessageInboxEntryInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"url";
  v3[0] = objc_opt_class();
  v2[1] = @"senderHandle";
  v3[1] = objc_opt_class();
  v2[2] = @"senderAlias";
  v3[2] = objc_opt_class();
  v2[3] = @"contactID";
  v3[3] = objc_opt_class();
  v2[4] = @"contactName";
  v3[4] = objc_opt_class();
  v2[5] = @"friendCode";
  v3[5] = objc_opt_class();
  v2[6] = @"timestamp";
  v3[6] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_10;
  secureCodedPropertyKeys_sSecureCodedKeys_10 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)senderDisplayName
{
  contactName = self->_contactName;
  if (contactName) {
    goto LABEL_4;
  }
  if (self->_senderAlias)
  {
    contactName = self->_senderHandle;
LABEL_4:
    v3 = contactName;
    goto LABEL_5;
  }
  v3 = &stru_1F1E47DF8;
LABEL_5:

  return (NSString *)v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)senderAlias
{
  return self->_senderAlias;
}

- (void)setSenderAlias:(id)a3
{
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_senderAlias, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end