@interface EMSortableThreadProxyAdditionalProperties
- (BOOL)allowAuthenticationWarning;
- (BOOL)hasAttachments;
- (BOOL)hasUnflagged;
- (BOOL)isAuthenticated;
- (BOOL)isBlocked;
- (BOOL)isVIP;
- (ECMessageFlags)flags;
- (EMCategory)category;
- (EMGeneratedSummary)generatedSummary;
- (EMReadLater)readLater;
- (NSArray)ccList;
- (NSArray)mailboxObjectIDs;
- (NSArray)senderList;
- (NSArray)toList;
- (NSDate)displayDate;
- (NSDate)sendLaterDate;
- (NSIndexSet)flagColors;
- (NSString)businessLogoID;
- (int64_t)businessID;
- (int64_t)displayMessageGlobalID;
- (unint64_t)numberOfMessagesInThread;
- (void)setAllowAuthenticationWarning:(BOOL)a3;
- (void)setBusinessID:(int64_t)a3;
- (void)setBusinessLogoID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCcList:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setDisplayMessageGlobalID:(int64_t)a3;
- (void)setFlagColors:(id)a3;
- (void)setFlags:(id)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setHasAttachments:(BOOL)a3;
- (void)setHasUnflagged:(BOOL)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setIsBlocked:(BOOL)a3;
- (void)setIsVIP:(BOOL)a3;
- (void)setMailboxObjectIDs:(id)a3;
- (void)setNumberOfMessagesInThread:(unint64_t)a3;
- (void)setReadLater:(id)a3;
- (void)setSendLaterDate:(id)a3;
- (void)setSenderList:(id)a3;
- (void)setToList:(id)a3;
@end

@implementation EMSortableThreadProxyAdditionalProperties

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayDate:(id)a3
{
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(int64_t)a3
{
  self->_businessID = a3;
}

- (NSString)businessLogoID
{
  return self->_businessLogoID;
}

- (void)setBusinessLogoID:(id)a3
{
}

- (EMCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (EMReadLater)readLater
{
  return (EMReadLater *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReadLater:(id)a3
{
}

- (NSDate)sendLaterDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSendLaterDate:(id)a3
{
}

- (unint64_t)numberOfMessagesInThread
{
  return self->_numberOfMessagesInThread;
}

- (void)setNumberOfMessagesInThread:(unint64_t)a3
{
  self->_numberOfMessagesInThread = a3;
}

- (int64_t)displayMessageGlobalID
{
  return self->_displayMessageGlobalID;
}

- (void)setDisplayMessageGlobalID:(int64_t)a3
{
  self->_displayMessageGlobalID = a3;
}

- (BOOL)hasUnflagged
{
  return self->_hasUnflagged;
}

- (void)setHasUnflagged:(BOOL)a3
{
  self->_hasUnflagged = a3;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)allowAuthenticationWarning
{
  return self->_allowAuthenticationWarning;
}

- (void)setAllowAuthenticationWarning:(BOOL)a3
{
  self->_allowAuthenticationWarning = a3;
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
}

- (NSArray)toList
{
  return self->_toList;
}

- (void)setToList:(id)a3
{
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (void)setCcList:(id)a3
{
}

- (ECMessageFlags)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (void)setFlagColors:(id)a3
{
}

- (NSArray)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (void)setMailboxObjectIDs:(id)a3
{
}

- (EMGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_businessLogoID, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
}

@end