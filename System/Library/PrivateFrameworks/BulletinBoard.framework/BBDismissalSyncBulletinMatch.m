@interface BBDismissalSyncBulletinMatch
- (BBDismissalItem)dismissalItem;
- (BBDismissalSyncBulletinMatch)initWithDismissalDictionaryItem:(id)a3;
- (BBDismissalSyncBulletinMatch)initWithDismissalID:(id)a3 andItem:(id)a4;
- (NSString)dismissalID;
- (NSString)sectionID;
- (id)description;
- (unint64_t)feeds;
- (void)setDismissalID:(id)a3;
- (void)setDismissalItem:(id)a3;
- (void)setFeeds:(unint64_t)a3;
- (void)setSectionID:(id)a3;
@end

@implementation BBDismissalSyncBulletinMatch

- (BBDismissalSyncBulletinMatch)initWithDismissalID:(id)a3 andItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BBDismissalSyncBulletinMatch;
  v8 = [(BBDismissalSyncBulletinMatch *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    dismissalID = v8->_dismissalID;
    v8->_dismissalID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_dismissalItem, a4);
  }

  return v8;
}

- (BBDismissalSyncBulletinMatch)initWithDismissalDictionaryItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBDismissalSyncBulletinMatch;
  id v6 = [(BBDismissalSyncBulletinMatch *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dismissalItem, a3);
  }

  return v7;
}

- (unint64_t)feeds
{
  return [(BBDismissalItem *)self->_dismissalItem feeds];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; sectionID:%@; dismissalItem:%@; dismissalID:%@>",
               objc_opt_class(),
               self,
               self->_sectionID,
               self->_dismissalItem,
               self->_dismissalID);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (BBDismissalItem)dismissalItem
{
  return self->_dismissalItem;
}

- (void)setDismissalItem:(id)a3
{
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (void)setDismissalID:(id)a3
{
}

- (void)setFeeds:(unint64_t)a3
{
  self->_feeds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_dismissalItem, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end