@interface DOCHotFolderEvent
- (DOCHotFolderEvent)initWithAppBundleIdentifier:(id)a3 folderItem:(id)a4 type:(unint64_t)a5 lastUsedDate:(id)a6 frecency:(double)a7;
- (DOCHotFolderEvent)initWithRowId:(id)a3 appBundleIdentifier:(id)a4 folderItem:(id)a5 type:(unint64_t)a6 lastUsedDate:(id)a7 frecency:(double)a8;
- (FPItem)folderItem;
- (NSNumber)rowId;
- (NSString)appBundleIdentifier;
- (unint64_t)type;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setFolderItem:(id)a3;
- (void)setRowId:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation DOCHotFolderEvent

- (DOCHotFolderEvent)initWithAppBundleIdentifier:(id)a3 folderItem:(id)a4 type:(unint64_t)a5 lastUsedDate:(id)a6 frecency:(double)a7
{
  return [(DOCHotFolderEvent *)self initWithRowId:0 appBundleIdentifier:a3 folderItem:a4 type:a5 lastUsedDate:a6 frecency:a7];
}

- (DOCHotFolderEvent)initWithRowId:(id)a3 appBundleIdentifier:(id)a4 folderItem:(id)a5 type:(unint64_t)a6 lastUsedDate:(id)a7 frecency:(double)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)DOCHotFolderEvent;
  v19 = [(DOCHotFolderEvent *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_rowId, a3);
    objc_storeStrong((id *)&v20->_appBundleIdentifier, a4);
    objc_storeStrong((id *)&v20->_folderItem, a5);
    v20->_type = a6;
    [(DOCFrecencyBasedEvent *)v20 setLastUsedDate:v18];
    [(DOCFrecencyBasedEvent *)v20 setFrecency:a8];
  }

  return v20;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (FPItem)folderItem
{
  return self->_folderItem;
}

- (void)setFolderItem:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSNumber)rowId
{
  return self->_rowId;
}

- (void)setRowId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowId, 0);
  objc_storeStrong((id *)&self->_folderItem, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end