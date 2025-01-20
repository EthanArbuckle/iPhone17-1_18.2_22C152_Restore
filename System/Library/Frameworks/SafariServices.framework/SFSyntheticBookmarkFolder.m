@interface SFSyntheticBookmarkFolder
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (SFSyntheticBookmarkFolder)initWithBookmarkList:(id)a3 title:(id)a4;
- (WebBookmarkList)bookmarkList;
- (void)setBookmarkList:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFSyntheticBookmarkFolder

- (SFSyntheticBookmarkFolder)initWithBookmarkList:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFSyntheticBookmarkFolder;
  v9 = [(SFSyntheticBookmarkFolder *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bookmarkList, a3);
    objc_storeStrong((id *)&v10->_title, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFSyntheticBookmarkFolder *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(SFSyntheticBookmarkFolder *)self bookmarkList],
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
      && (id v8 = (void *)v7,
          [(SFSyntheticBookmarkFolder *)v6 bookmarkList],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      v10 = [(SFSyntheticBookmarkFolder *)self bookmarkList];
      int v11 = [v10 folderID];
      v12 = [(SFSyntheticBookmarkFolder *)v6 bookmarkList];
      BOOL v13 = v11 == [v12 folderID];
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (WebBookmarkList)bookmarkList
{
  return self->_bookmarkList;
}

- (void)setBookmarkList:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_bookmarkList, 0);
}

@end