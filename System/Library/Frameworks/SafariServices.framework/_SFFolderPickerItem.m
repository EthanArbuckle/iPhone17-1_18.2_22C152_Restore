@interface _SFFolderPickerItem
- (NSString)title;
- (SFSyntheticBookmarkFolder)syntheticFolder;
- (WebBookmark)bookmark;
- (id)_initWithBookmark:(id)a3 syntheticFolder:(id)a4 depth:(unint64_t)a5;
- (unint64_t)depth;
@end

@implementation _SFFolderPickerItem

- (id)_initWithBookmark:(id)a3 syntheticFolder:(id)a4 depth:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFFolderPickerItem;
  v11 = [(_SFFolderPickerItem *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bookmark, a3);
    objc_storeStrong((id *)&v12->_syntheticFolder, a4);
    v12->_depth = a5;
    v13 = v12;
  }

  return v12;
}

- (NSString)title
{
  v3 = [(SFSyntheticBookmarkFolder *)self->_syntheticFolder title];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WebBookmark *)self->_bookmark localizedTitle];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (SFSyntheticBookmarkFolder)syntheticFolder
{
  return self->_syntheticFolder;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticFolder, 0);

  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end