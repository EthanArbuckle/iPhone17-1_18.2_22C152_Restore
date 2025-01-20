@interface MFAccountResultsGenerator
+ (id)resultsDictionaryFromAccount:(id)a3 forKeys:(id)a4;
- (MailAccount)account;
- (id)_accountReference:(id)a3;
- (id)_canFetch:(id)a3;
- (id)_defaultAddress:(id)a3;
- (id)_displayName:(id)a3;
- (id)_emailAddresses:(id)a3;
- (id)_emailAddressesAndAliases:(id)a3;
- (id)_fromEmailAddresses:(id)a3;
- (id)_fromEmailAddressesIncludingDisabled:(id)a3;
- (id)_fullUserName:(id)a3;
- (id)_isActive:(id)a3;
- (id)_isDefaultSendingAccount:(id)a3;
- (id)_isManaged:(id)a3;
- (id)_pcStyle:(id)a3;
- (id)_restrictedFromMailDrop:(id)a3;
- (id)_restrictedFromSendingExternally:(id)a3;
- (id)_restrictedFromSyncingRecents:(id)a3;
- (id)_restrictsRepliesAndForwards:(id)a3;
- (id)_supportsMailDrop:(id)a3;
- (id)_supportsThreadOperations:(id)a3;
- (id)_syncsReadState:(id)a3;
- (id)_username:(id)a3;
- (id)blockForKey:(id)a3;
- (void)setAccount:(id)a3;
@end

@implementation MFAccountResultsGenerator

+ (id)resultsDictionaryFromAccount:(id)a3 forKeys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(_MFResultsGenerator *)[MFAccountResultsGenerator alloc] initWithKeys:v6];
  [(MFAccountResultsGenerator *)v7 setAccount:v5];
  v8 = [(_MFResultsGenerator *)v7 results];

  return v8;
}

- (id)blockForKey:(id)a3
{
  id v3 = a3;
  if (qword_10016B9F0 != -1) {
    dispatch_once(&qword_10016B9F0, &stru_10013B308);
  }
  v4 = [(id)qword_10016B9E8 objectForKeyedSubscript:v3];

  return v4;
}

- (id)_accountReference:(id)a3
{
  id v3 = [(MailAccount *)self->_account uniqueID];

  return v3;
}

- (id)_displayName:(id)a3
{
  id v3 = [(MailAccount *)self->_account displayName];

  return v3;
}

- (id)_fullUserName:(id)a3
{
  id v3 = [(MailAccount *)self->_account fullUserName];

  return v3;
}

- (id)_username:(id)a3
{
  id v3 = [(MailAccount *)self->_account username];

  return v3;
}

- (id)_emailAddresses:(id)a3
{
  id v3 = [(MailAccount *)self->_account emailAddressStrings];

  return v3;
}

- (id)_emailAddressesAndAliases:(id)a3
{
  id v3 = [(MailAccount *)self->_account emailAddressesAndAliasesList];

  return v3;
}

- (id)_fromEmailAddresses:(id)a3
{
  id v3 = [(MailAccount *)self->_account fromEmailAddresses];

  return v3;
}

- (id)_fromEmailAddressesIncludingDisabled:(id)a3
{
  id v3 = [(MailAccount *)self->_account fromEmailAddressesIncludingDisabled];

  return v3;
}

- (id)_defaultAddress:(id)a3
{
  id v3 = [(MailAccount *)self->_account defaultEmailAddress];

  return v3;
}

- (id)_isActive:(id)a3
{
  unsigned int v3 = [(MailAccount *)self->_account isActive];
  v4 = &kCFBooleanTrue;
  if (!v3) {
    v4 = &kCFBooleanFalse;
  }
  CFBooleanRef v5 = *v4;

  return v5;
}

- (id)_isDefaultSendingAccount:(id)a3
{
  v4 = +[MailAccount defaultMailAccountForDelivery];
  if (v4 == self->_account) {
    CFBooleanRef v5 = (id *)&kCFBooleanTrue;
  }
  else {
    CFBooleanRef v5 = (id *)&kCFBooleanFalse;
  }
  id v6 = *v5;

  return v6;
}

- (id)_restrictsRepliesAndForwards:(id)a3
{
  unsigned int v3 = [(MailAccount *)self->_account restrictedFromTransferingMessagesToOtherAccounts];
  v4 = &kCFBooleanTrue;
  if (!v3) {
    v4 = &kCFBooleanFalse;
  }
  CFBooleanRef v5 = *v4;

  return v5;
}

- (id)_restrictedFromSendingExternally:(id)a3
{
  unsigned int v3 = [(MailAccount *)self->_account restrictedFromSendingExternally];
  v4 = &kCFBooleanTrue;
  if (!v3) {
    v4 = &kCFBooleanFalse;
  }
  CFBooleanRef v5 = *v4;

  return v5;
}

- (id)_supportsMailDrop:(id)a3
{
  unsigned int v3 = +[NSNumber numberWithBool:[(MailAccount *)self->_account supportsMailDrop]];

  return v3;
}

- (id)_isManaged:(id)a3
{
  unsigned int v3 = +[NSNumber numberWithBool:[(MailAccount *)self->_account isManaged]];

  return v3;
}

- (id)_canFetch:(id)a3
{
  unsigned int v3 = +[NSNumber numberWithBool:[(MailAccount *)self->_account canFetch]];

  return v3;
}

- (id)_pcStyle:(id)a3
{
  [(MailAccount *)self->_account uniqueIdForPersistentConnection];
  unsigned int v3 = +[NSNumber numberWithUnsignedInt:PCSettingsGetStyle()];

  return v3;
}

- (id)_restrictedFromMailDrop:(id)a3
{
  unsigned int v3 = +[NSNumber numberWithInt:[(MailAccount *)self->_account supportsMailDrop] ^ 1];

  return v3;
}

- (id)_supportsThreadOperations:(id)a3
{
  unsigned int v3 = [(MailAccount *)self->_account supportsThreadOperations];
  v4 = &kCFBooleanTrue;
  if (!v3) {
    v4 = &kCFBooleanFalse;
  }
  CFBooleanRef v5 = *v4;

  return v5;
}

- (id)_syncsReadState:(id)a3
{
  unsigned int v3 = +[NSNumber numberWithBool:[(MailAccount *)self->_account supportsSyncingReadState]];

  return v3;
}

- (id)_restrictedFromSyncingRecents:(id)a3
{
  unsigned int v3 = +[NSNumber numberWithBool:[(MailAccount *)self->_account restrictedFromSyncingRecents]];

  return v3;
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end