@interface IMDChatStatusChangeContext
- (BOOL)isBlackholed;
- (IMDAccount)account;
- (NSArray)handleInfo;
- (NSString)displayName;
- (NSString)extensionName;
- (NSString)groupID;
- (NSString)lastAddressedHandle;
- (NSString)lastAddressedSIMID;
- (NSString)messageID;
- (NSString)originalGroupID;
- (int64_t)category;
- (void)setAccount:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setExtensionName:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHandleInfo:(id)a3;
- (void)setIsBlackholed:(BOOL)a3;
- (void)setLastAddressedHandle:(id)a3;
- (void)setLastAddressedSIMID:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setOriginalGroupID:(id)a3;
@end

@implementation IMDChatStatusChangeContext

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)originalGroupID
{
  return self->_originalGroupID;
}

- (void)setOriginalGroupID:(id)a3
{
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (void)setLastAddressedHandle:(id)a3
{
}

- (NSString)lastAddressedSIMID
{
  return self->_lastAddressedSIMID;
}

- (void)setLastAddressedSIMID:(id)a3
{
}

- (NSArray)handleInfo
{
  return self->_handleInfo;
}

- (void)setHandleInfo:(id)a3
{
}

- (IMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (NSString)extensionName
{
  return self->_extensionName;
}

- (void)setExtensionName:(id)a3
{
}

- (BOOL)isBlackholed
{
  return self->_isBlackholed;
}

- (void)setIsBlackholed:(BOOL)a3
{
  self->_isBlackholed = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_extensionName, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_handleInfo, 0);
  objc_storeStrong((id *)&self->_lastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_lastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end