@interface MFMailboxResultsGenerator
+ (id)resultsDictionaryFromMailboxUid:(id)a3 forKeys:(id)a4;
- (MFMailboxUid)mailboxUid;
- (NSSet)pushedMailboxUids;
- (id)_displayName:(id)a3;
- (id)_level:(id)a3;
- (id)_pushState:(id)a3;
- (id)_relativePath:(id)a3;
- (id)_type:(id)a3;
- (id)blockForKey:(id)a3;
- (void)setMailboxUid:(id)a3;
- (void)setPushedMailboxUids:(id)a3;
@end

@implementation MFMailboxResultsGenerator

+ (id)resultsDictionaryFromMailboxUid:(id)a3 forKeys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(_MFResultsGenerator *)[MFMailboxResultsGenerator alloc] initWithKeys:v6];
  [(MFMailboxResultsGenerator *)v7 setMailboxUid:v5];
  v8 = [(_MFResultsGenerator *)v7 results];

  return v8;
}

- (id)blockForKey:(id)a3
{
  id v3 = a3;
  if (qword_10016BB68 != -1) {
    dispatch_once(&qword_10016BB68, &stru_10013C5E0);
  }
  v4 = [(id)qword_10016BB60 objectForKeyedSubscript:v3];

  return v4;
}

- (id)_displayName:(id)a3
{
  id v3 = [(MFMailboxUid *)self->_mailboxUid displayNameUsingSpecialNames];

  return v3;
}

- (id)_relativePath:(id)a3
{
  id v3 = [(MFMailboxUid *)self->_mailboxUid accountRelativePath];

  return v3;
}

- (id)_type:(id)a3
{
  id v3 = +[NSNumber numberWithInteger:[(MFMailboxUid *)self->_mailboxUid mailboxType]];

  return v3;
}

- (id)_level:(id)a3
{
  id v3 = +[NSNumber numberWithInt:[(MFMailboxUid *)self->_mailboxUid level]];

  return v3;
}

- (id)_pushState:(id)a3
{
  id v3 = +[NSNumber numberWithBool:[(NSSet *)self->_pushedMailboxUids containsObject:self->_mailboxUid]];

  return v3;
}

- (MFMailboxUid)mailboxUid
{
  return self->_mailboxUid;
}

- (void)setMailboxUid:(id)a3
{
}

- (NSSet)pushedMailboxUids
{
  return self->_pushedMailboxUids;
}

- (void)setPushedMailboxUids:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushedMailboxUids, 0);

  objc_storeStrong((id *)&self->_mailboxUid, 0);
}

@end